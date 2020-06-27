#!/usr/bin/env python
# coding: utf-8

# # Coleta de Dados no Twitter utilizando pacote Tweepy do Python

# **OBSERVAÇÃO:**
# 
# Antes de usar o tweepy pela primeira vez, **<font color='red'>é necessário instalar o pacote</font>**. Para isso, acesse o prompt do Anaconda e execute o comando abaixo:
# 
# ![image.png](attachment:image.png)

# ### Importação do pacote tweepy 

# **<font color='red'>SEMPRE é necessário importar</font>**  o(s) pacote(s) que serão usados no seu script.

# Vamos importar os pacotes que precisaremos usar nessa aplicação: TextBlob, Tweepy e NumPy
# Tenha certeza que todos os pacotes foram previamente instalados. 

# In[ ]:


#Importação de pacotes

import tweepy


# ### Credenciais para utilização da API do Twitter

# Para utilizar a API do twitter, é necessário ter uma conta no twitter, solicitar o acesso de desenvolvedor, criar sua aplicação, gerar suas credenciais.
# * Veja vídeo explicativo "*APIs e coleta de dados*": https://igti.instructure.com/courses/2939/pages/apis-e-coleta-de-dados-2?module_item_id=194528

# In[ ]:


# Credenciais para utilização da API do Twitter

consumer_key = ""
consumer_secret = ""
access_token = ""
access_token_secret = ""


# Fazer a autenticação na API usando suas credenciais

# In[ ]:


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
token = tweepy.API(auth)


# ### Realizar a busca por palavra chave.

# In[ ]:


#Definir que palavra deseja pesquisar no Twitter
#keyword = 'covid-19'
keyword = ('covid OR covid-19 OR corona OR coronavirus')


# In[ ]:





# In[ ]:


# Fazer a busca por palavra chave

# result_type --> mixed (default), recent, popular
#tweets --> variável que irá armazenar todos os Tweets com a palavra escolhida na função search da API

tweets = token.search(q=keyword,count=10,result_type='mixed')



# **Observação:**
# 
# Fazer a busca por palavra chave, busca o text do tweet truncado:
# * tweets = token.search(q=keyword,lang='pt')
# 
# Fazer a busca por palavra chave, busca o text do tweet por inteiro
# * tweets = token.search(q=keyword,tweet_mode='extended')

# In[ ]:


# Para verificar a quantidade de tweets coletado use a função "len()"

print("Total de tweets coletados %s." % (len(tweets)))


# In[ ]:


#Podemos imprimir o nome do usuário (screen_name) e o texto do tweet

for tweet in tweets:
    print("Usuário: %s "% {tweet.user.screen_name})
    print("  Tweet: %s"  % {tweet.text})
    #print("  Tweet: %s"  % {tweet.full_text}) #No caso da busca em tweet_mode='extended'


# ## <font color=blue>Análise de polaridade</font>

# Para fazer a **análise de polaridade**, vamos usar a função *sentiment.polarity* do pacote *TextBlob*.
# 
# * A função *sentiment.polarity* retornará um número entre -1 e 1, onde quanto maior esse número, menos "chateada" a pessoa que postou está. 
# 
# Ou seja, quanto maior esse número mais positivo é o tweet. Podemos ainda considerar que a polaridade 0 (zero) pode indicar uma neutralidade do tweet.

# In[ ]:


#importa pacotes

from textblob import TextBlob as tb
import numpy as np


# **Observação:** Lembre-se de instalar os pacotes primeiro.

# In[ ]:


#Variável que irá armazenar as polaridades
analysis = None


# In[ ]:


# Lista vazia para armazenar scores
tweets_score = [] 


# In[ ]:


for tweet in tweets:
    print('**',tweet.text)
    analysis = tb(tweet.text)
    polarity = analysis.sentiment.polarity
    tweets_score.append(polarity)


# In[ ]:


print('Vetor de polaridade:',tweets_score)


# In[ ]:


print('MÉDIA DE SENTIMENTO: ' + str(np.mean(tweets_score))) #a função mean() pertence ao pacote numpy


# In[ ]:


numpy.mean(valor)


# ##### Análise de polaridade para tweets que não foram postados em inglês.

# In[ ]:


polarities = []

for tweet in tweets: #para cada tweet 
    analysis = tb(tweet.text)  # tweet.full_text para modo extendido
    
    if analysis.detect_language() != 'en': #verifica se o tweet esta em inglês, se não estiver, vai traduzir

        traducao = tb(str(analysis.translate(to='en')))
        
        print('Texto traduzido %s: ' % traducao)
        
        polarity = traducao.sentiment.polarity
    else:
        polarity = analysis.sentiment.polarity
    
    polarities.append(polarity)
    


# In[ ]:


print('Vetor de polaridade:',polarities)


# In[ ]:


print('MÉDIA DE SENTIMENTO: ' + str(np.mean(polarities)))


# ## <font color=blue>Armazenar o tweets coletados</font> 

# Até aqui, nós criamos nossa autenticação e já temos acesso aos tweets coletados.
# Agora vamos armazenar nossos tweets.

# ##### Armazenar em arquivos

# In[ ]:


#importa o pacote json

import json 


# In[ ]:


status = tweets[0]

#converte para string
json_str = json.dumps(status._json)

#deserialise string para um objeto python
parsed = json.loads(json_str)


# In[ ]:


type(tweets)


# In[ ]:


type(json_str)


# In[ ]:


type(parsed)


# Agora vamos deserializar os tweets e gravar no arquivo json.
# 
# **Observação:** Antes de executar o scrit, verifique se o caminho de gravação do arquivo definido na variável *datasetPath* existe.

# In[ ]:


datasetPath = 'C:\Bootcamp\Datasets\JSON'

with open(datasetPath+'\\tweets_keywords.json', 'a', encoding='utf8') as filename:    #aberto em mode de append
    
    for tweet in tweets: #para cada tweet no vetor de resultados tweets
        
        status = tweet
        
        #converte para string        
        json_str = json.dumps(status._json)
        
        #deserializa a string para um objeto python do tipo dict        
        parsed = json.loads(json_str)
        
        #grava o tweet deserializado no arquivo
        json.dump(parsed, filename, ensure_ascii=False, sort_keys=True, indent=4, separators=(',', ':'))


# ##### Armazenar no MongoDB

# In[ ]:


#importa o pacote pymongo

import pymongo


# In[ ]:


#Conexão ao banco de dados
con = pymongo.MongoClient('localhost', 27017)

#seleciona o banco de dados
db = con.twitterdb


# In[ ]:


#seleciona a coleção para armazenar os tweets
collection = db.tweets_keywords


# In[ ]:


#lista a quantidade de tweets existentes na coleção
db.tweets_keywords.count()


# In[ ]:


#lista a quantidade de tweets existentes na coleção
db.tweets_keywords.count_documents({})


# In[ ]:


i = 0
#para cada tweet no vetor de resultados tweets
for tweet in tweets:
    db.tweets_keywords.insert_one(tweet._json)
    i=i+1
    #print("Tweet inserido com sucesso !!")


# In[ ]:


#lista a quantidade de tweets inseridos
print("Quantidade de tweets inseridos: %s" % i)


# In[ ]:


#lista a quantidade de tweets existentes na coleção
db.tweets_keywords.count_documents({})


# In[ ]:




