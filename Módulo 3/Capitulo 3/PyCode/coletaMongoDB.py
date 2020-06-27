#!/usr/bin/env python
# coding: utf-8

# # Coleta de Dados no MongoDB com Python

# **OBSERVAÇÃO:**
# 
# Antes de usar o pymongo pela primeira vez, é necessário instalar o pacote. Para isso, acesse o prompt do Anaconda e execute o comando abaixo:
# 
# *conda install -c wakari pymongo*

# In[ ]:


#importação de biblioteca

import pymongo


# In[ ]:


#Conexão ao banco de dados
#from pymongo import MongoClient
con = pymongo.MongoClient('localhost', 27017)


# In[ ]:


con


# In[ ]:


#listar os bancos de dados
con.list_database_names()


# In[ ]:


#seleciona o banco de dados
db = con.igti


# In[ ]:


db


# In[ ]:


#listar as coleções
db.list_collection_names()


# In[ ]:


#seleciona a coleção
collection = db.megasena


# In[ ]:


#seleciona o primeiro elemento da coleção
collection.find_one()


# In[ ]:


#seleciona o primeiro documento da coleção que atenda a condição
print(collection.find_one({"Ganhadores_Sena": "0"}))


# In[ ]:


#importação de pacote/biblioteca
import pprint #outro pacote para imprimir


# In[ ]:


pprint.pprint(collection.find_one({"Ganhadores_Sena": "0"}))


# In[ ]:


#seleciona o primeiro documento da coleção que atenda a condição
pprint.pprint(collection.find_one({"Concurso":"100"}))


# In[ ]:


#selecionas os documentos da coleção que atendam a condição, e imprime os documentos
for documets in collection.find({"Ganhadores_Sena": "5"}):
    pprint.pprint(documets)


# In[ ]:


#listar as coleções
db.list_collection_names()


# #### Criar banco de dados e coleção

# In[ ]:


con = pymongo.MongoClient("mongodb://localhost:27017/")


# In[ ]:


#listar os bancos de dados
con.list_database_names()


# In[ ]:


db = con["Vendas"]


# In[ ]:


con.list_database_names()


# In[ ]:


colecao = db["clientes"]


# In[ ]:


db.list_collection_names()


# In[ ]:


documento = {"nome" : "maria", "idade" : 23}


# In[ ]:


resultado = colecao.insert_one(documento)


# In[ ]:


print(resultado)


# In[ ]:


con.list_database_names()


# In[ ]:


db.list_collection_names()


# In[ ]:


print(colecao.find_one())


# In[ ]:


#selecionas os documentos da coleção que atendam a condição, e imprime os documentos
for resultado in colecao.find():
    pprint.pprint(resultado)


# In[ ]:


documento = [
    {"nome" : "jorge", "idade" : 33},
    {"nome" : "ana"},
    {"nome": "William", "endereco": "Avenida Central n. 954"},
    {"nome" : "ana", "endereco": "Avenida Central n. 954"},
    {"nome": "William", "endereco": "Avenida Central n. 954"},
    {"nome": "William"}   
    ]


# In[ ]:


pprint.pprint(documento)


# In[ ]:


resultado = colecao.insert_one(documento)


# In[ ]:


#inserir documento em uma coleção
resultado = colecao.insert_many(documento)


# In[ ]:


print(resultado)


# In[ ]:


#selecionas os documentos da coleção que atendam a condição, e imprime os documentos
for resultado in colecao.find():
    pprint.pprint(resultado)


# In[ ]:


condicao = { 'nome': 'ana' }
valor = { "$set": { "logradouro": "Avenida JK","num": 345 } }

colecao.update_one(condicao, valor)

for resultado in colecao.find():
    pprint.pprint(resultado)


# In[ ]:


for resultado in colecao.find({ 'nome': 'ana' }):
    pprint.pprint(resultado)


# In[ ]:


condicao = { 'nome': 'ana' }
valor = { "$set": { "logradouro": "Avenida JK","num": 345 } }

colecao.update_many(condicao, valor)


# In[ ]:


for resultado in colecao.find({ 'nome': 'ana' }):
    pprint.pprint(resultado)


# In[ ]:


for resultado in colecao.find({ 'nome': 'William' }):
    pprint.pprint(resultado)


# In[ ]:


condicao = { 'nome': 'William' }

colecao.delete_one(condicao)


# In[ ]:


for resultado in colecao.find({ 'nome': 'William' }):
    pprint.pprint(resultado)


# In[ ]:


condicao = { 'nome': 'William' }

colecao.delete_many(condicao)


# In[ ]:


for resultado in colecao.find({ 'nome': 'William' }):
    pprint.pprint(resultado)


# In[ ]:


for resultado in colecao.find():
    pprint.pprint(resultado)


# In[ ]:




