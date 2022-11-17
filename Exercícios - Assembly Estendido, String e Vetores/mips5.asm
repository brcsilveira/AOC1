# 5. Declare tr�s vetores do mesmo tamanho:
#	.data
#		tamanho: .word 7
#		vetor1: .word -30, -23, 56, -43, 72, -18, 71
#		vetor2: .word 45, 23, 21, -23, -82, 0, 69
#		soma: .word 0, 0, 0, 0, 0, 0, 0

# Inicialize um ponteiro para cada vetor (pseudo-instru��o la) e fa�a a soma dos
# elementos dos vetores 2 a 2.
# O vetor resultante deve ser armazenado depois dos elementos do segundo vetor.
# Exemplo: soma[i] = vetor1[i]+vetor2[i]

.data
	tamanho: .word 7
	vetor1: .word -30, -23, 56, -43, 72, -18, 71
	vetor2: .word 45, 23, 21, -23, -82, 0, 69
	soma: .word 0, 0, 0, 0, 0, 0, 0
.text
	lw $t0, tamanho		#carrega o valor de tamanho em t0
	la $s1, vetor1		#carrega o endere�o do 1� elemento de vetor1
	la $s2, vetor2		#carrega o endere�o do 1� elemento de vetor2
	la $s3, soma		#carrega o endere�o do 1� elemento de soma
	
	ori $t4, $zero, 0	#inicializa o contador em 0
loop:
	beq $t4, $t0, fim	
	
	lw $t1, 0($s1)		#carrega um elemento do vetor1
	lw $t2, 0($s2)		#carrega um elemento do vetor2
	lw $t3, 0($s3)		#carrega um elemento do soma
	
	add $t3, $t1, $t2	#soma[i] = vetor1[i] + vetor2[i]
	sw $t3, 0($s3)		#escreve no endere�o referenciado por t3 (soma)
	
	addi $s1, $s1, 4	#incremnta a posi��o de vetor1
	addi $s2, $s2, 4	#incremnta a posi��o de vetor2
	addi $s3, $s3, 4	#incremnta a posi��o de soma
	
	addi $t4, $t4, 1
	j loop
fim: 
	nop			#fim