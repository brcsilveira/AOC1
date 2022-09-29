#10. Faça um programa que calcule a área do triângulo equilátero abaixo e escreva o
# resultado em $t3.
# Armazene b em $t1 e h em $t2 utilizando as instruções addi $t1, $zero, b e
# addi $t2, $zero, h, substituindo b e h pelos valores desejados, e sempre que precisar
# de b e h, utilize os valores armazenados nos registradores $t1 e $t2. 

#	A = (b.h)/2

#	b: base/lado
#	h: altura

addi $t1, $zero, 160	#inicializa t1(b) com 160
addi $t2, $zero, 120	#inicializa t2(h) com 120

mult $t1, $t2		#multiplica o conteudo de t1(160) com o de t2(120)
mflo $t3		#guarda o valor da multiplicação em t3

addi $t4, $zero, 2	#inicializa t4(aux) com o divisor(2)

div $t3, $t4		#divide o conteudo de t3 por t4(2)

mflo $t3		#guarda o quociente da divisão