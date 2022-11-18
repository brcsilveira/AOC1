# 4. Escreva um programa que conte com tr�s subrotinas capazes de calcular a �rea da
# circunfer�ncia (?*r^2), do tri�ngulo (b*a/2) e do ret�ngulo (b*a). Inicialmente,
# pergunte ao usu�rio (use syscall) qual forma geom�trica ele deseja (armazenando no
# registrador $t0) e depois solicite as medidas necess�rias para calcular a �rea de cada
# forma (armazenar para circunfer�ncia o valor r em $t0, tri�ngulo e ret�ngulo
# armazenar valor de a e b em $t0 e $t1, respectivamente). Ao final, imprima a �rea
# desejada. Respeite as conven��es de uso dos registradores.

.data
	pergunta: .asciiz "Qual forma geom�trica voc� deseja calcular a �rea(1-Circunfer�ncia, 2-Tri�ngulo e 3-Ret�ngulo)? "
	perguntaR: .asciiz "Informe o r: "
	perguntaA: .asciiz "Informe o a: "
	perguntaB: .asciiz "Agora informe o b: "
	resposta: .asciiz "C�lculo da �rea: "
.text
	li $v0, 4		#imprime a string
	la $a0, pergunta	#carrega o endere�o da string
	syscall
	
	li $v0, 5			#l� um inteiro
	syscall
	move $t0, $v0			#guarda a op��o do usu�rio
	
	beq $t0, 1, circunferencia	#se digitar 1 pula pra circunfer�ncia
	beq $t0, 2, triangulo		#se digitar 2 pula pra tri�ngulo
	beq $t0, 3, retangulo		#se digitar 3 pula pra ret�ngulo

	li $v0, 10	#se n�o digitar nada v�lido, encerra o programa
	syscall

circunferencia:
	jal areaDaCirc 	#chamada da fun��o
	
	li $v0, 4		# imprime string
	la $a0, resposta	# carrega o endere�o da string
	syscall
	
	li $v0, 1		# imprime inteiro
	move $a0, $v1		# carrega em a0 o resultado do c�lculo
	syscall
	
	li $v0, 10	# encerra o programa
	syscall

triangulo:
	jal areaDoTri	#chamada da fun��o
	
	li $v0, 4		# imprime string
	la $a0, resposta	# carrega o endere�o da string
	syscall
	
	li $v0, 1		# imprime inteiro
	move $a0, $v1		# carrega em a0 o resultado do c�lculo
	syscall
	
	li $v0, 10	# encerra o programa
	syscall

retangulo:
	jal arearet	#chamada da fun��o
	
	li $v0, 4		# imprime string
	la $a0, resposta	# carrega o endere�o da string
	syscall
	
	li $v0, 1		# imprime inteiro
	move $a0, $v1		# carrega em a0 o resultado do c�lculo
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
	mult $t0, $t1		# 3 * r�
	mflo $v1		# v1 = 3 * r�
	jr $ra			# t�rmino da fun��o
		
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
	jr $ra			# fim da fun��o
	
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
	jr $ra			# fim da fun��o