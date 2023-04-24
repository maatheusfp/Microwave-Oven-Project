Estudantes:
DIEGO JOSÉ ARCOVERDE AGRA ROCHA - djaar
JOÃO ANTONIO DE LIMA REIS - jalr
MATHEUS FERREIRA PINHEIRO - mfp2
RAFAELA ARAUJO DE AZEVEDO PITANGA - raap

Como rodar os testes:
Ubuntu 22.04 com Icarus Verilog e Gtkwave
$ iverilog -o [módulo] [módulo]\_test.v [módulo].v #Compilar
$ vvp [módulo] #Simular
$ gtkwave [módulo] #Visualizar funções de onda
