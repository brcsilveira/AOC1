#8. Faça um programa que calcule a seguinte equação:
#	y = 3x² - 5x + 13
# Armazene x no registrador $t5 com a instrução addi $t5, $zero, x, substituindo x pelo
# valor desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
# registrador $t5.
# Armazene o resultado y no registrador $t6.
# Faça teste com diferentes valores positivos e negativos de x.
# Faça um teste substituindo a primeira instrução addi por uma instrução ori
# equivalente e responda, nos comentários, qual o resultado quando são usados números
# positivos e números negativos.

addi $t5, $zero, 2 	#inicializa x em t5 com 2
mult $t5, $t5		#multiplica o conteúdo de t5 com ele mesmo (2 * 2 = 4) que vai para "lo"
mflo $t6 		#guarda o conteúdo de lo em t6

addi $t1, $zero, 3	#inicializa t1 (auxiliar) com 3

mult $t6, $t1		#multiplica o conteudo de t6 com t1 (4 * 3 = 12)
mflo $t6		#guarda o conteúdo de lo em t6

addi $t1, $zero, 5	#inicializa t1 (auxiliar) com 5

mult $t5, $t1		#multiplica o conteudo de t5 com t1 (2 * 5 = 10)
mflo $t1		#guarda temporariamente o "lo" no t1 (aux)

sub $t6, $t6, $t1	#conteudo de t6 (12) - conteudo de t1 (10) = t6 (2)

addi $t1, $zero, 13	#inicializa t1 (auxiliar) com 13

add $t6, $t6, $t1	#soma o conteúdo de t6 (2) com o conteudo de t1 (13) = t6 (15)

#Comentar com o Dani para ver o que ele achou