#importação de biblioteca
require(mongolite)

#Conecta ao SGBD MongoDB

connection <- mongo(collection = "megasena", db = "igti", url = "mongodb://localhost")

query <- connection$find('{"Ganhadores_Sena":"1"}')

exam_scores <- query[c("Rateio_Sena")]

summary(exam_scores)

iris <- read.csv("C:/Bootcamp/Datasets/CSV/Iris.csv");

#Conecta ao SGBD MongoDB, a uma coleção específica

connection <- mongo(collection = "iris", db = "igti", url = "mongodb://localhost")

connection$insert(iris)

connection$find(limit = 5)

pessoas <- mongo(collection ="pessoas", db = "igti", url = "mongodb://localhost")
str <- c('{"nome" : "maria"}' , '{"nome": "ana", "idade" : 23}', '{"nome": "joão"}')
pessoas$insert(str)

pessoas$find()

pessoas$count()

pessoas$remove('{"idade" : 23}')
pessoas$count()

pessoas$find()

str <- c('{"nome" : "bill"}' , '{"nome": "anna", "idade" : 23}', '{"nome": "jose","idade" : 35}')
pessoas$insert(str)

pessoas$find()

pessoas$update('{"nome":"bill"}', '{"$set":{"idade": 21}}')

pessoas$find()


