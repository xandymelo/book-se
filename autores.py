from tokenize import group
from df_muito_usados import DfsUsados
import streamlit as st
import matplotlib.pyplot as plt
import plotly.figure_factory as ff
import pandas as pd
import sys
sys.setrecursionlimit(10000)

dataframe = DfsUsados().dataframe


'''Variaveis para armazenar as médias gerais '''
autores = dataframe[['authors']]
quantidades_pages = []
quantidades_livros = []
medias_geral = []
#Media geral de quantidade de paginas
media_geral_pages = 0
#Media geral da quantidade de livros
media_geral_livros = 0
#Media geral de avaliação 
medias_geral_value = 0 


medias_baixa = []
pages_baixa = []
livros_baixa = []
medias_altas = []
pages_altas = []
livros_altas = []
medias_altas_avaliacoes = 0
medias_altas_pages = 0
medias_altas_livros = 0   
medias_baixas_avaliacoes = 0
medias_baixas_pages = 0
medias_baixas_livros = 0  

def autores_relacao():
    global medias_geral, quantidades_livros, quantidades_pages, media_geral_livros, media_geral_pages, medias_geral_value, medias_baixa, medias_altas, medias_baixas_avaliacoes, medias_altas_avaliacoes, medias_baixas_livros, medias_altas_livros, medias_altas_pages, medias_baixas_pages, pages_altas, livros_altas, pages_baixa, medias_baixas_livros

    
    

    def run_in_autores(autor, i):

        global medias_geral, quantidades_livros, quantidades_pages 
       

        if i < len(autor):

            if isinstance(autor[i], str):

                autor_n = autor[i].replace('"', "")
                livros = dataframe.query('authors == "'+ autor_n + '"')
                soma = sum(int(k) for k in livros[['num_pages']].values)
                if len(livros[['num_pages' ]].values) > 0:
                    media_pages = soma/len(livros[['num_pages']].values)
                else:
                    media_pages = soma
                quantidades_pages.append(media_pages)

                soma = sum(float(i) for i in livros[['average_rating']].values)

                if len(livros[['average_rating']].values) > 0:
                    medias_autor = soma / len(livros[['average_rating']].values)
                else:
                    medias_autor = soma
                
                medias_geral.append(medias_autor)
                qnt_livros = len(livros[['title']].values)
                quantidades_livros.append(qnt_livros)
            i += 1
            run_in_autores(autor, i)
        else:
            return
        return


    def run_autores(autores, j):
        global media_geral_livros, media_geral_pages, medias_geral_value
        
        if j < len(autores):
            
            run_in_autores(autores[j], i=0)
            j+=1
            run_autores(autores, j)

            media_geral_livros = sum(quantidades_livros) / len(quantidades_livros)       
            media_geral_pages = sum(quantidades_pages) / len(quantidades_pages)
            medias_geral_value = sum(medias_geral) / len(medias_geral)
        else:
            return 

    print(autores.values)
    run_autores(autores.values, j=0)
    print("SAIU DA RECURSIVIDADE")
    print(media_geral_livros)
     
    '''Variaveis para os autores acima da média de avaliações'''

    def run_in_media(autor, i):
        global pages_altas, livros_altas, medias_altas, pages_baixa, livros_baixa, medias_baixa
        if i < len(autor):
            if isinstance(autor[i], str):
                autor_n = autor[i].replace('"',"")
                livros = dataframe.query('authors == "' + autor_n+'"')
                
                soma = sum(float(i) for i in livros[['average_rating']].values)
                if len(livros[['average_rating']].values) > 0:
                
                    avaliacoes = soma/ len(livros[['average_rating']].values)
                else:
                    avaliacoes = soma
                
                if avaliacoes >= medias_geral_value:
                    soma = sum(int(i) for i in livros[['num_pages']].values)
                    if(len(livros[['num_pages' ]].values) > 0):
                        
                        qnt_pages = soma/len(livros[['num_pages' ]].values)
                    else:
                        qnt_pages = soma
                    pages_altas.append(qnt_pages)
                    
                    qnt_livros = len(livros[['title']].values)
                    livros_altas.append(qnt_livros)
                    medias_altas.append(avaliacoes)
                elif avaliacoes < medias_geral_value:
                    soma = sum(int(i) for i in livros[['num_pages']].values)
                    if(len(livros[['num_pages' ]].values) > 0):
                        
                        qnt_pages = soma/len(livros[['num_pages' ]].values)
                    else:
                        qnt_pages = soma
                    pages_baixa.append(qnt_pages)
                    qnt_livros = len(livros[['title']].values)
                    livros_baixa.append(qnt_livros)
                    medias_baixa.append(avaliacoes)
            i += 1
            run_in_media(autor, i)
        else:
            return
        return

    def run_media(autores, j):
        global medias_altas_avaliacoes, medias_baixas_avaliacoes, medias_altas_pages, medias_altas_livros, medias_baixas_livros, medias_baixas_pages
        if j < len(autores):
            run_in_media(autores[j], i = 0)
            j+=1
            run_media(autores, j)
            medias_altas_avaliacoes = sum(medias_altas) / len(medias_altas)
            medias_altas_pages = sum(pages_altas) / len(pages_altas)
            medias_altas_livros = sum(livros_altas) / len(livros_altas)
            
            medias_baixas_avaliacoes = sum(medias_baixa) / len(medias_baixa)
            medias_baixas_pages = sum(pages_baixa) / len(pages_baixa)
            medias_baixas_livros = sum(livros_baixa) / len(livros_baixa)
        else:
            return

    run_media(autores.values, j=0)
    
    print(medias_geral_value )
    porcentagem_rating = ((medias_altas_avaliacoes / medias_baixas_avaliacoes) -1) * 100
    porcentagem_rating  = round(porcentagem_rating, 2)
    porcentagem_pages = ((medias_altas_pages / medias_baixas_pages) - 1 ) * 100
    porcentagem_pages  = round(porcentagem_pages, 2)
    porcentagem_livros = ((medias_altas_livros / medias_baixas_livros) - 1 ) * 100
    porcentagem_livros  = round(porcentagem_livros, 2)
    
    medias_geral_value = round(medias_geral_value, 2)

    
    st.title(""" 
             Qual a relação entre as características do autor e as avaliações dos livros dele?
             """)
    st.write(''' 
             Para começar, iremos gerar a média das avaliações de todos os livros de cada autor e com isso encontrar a média de todos os autores.
             ''')
    

        
    coluna_geral_rating = {'Média geral dos autores': [round(medias_geral_value, 2)]}
    df = st.dataframe(coluna_geral_rating)
    st.write(f'''
             Como é possivel ver, a média geral das avaliações dos autores é de {round(medias_geral_value, 2)}.
             ''')

    st.write(f'''
             E agora que sabemos que a média geral é de {medias_geral_value}, é possivel definir oque é um autor acima e oque é um autor abaixo da média.
             ''')
    
    

    
    st.title('''
             Comparação das médias de avaliação dos autores abaixo e dos que estão acima da média.🤼
             ''')
    st.write(f'''
             Nessa parte iremos separar os autores com uma média de avaliação acima de {medias_geral_value} dos que estão abaixo afim de obter a média de cada um dos grupos.
             ''')
    hist_data = [medias_altas, medias_baixa]
    group_labels = ['Médias altas', 'Médias baixas']
    fig = ff.create_distplot(
         hist_data, group_labels, bin_size=[.1, .25])
    st.plotly_chart(fig, use_container_width=True)
    dataframe_comp_rating = {'Abaixo da média': [medias_baixas_avaliacoes], 'Acima da média': [medias_altas_avaliacoes]}
    st.dataframe(dataframe_comp_rating)  
    st.write(f'Como é possivel ver, os autores abaixo da média geral possuem uma média de {round(medias_baixas_avaliacoes, 2)} enquanto os que estão acima possuem uma média de {round(medias_altas_avaliacoes, 2)}.')  
    st.write(f'E isso nos leva a perceber que os autores acima da média possuem uma diferença de {porcentagem_rating}% na média da avaliações em comparação aos que estão abaixo.')
    
    
    st.title('''
             Comparação entre os dois grupos pelas caracteristicas de um autor. 👥
             ''')
    st.write('''
             Nós iremos considerar como caracteristicas de um autor a sua quantidade média de páginas e de livros publicados.
             ''')
    st.write(f'📝Para começar iremos comparar a quantidade média de páginas dos autores abaixo da média com a quantidade dos que estão acima. ')
    dataframe_comp_pages = {'Média de páginas abaixo': [medias_baixas_pages], 'Média de páginas acima': [medias_altas_pages]}
    st.dataframe(dataframe_comp_pages)  
    st.write(f'''
             Podemos observar que a quantidade média de páginas doa autores abaixo da média é de {round(medias_baixas_pages, 2)} emquanto dos que estão acima é de {round(medias_altas_pages)}
             ''')
    
    st.write(f'E ainda é possivel observar que os autores mais bem avaliados possuem uma média de páginas {porcentagem_pages}% maior que os menos avaliados.')  
    
    st.write(f'''
             Agora iremos comparar a quantidade média de livros publicados 📚
             ''')
    dataframe_comp_livros = {'Média de livros abaixo': [medias_baixas_livros], 'Média de autores acima': [medias_altas_livros]}
    st.dataframe(dataframe_comp_livros)  
    st.write(f'Os autores abaixo da média possuem uma quantidade média de {round(medias_baixas_livros, 2)} enquanto os autores com melhores avaliações apresentaram {round(medias_altas_livros, 2)}') 
    st.write(f'Isso nos entrega uma diferença de {porcentagem_livros}% entre os dois grupo em relação a diferença na quantidade de livros publicados.')
    
    st.title('Conclusão 🎯')
    st.write(f'Observando as diferenças de {porcentagem_pages}% a mais de páginas e {porcentagem_livros}% de livros, podemos identificar uma relação entre a maior quantidade de livros publicados e páginas escritas com a média das avaliações dos autores. ')

      
      

 