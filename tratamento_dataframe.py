
def tratamento_df(dataframe):
    dataframe['num_pages'].fillna(0, inplace=True)
    dataframe['num_pages'] = dataframe['num_pages'].astype('int')
    dataframe['average_rating'].fillna(0, inplace=True)
    dataframe['published_year'].fillna(0, inplace=True)
    dataframe['published_year'] = dataframe['published_year'].apply(lambda year: str(year)[:4])
    #esse tratamento abaixo é porque tinham algumas categorias com '.' no final, e ai tratando como categorias diferentes
    dataframe['categories'] = dataframe['categories'].apply(lambda cat: str(cat).replace('.',''))
    dataframe['categories'] = dataframe['categories'].apply(lambda cat: str(cat).replace("China)","China"))
    return dataframe