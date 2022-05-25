import streamlit as st
from df_muito_usados import DfsUsados
import pandas as pd

def filtros():
    dataframe = DfsUsados.dataframe
    st.title('Filtros')
    #NUM_PAGES
    st.subheader('Filtro por quantidade de páginas')
    de_pag = st.slider('De', 2, 3342, 100)
    para_pag = st.slider('Até', de_pag, 3342, 500)
    filtro = dataframe.query(f'num_pages > {de_pag}')
    filtro = filtro.query(f'num_pages < {para_pag}').sort_values('num_pages', ascending = False)
    #ANO PUBLICACAO
    st.subheader('Filtro por ano de publicação')
    de_ano = st.slider('De', 1853, 2019, 2000)
    para_ano = st.slider('Até', de_ano, 2019, 2010)
    filtro = filtro.query(f'published_year > {de_ano}')
    filtro = filtro.query(f'published_year < {para_ano}')
    #AVERAGE_RATING
    st.subheader('Filtro por Avaliação')
    de_avaliacao = st.slider('De', 0.0, 5.0, 3.0)
    para_avalicao = st.slider('Até', de_avaliacao, 5.0, 4.0)
    filtro = filtro.query(f'average_rating > {de_avaliacao}')
    filtro = filtro.query(f'average_rating < {para_avalicao}')
    #CATEGORIAS
    st.subheader('Categorias')
    categorias = DfsUsados.todas_categorias_list
    col1, col2 = st.columns(2)
    cont = 0
    for categoria in categorias:
        if categorias.index(categoria) > ( len(categorias) / 2 ):
            with col2:
                check = st.checkbox(categoria)
        else:
            with col1:
                check = st.checkbox(categoria)
        if check:
            if ( cont >= 1 ) :
                dataframe_categorias = dataframe.query(f'categories == "{categoria}"')
                concat_list = [filtro, dataframe_categorias]
                filtro = pd.concat(concat_list)
            else:
                filtro = filtro.query(f'categories == "{categoria}"')
            cont += 1
    
    


    st.subheader(f'Quantidade de livros: {len(filtro.index)}')
    st.dataframe(filtro)