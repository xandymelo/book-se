import pandas as pd
from tratamento_dataframe import tratamento_df

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

class DfsUsados():
    dataframe = tratamento_df(pd.read_csv("books.csv"))
    livros_bem_avaliados = dataframe.query('(average_rating > 3.9084) and (published_year != 1111)') #tirar anos de publicação inválidos
    todas_categorias = dataframe['categories'].str.get_dummies(',')
    todas_categorias_list = list(map(lambda x: x.lstrip(),list(todas_categorias)))
    quantidade_livros_por_categoria = todas_categorias.sum()
    df_agrupado_por_quantidade_livros_e_media_notas = criar_df_por_categoria(dataframe,todas_categorias_list,quantidade_livros_por_categoria)
    df_categorias_acima_media = df_agrupado_por_quantidade_livros_e_media_notas.query('media_notas > 3.9094').sort_values('media_notas',ascending=False)