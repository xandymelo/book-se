from turtle import title
import streamlit as st
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

st.write(""" # Recomendação de Livros
          Vamos ver nosso primeiro gráfico do projeto!""")
dataframe = pd.read_csv("books.csv")
df_art = dataframe.query('categories == "Art"')
num_pag = list(dataframe['num_pages'])
st.write("Todos os livros")
st.dataframe(dataframe)
sidebar = st.sidebar
sidebar.write("Escolha uma categoria de Livro")
sidebar.button("Categoria1")
st.write("livros com categoria: Arte")
st.dataframe(df_art)
notas = list(df_art['average_rating'])
fig, ax = plt.subplots()
ax.hist(notas, bins=5)
ax.set_title('Avaliação dos livros de categoria Arte')
st.pyplot(fig)
#st.write(ax)
#st.write(fig)