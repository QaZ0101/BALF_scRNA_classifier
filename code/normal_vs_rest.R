library(monocle)
library(dplyr)
library(Biobase)

rm(list=ls())
data<-read.csv(file = "covid-selected-data.csv")
data<-as.matrix(data)
rownames(data)<-data[,1]
data<-data[,-1]
n<-rownames(data)
data<-apply(data,2,as.numeric)
rownames(data)<-n
data<-t(data)
dim(data)
true_lables<-read.csv(file="covid-selected-data-labels.csv")
true_lables<-as.matrix(true_lables)
rownames(true_lables)<-true_lables[,1]
true_lables<-true_lables[,-1]
n<-rownames(data)
rownames(data)<-n
true_lables<-as.matrix(true_lables)
colnames(true_lables)<-c("cell_type")
true_lables<-as.data.frame(true_lables)
summary(as.factor(true_lables$cell_type))
true_lables<-true_lables %>% mutate(Nor_vs_rest = case_when(
  cell_type == c("Normal") ~ "Normal",
  cell_type != c("Normal") ~ "Rest"))
features<-matrix(0,nrow(data),1)
colnames(features)<-c("gene_short_name")
rownames(features)<-rownames(data)
features[,1]<-rownames(data)
features<-as.data.frame(features)

pd <- new("AnnotatedDataFrame", data = true_lables)
fd <- new("AnnotatedDataFrame", data = features)
covid <- newCellDataSet(as.matrix(data),
                        phenoData = pd, featureData = fd,expressionFamily=uninormal(),lowerDetectionLimit = -50)




marker_genes <- row.names(subset(fData(covid),
                                 gene_short_name %in% gene_short_name))
diff_test_res_Nor <- differentialGeneTest(covid[marker_genes,],
                                          fullModelFormulaStr = "~Nor_vs_rest", cores = 2)
Ordered_diff_test_res_Nor<- diff_test_res_Nor[order(diff_test_res_Nor$qval),]
head(Ordered_diff_test_res_Nor,20)
write.table(Ordered_diff_test_res_Nor, file = "normal_vs_rest.txt", sep = '\t', row.names = TRUE, col.names = TRUE)
