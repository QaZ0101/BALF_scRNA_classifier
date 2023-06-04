import csv
import random

s=set()
label=[]
result=[]
test_set=[]
test_label=[]
training_set=[]
training_label=[]


while len(s)<5797:
    number=random.randint(1, 23189)
    if number not in s:
        s.add(number)


random_index=list(s)

with open("covid-selected-data.csv") as f1:
    lines=f1.readlines()
    for line in lines:
        line=line.strip()
        line=line.split(',')
        result.append(line)

test_set.append(result[0])
                      
for index in range(0, len(result)):
    if index in random_index:
        test_set.append(result[index])
    else:
        training_set.append(result[index])


with open("covid-selected-data-labels.csv") as f2:
    lines2=f2.readlines()
    for line2 in lines2:
        line2=line2.strip()
        line2=line2.split(',')
        label.append(line2)

test_label.append(label[0])
                      
for index2 in range(0, len(label)):
    if index2 in random_index:
        test_label.append(label[index2])
    else:
        training_label.append(label[index2])

        

with open("training_data.csv", 'w', newline='') as f3:
    writer=csv.writer(f3)
    writer.writerows(training_set)

with open("test_data.csv", 'w', newline='') as f4:
    writer2=csv.writer(f4)
    writer2.writerows(test_set)

with open("training_label.csv", 'w', newline='') as f5:
    writer3=csv.writer(f5)
    writer3.writerows(training_label)

with open("test_label.csv", 'w', newline='') as f6:
    writer4=csv.writer(f6)
    writer4.writerows(test_label)

print("done")


