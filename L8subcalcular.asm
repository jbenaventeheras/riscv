.globl calcular	
	
	#-- La funcion se encuentra en el segmento de texto
	.text

calcular:

	#-- Calcular la expresion: num = (d1 - 48) * 10 + (d0 - 48)
	#-- t2 = 48
	li t2, 48
	
	#-- t3 = d0 - 48
	sub t3, a0, t2
	
	#-- t4 = d1 - 48
	sub t4, a1, t2
	
	#-- t6 = (d1 - 48) * 10
	li t5, 10
	mul t6, t4, t5
	
	#-- t6 = (d1 - 48) * 10 + (d0 - 48)
	add t6, t6, t3
	
	mv a0, t6

	ret