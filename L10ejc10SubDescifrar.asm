#-- descifrar(pcad,k) tiene dos argumentos de entrada. El primer es un puntero a la cadena a cifrar y el segundo es la clave para cifrar.
#-- Es un número entero entre 1 y 255. Es el valor que se resta a cada carácter de la cadena original para descifrar a1: cadena a0: numero cifrado

	.globl descifrar

	.text

descifrar:

	#-- Crear la pila
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)
	
	#-- Multiplicar a1 por -1
	li t0, -1
	mul a1, a1,t0
	
	#-- Llamar a cifrar
	jal cifrar
	
	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	
	#-- Limpiar la pila
	addi sp, sp, 16
	



	ret