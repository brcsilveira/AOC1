#1. Reescreva o seguinte c?digo C em MIPS Assembly:
#	int i;
#	int vetor[8];

#	for(i=0; i<8; i++) {
#	if(i%2==0)
#		vetor[i] = i * 2;
#	else
#		vetor[i] = vetor[i] + vetor[i-1];
#	}

# Cada posi??o do vetor deve ter 4 bytes e deve ser armazenada, em sequ?ncia, a
# partir da posi??o 0x1001000 da mem?ria.

.data
	a: .space 32
.text
	lui $t0, 0x1001		#regitrador base
	addi, $t1, $zero, 0	#vai ser o i
	addi, $t3, $zero, 8	#limite do for
	addi $t4, $zero, 0 # temp
	addi $t5, $zero, 0 # endereco para store
	
loop:	beq $t1, $t3, fim
	
	andi $t2, $t1, 0x0001	#t2 = 1;	IMPAR	
				#t2 = 0;	PAR
	beq $t2, $zero, par
	
	impar:		addi $t5, $t1, -1	# index do anterior
			sll $t5, $t5, 2		# multiplica esse index por 4
			add $t5, $t5, $t0	# Soma o deslocamento com a base
			lw $t4, 0($t5)
			sll $t5, $t1, 2	
			add $t5, $t5, $t0
			sw $t4, 0($t5)
			j fimLoop
	
	par:		sll $t4, $t1, 1 	# multiplica por 2
			sll $t5, $t1, 2		# index * 4 = endere?o da posicao do vetor
			add $t5, $t5, $t0	# Soma o deslocamento com a base
			sw $t4, 0($t5)
			sll $zero, $zero, 0 	#ToDo
	
	fimLoop: 
		addi $t1, $t1, 1
		j loop

fim:	sll $zero, $zero, 0