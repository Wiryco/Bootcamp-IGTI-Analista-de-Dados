#Install rjson Package
#In the R console, you can issue the following command to install the rjson package.
#install.packages("rjson")

# Load the package required to read JSON files.
library("rjson")

filename <- paste(getwd(),"/Datasets/data.json",sep="")
# Give the input file name to the function.
result <- fromJSON(file = filename)

# Print the result.
print(result)

# Convert JSON file to a data frame.
json_data_frame <- as.data.frame(result)

print(json_data_frame)

csvfilename <- paste(getwd(),"/Datasets/clientes.csv",sep="")
write.csv(json_data_frame,csvfilename,col.names = TRUE)