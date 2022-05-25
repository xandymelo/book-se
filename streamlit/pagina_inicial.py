import streamlit as st

from df_muito_usados import DfsUsados

def pagina_inicial():
    st.write(""" # Book-se 📚
        Este é um projeto de alunos da faculdade UFRPE, para a cadeira de projeto 3.
        Nesa página vamos mostrar nossos estudos em cima dos dados que vamos
            usar no nosso desenvolvimento mobile Book-se, um Aplicativo de 
            recomendações literárias!
        """)
    st.subheader("🏷️Dataframe - Todos os livros")
    st.dataframe(DfsUsados.dataframe)
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
    st.subheader("🏷️Termos")
    st.subheader('''Livros bem Avaliados
    são os livros que estão com a avaliação acima da avaliação média (3.9084)''')
    st.dataframe(DfsUsados.livros_bem_avaliados)