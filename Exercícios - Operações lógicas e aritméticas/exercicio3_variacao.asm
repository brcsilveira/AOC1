#3. Comece um programa pela instru��o: ori $t1, $zero, 0x01. Usando
#apenas as instru��es l�gicas do tipo R (dois registradores como
#operandos) or, and e xor e instru��es de shift (isto �, sem usar outras
#instru��es ori al�m da inicial e nem instru��es nor),
#escreva 0xFFFFFFFF em $t1. Procure usar o menor n�mero de
#instru��es poss�vel.

ori $t1, $zero, 0x01
sll $t2, $t1, 1
or $t1, $t2, $t1
sll $t2, $t1, 2
or $t1, $t2, $t1
sll $t2, $t1, 4
or $t1, $t2, $t1
sll $t2, $t1, 8
or $t1, $t2, $t1
sll $t2, $t1, 16
or $t1, $t2, $t1