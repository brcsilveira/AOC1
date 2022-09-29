#1. Faça um programa que escreva o valor 0xDECADA70 no registrador
#$t7, incluindo um dígito hexadecimal por vez (isto é, insira letra por
#letra, individualmente) no registrador.

# $t7 <- (recebe) 0xDECADA70

ori $t7, $zero, 0xD
sll $t7, $t7, 4
ori $t7, $t7, 0xe
sll $t7, $t7, 4
ori $t7, $t7, 0xc
sll $t7, $t7, 4
ori $t7, $t7, 0xa
sll $t7, $t7, 4
ori $t7, $t7, 0xd
sll $t7, $t7, 4
ori $t7, $t7, 0xa
sll $t7, $t7, 4
ori $t7, $t7, 0x7
sll $t7, $t7, 4
ori $t7, $t7, 0x0