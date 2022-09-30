#2. Fa�a um programa que calcule o seguinte polin�mio usando o m�todo de Horner:
#	y = 9a� - 5a� + 7a + 15
# Utilize endere�os de mem�ria para armazenar o valor de a e o resultado y. Cada
# valor deve ocupar 4 bytes na mem�ria (.word), assim como para o resultado (.space
#4). Utilize as duas primeiras posi��es da mem�ria .data para armazenar,
# consecutivamente, a e y, iniciando o c�digo com:

.data
	a: .word 3
	y: .space 4
.text
# Observe como o m�todo de Horner � mais eficiente (faz menos opera��es) que
# calcular o polin�mio de forma sequencial.

#### inicializa o registrador base
lui $t0, 0x1001 	#  $t0 ser? o registrador base e vai receber 0x10010000

lw $t1, 0x0($t0) 	# carrega $t1 com "a" (word que inicia na posi��o 0x10010000)

# 9a�
mult $t1, $t1		#3 * 3 = 9 == a�
mflo $t2		# vai guardar o a�(t2) = 9
mult $t2, $t1		# 9 * 3 == a�
mflo $t2		# a�(27) = t2
addi $t3, $zero, 9	# inicializa t3(aux) com 9
mult $t2, $t3		# 9 * a� == 9 * 27
mflo $t2		# Guarda "9.a�" em t2

# 5a�
mult $t1, $t1		# 3 * 3 = 9 == a�
mflo $t3		# t3 = a�
addi $t4, $zero, 5	# t4(aux) = 5 
mult $t3, $t4		# t3(9) * t4(5)
mflo $t3		# t3 = 45

# 7a
addi $t4, $zero, 7	# t4 vai ser inicializado com 7
mult $t4, $t1		# t4(7) * t1(3)
mflo $t4		# t4 = 21

# 15	
addi $t5, $zero, 15	# t5 vai ser inicializado com 15

# 9a� - 5a�
sub $t2, $t2, $t3	# t2 = t2(243) - t3(45)

# 9a� - 5a� + 7a
add $t2, $t2, $t4	# t2 = t2(198) + t4(21)

# 9a� - 5a� + 7a + 15
add $t2, $t2, $t5	# t2 = t2(219) + t5(15)

#### armazena o resultado na mem�ria
sw $t2, 0x4($t0) # grava o resultado em "y" (word que inicia na posi��o 0x10010004)