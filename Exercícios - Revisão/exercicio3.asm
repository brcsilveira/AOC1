#3. Escreva um programa que encontre a mediana de três valores lidos da memória. A
# mediana deve ser salva na posição 0x1001000C da memória.
# Exemplos:

# .data
#	a: .word 3
#	b: .word 2
#	c: .word 6
#	Mediana = 3

#.data
#	a: .word 19
#	b: .word 9
#	c: .word 6
#	Mediana = 9

.data
	a: .word 19
	b: .word 9
	c: .word 6
	m: .space 4
.text

	lui $t0, 0x1001		#registrador base
	lui $t8, 0x1001		#registrador base para salvar na memória
	lw $t1, 0($t0)		#inicializa t1 com a(3)
	lw $t2, 4($t0)		#inicializa t2 com b(2)
	lw $t3, 8($t0)		#inicializa t3 com c(6)
	addi $t5, $zero, 1	#inicializa t5 com 1
	lw $t6, 0($t0)		#inicializa t6 com a - vai ser o temporário 
	addi $t7, $zero, 0	#contador

reinicia:
	slt $t4, $t6, $t1	# se t6 for menor que t1 coloca 1 em t4
	
	beq $t4, $t5, incrementa1
	
volta:	slt $t4, $t6, $t2	# se t6 for menor que t2 coloca 1 em t4

	beq $t4, $t5, incrementa2

volta2:	slt $t4, $t6, $t3	# se t6 for menor que t3 coloca 1 em t4

	beq $t4, $t5, incrementa3

volta3:	beq $t7, $t5, mediana
	addi $t0, $t0, 4
	lw $t6, 0($t0)
	j reinicia

incrementa1:
	addi $t7, $zero, 1
	j volta
	
incrementa2:
	addi $t7, $zero, 1
	j volta2
	
incrementa3:
	addi $t7, $zero, 1
	j volta3
	
mediana:
	sw $t6, 0xc($t8)