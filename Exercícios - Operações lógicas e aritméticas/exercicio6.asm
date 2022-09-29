#6. Inicialize o registrador $t7 com 0x1. Com apenas uma instrução,
#multiplique o conteúdo do registrador $t7 por 32. Utilize apenas instruções
#já vistas em aula até agora. O programa deve funcionar para qualquer valor,
#não apenas para 0x1.

ori $t7, $zero, 0x1 #inicia o acumulador 
sll $t7, $t7, 5 # pq 2^5 = 32, por isso que se faz as rotações a direita com 5