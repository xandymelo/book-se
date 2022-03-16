import streamlit as st
import matplotlib.pyplot as plt
import pandas as pd
import plotly.figure_factory as ff
import numpy as np
import scipy
from livros_por_ano import livros_por_ano_publi
from tratamento_dataframe import tratamento_df
from pagina_inicial import pagina_inicial
from livros_por_categoria import livros_por_categoria
from livros_por_pag import livros_por_pagina
    
if __name__ == '__main__':
    dataframe = pd.read_csv("books.csv")
    dataframe = tratamento_df(dataframe)
    sidebar = st.sidebar
    my_page = st.sidebar.radio('Análises', ['Página inicial 📚' ,'Livros por categoria 📗', 'Livros por quantidade de páginas 📘', 'Livros por ano de publicação 🗓️'])
    if my_page == 'Página inicial 📚':
        paginainicial = pagina_inicial(dataframe)
    if my_page == 'Livros por categoria 📗':
        estudo1 = livros_por_categoria(dataframe)
    if my_page == 'Livros por quantidade de páginas 📘':
        estudo2 = livros_por_pagina(dataframe)
    if my_page == 'Livros por ano de publicação 🗓️':
        estudo3 = livros_por_ano_publi(dataframe)