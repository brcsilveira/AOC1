#4. Escreva um programa que calcule o fatorial de n.

# O valor de n deve ser lido da memória na posição 0x10010000 e o valor de n! deve
# ser escrito na posição seguinte na memória (0x10010004).

.data
	n: .word 5
	r: .space 4
.text

	lui $t0, 0x1001		#inicializa o registrador base
	lw $t1, 0x0($t0)	#guarda n em t1
	addi $t2, $zero, 0	#vai ser o aux em caso do fatorial ser 0
	addi $t4, $t1, 0	#vai guardar o valor de t1
	addi $t5, $zero, 0	#vai guardar o valor do n!
		
	beq $t1, $t2, fim0	#caso t1 seja 0
	addi $t2, $zero, 1	#vai ser o aux em caso do fatorial ser > 0
	
	beq $t1, $t2, fim0	#caso t1 seja 1
	addi $t2, $zero, 2	#vai ser o aux em caso do fatorial ser > 1
	
	addi $t3, $t1, -1	
	
volta:	beq $t4, $t2, fimresto	#compara para ver se 2 = 2
	mult $t1, $t3		# t1 * t4
	mflo $t1		#t1 = lo
	addi $t3, $t3, -1	# t3 = t3 - 1
	addi $t4, $t4, -1	# t4 = t4 - 1
	j volta

fim0:	addi $t3, $zero, 1
	sw $t3, 0x4($t0)
	j fimtrue
fimresto:
	mflo $t5		# guarda o valor do acumulador em t5
	sw $t5, 0x4($t0)	# escreve t5 na memória 
fimtrue: