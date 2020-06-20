getwd();

# Importar (ler) os dados do arquivo CSV de valores separados por virgulas
iris <- read.csv(paste(getwd(),"/Datasets/Iris.csv",sep=""));

# Imprimir as 6 primeiras linhas do vetor iris 
head (iris);

# Imprimir as 3 primeiras linhas do vetor iris 
head (iris, 3);

# Imprimir todas as linhas do vetor iris
print(iris);

#Resumo das estatísticas descritivas: a observação mínima, 1a quartil (25%), 
# mediana (50%), media aritmética, 3a quartil (75%) e a máxima são 
#exibidos para cada amostra.
summary(iris);

#help(plot)

# Boxplot mostrando a mediana (linha horizontal, quartis 25 % e 75 % (caixa verde - col=3) e observações máxima e
#mínima (linhas verticais) – ylab e xlab são as etiquetas dos eixos y e x, respectivamente.
boxplot(iris, col=3, ylab="Valores(cm)", xlab="Característica")

#Usa range=0 para não mostrar os outliers (observações extremas representadas como pontos)
boxplot(iris, range=0, col=2, ylab="Valores(cm)", xlab="Característica")

#Mostrar todas as observações cruas da amostra A na forma de gráfico barplot. Anote y$A significa a
#coluna A de observações no arranjo de dados y - Figura 3
barplot(iris$ComprimentoSepalaCM,ylab="Valores em cm", xlab="Valores crus",
        names=as.character(iris$ComprimentoSepalaCM),cex.names=0.7, ylim=c(0,10));

#Para mostrar um histograma de freqüências das observações em amostra A (mais informativo sobre a
#distribuição das observações do que gráfico anterior!) - Figura 4
hist(iris$ComprimentoSepalaCM, col=2, main="Histograma de amostra A", xlab="Classe de
massa (g)", ylab="Freqüência");

#Podemos variar o número de intervalos com breaks e os limites do eixo x com xlim. Reparou as
#diferenças entre os dois histogramas? Lembre, são os mesmos dados - Figura 5
hist(iris$ComprimentoSepalaCM, breaks=2, xlim=(range(1,10)), col=2,
       main="Histograma de amostra A", xlab="Classe de massa (g)",ylab="Freqüência");

#Algumas estatísticas úteis:
# Desvio padrão (s) da amostra A => sd(x)
# variância (s2) da amostra A => var(x)
# Tamanho da amostra - n, o número de observações da amostra A => length(iris$ComprimentoSepalaCM)
# Desvio interquartílico (a diferença entre a 3a e a 1a quartil) da amostra A => IQR(iris$ComprimentoSepalaCM)
#Erro padrão da média da amostra A => sd(y$A)/sqrt(length(y$A))

cabecalho <- c("Média","Desvio padrão","variância","Tamanho da amostra","Desvio interquartílico","Erro padrão da média")
valores <- c(mean(iris$ComprimentoSepalaCM),sd(iris$ComprimentoSepalaCM), var(iris$ComprimentoSepalaCM),length(iris$ComprimentoSepalaCM),
             IQR(iris$ComprimentoSepalaCM),(sd(iris$ComprimentoSepalaCM)/sqrt(length(iris$ComprimentoSepalaCM))))

print(cabecalho);
print(valores);
print(rbind(cabecalho,valores));
print(cbind(cabecalho,valores));