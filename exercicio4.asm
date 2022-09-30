#4. Uma temperatura, armazenada em $t0, pode ficar em dois intervalos:

#	20 ? temp ? 40 e // acho que deveria ser "ou"
#	60 ? temp ? 80.

# Escreva um programa que coloque uma flag (registrador $t1) para 1 se a
# temperatura está entre os valores permitidos e para 0 caso contrário.
# Inicie o código com a instrução: ori $t0, $zero, temperatura, substituindo
# temperatura por um valor qualquer.

	ori $t0, $zero, 20	#Pode substituir o 20 por qualquer valor para conferir
	ori $t2, $zero, 0	#Para comparar com os saltos condicionais
	
	#Primeiro intervalo:
	slti $t1, $t0, 20	# t1 = 0
	bne $t1, $t2, fora	# se eles n forem iguais: fora
	slti $t1, $t0, 41	# t1 = 1
	beq $t1, $t2, fora	# se eles forem iguais: fora
	j bom1
	
	#Segundo intervalo:
int2:	slti $t3, $t0, 60	# t3 = 1
	bne $t3, $t2, forad	# se eles n forem iguais: fora
	slti $t3, $t0, 81	
	beq $t3, $t2, forad	# se eles forem iguais: fora
	j bom2
	
fora:	addi $t1, $zero, 0
	j int2
	
forad:  addi $t3, $zero, 0
	j fim

bom1:	j int2
bom2:	j fim

fim:	or $t1, $t1, $t3	