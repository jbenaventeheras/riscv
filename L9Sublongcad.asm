#-- Subrutina para contar el numero de veces que aparece un car�cter
#-- int count(*cad, car)
#-- ENTRADAS:
#--    * a0: Puntero a la cadena
#--    * a1: Car�cter a contador
#-- SALIDAS:	
#--    * a0: N�mero de veces que aparece el caracter en la cadena

	#-- Punto de entrada
	.globl Longcad

#-- Punto de entrada
Longcad:

	#-- Inicializar contador de caracter: t0
	li t0, 0

bucle:
	#-- Leer caracter de la cadena (t1)
	lb t1, 0(a0)
	
	#-- Si es '\0' terminar
	li t2, '\n'
	beq t1, t2, fin

	
	#-- Caracter detectado. Incrementar contador
	addi t0, t0, 1

	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir el bucle
	b bucle

fin:

	#-- Devolver el numero de caracteres
	mv a0, t0

	#--- Punto de salida
	ret
