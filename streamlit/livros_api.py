from fastapi import FastAPI
from df_muito_usados import DfsUsados
import json
import random as rm

app = FastAPI()

rm.seed(1)

#RETOORNA UM LIVRO ALEATÓRIO DE UMA CERTA CATEGORIA
@app.get("/livros/{categoria}")
def randomBook(categoria):
    livros = DfsUsados().dataframe
    livros = livros.query('categories == "'+categoria+'"', )
    random_index = rm.randint(0, livros.values.__len__())
    livro = {
        "isbn13": str(livros.values[random_index][0]),
        "isbn10": str(livros.values[random_index][1]),
        "title": str(livros.values[random_index][2]),
        "subtitle": str(livros.values[random_index][3]),
        "authors": str(livros.values[random_index][4]),
        "categories": str(livros.values[random_index][5]),
        "thumbnail": str(livros.values[random_index][6]),
        "description": str(livros.values[random_index][7]),
        "published_year": str(livros.values[random_index][8]),
        "average_rating": str(livros.values[random_index][9]),
        "num_pages": str(livros.values[random_index][10]),
        "ratings_count": str(livros.values[random_index][11])
    }
    return livro
#RETORNA TODAS AS CATEGORIAS
@app.get("/categorias")
def RetornaCategorias():
    categorias = DfsUsados().dataframe
    categoria = categorias["categories"].unique().tolist()
    categoria = {"categorias" : categoria}
    print(categoria)
    return categoria
