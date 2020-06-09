
package IGTI;

import java.io.*;
import java.util.*;
import java.util.Random;
import java.text.*;
import org.apache.hadoop.conf.*;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;
import org.apache.hadoop.util.*;


public class ExemploIGTI extends Configured implements Tool 
{          
    public static void main (final String[] args) throws Exception {   
      int res = ToolRunner.run(new Configuration(), new ExemploIGTI(), args);        
      System.exit(res);           
    }   

    public int run (final String[] args) throws Exception {
      try{ 	             	       	
            JobConf conf = new JobConf(getConf(), ExemploIGTI.class);
            conf.setJobName("Calculo Covid19");

            final FileSystem fs = FileSystem.get(conf);
  
            Path diretorioEntrada = new Path("PastaEntrada"), diretorioSaida = new Path("PastaSaida");
            fs.mkdirs(diretorioEntrada);

            fs.copyFromLocalFile(new Path("/usr/local/hadoop/Dados/covidData.txt"), diretorioEntrada);

            FileInputFormat.setInputPaths(conf, diretorioEntrada);
            FileOutputFormat.setOutputPath(conf, diretorioSaida);

            conf.setOutputKeyClass(Text.class);
            conf.setOutputValueClass(Text.class);

            conf.setMapperClass(ReduceIGTI.class);
           // conf.setReducerClass(ReduceIGTI.class);
            JobClient.runJob(conf);            
        }
        catch ( Exception e ) {
            throw e;
        }
        return 0;
     }
 
    public static class MapIGTI extends MapReduceBase implements Mapper<LongWritable, Text, Text, Text> {
            
      public void map(LongWritable key, Text value, OutputCollector<Text, Text> output, Reporter reporter)  throws IOException {
           Text txtChave = new Text();
           Text txtValue = new Text();
           
           String[] dadosCovid = value.toString().split(",");
           String dataEvento = dadosCovid[0];
           String paisEvento = dadosCovid[2];
           int novosCasos = Integer.parseInt(dadosCovid[4]);
           int novosObitos = Integer.parseInt(dadosCovid[6]);

           String strChave = dataEvento;
           String strValor = paisEvento + "|" + String.valueOf(novosCasos) + "|" + String.valueOf(novosObitos);
           txtChave.set(strChave);
           txtValue.set(strValor);
           output.collect(txtChave, txtValue);            

      }        
    }
 
   
    public static class ReduceIGTI extends MapReduceBase implements Reducer<Text, Text, Text, Text> {       
       public void reduce (Text key, Iterator<Text> values, OutputCollector<Text, Text> output, Reporter reporter) throws IOException {   
           int maiorCasos = 0, maiorObitos = 0;
           String paisCasos = "", paisObitos = "", strSaida = "";
           Text value = new Text();
           String[] campos = new String[3];
           while (values.hasNext()) {
              value = values.next();   
              campos = value.toString().split("\\|");
              if (Integer.parseInt(campos[1]) > maiorCasos) {
                 maiorCasos = Integer.parseInt(campos[1]);
                 paisCasos = campos[0];
              }
              if (Integer.parseInt(campos[2]) > maiorObitos) {
                  maiorObitos = Integer.parseInt(campos[2]);
                  paisObitos = campos[0];
              }
           }
           strSaida = "Casos: " + String.valueOf(maiorCasos) + " em " + paisCasos + ".";
           strSaida += "Obitos: " + String.valueOf(maiorObitos) + " em " + paisObitos + ".";

           value.set(strSaida);
           output.collect(key, value);          
 
      }                
    }

   public static class MapIGTIMaior extends MapReduceBase implements Mapper<LongWritable, Text, Text, Text> {

      public void map(LongWritable key, Text value, OutputCollector<Text, Text> output, Reporter reporter)  throws IOException {

           
     }
}

    public static class ReduceIGTIMaior extends MapReduceBase implements Reducer<Text, Text, Text, Text> {   
       public void reduce (Text key, Iterator<Text> values, OutputCollector<Text, Text> output, Reporter reporter) throws IOException {      
         
             
  }
}

}
