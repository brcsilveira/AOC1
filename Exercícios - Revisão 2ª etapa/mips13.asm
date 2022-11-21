#13. Escreva um programa que leia uma string de entrada e armazene na memória
# iniciando na posição 0x10010000. Transforme os caracteres maiúsculos de uma
# string em minúsculos e os caracteres minúsculos em maiúsculos.
# Por exemplo, a entrada:
# 	“ONE RING to rule Them aLL”
# Deve produzir:
# 	“one ring TO RULE tHEM All”.
# OBS: Use apenas uma string (não use uma string de saída ou uma string auxiliar no
# seu programa). Não esqueça de terminar a string com nulo. Mantenha a string de
# saída na mesma posição da string de entrada.
.data
	string: .asciiz "ONE RING to rule Them aLL"
	newline: .asciiz "\n"
.text	
	li $v0, 4			#imprime a string
	la $a0, string			#carrega o endereço da string
	syscall
	
	addi $t0, $zero, 90		#última letra maiúscula da ASCII
	la $s1, string			#primeiro endereço da string
	addi $t3, $zero, 1		# t3 = 1
	addi $t4, $zero, 32		#flag para space
	
loop:	
	lbu $t1, 0($s1)			#carrega na posição atual da string
	beq $t1, $zero, fim		#testa se é igual a null
	beq $t1, $t4, pula		#sinal que é espaço
	slt $t2, $t1, $t0		# se t1 < t0, t2 = 1. Se não, t2 = 0
	beq $t2, $t3, ehMaiuscula
	beq $t2, $zero, ehMinuscula
volta:	
	sb $t1, 0($s1)			#armazena o valor modificado na mesma posição
pula:
	addi $s1, $s1, 1		#atualiza para o próximo char
	j loop

fim:	
	li $v0, 4			#imprime a string
	la $a0, newline			#carrega o endereço da string
	syscall

	li $v0, 4			#imprime a string
	la $a0, string			#carrega o endereço da string
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