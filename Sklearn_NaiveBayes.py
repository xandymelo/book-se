# -*- coding: utf-8 -*-
"""projeto_0101.py

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1czkvYzBF2hP7LchoE5YdLnGnzbT46OBv
"""

import pandas as pd
import re
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis as LDA
import sklearn.metrics as metrics

data = pd.read_csv("/content/df_tratado_01.csv")

data.drop(["Unnamed: 0"], axis="columns", inplace=True)

data.head()

data.info()

data.isnull().sum()

data = data.dropna()

data.describe().T

bom = data[data.tipo_avaliacao == "acima da média"]

ruim = data[data.tipo_avaliacao == "abaixo da média"]

data

# Dropando a coluna de avaliaçao pra nao incluir ela na parte de treino e teste do algoritimo
xdata = data.drop("tipo_avaliacao", axis=1)
ydata = data.tipo_avaliacao

xtrain, xtest, ytrain, ytest = train_test_split(xdata, ydata, test_size = 0.3, random_state = 1)

#Classificador Árvore de Decisao
clf = DecisionTreeClassifier()
clf = clf.fit(xtrain, ytrain)
ypred = clf.predict(xtest)
print('Acurácia DCS Tree: ', metrics.accuracy_score(ytest, ypred)*100)

# Gaussian NaiveBayes
gnb = GaussianNB()
gnb = gnb.fit(xtrain, ytrain)
ypredgnb = gnb.predict(xtest)
print("Acurácia GNB: ", metrics.accuracy_score(ytest, ypredgnb)*100)

clf.feature_importances_

data = pd.DataFrame({'Feature_names': xdata.columns,'Importances':clf.feature_importances_})
data
