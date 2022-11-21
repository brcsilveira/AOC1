#11. Leia dois vetores de 5 números inteiros (word) e armazene na memória iniciando na
# posição 0x10010000. Concatene os vetores e imprima o resultado na tela.
# Exemplo
# 	vetor1: 1 5 4 3 5
#	vetor2: 2 3 4 6 8
#	saida: 1 5 4 3 5 2 3 4 6 8

.data
	vetor1: .word 0, 0, 0, 0, 0
	vetor2: .word 0, 0, 0, 0, 0
	vetorSaida: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	pergunta1: .asciiz "Informe o 1°vetor de 5 números:\n"
	pergunta2: .asciiz "Informe o 2°vetor de 5 números:\n"
	resposta: .asciiz "Vetor concatenador: "
.text
	ori $t0, $zero, 5		#joga 5 em t0
	ori $t1, $zero, 0		#vai ser o contador
	ori $t2, $zero, 0		#incrementa na memória
	
	li $v0, 4			#imprime String
	la $a0, pergunta1		#carrega o endereço da String
	syscall				#chama o sistema
	
loop:	beq $t1, $t0, vet2		
	li $v0, 5			#lê inteiro
	syscall
	sw $v0, vetor1($t2)	
	addi $t2, $t2, 4		#incrementa na posição da memória
	addi $t1, $t1, 1		#incrementa o contador
	j loop
vet2:	
	ori $t1, $zero, 0		#vai ser o contador
	ori $t2, $zero, 0		#incrementa na memória
	
	li $v0, 4			#imprime String
	la $a0, pergunta2		#carrega o endereço da String
	syscall				#chama o sistema
	
loop1:	beq $t1, $t0, concatena		
	li $v0, 5			#lê inteiro
	syscall
	sw $v0, vetor2($t2)	
	addi $t2, $t2, 4		#incrementa na posição da memória
	addi $t1, $t1, 1		#incrementa o contador
	j loop1
concatena:
	ori $t0, $zero, 10		#joga 10 em t0	
	ori $t1, $zero, 0		#vai ser o contador
	addi $t3, $t3, 0
	
	li $v0, 4			#imprime String
	la $a0, resposta		#carrega o endereço da String
	syscall				#chama o sistema
	
	lw $t2, vetor1			#carrega t2 com o primeiro elemento do vetor1
	
loop3:	beq $t1, $t0, fim	
	sw $t2, vetorSaida($t3)		#salva na 1ª posição do vetor saida
	li $v0, 1			#imprime inteiro
	move $a0, $t2
	syscall
	addi $t1, $t1, 1		#incrementa o contador
	addi $t3, $t3, 4
	lw $t2, vetor1($t3)		#carrega t2 com o primeiro elemento do vetor1
	j loop3
fim:	
	li $v0, 10			#sai do programa
	syscall
