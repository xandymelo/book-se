# Book-se 📚
  Este é um projeto de alunos da faculdade UFRPE, para a cadeira de projeto 3.
        Nosso objetivo é o desenvolvimento de um aplicativo de recomendações literarias.

        Nesse repositorio iremos armazenas o conteudo da cadeira de Projetos III.
# Rodar o projeto Flutter
  Para Rodar o proejto em flutter, use o comando:
  	flutter run --no-sound-null-safety

# Como acessar ao projeto

<p>Após instalar todas bibliotecas usadas no programa(streamlit por exemplo) o usuário irá digitar em seu console:

		streamlit run main.py

</p>

# Orange - Documentação da implementação:

  Esta seção abordará a documentação do orange no decorrer da implementação dos modelos de machine learning.
  
1. **Envio do Dataframe**:
	
	Inicialmente, ao iniciarmos o Orange, escolhemos a opção "new" para um novo documento que será criado no Orange:
	
	![image](https://user-images.githubusercontent.com/75483023/169921195-618030cc-04a8-4ec1-a7f4-346de17602da.png)
	
	


	Em seguida, no canto superior esquerdo, abrimos a parte de "Data" ” para escolhermos um “File” que vai receber a parte do arquivo.csv que vai conter o dataframe.


	![file](https://user-images.githubusercontent.com/75483023/169922352-7df74cd5-4a17-419a-87d3-c2a765851b89.png)

	Nesse arquivo file, vai estar o dataframe que vamos utilizar.
	
	Clicando nele, é possível ver o dataframe: 
	
	![dataframe orange](https://user-images.githubusercontent.com/75483023/169922292-a599118d-df78-456e-8159-2aeedcc0a48f.png)

	Na tela acima, podemos classificar as variáveis como variáveis meta, que não serão utilizadas no momento de rodar o modelo; feature que são utilizadas no momento de rodar o modelo; target, que vai ser a variável que será alvo para a classificação; ou skip, que vai ser desconsiderado.

	A nossa configuração de variáveis ficou da seguinte forma:
	
	![organizaçao do file](https://user-images.githubusercontent.com/75483023/169922255-41b5856b-d9cd-45f5-9fba-7d378598918f.png)

	**feature 1:** removemos pois classificamos como uma variável que não influencia no momento da aplicação do modelo

	**unnamed: 0:** removemos pois classificamos como uma variável que não influencia no momento da aplicação do modelo

	**isbn13:** Removemos pois é o número do código de barras do livro, classificamos como uma variável que não influencia na hora de aplicação do modelo.

	**Categories:** Mantivemos ela, pois são as categorias dos livros, pois é uma variável importante que influencia no momento de definição de um livro bom ou ruim.

	**published_year:** Mantivemos, pois é uma variável que influencia no momento da classificação de um livro como bom ou ruim, devido a algumas evidências nos dados onde muitos livros que eram classificados como bons tinham uma concentração em um certo ano.

	**average_rating:** Mantivemos, pois é uma variável que influencia, pois é a maior nota que um determinado livro obteve dentre as classificações que ele possui.

	num_pages:Mantivemos, pois foi identificado que muitos dos livros que possuem características que os classificam como bons, se concentram numa área onde o número de páginas possui uma margem parecida.

	ratings_count:Mantivemos, pois foi identificado que é uma variável que influencia na classificação do livro, pois uma grande quantidade de ratings, nos ajuda a termos uma melhor compreensão da quantidade de pessoas que avaliaram um determinado livro.

	**tipo_avaliaçao:** É a variável target, ou seja, ela que diz se o conjunto teste é bom ou não.

	**isbn10:**  Removemos pois é o número do código de barras do livro, apenas em outra formatação, classificamos como uma variável que não influencia na hora de aplicação do modelo.


	title: Mantivemos, pois é uma variável que influencia no momento da classificação.

	subtitle:Removemos, pois já utilizaremos o title.

	authors:Mantivemos, pois autor é uma variável que influencia se um livro possui uma determinada nota, seja ela boa ou ruim.

	thumbnail: Removemos, pois é uma variável que contém as imagens das capas dos livros.

	description: Mantivemos, pois é uma variável que influencia no momento da classificação, pois contém informações que podem alterar a classificação do livro.



	Na seção “Data” podemos utilizar o “data table” para melhor visualização dos nossos dados.
	
	![datatable](https://user-images.githubusercontent.com/75483023/169923086-ccf498f1-7600-4026-a5bc-59fa35d32305.png)
	
	Abaixo, temos uma head do nosso datatable, com os 20 primeiros dados: 
	
	![hd_datatable](https://user-images.githubusercontent.com/75483023/169923207-d1a414a2-4020-4fb4-8f94-b6e7c333b79d.png)
	

2. **Tratamento**:

	Em seguida, realizamos um leve tratamento na base de dados, pois na parte de descrições, haviam algumas descrições vazias, dessa forma, quisemos tirar elas para não causar nenhum tipo de problema no momento da implementação do modelo.
	
	Utilzando o “Select Rows” da aba “Data”, podemos retirar as descrições que era vazias, no orange, elas eram apareciam como “?”, portanto, retiramos todas as que eram “?”.

	![slct rows](https://user-images.githubusercontent.com/75483023/169923486-c679359d-d317-4462-8d2a-b0d476f3ef3e.png)
	
	Portanto, adicionamos essa condição, como é mostrado acima, e retiramos os dados “?”.
	
	É possível ver o número de dados que foram retirados a partir da parte debaixo da aba de Select Rows, onde o número inicial de dados era 6810 e após o tratamento, foram para 6545.


3. **Seleção das colunas que vamos utilizar**:
	
	Em seguida, vamos selecionar as colunas que vamos utilizar no momento de rodar o modelo. Dessa maneira, na parte de “Data”, selecionamos o “Select Columns”, que vai nos servir como filtro das variáveis.

	![slct columns](https://user-images.githubusercontent.com/75483023/169923728-888568b2-b5aa-495a-b075-09bebe0b845c.png)

	
	Mantemos as variáveis na parte superior como as que iremos utilizar no modelo, abaixo a variável target, e em Meta attributes, as variáveis que não iremos utilizar no modelo de machine learning.


4. **Aplicação dos Modelos de Machine Learning**:

	Em seguida, vamos aplicar os modelos de machine learning, na aba “Model”, temos a disponibilidade dos modelos de machine learning que o orange possui, vamos utilizar o kNN, SVM e Naive Bayes. Vamos ligá-los ao “ Select Columns”

	![modelos orange](https://user-images.githubusercontent.com/75483023/169923950-c4a7e05a-4800-4097-b784-f87e4916541c.png)


	Em seguida, na aba “Evaluate” utilizaremos o “test and score” para identificar, a partir dos dados testes, os scores dos modelos, ligaremos o “test and score” tanto ao modelo quanto ao “select columns” que contém os dados.
	
	![modelos seguidos orange](https://user-images.githubusercontent.com/75483023/169924024-3c17c750-181a-4ee7-963b-89ce3258ce9d.png)

	
	Ao Clicarmos em "test and Score" de cada modelo, podemos fazer alterações de alguns parâmetros que sao apresentados:
	
	Por exemplo, ao clicarmos no modelo SVM, podemos alterar o número de folds, podemos rodar um random sampling, podemos e dentro dele, podemos alterar  o número de repetições do modelo dentro dos dados, podemos também alterar o training set size, que vai dividir a quantidade dos dados que vão servir como treino, e o resto servirá como o teste
	
	![svm test and score](https://user-images.githubusercontent.com/75483023/169924180-5f90b7e6-d7e4-431c-bedc-2164d5a14f57.png)

	
	Dentro dos modelos nós utilizamos o target class como o average over classes, para utilizamos tanto a classificação “acima da média” quanto a “abaixo da média”, que serviram como o classificador de livros bons ou ruins respectivamente.
	
	Ainda nos modelos, utilizamos como Model Comparison a “Area Under ROC curve”, que essa análise ROC fornece ferramentas para selecionar modelos possivelmente ideais (modelos ótimos) e descartar modelos não tão ótimos
	


5. **Predições a partir dos dados**:

	Em seguida, vamos realizar novamente a parte inicial, mas sem os modelos, vamos selecionar o dataframe sem os modelos, para podermos utilizar a totalidade dos dados para teste a partir dos modelos anteriormente treinados.

	![test orange](https://user-images.githubusercontent.com/75483023/169924273-4a9bf110-f7fc-4985-9ba3-42b122fcd707.png)

	Posteriormente, ligamos esse “Select Columns” a uma funcionalidade chamada "Predictions" que é encontrada na parte “Evaluate” 

	![predictions do test](https://user-images.githubusercontent.com/75483023/169924346-eb7a2464-7027-4ca7-99b7-09946e2309a9.png)

	E para realizarmos essas predições a partir dos dados, ligar todos os modelos que foram anteriormente treinados ao “Predictions”. 
	
	Teremos uma Interface parecida com essa:
	
	![interface final orange](https://user-images.githubusercontent.com/75483023/169924435-f1ec83f0-2f4f-464b-bcb8-80760b5e4fa3.png)

	
	Dessa maneira, no "Predicitons" adicionado ao fim, podemos vizualizar os resultados obtidos dos testes feito com todo o dataframe, e assim comparar os resultados, por exemplo, abaixo temos os 10 primeiros resultados dos 3 modelos, e a direita, temos a comparação com o real tipo de avaliação.
	
	
	![modelos em comparaçao](https://user-images.githubusercontent.com/75483023/169924643-0e4d8ad1-4305-410a-a3a4-eac125eaad1f.png)

	Na imagem acima,podemos ver a proporção dos modelos, Utilizando como exemplo o modelo SVM, Em seu primeiro resultado, tivemos uma proporção de 53 % dos resultados como "abaixo da média" e 47% como "acima da média", e o algoritmo o classificou como "abaixo da média", essa informaçao mostra a comparaçao dos modelos em relação aos tipos de classificação.

	![resultados](https://user-images.githubusercontent.com/75483023/169924859-659f4802-bb37-47d8-acb5-d634be969791.png)

	Como mostrado na imagem acima, na parte inferior, podemos ver o reporte dos resultados dos modelos, com as informaçoes de AUC, CA, F1, Precision e Recall:
	
	![resultados dos modelos](https://user-images.githubusercontent.com/75483023/169924971-5d28593d-065a-4aca-adf9-d916a42de462.png)

	
	
	
	





	

	
	
	
