# Escreva a sequ�ncia 0x12345678 em $t1. A seguir, escreva um c�digo
# que inverta a sequ�ncia, escrevendo 0x87654321 em $t2. Obviamente o
# c�digo deve inverter os bits de $t1 e n�o simplesmente
# escrever 0x87654321 diretamente em $t2.

# Inicializa tudo em 0
or $t1, $zero, $zero
or $t2, $zero, $zero
or $t3, $zero, $zero
or $t4, $zero, $zero

# Colocar 12345678 em t1
ori $t1, $zero, 0x1234
sll $t1, $t1, 16 # cada casa ocupa 4 bits, por isso a rota��o a esquerda em 16
ori $t1, $t1, 0x5678

# t3 � mascara � come�a setada para pegar o digito menos significativo
ori $t3, $zero, 0xf

# t4 � carregador com o valor de t1
or $t4, $zero, $t1

# Continuar
and $t2, $t3, $t4 # � feita uma and entre t3 e t4 para pegar o bit menos significativo e salvar em t2
sll $t2, $t2, 4 # Rota��o � esquerda em t2 para esperar o proximo bit.
srl $t4, $t4, 4 # Rota��o � direita em t4 para que o pegar o novo bit menos significativo (7)

and $t4, $t4, $t3 # and de t4 com t3 para ficar 00000007 e salvar em t4
or $t2, $t2, $t4 # or entre t2 e t4 para que t2 fique assim 00000087

sll $t2, $t2, 4 # Rota��o � esquerda em t2 para esperar o proximo bit.
or $t4, $t1, $zero # Guarda o valor de t1 (12345678) em t4.
srl $t4, $t4, 8 # Rotaciona t4 dois bits a direita (00123456)
and $t4, $t4, $t3 # and entre t4 e t3 para pegar o bit menos significativo (6) e guardar no pr�prio t4
or $t2, $t2, $t4 # or entre t2 e t4 para guardar o o bit menos significativo em t2 (00000876)

# E assim sucessivamente at� o valor de t1 estar completamente invertido em t2

sll $t2, $t2, 4
or $t4, $t1, $zero
srl $t4, $t4, 12
and $t4, $t4, $t3
or $t2, $t2, $t4

sll $t2, $t2, 4
or $t4, $t1, $zero
srl $t4, $t4, 16
and $t4, $t4, $t3
or $t2, $t2, $t4

sll $t2, $t2, 4
or $t4, $t1, $zero
srl $t4, $t4, 20
and $t4, $t4, $t3
or $t2, $t2, $t4

sll $t2, $t2, 4
or $t4, $t1, $zero
srl $t4, $t4, 24
and $t4, $t4, $t3
or $t2, $t2, $t4

sll $t2, $t2, 4
or $t4, $t1, $zero
srl $t4, $t4, 28
and $t4, $t4, $t3
or $t2, $t2, $t4