#13. Escreva um programa que leia uma string de entrada e armazene na mem�ria
# iniciando na posi��o 0x10010000. Transforme os caracteres mai�sculos de uma
# string em min�sculos e os caracteres min�sculos em mai�sculos.
# Por exemplo, a entrada:
# 	�ONE RING to rule Them aLL�
# Deve produzir:
# 	�one ring TO RULE tHEM All�.
# OBS: Use apenas uma string (n�o use uma string de sa�da ou uma string auxiliar no
# seu programa). N�o esque�a de terminar a string com nulo. Mantenha a string de
# sa�da na mesma posi��o da string de entrada.
.data
	string: .asciiz "ONE RING to rule Them aLL"
	newline: .asciiz "\n"
.text	
	li $v0, 4			#imprime a string
	la $a0, string			#carrega o endere�o da string
	syscall
	
	addi $t0, $zero, 90		#�ltima letra mai�scula da ASCII
	la $s1, string			#primeiro endere�o da string
	addi $t3, $zero, 1		# t3 = 1
	addi $t4, $zero, 32		#flag para space
	
loop:	
	lbu $t1, 0($s1)			#carrega na posi��o atual da string
	beq $t1, $zero, fim		#testa se � igual a null
	beq $t1, $t4, pula		#sinal que � espa�o
	slt $t2, $t1, $t0		# se t1 < t0, t2 = 1. Se n�o, t2 = 0
	beq $t2, $t3, ehMaiuscula
	beq $t2, $zero, ehMinuscula
volta:	
	sb $t1, 0($s1)			#armazena o valor modificado na mesma posi��o
pula:
	addi $s1, $s1, 1		#atualiza para o pr�ximo char
	j loop

fim:	
	li $v0, 4			#imprime a string
	la $a0, newline			#carrega o endere�o da string
	syscall

	li $v0, 4			#imprime a string
	la $a0, string			#carrega o endere�o da string
	syscall

	li $v0, 10			#sai do programa
	syscall

ehMaiuscula:
	jal passaPraMinuscula
	j volta

passaPraMinuscula:
	addi $t1, $t1, 32
	jr $ra

ehMinuscula:
	jal passaPraMaiscula
	j volta
	
passaPraMaiscula:
	addi $t1, $t1, -32
	jr $ra