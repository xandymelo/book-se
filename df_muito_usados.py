import pandas as pd
from tratamento_dataframe import tratamento_df
class DfsUsados():
    dataframe = tratamento_df(pd.read_csv("books.csv"))
    livros_bem_avaliados = dataframe.query('(average_rating > 3.9084) and (published_year != 1111)') #tirar anos de publicação inválidos
