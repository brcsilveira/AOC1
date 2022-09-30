#1. Escreva um programa que leia dois halfwords (a e b) da memória e calcule a sua
# divisão se os dois valores forem diferentes e a sua multiplicação se os dois valores
# forem iguais. Escreva o resultado (y) em uma palavra (4 bytes) de memória. O
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
# memória .data. Inicie o código com:

.data
	a: .half 30
	b: .half 5
	y: .space 4

.text

	lui $t0, 0x1001 	#inicializa o registrador base em t0
	lh $t1, 0($t0)		#carrega a em t1
	lh $t2, 2($t0)		#carrega b em t2

	bne $t1, $t2, divide	#se o conteudo de t1 for igual ao conteudo de t2 ele segue, se não ele pula(divide)
	mult $t1, $t2
	j fim
	
divide:	div $t1, $t2

fim:	mflo $t3		#guarda o resultado em t4
	sw $t3, 4($t0)		#escreve o resultado em y