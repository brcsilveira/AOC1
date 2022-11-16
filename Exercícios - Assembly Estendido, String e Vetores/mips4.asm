#4. Escreva um programa que inverta a ordem dos elementos de um vetor (.word) com 5
# posi��es. Por exemplo, a entrada: 1, 2, 3, 4, 5 deve produzir 5, 4, 3, 2, 1.
# A resposta deve ser o vetor de entrada modificado, e n�o um novo vetor na mem�ria,
# ou seja, iniciando no endere�o de mem�ria 0x10010000.

.data
	vetor: .word 1, 2, 3, 4, 5
.text
	la $s1, vetor		#carrega o endere�o do primeiro elemento do vetor
	la $s2, 16($s1)		#carrega o endere�o do �ltimo elemento do vetor
	ori $t3, $zero, 0	#seta o contador em 0
	ori $t1, $zero, 2	#seta o numero de voltas em 2
loop:
	beq $t1, $t3, fim	#se t1 = t3, pula pro fim
	
	lw $t4, 0($s1)		#carrega um elemento do vetor em t4
	lw $t5, 0($s2)		#carrega um elemento do vetor em t5
	
	sw $t4, 0($s2)		#escreve t4 no endere�o referenciado por s2
	sw $t5, 0($s1)		#escreve t4 no endere�o referenciado por s2
	
	add $s1, $s1, 4 	#pr�ximo elemento do vetor - crescente
	add $s2, $s2, -4 	#pr�ximo elemento do vetor - decrescente
	
	addi $t3, $t3, 1	#incrementa o contador
	j loop
fim: