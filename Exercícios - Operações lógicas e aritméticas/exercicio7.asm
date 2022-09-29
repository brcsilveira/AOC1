#7. Escreva um programa que calcule o valor de
# 4x - 2y + 3z (armazene os valores de x, y e z em $t1, $t2 e $t3,
# respectivamente) e coloque o resultado em $t7. Fa�a testes com alguns
# valores diferentes de x, y e z. Utilize apenas instru��es j� vistas na
# disciplina.

# 4x - 2y + 3z 
# 8 - 10 + 9 = 7

# inicializa

ori $t1, $zero, 2  #incializa x com 2
ori $t2, $zero, 5  #incializa y com 5
ori $t3, $zero, 3  #incializa z com 3

add $t5, $t1, $t1 # soma x com x
add $t5, $t5, $t5 # soma 2x com 2x = 4x

add $t6, $t2, $t2 # soma y com y

add $t7, $t3, $t3 # soma z com z
add $t7, $t7, $t3 # soma de 2z com z = 3z

add $t7, $t7, $t5 # soma de 3z com 4x = 4x + 3z

sub $t7, $t7, $t6 # 4x + 3z - 2y