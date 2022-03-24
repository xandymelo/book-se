import streamlit as st
def livros_por_categoria(dataframe):
    st.write("FAZER TRATAMENTO DE CATEGORIAS COM >= SETE LIVROS, TROCAR POR 'OUTROS'")
    st.write("CRIAR UM DATAFRAME COM AS MÉDIAS, QTD DE LIVROS, E FAZER UMA ANÁLISE")
    todas_categorias = dataframe['categories'].str.get_dummies(',')
    todas_categorias_list = list(todas_categorias)
    todas_categorias_list = list(map(lambda x: x.lstrip(),todas_categorias_list))
    quantidade_livros_por_categoria = todas_categorias.sum().sort_values(ascending=False)
    #quantidade_livros_por_categoria.columns = ['teste', 'teste2']
    #NÃO CONSEGUI TROCAR O NOME DAS COLUNAS
    st.title(""" Livros por Categoria 📗
                Abaixo está mostrando cada categoria, e a quantidade de livros que o
     dataset possui nela. """)
    st.dataframe(quantidade_livros_por_categoria)
    st.title("Temos no total, {} categorias.".format(len(quantidade_livros_por_categoria.index)))
    categories_chart = st.slider('Quantidade de livros comparados no gráfico', 0, 585, 15)
    st.line_chart(quantidade_livros_por_categoria.head(categories_chart))
    st.write(list(todas_categorias_list))
    for x in todas_categorias_list:
        a = dataframe[dataframe.categories.str.contains(x, regex = True)].mean()
        st.write('{} : {}'.format(x, a['average_rating']))