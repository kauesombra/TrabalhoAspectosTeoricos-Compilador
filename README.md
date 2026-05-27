# Compilador — README

## Requisitos
- Arquivos `.jar` na pasta `lib/`

---

## Como executar

### Solucao integrada (tudo de uma vez)
```
run.bat
```

### Apenas o Scanner (JFlex)
```
java -jar lib/jflex-full-1.9.1.jar calc.flex
javac -cp ".;lib/java-cup-11b-runtime.jar" scanner.java
```

### Apenas o Parser (JCup)
```
java -jar lib/java-cup-11b.jar -parser parser -symbols sym calc.cup
javac -cp ".;lib/java-cup-11b.jar;lib/java-cup-11b-runtime.jar" parser.java sym.java
```

### Solucao integrada (manual)
```
java -jar lib/jflex-full-1.9.1.jar calc.flex
java -jar lib/java-cup-11b.jar -parser parser -symbols sym calc.cup
javac -cp ".;lib/java-cup-11b.jar;lib/java-cup-11b-runtime.jar" *.java
java -cp ".;lib/java-cup-11b.jar;lib/java-cup-11b-runtime.jar" Main
```

### Limpar arquivos gerados
```
cleanup.bat
```
