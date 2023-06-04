# Identification of Single-Cell RNA Sequencing Molecular Signatures for COVID-19 Infection Severity Classification
Researchers have leveraged single-cell RNA-sequencing (scRNA-seq) to elucidate the underlying mechanisms of respiratory diseases. While prior research focused on identifying COVID-19 severity bio-markers utilizing conventional machine-learning techniques, few of these studies captured intricate patterns inherent within scRNA-seq data. In this study, we propose a graph-based machine learning framework to identify scRNA-seq molecular signatures for COVID-19 infection severity identification. We conduct extensive experiments on scRNA-seq data from bronchoalveolar lavage fluid (BALF) with four machine learning models: support vector machine, Random Forest, Graph Convolutional Network (GCN), and Graph Attention Network (GAT). In addition, we employ explainable artificial intelligence approach, GNNExplainer, to interpret model predictions by identifying top 15 features that contribute to the severity classification. Our finding suggests that graphical models could accurately predict COVID-19 severity (F1-score $>0.9$) based on patient scRNA-seq data, along with meaningful molecular signatures identification and discovery. Furthermore, the pathways significantly enriched by these identified genes exhibit biological relevance with the potential to generalize to other respiratory diseases.
## Dataset Information
The dataset contains a gene expression matrix of 23,189 cells and 1,999 genes. Each cell has a COVID severity label (Normal, Mild, or Severe) based on the clinical severity label of its patient of origin.
## Libraries
* NumPy
* Pandas
* Matplotlib
* Scikit-Learn
* PyTorch
* GNNexplainer
* R
## Algorithms
* Random Forest
* Support Vector Machine
* Graph Convolutional Network
* Graph Attention Network
