#1. Escreva uma subrotina que retorne a m�dia entre tr�s valores. A subrotina deve
# receber como argumentos tr�s inteiros e retornar a m�dia entre eles. Escreva um
# programa para testar a subrotina que leia tr�s valores do usu�rio e imprima o
# resultado. Importante: Utilize os registradores convencionados para a passagem de
# argumentos e valor de retorno! Armazene o retorno da subrotina (m�dia entre os tr�s
# valores) no registrador $t5.
# Exemplo:
#    Entrada 	Sa�da
#	51
#	42
#	39 	  44 		-- 44 tamb�m deve ser armazenado em $t5

.data
	pergunta1: .asciiz "Digite o 1� valor: "
	pergunta2: .asciiz "Digite o 2� valor: "
	pergunta3: .asciiz "Digite o 3� valor: "
	resposta: .asciiz "C�lculo da m�dia dos 3 valores: "
.text
	li $v0, 4		#imprime string
	la $a0, pergunta1	#carrega o endere�o da string
	syscall			#chamada do sistema
	
	li $v0, 5		#l� um inteiro
	syscall
	move $a1, $v0		#guarda o conte�do de v0 em t1
	
	li $v0, 4		#imprime string
	la $a0, pergunta2	#carrega o endere�o da string
	syscall			#chamada do sistema
	
	li $v0, 5		#l� um inteiro
	syscall
	move $a2, $v0		#guarda o conte�do de v0 em t2
	
	li $v0, 4		#imprime string
	la $a0, pergunta3	#carrega o endere�o da string
	syscall			#chamada do sistema
	
	li $v0, 5		#l� um inteiro
	syscall
	move $a3, $v0		#guarda o conte�do de v0 em t3
	
	jal media		#chamada da fun��o "media"
	
	move $t5, $v0		#salva a m�dia em t5
	
	li $v0, 4		#imprime string
	la $a0, resposta	#carrega o endere�o da string
	syscall			#chamada do sistema
	
	li $v0, 1		#imprime um inteiro
	move $a0, $t5		#carrega o endere�o do inteiro
	syscall
	
	li $v0, 10		#sai do programa
	syscall
	
media:
	add $v0, $a1, $a2	# v0 = a1 + a2
	add $v0, $v0, $a3	# v0 = v0 + a3
	
	addi $t0, $zero, 3	#guarda 3 em t4
	
	div $v0, $t0		#c�lculo da m�dia
	
	mflo $v0		#salva o valor em v0
	jr $ra			#marca o t�rmino da fun��o
