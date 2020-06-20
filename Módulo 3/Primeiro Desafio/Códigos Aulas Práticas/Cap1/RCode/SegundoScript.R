
# Importar (ler) os dados do arquivo CSV de valores separados por virgulas
# O comando "<- read.table" passa para "dados" o conteúdo do arquivo. 
#Para verificar o conteúdo basta digitar "dados" na linha de comando.

dados <- read.table(paste(getwd(),"/Datasets/contabilidadeEmpresa.csv",sep=""),header=TRUE,sep=";");
head(dados,3)

#Para obter um resumo das colunas do dataframe basta digitarmos o comando summary():
summary(dados)

#É apresentado um resumo com os valores de mínimo, primeiro quartil, mediana, média, terceiro
#quartil e máximo. Mas num dataframe nem todas as colunas precisam ser da mesma classe e no caso
#as três primeiras (Empresa Tipo_SA Tamanho) são variáveis categóricas. As estatísticas apresentadas são válidas apenas para as
#variáveis métricas, Patrimonio_Liquido, Ativo_Circulante, Passivo_Circulante,
#Ativo_Permanente, AtivoRLP, PassivoELP, Perc_Lucro_Liquido.

#Vamos transformar as variáveis categóricas para fatores assim elas serão utilizadas de forma correta.
# Transformar CAP e TAM:
dados$Tipo_SA <- factor(dados$Tipo_SA,labels= c("Capital Aberto","Capital Fechado"))

dados$Tamanho <- factor(dados$Tamanho,labels=c("Pequena","Média","Grande"))

summary(dados)

#Medidas de centro
#Média: mean(x)

with(dados,mean(Patrimonio_Liquido))
mean(dados$Patrimonio_Liquido)

#Para que as variáveis fique disponíveis de forma mais direta utilizamos o comando attach(dataframe). Desta forma não precisamos utilizar a notação $.
#Depois utilizamos detach(dados)
attach(dados)

#Mediana: median(x)
#A mediana é o valor que separa 50% dos valores inferiores dos 50% dos valores superiores, em
#outras palavras é o percentil 50.
median(Patrimonio_Liquido)
median(Ativo_Circulante)
median(Passivo_Circulante)

#Ativo_Permanente, AtivoRLP, PassivoELP, Perc_Lucro_Liquido.

#Percentil: quantile(x,p)
#Sendo p o percentil, por exemplo se p = 0.50 temos a mediana.

quantile(Patrimonio_Liquido,0.50)
quantile(Patrimonio_Liquido, probs = c(0.1, 0.5, 1, 2, 5, 10, 50)/100)

#Medidas de dispersão
#Desvio Padrão Amostral => sd(x)
sd(Patrimonio_Liquido)
sd(Ativo_Circulante)

#Variância 2 s var(x)
var(Patrimonio_Liquido)

#Gráficos
#Histograma hist(x) 
hist(Ativo_Circulante)

#Boxplot => boxplot(x)
#boxplot(x,range=0) - não mostra outliers

boxplot(Patrimonio_Liquido~Tamanho,col=4,ylab="Patrimônio Liquido(R$)",xlab ="Tamanho")
boxplot(Patrimonio_Liquido~Tipo_SA,col=5,ylab="Patrimônio Liquido(R$)",xlab ="Tipo SA")

#Gráfico de frequência para dados categóricos
#Gráfico de Barras => barplot(table(x))
barplot(table(Tamanho),col=2,xlab="Tamanho da empresa",ylab="Quantidade")

#Gráfico de Pizza pie(table(x)) 
pie(table(Tamanho))
pie(table(Tamanho), col = rainbow(10), radius = 0.9)
help(pie)

#Distribuição Binomial
# A probabilidade de se obter exatamente x sucessos em n tentativas, sendo a p a probabilidade de
#sucesso em uma tentativa, é dada por => P(x) = dbinom(x,n,p)
#Gráfico ??
x<-0:50
plot(x,dbinom(x,size=50,prob=.4),type="h")

#Score-z ou padronização dos dados zscore(x)
#  Instalar e carregar o pacote R.basic:
#Xz <- zscore(dados$Patrimonio_Liquido)

#Intervalo de Confiança para média t.test(x)
t.test(Ativo_Circulante, conf.level=.90)

#Intervalo de Confiança para proporção prop.test(x)
#Contagem de itens válidos: 
n = length(Tipo_SA)
#Contagem de itens iguais à Capital Aberto:
k = sum(Tipo_SA == "Capital Aberto")
#Teste de proporção 
prop.test(k, n)
