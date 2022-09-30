#3. Faça um programa que calcule o seguinte polinômio usando o método de Horner:

#	y = - ax^4 + bx³ - cx² + dx - e

# Utilize endereços de memória para armazenar o valor de a, b, c, d, e, x e o resultado
# y. Cada valor deve ocupar 4 bytes na memória (.word), assim como para o resultado
# (.space 4). Utilize as sete primeiras posições da memória .data para armazenar,
# consecutivamente, a, b, c, d, e, x e y, iniciando o código com:
.data
	a: .word -3
	b: .word 7
	c: .word 5
	d: .word -2
	e: .word 8
	x: .word 4
	y: .space 4
.text

lui $t0, 0x1001		#  $t0 será o registrador base e vai receber 0x10010000

lw $t1, 0x0($t0)	# t1 = a
lw $t2, 0x14($t0)	# t2 = x

# - ax^4
mult $t2, $t2		# x²
mflo $t3		# t3 = x²
mult $t3, $t2		# x³
mflo $t3		# t3 = x³
mult $t3, $t2		# x^4
mflo $t3		# t3 = x^4
mult $t1, $t3		# a(-3) * t3(256)
mflo $t1		# t1 = a(-3) * t3(256) == ax^4
addi $t3, $zero, -1	# inicializa t3 com -1
mult $t1, $t3 		# -a(-3) * t3(256) == -ax^4
mflo $t1		# t1 = -a(-3) * t3(256) == -ax^4
# NÃO POSSO MAIS USAR $t1

# bx³
lw $t3, 0x4($t0)	# t3 = b
mult $t2, $t2		# x²
mflo $t4		# t4 = x²
mult $t4, $t2		# x³
mflo $t4		# t4 = x³
mult $t3, $t4		# b(7) * t4(-27)
mflo $t3		# t3 = b(7) * t4(-27)
# NÃO POSSO MAIS USAR $t3

# cx²
lw $t4, 0x8($t0)	# t4 = c
mult $t2, $t2		# x²
mflo $t5		# t5 = x²
mult $t4, $t5		# c(5) * t5(x²)
mflo $t4		# t4 = c(5) * t5(x²)
# NÃO POSSO MAIS USAR $t4

#dx
lw $t5, 0xc($t0)	# t5 = d
mult $t5, $t2		# d(-2) * x
mflo $t5			# t5 = d(-2) * x
# NÃO POSSO MAIS USAR $t5

#e
lw $t6,0x10($t0)	# t6 = e

# - ax^4 + bx³
add $t1, $t1, $t3

# - ax^4 + bx³ - cx²
sub $t1, $t1, $t4

# - ax^4 + bx³ - cx² + dx
add $t1, $t1, $t5

# - ax^4 + bx³ - cx² + dx - e
sub $t1, $t1, $t6

#### armazena o resultado na memória
sw $t1, 0x18($t0) # grava o resultado em "y" (word que inicia na posição 0x10010004)