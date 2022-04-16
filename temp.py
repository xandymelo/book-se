from turtle import pd
from df_muito_usados import DfsUsados
from tratamento_dataframe import tratamento_df
import pandas as pd


df =pd.read_csv('dataframe_com_tratamento.csv')
avaliacoes = list(df['average_rating'])
nova_coluna = list(map(lambda x: 'acima da média' if (x > 3.9084) else 'abaixo da média', avaliacoes))
df['tipo_avaliacao'] = nova_coluna
df.to_csv('df_com_tipo_avaliacao.csv')
