#1. Escreva uma subrotina que retorne a média entre três valores. A subrotina deve
# receber como argumentos três inteiros e retornar a média entre eles. Escreva um
# programa para testar a subrotina que leia três valores do usuário e imprima o
# resultado. Importante: Utilize os registradores convencionados para a passagem de
# argumentos e valor de retorno! Armazene o retorno da subrotina (média entre os três
# valores) no registrador $t5.
# Exemplo:
#    Entrada 	Saída
#	51
#	42
#	39 	  44 		-- 44 também deve ser armazenado em $t5

.data
	pergunta1: .asciiz "Digite o 1° valor: "
	pergunta2: .asciiz "Digite o 2° valor: "
	pergunta3: .asciiz "Digite o 3° valor: "
	resposta: .asciiz "Cálculo da média dos 3 valores: "
.text
	li $v0, 4		#imprime string
	la $a0, pergunta1	#carrega o endereço da string
	syscall			#chamada do sistema
	
	li $v0, 5		#lê um inteiro
	syscall
	move $a1, $v0		#guarda o conteúdo de v0 em t1
	
	li $v0, 4		#imprime string
	la $a0, pergunta2	#carrega o endereço da string
	syscall			#chamada do sistema
	
	li $v0, 5		#lê um inteiro
	syscall
	move $a2, $v0		#guarda o conteúdo de v0 em t2
	
	li $v0, 4		#imprime string
	la $a0, pergunta3	#carrega o endereço da string
	syscall			#chamada do sistema
	
	li $v0, 5		#lê um inteiro
	syscall
	move $a3, $v0		#guarda o conteúdo de v0 em t3
	
	jal media		#chamada da função "media"
	
	move $t5, $v0		#salva a média em t5
	
	li $v0, 4		#imprime string
	la $a0, resposta	#carrega o endereço da string
	syscall			#chamada do sistema
	
	li $v0, 1		#imprime um inteiro
	move $a0, $t5		#carrega o endereço do inteiro
	syscall
	
	li $v0, 10		#sai do programa
	syscall
	
media:
	add $v0, $a1, $a2	# v0 = a1 + a2
	add $v0, $v0, $a3	# v0 = v0 + a3
	
	addi $t0, $zero, 3	#guarda 3 em t4
	
	div $v0, $t0		#cálculo da média
	
	mflo $v0		#salva o valor em v0
	jr $ra			#marca o término da função
