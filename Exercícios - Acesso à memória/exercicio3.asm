#3. Fa�a um programa que calcule o seguinte polin�mio usando o m�todo de Horner:

#	y = - ax^4 + bx� - cx� + dx - e

# Utilize endere�os de mem�ria para armazenar o valor de a, b, c, d, e, x e o resultado
# y. Cada valor deve ocupar 4 bytes na mem�ria (.word), assim como para o resultado
# (.space 4). Utilize as sete primeiras posi��es da mem�ria .data para armazenar,
# consecutivamente, a, b, c, d, e, x e y, iniciando o c�digo com:
.data
	a: .word -3
	b: .word 7
	c: .word 5
	d: .word -2
	e: .word 8
	x: .word 4
	y: .space 4
.text

lui $t0, 0x1001		#  $t0 ser� o registrador base e vai receber 0x10010000

lw $t1, 0x0($t0)	# t1 = a
lw $t2, 0x14($t0)	# t2 = x

# - ax^4
mult $t2, $t2		# x�
mflo $t3		# t3 = x�
mult $t3, $t2		# x�
mflo $t3		# t3 = x�
mult $t3, $t2		# x^4
mflo $t3		# t3 = x^4
mult $t1, $t3		# a(-3) * t3(256)
mflo $t1		# t1 = a(-3) * t3(256) == ax^4
addi $t3, $zero, -1	# inicializa t3 com -1
mult $t1, $t3 		# -a(-3) * t3(256) == -ax^4
mflo $t1		# t1 = -a(-3) * t3(256) == -ax^4
# N�O POSSO MAIS USAR $t1

# bx�
lw $t3, 0x4($t0)	# t3 = b
mult $t2, $t2		# x�
mflo $t4		# t4 = x�
mult $t4, $t2		# x�
mflo $t4		# t4 = x�
mult $t3, $t4		# b(7) * t4(-27)
mflo $t3		# t3 = b(7) * t4(-27)
# N�O POSSO MAIS USAR $t3

# cx�
lw $t4, 0x8($t0)	# t4 = c
mult $t2, $t2		# x�
mflo $t5		# t5 = x�
mult $t4, $t5		# c(5) * t5(x�)
mflo $t4		# t4 = c(5) * t5(x�)
# N�O POSSO MAIS USAR $t4

#dx
lw $t5, 0xc($t0)	# t5 = d
mult $t5, $t2		# d(-2) * x
mflo $t5			# t5 = d(-2) * x
# N�O POSSO MAIS USAR $t5

#e
lw $t6,0x10($t0)	# t6 = e

# - ax^4 + bx�
add $t1, $t1, $t3

# - ax^4 + bx� - cx�
sub $t1, $t1, $t4

# - ax^4 + bx� - cx� + dx
add $t1, $t1, $t5

# - ax^4 + bx� - cx� + dx - e
sub $t1, $t1, $t6

#### armazena o resultado na mem�ria
sw $t1, 0x18($t0) # grava o resultado em "y" (word que inicia na posi��o 0x10010004)