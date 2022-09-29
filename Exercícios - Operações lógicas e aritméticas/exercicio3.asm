#3. Comece um programa pela instrução: ori $t1, $zero, 0x01. Usando
#apenas as instruções lógicas do tipo R (dois registradores como
#operandos) or, and e xor e instruções de shift (isto é, sem usar outras
#instruções ori além da inicial e nem instruções nor),
#escreva 0xFFFFFFFF em $t1. Procure usar o menor número de
#instruções possível.

ori $t1, $zero, 0x01
nor $t2, $t1, $zero
or $t1, $t2, $t1