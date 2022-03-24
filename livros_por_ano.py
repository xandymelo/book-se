import streamlit as st
import matplotlib.pyplot as plt
import pandas as pd

import numpy as np
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
    
    st.title('''Livros mais antigos possuem uma média de avaliação maior do que a média dos livros mais atuais❓
             ''')
    st.write('''
             Para isso, serão considerados como mais antigos os livros de 1850 a 1940 enquantos os mais atuais dos anos 2008 até então.
             ''')
    st.title(''' Livros mais antigos.
             ''')
    more_old = dataframe.query('published_year <= 1940 and published_year >= 1850')
    livros_anos_nota = more_old[['title', 'published_year', 'average_rating']].sort_values('published_year', ascending = True)
    st.dataframe(livros_anos_nota)
    media_antigos = more_old['average_rating'].sum()
    media_antigos = media_antigos / len(more_old['average_rating'])
    media_antigos = round(media_antigos, 1)
    st.title('''
             Livros mais novos 
             ''')
    more_young = dataframe.query('published_year >= 2008')
    livros_anos_nota = more_young[['title', 'published_year', 'average_rating']].sort_values('published_year', ascending = True)
    media_novos = more_young['average_rating'].sum()
    media_novos = media_novos / len(more_young['average_rating'])
    media_novos = round(media_novos, 1)
    st.dataframe(livros_anos_nota)
    st.write('''Os livros mais antigos possuem uma média de %s enquanto os livros mais novos %s. Oque responde a nossa pergunta com 'Sim, livros mais antigos possuem uma média de avaliação maior do que os mais atuais.' ''' %(media_antigos, media_novos))
    medias = [media_antigos, media_novos]
    chart_data = pd.DataFrame(list(zip(more_old['average_rating'].tolist(), more_young['average_rating'].tolist())),
    columns = ['Livros mais antigos','Livros mais atuais'])
    st.area_chart(chart_data)
