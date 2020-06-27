#instalar pacote
install.packages('mongolite')

#importação de biblioteca
require(mongolite)

#Conexão ao banco de dados
iris <- mongo(collection = "iris", db = "igti", url = "mongodb://localhost")

#Contar o número de documentos existentesa na coleção iris
iris$count()

#Cria um data.frame com todos os dados da coleção
iris.df <- iris$find()

print(paste('Número de colunas: ',ncol(iris.df)))
print(paste('Número de linhas: ',nrow(iris.df)))
print(paste('Tamanho: ',length(iris.df)))

# Imprimir as 6 primeiras linhas do vetor(data.frame) iris 
head(iris.df);

#Imprimir os nomes de linhas do data.frame iris
#print(paste('Nome de linhas:',rownames(iris.df)))
print(rownames(iris.df))

#Imprimir os nomes de colunas do data.frame iris
#print(paste('Nome de linhas:',rownames(iris.df)))
print(colnames(iris.df))

#Grava arquivo CSV

write.csv(iris.df,'C:/Bootcamp/Datasets/CSV/irisFromMongo.csv',row.names=FALSE)

iris.df2 <- iris.df #criar novo data.frame identico ao iris.df
head(iris.df2)

print("Colunas do dataframe 2:")
print('')
print(colnames(iris.df2))

iris.df2$Id <- NULL
iris.df2$Especie <- NULL
print("Colunas do dataframe 2 após setar colunas ID e Especie para NULL:")
print('')
print(colnames(iris.df2))

#Renomear colunas do dataframe
colnames(iris.df2)[1] <- "Comprimento_Sepala"
colnames(iris.df2)[2] <- "Largura_Sepala"
colnames(iris.df2)[3] <- "Comprimento_Petala"
colnames(iris.df2)[4] <- "Largura_Petala"
print(colnames(iris.df2))

#Resumo das estatísticas descritivas:
summary(iris.df2)

# Boxplot mostrando a mediana (linha horizontal, quartis 25 % e 75 % (caixa verde - col=3) e observações máxima e
#mínima (linhas verticais) – ylab e xlab são as etiquetas dos eixos y e x, respectivamente.
# paramentro col=3 indica cor dar barras para verde
boxplot(iris.df2, col=3, ylab="Valores(cm)", xlab="Característica")

#Usa range=0 para não mostrar os outliers (observações extremas representadas como pontos)
# paramentro col=2 indica cor dar barras para vermelho
boxplot(iris.df2, range=0, col=2, ylab="Valores(cm)", xlab="Característica")

#Mostrar todas as observações cruas da amostra A na forma de gráfico barplot. Anote y$A significa a
#coluna A de observações no arranjo de dados y
# paramentro col=4 indica cor dar barras para azul
barplot(iris.df2$Comprimento_Sepala,ylab="Valores em cm", xlab="Valores crus",
        names=as.character(iris.df2$Comprimento_Sepala),cex.names=0.7, ylim=c(0,10),col=4);

#Para mostrar um histograma de freqüências das observações em amostra A (mais informativo sobre a
#distribuição das observações do que gráfico anterior!) - Figura 4
hist(iris.df2$Comprimento_Sepala, col=2, main="Histograma de amostra A", xlab="Classe de
massa (g)", ylab="Freqüência");

#Contar o número de documentos existentesa na coleção iris
iris$count()

# usar a função export para exibir os documentos da coleção iris
iris$export(stdout())

#exportar os documentos da coleção para um arquivo json
# se não informar o caminho, o arquivo será gerado no diretório de trabalho
iris$export(file("dumpIris.json"))

#gerar o arquivo de dump em um local específico
iris$export(file("C:/Bootcamp/Datasets/JSON/dumpIris.json"))

#Criar uma nova conexão ao banco de dados
irisDump <- mongo(collection = "irisDump", db = "igti", url = "mongodb://localhost")

#importa os documentos do arquivo para a nova coleção
irisDump$import(file("C:/Bootcamp/Datasets/JSON/dumpIris.json"))

irisDump$count()

irisDump$find(limit=5)

rm(irisDump) #Remove a conexão com a coleção irisDump

#Desconecta do MongoDB
iris$disconnect()

#Contar o número de documentos existentesa na coleção iris
iris$count()

#Contar o número de documentos existentesa na coleção iris
iris$count()

# Quando a conexão for removida vai desconectar automaticamente

rm(iris) #Remove a conexão com a coleção iris


#Contar o número de documentos existentesa na coleção iris
iris$count()


