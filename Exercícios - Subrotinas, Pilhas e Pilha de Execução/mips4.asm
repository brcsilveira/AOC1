# 4. Escreva um programa que conte com três subrotinas capazes de calcular a área da
# circunferência (?*r^2), do triângulo (b*a/2) e do retângulo (b*a). Inicialmente,
# pergunte ao usuário (use syscall) qual forma geométrica ele deseja (armazenando no
# registrador $t0) e depois solicite as medidas necessárias para calcular a área de cada
# forma (armazenar para circunferência o valor r em $t0, triângulo e retângulo
# armazenar valor de a e b em $t0 e $t1, respectivamente). Ao final, imprima a área
# desejada. Respeite as convenções de uso dos registradores.

.data
	pergunta: .asciiz "Qual forma geométrica você deseja calcular a área(1-Circunferência, 2-Triângulo e 3-Retângulo)? "
	perguntaR: .asciiz "Informe o r: "
	perguntaA: .asciiz "Informe o a: "
	perguntaB: .asciiz "Agora informe o b: "
	resposta: .asciiz "Cálculo da área: "
.text
	li $v0, 4		#imprime a string
	la $a0, pergunta	#carrega o endereço da string
	syscall
	
	li $v0, 5			#lê um inteiro
	syscall
	move $t0, $v0			#guarda a opção do usuário
	
	beq $t0, 1, circunferencia	#se digitar 1 pula pra circunferência
	beq $t0, 2, triangulo		#se digitar 2 pula pra triângulo
	beq $t0, 3, retangulo		#se digitar 3 pula pra retângulo

	li $v0, 10	#se não digitar nada válido, encerra o programa
	syscall

circunferencia:
	jal areaDaCirc 	#chamada da função
	
	li $v0, 4		# imprime string
	la $a0, resposta	# carrega o endereço da string
	syscall
	
	li $v0, 1		# imprime inteiro
	move $a0, $v1		# carrega em a0 o resultado do cálculo
	syscall
	
	li $v0, 10	# encerra o programa
	syscall

triangulo:
	jal areaDoTri	#chamada da função
	
	li $v0, 4		# imprime string
	la $a0, resposta	# carrega o endereço da string
	syscall
	
	li $v0, 1		# imprime inteiro
	move $a0, $v1		# carrega em a0 o resultado do cálculo
	syscall
	
	li $v0, 10	# encerra o programa
	syscall

retangulo:
	jal arearet	#chamada da função
	
	li $v0, 4		# imprime string
	la $a0, resposta	# carrega o endereço da string
	syscall
	
	li $v0, 1		# imprime inteiro
	move $a0, $v1		# carrega em a0 o resultado do cálculo
	syscall
	
	li $v0, 10	# encerra o programa
	syscall

areaDaCirc:
	li $v0, 4
	la $a0, perguntaR
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	mult $t0, $t0		# raio ao quadrado
	mflo $t0
	addi $t1, $zero, 3	# vai ser o PI
	mult $t0, $t1		# 3 * r²
	mflo $v1		# v1 = 3 * r²
	jr $ra			# término da função
		
areaDoTri:
	li $v0, 4		#imprime string
	la $a0, perguntaA	
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, perguntaB
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	mult $t1, $t0		# a * b
	mflo $t0		# t0 = a * b
	addi $t1, $zero, 2
	div $t0, $t1		# (a * b) / 2
	mflo $v1		# v1 =  (a * b) / 2
	jr $ra			# fim da função
	
arearet:
	li $v0, 4		#imprime string
	la $a0, perguntaA	
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, perguntaB
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	mult $t1, $t0		# a * b
	mflo $v1		# v1 = a * b
	jr $ra			# fim da função