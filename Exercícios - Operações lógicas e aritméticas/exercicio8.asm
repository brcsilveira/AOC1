#8. Fa�a um programa que calcule a seguinte equa��o:
#	y = 3x� - 5x + 13
# Armazene x no registrador $t5 com a instru��o addi $t5, $zero, x, substituindo x pelo
# valor desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
# registrador $t5.
# Armazene o resultado y no registrador $t6.
# Fa�a teste com diferentes valores positivos e negativos de x.
# Fa�a um teste substituindo a primeira instru��o addi por uma instru��o ori
# equivalente e responda, nos coment�rios, qual o resultado quando s�o usados n�meros
# positivos e n�meros negativos.

addi $t5, $zero, 2 	#inicializa x em t5 com 2
mult $t5, $t5		#multiplica o conte�do de t5 com ele mesmo (2 * 2 = 4) que vai para "lo"
mflo $t6 		#guarda o conte�do de lo em t6

addi $t1, $zero, 3	#inicializa t1 (auxiliar) com 3

mult $t6, $t1		#multiplica o conteudo de t6 com t1 (4 * 3 = 12)
mflo $t6		#guarda o conte�do de lo em t6

addi $t1, $zero, 5	#inicializa t1 (auxiliar) com 5

mult $t5, $t1		#multiplica o conteudo de t5 com t1 (2 * 5 = 10)
mflo $t1		#guarda temporariamente o "lo" no t1 (aux)

sub $t6, $t6, $t1	#conteudo de t6 (12) - conteudo de t1 (10) = t6 (2)

addi $t1, $zero, 13	#inicializa t1 (auxiliar) com 13

add $t6, $t6, $t1	#soma o conte�do de t6 (2) com o conteudo de t1 (13) = t6 (15)

#Comentar com o Dani para ver o que ele achou