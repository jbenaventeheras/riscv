#-- Cifrar(pcad,k) tiene dos argumentos de entrada. El primer es un puntero a la cadena a cifrar y el segundo es la clave para cifrar.
#-- Es un número entero entre 1 y 255. Es el valor que se suma a cada carácter de la cadena original para cifrar a1: cadena a0: numero cifrado

	.globl cifrar

	.text

cifrar:
	
recorrerstring:

	#-- Leer caracter y guardar en t0 avanzar con a0
	lb t0, 0(a0)
	
	#-- ver si ha llegado a final del string	
	li t1, '\n'
	beq t0, t1, fin
	
	#-- Sumar la clave al caracter
	add t0, t0, a1
	
	#-- Guardar el caracter cifrado
	sb t0, 0(a0)
	
	#-- avanzar a0 a siguiente caracter
	
	addi, a0, a0, 1

	b recorrerstring
fin:	
	#-- terminar funcion
	ret