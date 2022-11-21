#12. Crie um programa para calcular a soma S de todos os n�meros pares dentre os N
# n�meros informados pelo usu�rio. Inicialmente, o n�mero N dever� ser lido pelo
# teclado e, logo depois, ser�o lidos os N valores. Os N valores lidos devem ser
# armazenados na mem�ria. O resultado S da soma de pares dever� ser apresentado na
# tela, assim como a quantidade Q de valores pares.
# Voc� deve criar uma sub-rotina para a leitura dos valores e uma sub-rotina para
# encontrar e somar os pares.

.data
	Pergunta: .asciiz "Informe quantos n�meros ser�o lidos: "
	Pergunta1: .asciiz "Informe os valores:\n"
	Resposta: .asciiz "Resultado da soma dos pares e a quantidade de pares, respectivamente:\n"
	novalinha: .byte 10
	N: .word 0
.text
	li $v0, 4		#imprime string
	la $a0, Pergunta	#carrega o endere�o da string a ser lida
	syscall
	
	li $v0, 5		#l� um inteiro
	syscall
	sw $v0, N		#carrega o valor lido na posi��o de N
	move $t0, $v0
	addi $t1, $zero, 0	#contador
	addi $t2, $zero, 4	#mudar na mem�ria
	
	li $v0, 4		#imprime string
	la $a0, Pergunta1	#carrega o endere�o da string a ser lida
	syscall
loop:	
	beq $t1, $t0, soma
	jal leitura		#vai para a fun��o
	addi $t1, $t1, 1	#incrementa
	j loop
soma:
	addi $t2, $zero, 4	#mudar na mem�ria
	addi $t1, $zero, 0	#contador
	addi $t3, $zero, 0	#somador
	addi $t4, $zero, 0	#quantidade de pares
	addi $s0, $zero, 2	#verificador de pares
loop1:
	beq $t1, $t0, imprime
	jal somador
	addi $t1, $t1, 1	#incrementa
	j loop1
imprime:
	li $v0, 4		#imprime string
	la $a0, Resposta	#carrega o endere�o da string a ser lida
	syscall

	li $v0, 1		#imprime inteiro
	move $a0, $t3
	syscall
	
	li $v0, 4		#imprime string
	la $a0, novalinha	#carrega o endere�o da string a ser lida
	syscall
	
	li $v0, 1		#imprime inteiro
	move $a0, $t4
	syscall

	li $v0, 10		#sai do programa
	syscall
	
somador:
	lw $a1, N($t2)		#carrega a mem�ria ap�s N para $v0
	div $a1, $s0		
	mfhi $t5		#move o resto da divis�o para t5
	bne $t5, $zero, nehpar
	addi $t4, $t4, 1	#incrementa a quantidade de pares
	add $t3, $t3, $a1	#somador de numeros pares
nehpar:	addi $t2, $t2, 4	#mudar na mem�ria
	jr $ra

leitura:
	li $v0, 5		#l� um inteiro
	syscall
	sw $v0, N($t2)		#salva na mem�ria ap�s N
	addi $t2, $t2, 4
	jr $ra