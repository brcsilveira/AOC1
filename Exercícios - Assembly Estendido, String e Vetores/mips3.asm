#3. Escreva um programa que leia um vetor de 10 posições (.word) da memória
# (começando na posição 0x10010000) e verifique se o vetor está ou não ordenado.
# Use o registrador $t0 como flag.
# Faça $t0 = 1 se o vetor estiver ordenado e $t0 = 0 caso contrário

.data
	vetor: .word 4,-2,33,52,1,17,11,7,90,-7
	tamanho: .word 10
	#vetor: .word 0,1,2,3
	#tamanho: .word 4
.text
	lw $t2, tamanho		# carrega o valor de tamanho em t2
	la $s1, vetor		# pega o endereço do primeiro elemento do vetor
	
	ori $t1, $zero, 1	# seta o contador em 1

loop:
	beq $t1, $t2, estado	# se t1 for igual a t2 pula pro fim
	lw $t3, 0($s1)		# carrega em t3 o elemento do vetor
	addi $s1, $s1, 4	# incrementa para próxima posição do vetor
	lw $t4, 0($s1)		# carrega em t4 o próximo elemento do vetor
	
	slt $t0, $t4, $t3	# compara se tá em ordem crescente, caso não: t0 = 1
	bnez $t0, estado

	addi $t1, $t1, 1	# incrementa t1
	j loop

estado:
   	bnez $t0, desordenado
	beqz $t0, ordenado

ordenado:
	addi $t0, $zero, 1
	j fim

desordenado:
	addi $t0, $zero, 0
	j fim
fim:
	nop			#fim do programa