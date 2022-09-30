#2. Escreva um programa que calcule:

#	1 + 2 + 3 + … + 333

# Escreva o resultado (y) em uma palavra (4 bytes) de memória. O resultado deve ser
# armazenado, obrigatoriamente, na posição 0x10010000 da memória .data. Inicie o
# código com:

.data
	y: .space 4
.text

	lui $t0, 0x1001		#inicializa o registrador base em t0
	addi $t1, $zero, 1	#inicializa t1 com 1
	addi $t2, $zero, 333	#inicializa t2 com 333
	addi $t3, $zero, 1	#inicializa t3 com 1
	addi $t4, $zero, 1	#inicializa t4 com 1
	
volta:	beq $t1, $t2, fim
	
	#CALCULO DA PROGRESSÃO ARITMÉTICA
	add $t1, $t1, $t3
	add $t4, $t4, $t1
	
	j volta
	
fim:	sw $t4, 0($t0) #Guarda o valor de t4(PA) em y		 