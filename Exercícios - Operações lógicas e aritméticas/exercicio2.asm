#2. Escreva 0xAAAAAAAA em $t1. Fa�a um shift de um bit para a direita
#desse valor e coloque o resultado em $t2, deixando $t1 inalterado. Em
#$t3, $t4 e $t5 coloque os resultados das opera��es or, and e xor entre
#$t1 e $t2, respectivamente. Em coment�rios no final do c�digo, explique
#os resultados obtidos, mostrando os valores bin�rios.

ori $t1, $zero, 0xA
sll $t1, $t1, 4
ori $t1, $t1, 0xA
sll $t1, $t1, 4
ori $t1, $t1, 0xA
sll $t1, $t1, 4
ori $t1, $t1, 0xA
sll $t1, $t1, 4
ori $t1, $t1, 0xA
sll $t1, $t1, 4
ori $t1, $t1, 0xA
sll $t1, $t1, 4
ori $t1, $t1, 0xA
sll $t1, $t1, 4
ori $t1, $t1, 0xA
srl $t2, $t1, 1
or $t3,$t1, $t2
and $t4,$t1, $t2
xor $t5,$t1, $t2
