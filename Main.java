import java.io.*;

public class Main {
    public static void main(String[] args) {
        String inputFile = "input.txt";

        // Permite passar outro arquivo como argumento
        if (args.length > 0) {
            inputFile = args[0];
        }

        System.out.println("===========================================");
        System.out.println(" Compilador Front-End AV3");
        System.out.println(" Arquivo de entrada: " + inputFile);
        System.out.println("===========================================\n");

        try {
            // Lê o arquivo de entrada
            BufferedReader reader = new BufferedReader(new FileReader(inputFile));

            // Mostra o código fonte de entrada
            System.out.println("--- Codigo-fonte de entrada ---");
            BufferedReader display = new BufferedReader(new FileReader(inputFile));
            String line;
            int lineNum = 1;
            while ((line = display.readLine()) != null) {
                System.out.printf("%3d | %s%n", lineNum++, line);
            }
            display.close();
            System.out.println("-------------------------------\n");

            // Inicializa o scanner e o parser
            scanner scanner = new scanner(reader);
            parser parser = new parser(scanner);

            // Executa a análise sintática e semântica
            System.out.println("--- Saida da analise ---");
            parser.parse();
            System.out.println("------------------------\n");

            System.out.println("Analise concluida!");

        } catch (FileNotFoundException e) {
            System.err.println("Erro: arquivo '" + inputFile + "' nao encontrado.");
        } catch (Exception e) {
            System.err.println("Erro durante a analise: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
