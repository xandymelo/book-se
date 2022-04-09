import pandas as pd
import streamlit as st

from df_muito_usados import DfsUsados

def criar_df_por_categoria(dataframe,todas_categorias_list,quantidade_livros_por_categoria):
    futuro_dataframe = {'categoria': [], 'media_notas': [], 'quantidade_livros': list(quantidade_livros_por_categoria), 'media_num_pages': [],'media_quantidade_avaliacoes': [], 'media_ano_publicacao': []}
    for x in todas_categorias_list:
        futuro_dataframe['categoria'].append(x)
        media_nota = dataframe[dataframe.categories.str.contains(x, regex = True)].mean()
        futuro_dataframe['media_notas'].append(media_nota['average_rating'])
        futuro_dataframe['media_ano_publicacao'].append(media_nota['published_year'])
        futuro_dataframe['media_quantidade_avaliacoes'].append(media_nota['ratings_count'])
        futuro_dataframe['media_num_pages'].append(media_nota['num_pages'])
    
    return  pd.DataFrame(futuro_dataframe)

def dif_por_categoria():
    todas_categorias = DfsUsados.dataframe['categories'].str.get_dummies(',')
    todas_categorias_list = list(todas_categorias)
    todas_categorias_list = list(map(lambda x: x.lstrip(),todas_categorias_list))
    quantidade_livros_por_categoria = todas_categorias.sum()
      #df_todas_categorias_qtd_livros = pd.DfsUsados.dataframe({'Categoria': todas_categorias_list, 'Quantidade de Livros': })
    st.title(""" Qual o diferencial dos livros bem avaliados de cada categoria ? 📗
                Abaixo está mostrando um gráfico de cada categoria e sua quantidade de livros, e
                também uma tabela cada categoria, a quantidade de livros que o
                dataset possui nela e a média das avaliações dos livros. """)
    st.title("Temos no total, {} categorias.".format(len(quantidade_livros_por_categoria.index)))
    categories_chart = st.slider('Quantidade de livros comparados no gráfico', 0, 61, 15)
    st.line_chart(quantidade_livros_por_categoria.head(categories_chart))
    df_agrupado_por_quantidade_livros_e_media_notas = criar_df_por_categoria(DfsUsados.dataframe,todas_categorias_list,quantidade_livros_por_categoria)
    st.title(""" Tabela com a média dos dados de cada categoria, 
                ordenado pela média das avaliações""")
    st.dataframe(df_agrupado_por_quantidade_livros_e_media_notas.sort_values('media_notas',ascending=False))
    st.title("a média da quantidade de livros por categoria é {:.2f}".format(df_agrupado_por_quantidade_livros_e_media_notas['quantidade_livros'].mean()))
    st.title('Média do DF inteiro')
    st.dataframe(DfsUsados.dataframe[['published_year', 'average_rating', 'num_pages', 'ratings_count']].mean())
    st.title('''Note que a média de avaliações do DF inteiro é 3.9
            Logo podemos diminuir nossos dados apenas para categorias com média
    de avaliação acima da média''')
    df_categorias_acima_media = df_agrupado_por_quantidade_livros_e_media_notas.query('media_notas > 3.9094').sort_values('media_notas',ascending=False)
    st.dataframe(df_categorias_acima_media)
    
    st.subheader(''' Temos {} categorias acima da média no ponto avaliação
        abaixo estão as médias dos dados apenas das categorias com a avaliação
        acima da média'''.format(len(df_categorias_acima_media.index)))
    st.dataframe(df_categorias_acima_media[['quantidade_livros', 'media_num_pages','media_quantidade_avaliacoes', 'media_ano_publicacao']].mean())
    st.subheader(""" Comparando a média dos dados de todo o DF e a média dos dados apenas das categorias com a avaliação acima da média, tivemos: """)
    st.subheader(' - um crescimento de 3% no dado de quantidade de páginas')
    st.subheader(' - uma queda de  de 55,78% no dado de quantidade de avaliações')
    st.subheader(' - uma queda de  de 0,1% no dado de ano de publicação')
    st.subheader(' - uma queda de  de 45,13% no dado de quantidade de livros por categoria')
    st.subheader('Logo, podemos concluir que nesse conjunto de dados, os dados mais importantes para as categorias bem avaliadas é a baixa quantidade de avaliações e de livros')
