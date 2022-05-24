from autores import autores_relacao
import streamlit as st
import matplotlib.pyplot as plt
import pandas as pd
#import plotly.figure_factory as ff
import numpy as np
from df_muito_usados import DfsUsados
#import scipy
from livros_por_ano import livros_por_ano_publi
from livros_por_categoria import Livros_por_categoria
from tratamento_dataframe import tratamento_df
from pagina_inicial import pagina_inicial
from diferencial_por_categoria import dif_por_categoria
from livros_por_pag import livros_por_quantidade_de_pag
from filtros import filtros
    
if __name__ == '__main__':
    sidebar = st.sidebar
    my_page = sidebar.radio('Análises', ['Página inicial 📚' ,'Filtragem 🔍' ,'P3 - Qual dado é o mais importante na nota do livro das categorias mais bem avaliadas? 📗', 'P1 - Avaliação dos livros bem avaliados em relação a quantidade de páginas 📘', 'P1 - Avaliação dos livros bem avaliados em relação ao ano de publicação 🗓️', 'P1 - Avaliação dos livros bem avaliados em relação a categoria 📂', 'P2 - Qual a relação entre as caracteristicas de um autor e suas avaliações? ✍️'])
    if my_page == 'Página inicial 📚':
        paginainicial = pagina_inicial()
    if my_page == 'P3 - Qual dado é o mais importante na nota do livro das categorias mais bem avaliadas? 📗':
        estudo1 = dif_por_categoria()
    if my_page == 'P1 - Avaliação dos livros bem avaliados em relação a quantidade de páginas 📘':
        estudo2 = livros_por_quantidade_de_pag()
    if my_page == 'P1 - Avaliação dos livros bem avaliados em relação ao ano de publicação 🗓️':
        estudo3 = livros_por_ano_publi()
    if my_page == 'P1 - Avaliação dos livros bem avaliados em relação a categoria 📂':
        estudo4 =  Livros_por_categoria()
    if my_page == 'P2 - Qual a relação entre as caracteristicas de um autor e suas avaliações? ✍️':
        estudo5 =  autores_relacao()
    if my_page == 'Filtragem 🔍':
        filtro = filtros()