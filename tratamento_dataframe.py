
def tratamento_df(dataframe):
    dataframe['num_pages'].fillna(0, inplace=True)
    dataframe['num_pages'] = dataframe['num_pages'].astype('int')
    #esse tratamento abaixo é porque tinham algumas categorias com '.' no final, e ai tratando como categorias diferentes
    dataframe['categories'] = dataframe['categories'].apply(lambda cat: str(cat).replace('.',''))
    return dataframe