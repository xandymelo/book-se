import streamlit as st
import matplotlib.pyplot as plt
import pandas as pd

import numpy as np

from df_muito_usados import DfsUsados
def livros_por_ano_publi():
    st.title("""Livros por ano de publicação🗓️
             Abaixo está uma tabela contendo cada livro e seus respectivos anos de publicação
             """)
    livros_e_anos = DfsUsados.dataframe[['title', 'published_year']].sort_values('published_year', ascending = True)
    st.dataframe(livros_e_anos.query('published_year != 1111'))
    st.subheader('a média do ano de publicação dos livros bem avaliados é {:.0f}, e o desvio padrão é de {:.0f}'.format(DfsUsados.livros_bem_avaliados['published_year'].mean(),DfsUsados.livros_bem_avaliados['published_year'].std(),))
    
    st.title('''Livros mais antigos tendem a ter uma maior quantidade de páginas❓ 
             
             ''')
    pag_qnt = DfsUsados.dataframe[['published_year', 'num_pages']]
    
    plt.scatter(DfsUsados.dataframe['published_year'], DfsUsados.dataframe['num_pages'], label='Ano de publicação por quantidade de paginas', color='r')
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
             Para isso, serão considerados como mais antigos os livros de 1850 a 2002, pois 2002 é a mediana dos anos de publicação, enquantos os mais atuais dos anos 2002 até então.
             ''')
    st.title(''' Livros mais antigos.
             ''')
    more_old = DfsUsados.dataframe.query('published_year < 2002 and published_year >= 1850')
    more_old = more_old.query('average_rating > 0')
    livros_anos_nota = more_old[['title', 'published_year', 'average_rating']].sort_values('published_year', ascending = True)
    st.dataframe(livros_anos_nota)
    media_antigos = more_old['average_rating'].sum()
    media_antigos = media_antigos / len(more_old['average_rating'])
    media_antigos = round(media_antigos, 1)
    st.title('''
             Livros mais novos 
             ''')
    more_young = DfsUsados.dataframe.query('published_year >= 2002')

    more_young = more_young.query('average_rating > 0')
    livros_anos_nota = more_young[['title', 'published_year', 'average_rating']].sort_values('published_year', ascending = True)
    media_novos = more_young['average_rating'].sum()
    media_novos = media_novos / len(more_young['average_rating'])
    media_novos = round(media_novos, 1)
    st.dataframe(livros_anos_nota)
    st.write('''Os livros mais antigos possuem uma média de %s enquanto os livros mais novos %s. O que responde a nossa pergunta com 'Não, a avaliação dos livros antigos e mais atuais são bem similares' ''' %(media_antigos, media_novos))
    medias = [media_antigos, media_novos]
    quantidade_chart = st.slider('Quantidade de livros comparados no gráfico', 0, 3598, 50)
    chart_data = pd.DataFrame(list(zip(more_old['average_rating'].head(quantidade_chart).tolist(), more_young['average_rating'].head(quantidade_chart).tolist())),
    columns = ['Livros mais antigos','Livros mais atuais'])
    st.area_chart(chart_data)
