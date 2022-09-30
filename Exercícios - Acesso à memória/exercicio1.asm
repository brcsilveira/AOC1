#1. Faça um programa que calcule a seguinte equação:

# y = 32ab - 3a + 7b - 13

# Utilize endereços de memória para armazenar o valore de a, b e o resultado y. Cada
# valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space
#4. Utilize as três primeiras posições da memória .data para armazenar,
# consecutivamente, a, b e y, iniciando o código com:

.data
	a: .word 3
	b: .word 5
	y: .space 4
.text

#### inicializa o registrador base
lui $t0, 0x1001  # $t0 ser? o registrador base e vai receber 0x10010000

#### l? "a" e "b" da mem?ria
lw $t1, 0x0($t0) # carrega $t1 com "a" (word que inicia na posi??o 0x10010000)
lw $t2, 0x4($t0) # carrega $t2 com "b" (word que inicia na posi??o 0x10010004)

#### carrega as constantes 32, -3 e 7 em registradores tempor?rios
ori $t3, $zero, 32 # carrega $t3 com 32
addi $t4, $zero, -3 # carrega $t4 com -3
ori $t5, $zero, 7 # carrega $t5 com 7

#### realiza os c?lculos
mult $t1, $t2 # multiplica "a" e "b"
mflo $t6 # coloca em $t6 o resultado de "ab" (ou seja, 15)

mult $t6, $t3 # multiplica 32 por "ab"
mflo $t6 # coloca em $t6 o resultado de "32ab" (ou seja, 480)

mult $t4, $t1 # multiplica -3 por "a"
mflo $t7 # coloca em $t7 o resultado de "-3a" (ou seja, -9)

mult $t5, $t2 # multiplica 7 por "b"
mflo $t8 # coloca em $t8 o resultado de "7b" (ou seja, 35)

add $t6, $t6, $t7 # coloca em $t6 o valor de "32b" + "-3a" (ou seja, 471)
add $t6, $t6, $t8 # coloca em $t6 o valor de "32b - 3a" + "7b" (ou seja, 506)
addi $t6, $t6, -13 # coloca em $t6 o valor de "32b - 3a + 7b" + "-13" (ou seja, 493)

#### armazena o resultado na mem?ria
sw $t6, 0x8($t0) # grava o resultado em "y" (word que inicia na posi??o 0x10010008)