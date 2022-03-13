import streamlit as st
import matplotlib.pyplot as plt
import pandas as pd
import plotly.figure_factory as ff
import numpy as np
import scipy



def tratamento_df(dataframe):
    dataframe['num_pages'].fillna(0, inplace=True)
    dataframe['num_pages'] = dataframe['num_pages'].astype('int')
    #esse tratamento abaixo é porque tinham algumas categorias com '.' no final, e ai tratando como categorias diferentes
    dataframe['categories'] = dataframe['categories'].apply(lambda cat: str(cat).replace('.',''))
    return dataframe

def pagina_inicial(dataframe):
    st.write(""" # Book-se 📚
        Este é um projeto de alunos da faculdade UFRPE, para a cadeira de projeto 3.
        Nesa página vamos mostrar nossos estudos em cima dos dados que vamos
            usar no nosso desenvolvimento mobile Book-se, um Aplicativo de 
            recomendações literárias!
        """)
    st.subheader("🏷️Dataframe - Todos os livros")
    st.dataframe(dataframe)
    st.subheader("🏷️Dicionário de dados")
    st.code(''' # Dicionário de Dados
# Books Dataset

## Descrição do Dataset
<p>	O data set contém um conjunto de 6811 livros e, em cada coluna, informações cruciais sobre cada um destes.</p>

## Dicionário

| Coluna | Tipo de dado | Comprimento | Descrição |
|--- |--- |--- |--- |
| ISBN13 | Int | 13 | Código internacional de identificação dos livros. |
| ISBN10 | Int | 10 | Código internacional de identificação dos livros. |
| Title | String | 100 | Titulo do livro. |
| Subtitle | String | 100 | Subtitulo do livro. |
| Authors | String | 60 | Nome do autor ou autores do livro.|
| Categories | String | 50 | Nome da categoria a qual o livro pertence. |
| Thumbnail | Varchar | 150 | Url para a imagem da capa do livro. |
| Description | TEXT | N/A | Descrição/sinopse do livro. |
| Published_year | Int | 4 | Ano de publicação do livro |
| Average_rating | Float | 1 | Média da avaliação do livro |
| Num_pages | Int | 6 | Numero de paginas do livro. |
| Rating_count | Int | 6 | Quantidade de avaliações do livro. |
''')


def livros_por_categoria(dataframe):
    todas_categorias = dataframe['categories'].str.get_dummies(',')
    quantidade_livros_por_categoria = todas_categorias.sum().sort_values(ascending=False)
    quantidade_livros_por_categoria.columns = ['teste', 'teste2']
    #NÃO CONSEGUI TROCAR O NOME DAS COLUNAS
    st.title(""" Livros por Categoria 📗
                Abaixo está mostrando cada categoria, e a quantidade de livros que o
     dataset possui nela. """)
    st.dataframe(quantidade_livros_por_categoria)
    st.title("Temos no total, {} categorias.".format(len(quantidade_livros_por_categoria.index)))
    categories_chart = st.slider('Quantidade de livros comparados no gráfico', 0, 585, 15)
    st.line_chart(quantidade_livros_por_categoria.head(categories_chart))
    st.write('''Podemos ver que a quantidade de livros da categoria Fiction no nosso dataset é bem maior
    do que as outras, dado que um livro pode ter mais de uma categoria, dividido por vírgula,
        e que esta categoria é uma categoria muito em alta nos livros, isso pode não ser
        uma desvantagem.''')
def livros_por_pagina(dataframe):
    st.title("""Livros por quantidade de páginas📘
    Abaixo está uma tabela ordenada de forma descrescente em relação a quantidade
     de páginas do livro, com suas respectivas notas.""")
    dataframe = dataframe[['title', 'categories', 'num_pages', 'average_rating']]
    quantidade_de_pag_por_livro = dataframe.sort_values('num_pages', ascending = False)
    st.dataframe(quantidade_de_pag_por_livro)
    dataframe_wihout_0 = dataframe.query('num_pages > 0')
    st.subheader('''A maior quantidade de páginas de um livro é {} a menor é {}.
     Vamos considerar livros pequenos como livros com menos que 300 páginas, entre
    300 e 800 páginas iremos considerar como médios, e maiores que 800 como grandes.
    (Não vamos levar em consideração os livros com 0 páginas)'''.format(dataframe['num_pages'].max(),dataframe_wihout_0['num_pages'].min()))
    df_pequenos_livros = dataframe.query('num_pages > 0 and num_pages <=300')
    df_medios_livros = dataframe.query('num_pages > 300 and num_pages <= 800')
    df_grandes_livros = quantidade_de_pag_por_livro.query('num_pages > 800')
    st.write('Livros pequenos :')
    st.dataframe(df_pequenos_livros.sort_values('num_pages'))
    st.write('Livros médios :')
    st.dataframe(df_medios_livros.sort_values('num_pages'))
    st.write('Livros grandes :')
    st.dataframe(df_grandes_livros.sort_values('num_pages'))
    st.subheader('''Temos {} livros pequenos, {} livros médios e {} livros grandes.'''.format(len(df_pequenos_livros.index),len(df_medios_livros.index),len(df_grandes_livros.index)))
    st.subheader(''' A média da avaliação dos livros pequenos é de {:.2f}, dos médios é de {:.2f}, dos grandes é {:.2f} e a média de todos os livros é {:.2f}.
    A comparação da média dos livros pequenos e grandes é mais comparável, pois 
    eles tem a quantidade de livros parecida, então os livros médios
    são levemente melhores avaliados que os pequenos.'''.format(df_pequenos_livros['average_rating'].mean(),df_medios_livros['average_rating'].mean(),df_grandes_livros['average_rating'].mean(),dataframe['average_rating'].mean()))
    # Group data together
    chart_data = pd.DataFrame(list(zip(df_grandes_livros['average_rating'].tolist(),df_medios_livros['average_rating'].tolist(),df_pequenos_livros['average_rating'].tolist())),
    columns = ['notas_livros_grandes','notas_livros_medios','notas_livros_pequenos'])
    range_chart = st.slider('Quantidade de livros comparados no gráfico', 0, 300, 30)
    st.area_chart(chart_data.head(range_chart))
    

if __name__ == '__main__':
    dataframe = pd.read_csv("books.csv")
    dataframe = tratamento_df(dataframe)
    sidebar = st.sidebar
    my_page = st.sidebar.radio('Análises', ['Página inicial 📚' ,'Livros por categoria 📗', 'Livros por quantidade de páginas 📘'])
    if my_page == 'Página inicial 📚':
        paginainicial = pagina_inicial(dataframe)
    if my_page == 'Livros por categoria 📗':
        estudo1 = livros_por_categoria(dataframe)
    if my_page == 'Livros por quantidade de páginas 📘':
        estudo2 = livros_por_pagina(dataframe)