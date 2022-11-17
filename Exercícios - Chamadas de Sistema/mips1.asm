#1. Escreva um programa que repetidamente pergunte ao usu�rio pelo n�mero de
# quil�metros viajados e litros de gasolina consumidos e depois imprima o n�mero de
# quil�metros por litro. Para sair do programa, o usu�rio deve digitar 0 como n�mero
# de quil�metros.
# Armazene todos os n�meros de quil�metros por litro na mem�ria, iniciando pelo
# endere�o 0x10010000.
# Exemplo:
# Entrada Sa�da
# 40
# 3 13 -- 13 tamb�m deve ser armazenado em 0x10010000
# 60
# 5 12 -- 12 tamb�m deve ser armazenado em 0x10010004
# 0 -- Sai do programa

.data
	pergunta1: .asciiz "Entre com o n�mero de Km viajados (0 para sair): \n"
	pergunta2: .asciiz "Entre com o n�mero de litros gastos: \n"
	respostas: .asciiz "A m�dia de consumo foi: \n"
	linha: .byte 10
.text

loop:
	#Quantos Km?
	li $v0, 4		#imprime a string
	la $a0, pergunta1	#pega o endere�o da string
	syscall			#chamada do sistema para impress�o
	
	li $v0, 5		#l� um inteiro
	syscall			#chamada do sistema para leitura
	beq $v0, $zero, fim	#se o retorno for 0 acaba o programa.
	move $t1, $v0		#se n ele guarda em t1
	
	li $v0, 4		#imprime a string
	la $a0, pergunta2	#pega o endere�o da string
	syscall			#chamada do sistema para impress�o
	
	li $v0, 5		#l� um inteiro
	syscall			#chamada do sistema para leitura
	move $t2, $v0		#guarda em t2 o conte�do lido
	
	li $v0, 4		#imprime a string
	la $a0, respostas	#pega o endere�o da string
	syscall			#chama o sistema
	
	div $t1, $t2		# Km/l
	mflo $t1		#salva o resultado da divis�o em t1
	
	li $v0, 1		#imprime o inteiro
	la $a0, ($t1)		#pega o endere�o do inteiro a ser impresso
	syscall			#chama o sistema
	
	li $v0, 4		#imprime uma string
	la $a0, linha		#pega o endere�o da string linha
	syscall			#chama o sistema
	
	j loop
	
fim:	
	nop			#fim