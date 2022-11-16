#2. Escreva um programa que altere uma string para “capitalizar” a primeira letra de cada
# palavra. Por exemplo, a entrada
#	.data
#		string: .asciiz "meu professor é muito bom"
# deve produzir a string
#	"Meu Professor É Muito Bom"
# Assuma que a entrada possui apenas espaços e letras minúsculas. Pode haver mais de
# um espaço entre as palavras.
# A resposta deve ser a string de entrada modificada, e não uma nova string na
# memória, ou seja, iniciando no endereço de memória 0x10010000.

.data
	string: .ascii "meu professor é muito bom"
.text
	la $s1, string	# pega o primeiro valor da string
	
	ori $t0, $t0, 32	# valor do espaço em ASCII
	
	lbu $t1, 0($s1)		# carrega em t1 o primeiro char da string
	add $t1, $t1, -32	# Seta a primeira letra da string para maiusculo
	sb $t1, 0($s1)		# Armazena na string o primeiro char em maiúsculo

loop:
	lbu $t1,0($s1)		# carrega em t1 o char da string
	beq $t1, $zero, fim	# testa se char é igual a null (null em ASCII é zero)
	beq $t1, $t0, ehespaco
	
	addi $s1, $s1, 1	# incrementa a string e passa para o próximo char
	j loop

ehespaco:
	addi $s1, $s1, 1
	lbu $t1,0($s1)
	beq $t1, $t0, ehespaco	
	bne $t1, $t0, nehespaco
	
nehespaco:
	add $t1, $t1, -32	# Seta a primeira letra da string para maiusculo
	sb $t1, 0($s1)		# Armazena na string o char em maiúsculo
	j loop
fim: