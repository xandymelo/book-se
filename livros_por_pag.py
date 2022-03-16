import streamlit as st
import pandas as pd

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
    st.dataframe(df_pequenos_livros.sort_values('average_rating', ascending = False))
    st.write('Livros médios :')
    st.dataframe(df_medios_livros.sort_values('average_rating', ascending = False))
    st.write('Livros grandes :')
    st.dataframe(df_grandes_livros.sort_values('average_rating', ascending = False))
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