#8. Faça um programa que calcule a seguinte equação:
#	y = (9x + 7)/(2x + 8)
# Armazene x em $t1, com a instrução addi $t1, $zero, x, substituindo x pelo valor
# desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
# registrador $t1.
# Armazene o quociente da divisão em $t2 e o resto em $t3.
# Responda o que acontece quando x = -4.

addi $t1, $zero, -4	#inicializa t1 com 2

#	Parte do dividendo:
addi $t2, $zero, 9	#t2 é o auxiliar do dividendo e vai ser inicializado com 9
mult $t2, $t1		#t2 (9) * t1(2) = lo (18) 
mflo $t3		# lo = t3
addi $t2, $zero, 7	#t2 é o auxiliar do dividendo e vai ser inicializado com 7
add $t3, $t3, $t2	# t3 (25) = t3 (18) + t2 (7)  	

#	Parte do divisor:
addi $t2, $zero, 2	#t2 é o auxiliar do divisor e vai ser inicializado com 2
mult $t2, $t1		#t2 (2) * t1 (2) = lo (4)
mflo $t4		# lo = t4
addi $t2, $zero, 8	#t2 é o auxiliar do divisor e vai ser inicializado com 8
add $t4, $t4, $t2	# t4 (12) = t4 (4) + t2 (8)

#	A divisão:
div $t3, $t4	# t3 (25) / t4 (12)
mflo $t2	# t2 = quociente
mfhi $t3	# t3 = resto

#com t4 os valores ficam negativos
#conferir dps