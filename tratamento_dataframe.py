import streamlit as st
def tratamento_df(dataframe):
    dataframe['num_pages'].fillna(0, inplace=True)
    dataframe['num_pages'] = dataframe['num_pages'].astype('int')
    dataframe['average_rating'].fillna(0, inplace=True)
    dataframe['published_year'].fillna(1111, inplace=True) #RESOLVER ISSO
    #TIRAR OS ZEROS DESCENESSÁRIOS DA DATA
    dataframe['published_year'] = dataframe['published_year'].apply(lambda year: int(str(year)[:4]))
    #esse tratamento abaixo é porque tinham algumas categorias com '.' no final, e ai tratando como categorias diferentes
    dataframe['categories'] = dataframe['categories'].apply(lambda cat: str(cat).replace('.',''))
    #os "(" e ")" estavam dando problema nos comandos com regex = True, então eu tirei
    dataframe['categories'] = dataframe['categories'].apply(lambda cat: str(cat).replace(")",""))
    dataframe['categories'] = dataframe['categories'].apply(lambda cat: str(cat).replace("(",""))
    dataframe['categories'] = dataframe['categories'].apply(lambda cat: str(cat).replace("nan","Outros"))
    dataframe['categories'] = dataframe['categories'].apply(lambda cat: str(cat).replace("FICTION","Fiction"))
    dataframe['categories'] = dataframe['categories'].apply(lambda cat: "Outros" if (cat in ['Horror', 'Family','English','Bible']) else cat )
    todas_categorias = list(dataframe['categories'].str.get_dummies(','))
    #Tratamento para trocar categoria com menos de 8 livros para "Outros"
    for x in todas_categorias:
        todos_livros_da_categoria = dataframe[dataframe.categories.str.contains(x, regex = True)]
        if len(todos_livros_da_categoria.index) < 8:
            dataframe['categories'] = dataframe['categories'].apply(lambda cat: "Outros" if ("Outros" in cat) else str(cat).replace(x,"Outros"))
    return dataframe
