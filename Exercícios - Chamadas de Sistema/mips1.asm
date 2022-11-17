#1. Escreva um programa que repetidamente pergunte ao usuário pelo número de
# quilômetros viajados e litros de gasolina consumidos e depois imprima o número de
# quilômetros por litro. Para sair do programa, o usuário deve digitar 0 como número
# de quilômetros.
# Armazene todos os números de quilômetros por litro na memória, iniciando pelo
# endereço 0x10010000.
# Exemplo:
# Entrada Saída
# 40
# 3 13 -- 13 também deve ser armazenado em 0x10010000
# 60
# 5 12 -- 12 também deve ser armazenado em 0x10010004
# 0 -- Sai do programa

.data
	pergunta1: .asciiz "Entre com o número de Km viajados (0 para sair): \n"
	pergunta2: .asciiz "Entre com o número de litros gastos: \n"
	respostas: .asciiz "A média de consumo foi: \n"
	linha: .byte 10
.text

loop:
	#Quantos Km?
	li $v0, 4		#imprime a string
	la $a0, pergunta1	#pega o endereço da string
	syscall			#chamada do sistema para impressão
	
	li $v0, 5		#lê um inteiro
	syscall			#chamada do sistema para leitura
	beq $v0, $zero, fim	#se o retorno for 0 acaba o programa.
	move $t1, $v0		#se n ele guarda em t1
	
	li $v0, 4		#imprime a string
	la $a0, pergunta2	#pega o endereço da string
	syscall			#chamada do sistema para impressão
	
	li $v0, 5		#lê um inteiro
	syscall			#chamada do sistema para leitura
	move $t2, $v0		#guarda em t2 o conteúdo lido
	
	li $v0, 4		#imprime a string
	la $a0, respostas	#pega o endereço da string
	syscall			#chama o sistema
	
	div $t1, $t2		# Km/l
	mflo $t1		#salva o resultado da divisão em t1
	
	li $v0, 1		#imprime o inteiro
	la $a0, ($t1)		#pega o endereço do inteiro a ser impresso
	syscall			#chama o sistema
	
	li $v0, 4		#imprime uma string
	la $a0, linha		#pega o endereço da string linha
	syscall			#chama o sistema
	
	j loop
	
fim:	
	nop			#fim