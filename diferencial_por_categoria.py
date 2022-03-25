import pandas as pd
import streamlit as st

def criar_df_por_categoria(dataframe,todas_categorias_list,quantidade_livros_por_categoria):
    futuro_dataframe = {'categoria': [], 'media_notas': [], 'quantidade_livros': list(quantidade_livros_por_categoria)}
    for x in todas_categorias_list:
        futuro_dataframe['categoria'].append(x)
        media_nota = dataframe[dataframe.categories.str.contains(x, regex = True)].mean()
        futuro_dataframe['media_notas'].append(media_nota['average_rating'])
    return  pd.DataFrame(futuro_dataframe)

def dif_por_categoria(dataframe):
    todas_categorias = dataframe['categories'].str.get_dummies(',')
    todas_categorias_list = list(todas_categorias)
    todas_categorias_list = list(map(lambda x: x.lstrip(),todas_categorias_list))
    quantidade_livros_por_categoria = todas_categorias.sum()
    st.title(""" PRÓXIMOS OBJETIVOS
                    - CRIAR UM DATAFRAME COM AS MÉDIAS, QTD DE LIVROS, E FAZER UMA ANÁLISE
                - criar um arquivo saparado com os dataframes úteis
                - adicionar a média de páginas e o período que os livros foram publicados ao
                df trabalhado nesta página""")    

    #df_todas_categorias_qtd_livros = pd.DataFrame({'Categoria': todas_categorias_list, 'Quantidade de Livros': })
    st.title(""" Qual o diferencial dos livros bem avaliados de cada categoria ? 📗
                Abaixo está mostrando um gráfico de cada categoria e sua quantidade de livros, e
                também uma tabela cada categoria, a quantidade de livros que o
                dataset possui nela e a média das avaliações dos livros. """)
    st.title("Temos no total, {} categorias.".format(len(quantidade_livros_por_categoria.index)))
    categories_chart = st.slider('Quantidade de livros comparados no gráfico', 0, 61, 15)
    st.line_chart(quantidade_livros_por_categoria.head(categories_chart))
    df_agrupado_por_quantidade_livros_e_media_notas = criar_df_por_categoria(dataframe,todas_categorias_list,quantidade_livros_por_categoria)
    st.dataframe(df_agrupado_por_quantidade_livros_e_media_notas.sort_values('media_notas',ascending=False))