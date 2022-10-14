.data
	tamanho: .word 5
	vetor: .word 4,-2,33,52,1
.text
	lw $t3, tamanho		#guarda 5 em t3 == t3 = 5
	la $t0, vetor		#guarda o endereço do vetor em t0
	lw $t4, 0($t0)		#inicia o 1° valor do vetor em t4
	
	addi $t1, $zero, 0	#t1 vai ser o contador
	addi $t2, $zero, 0	#t2 vai ser o somador	
	addi $t7, $zero, 0	#incrementa negativo
	addi $t5, $zero, 0	#incrememta positivo
	
loop:	beq $t1, $t3, fim
	add $t2, $t2, $t4	#t2 = t2 + t4
	slt $t6, $t4, $zero	#se t4 < 0 = 1 else t4 = 1
	bne $t6, $zero, negat
	add $t5, $t5, $t4
volta:	addi $t0, $t0, 0x4 	#incrementa o vetor
	lw $t4, 0($t0)
	addi, $t1, $zero, 1	#incrementa o contador do loop
	j loop
	
	
negat:	add $t7, $t7, $t4
	j volta
	
fim:	