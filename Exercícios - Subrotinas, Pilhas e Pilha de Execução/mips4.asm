# 4. Escreva um programa que conte com tr�s subrotinas capazes de calcular a �rea da
# circunfer�ncia (?*r^2), do tri�ngulo (b*a/2) e do ret�ngulo (b*a). Inicialmente,
# pergunte ao usu�rio (use syscall) qual forma geom�trica ele deseja (armazenando no
# registrador $t0) e depois solicite as medidas necess�rias para calcular a �rea de cada
# forma (armazenar para circunfer�ncia o valor r em $t0, tri�ngulo e ret�ngulo
# armazenar valor de a e b em $t0 e $t1, respectivamente). Ao final, imprima a �rea
# desejada. Respeite as conven��es de uso dos registradores.

.data
	Pergunta: .asciiz "Qual forma geom�trica voc� deseja calcular a �rea(1-Circunfer�ncia, 2-Tri�ngulo e 3-Ret�ngulo)? "
	reposta: .asciiz "C�lculo da �rea: "
.text
	  