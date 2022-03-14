import streamlit as st
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import time


def tratamento_df(dataframe):
    dataframe['num_pages'].fillna(0, inplace=True)
    dataframe['num_pages'] = dataframe['num_pages'].astype('int')
    return dataframe

def pagina_inicial(dataframe):
    st.write(""" # Book-se 📚
        Este é um projeto de alunos da faculdade UFRPE, para a cadeira de projeto 3.
        Nesa página vamos mostrar nossos estudos em cima dos dados que vamos
            usar no nosso desenvolvimento mobile Book-se, um Aplicativo de 
            recomendações literárias!
        """)
    df_art = dataframe.query('categories == "Art"')
    num_pag = list(dataframe['num_pages'])
    st.write("Todos os livros")
    st.dataframe(dataframe)
    st.write("livros com categoria: Arte")
    st.dataframe(df_art)
    notas = list(df_art['average_rating'])
    fig, ax = plt.subplots()
    ax.hist(notas, bins=5)
    ax.set_title('Avaliação dos livros de categoria Arte')
    st.pyplot(fig)

def livros_por_categoria(dataframe):
    todas_categorias = dataframe['categories'].str.get_dummies(',')
    quantidade_livros_por_categoria = todas_categorias.sum().sort_values(ascending=False)
    #quantidade_livros_por_categoria.columns = ['teste', 'teste2']
    #NÃO CONSEGUI TROCAR O NOME DAS COLUNAS
    st.title(""" Livros por Categoria 📗
                Abaixo está mostrando cada categoria, e a quantidade de livros que o
     dataset possui nela. """)
    st.dataframe(quantidade_livros_por_categoria)
    st.title("Temos no total, {} categorias.".format(len(quantidade_livros_por_categoria.index)))
    st.line_chart(quantidade_livros_por_categoria.head(10))
    st.write('''Podemos ver que a quantidade de livros da categoria Fiction no nosso dataset é bem maior
    do que as outras, dado que um livro pode ter mais de uma categoria, dividido por vírgula,
        e que esta categoria é uma categoria muito em alta nos livros, isso pode não ser
        uma desvantagem.''')
def livros_por_pagina(dataframe):
    st.title("""Livros por quantidade de páginas📘
    Abaixo está uma tabela ordenada de forma descrescente em relação a quantidade
     de páginas do livro, com suas respectivas notas.""")
    quantidade_de_pag_por_livro = dataframe[['title', 'categories', 'num_pages', 'average_rating']].sort_values('num_pages', ascending = False)
    st.dataframe(quantidade_de_pag_por_livro)
    st.title('''Livros com grande quantidade de páginas estão bem avalidos ? 🤔
        Para isso, vamos considerar que um livro "grande" seria um livro 
    com mais de 1000 páginas, estes livros estão listados abaixo.''')
    df_gt_1000 = quantidade_de_pag_por_livro.query('num_pages > 1000')
    st.dataframe(df_gt_1000[['title', 'categories', 'num_pages', 'average_rating']])
    "(PAREI AQUI, ALEXANDRE)A minha ideia aqui é comparar a média das notas desses livros, com a média de todos os livros, e a média dos livros melhores avaliados"

def livros_por_ano_publi(dataframe):
    st.title("""Livros por ano de publicação🗓️
             Abaixo está uma tabela contendo cada livro e seus respectivos anos de publicação
             """)
    dataframe['published_year'].fillna(0, inplace=True)
    dataframe['published_year'] = dataframe['published_year'].astype('int')
    livros_e_anos = dataframe[['title', 'published_year']].sort_values('published_year', ascending = True)
    st.dataframe(livros_e_anos)
    
    st.title('''Livros mais antigos tendem a ter uma maior quantidade de páginas❓ 
             
             ''')
    pag_qnt = dataframe[['published_year', 'num_pages']]
    
    plt.scatter(dataframe['published_year'], dataframe['num_pages'], label='Ano de publicação por quantidade de paginas', color='r')
    ax = plt.gca()

    ax.set_xlim([1850, 2022])
    ax.set_ylim([5, 3500])
    plt.xlabel("Ano de publicação")
    plt.ylabel("Quantidade de páginas")
    
    st.set_option('deprecation.showPyplotGlobalUse', False)
    st.pyplot()
    st.write('''
             É possivel observar que a realidade é exatamente o contrario: os livros com uma maior quantidade de páginas são exatamente os mais recentes enquanto que ao longo do aumento da idade do livro sua quantidade de páginas tende a se estabilizar entre 500 e 1000.
             ''')
    
    st.title('''Livros mais antigos possuem uma médias de avaliação maiores do que as médias dos livros mais atuais❓
             ''')
    st.write('''
             Para isso, serão considerados como mais antigos os livros de 1850 a 1940 enquantos os mais atuais dos anos 2008 até então.
             ''')
    st.title(''' Livros mais antigos.
             ''')
    more_old = dataframe.query('published_year <= 1940 and published_year >= 1850')
    livros_anos_nota = more_old[['title', 'published_year', 'average_rating']].sort_values('published_year', ascending = True)
    st.dataframe(livros_anos_nota)
    st.title(''' Livros mais novos.
             ''')
    more_young = dataframe.query('published_year >= 2008')
    livros_anos_nota = more_young[['title', 'published_year', 'average_rating']].sort_values('published_year', ascending = True)
    st.dataframe(livros_anos_nota)
    
    
    
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