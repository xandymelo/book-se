import streamlit as st
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

st.write(""" # Recomendação de Livros
          Vamos ver nosso primeiro gráfico do projeto!""")
dataframe = pd.read_csv("books.csv")
notas = list(dataframe['num_pages'])
st.dataframe(dataframe)
fig, ax = plt.subplots()
ax.hist(notas, bins=20)

st.pyplot(fig)
#st.write(ax)
#st.write(fig)