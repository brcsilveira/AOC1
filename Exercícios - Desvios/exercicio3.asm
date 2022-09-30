#3. Escreva um programa que leia um valor x > 0 da memória (posição 0x10010000) e
# calcule o x-ésimo termo da série de Fibonacci:

#	1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...

# Escreva o x-ésimo termo da série (y) em uma palavra (4 bytes) de memória. O
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
# memória .data. Inicie o código com:

.data
	x: .word 7
	y: .space 4
.text

	lui $t0, 0x1001		#inicializa o registrador base em t0
	lw $t1, 0($t0)		#carrega x(7) em t1
	addi $t2, $zero, 1	#inicializa t2 com 1. Vai ser o contador
	addi $t3, $zero, 1	#incrementa o contador 
	addi $t4, $zero, 1	#usado para Fibonacci
	addi $t5, $zero, 0	#usado para Fibonacci
	addi $t6, $zero, 0	#usado para Fibonacci
	
volta:	beq $t2, $t1, fim	#se o conteudo de t2 for igual ao de t1 pula
	add $t6, $t5, $t4	#t6 = t5 + t4
	addi $t5, $t4, 0	#t5 recebe o conteudo de t4
	addi $t4, $t6, 0	#t4 recebe o conteudo de t6
	
	add $t2, $t2,$t3	#incrementa o contador
	j volta
	
fim:	sw $t4, 4($t0)		#Guarda na memória na posição 0x10010004