#1. Escreva um programa que remova os espa�os de uma string. Por exemplo, a entrada
#	.data
#		string: .asciiz �Gosto muito do meu professor de AOC-I."
#	deve produzir a string
#		" GostomuitodomeuprofessordeAOC-I.�

# Use apenas uma string (n�o use uma string de sa�da ou uma string auxiliar no seu
# programa). N�o esque�a de terminar sua string com nulo (ver tabela ASCII para
# c�digo do espa�o e do \0 (null)).
# A resposta deve ser a string de entrada modificada, e n�o uma nova string na
# mem�ria, ou seja, iniciando no endere�o de mem�ria 0x10010000.

.data
	string: .asciiz "Gosto muito do meu professor de AOC-I."
.text
	la $s1, string		# $s1 = primeiro endere�o da string
	
	ori $t0, $t0, 32	# valor do Space em ASCII
	
loop:	
	lbu $t1, 0($s1)		# carrega char na posi��o atual da String 	
	beq $t1, $zero, fim	# testa se char � igual a null (null em ASCII � zero)
	beq $t1, $t0, tiraespaco# testa se char � igual a espa�o, se for comeca um loop para tirar esse espaco

	addi $s1, $s1, 1	#atualiza para o proximo char
	j loop
	
tiraespaco:
	la $s2, 0($s1)		# $s2 = endereco atual da string(char = espaco), utilizado uma variavel auxiliar para nao perder a posicao de s1

tiraespaco2:
	lbu $t1, 0($s2)		#carrega char na posicao atual da string
	beq $t1, $zero, loop	#testa se chegou ao final da string (null), se sim retorna ao loop de cima
	
	lbu $t1, 1($s2)		#carrega em t1 o proximo char
	sb $t1, 0($s2)		#armazena valor da posicao n+1 na posicao n
	
	addi $s2, $s2, 1	#atualiza para o proximo char
	j tiraespaco2		#volta ao loop que retira o atual espaco
	
fim:
	nop			#fim do programa
