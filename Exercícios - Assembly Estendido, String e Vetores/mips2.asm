#2. Escreva um programa que altere uma string para �capitalizar� a primeira letra de cada
# palavra. Por exemplo, a entrada
#	.data
#		string: .asciiz "meu professor � muito bom"
# deve produzir a string
#	"Meu Professor � Muito Bom"
# Assuma que a entrada possui apenas espa�os e letras min�sculas. Pode haver mais de
# um espa�o entre as palavras.
# A resposta deve ser a string de entrada modificada, e n�o uma nova string na
# mem�ria, ou seja, iniciando no endere�o de mem�ria 0x10010000.

.data
	string: .ascii "meu professor � muito bom"
.text
	la $s1, string	# pega o primeiro valor da string
	
	ori $t0, $t0, 32	# valor do espa�o em ASCII
	
	lbu $t1, 0($s1)		# carrega em t1 o primeiro char da string
	add $t1, $t1, -32	# Seta a primeira letra da string para maiusculo
	sb $t1, 0($s1)		# Armazena na string o primeiro char em mai�sculo

loop:
	lbu $t1,0($s1)		# carrega em t1 o char da string
	beq $t1, $zero, fim	# testa se char � igual a null (null em ASCII � zero)
	beq $t1, $t0, ehespaco
	
	addi $s1, $s1, 1	# incrementa a string e passa para o pr�ximo char
	j loop

ehespaco:
	addi $s1, $s1, 1
	lbu $t1,0($s1)
	beq $t1, $t0, ehespaco	
	bne $t1, $t0, nehespaco
	
nehespaco:
	add $t1, $t1, -32	# Seta a primeira letra da string para maiusculo
	sb $t1, 0($s1)		# Armazena na string o char em mai�sculo
	j loop
fim: