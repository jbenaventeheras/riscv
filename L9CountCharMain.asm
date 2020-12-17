#-- Solución al ejercicio 5
#-- Programa principal
#-- Contar el número de caracteres 'a' y 'e' que hay en una frase pedida al usuario

	.include "services.asm"
	
	#-- Longitud maxima de la cadena
	.eqv MAX 1024
	
	.data
	
msg1:	.string "Introduce una cadena: "

msg2:   .string "Introduce caracter a buscar: "
msg3:   .string "\nNumero de caracteres : "
msg4:   .string "\nLongcadena : "
msg5:   .string "\nCADENA EN MAYUSCULAS: "
msg6:   .string "NOPALINDROMO: "
msg7:   .string "SIPALINDROMO: "

	#-- Cadena introducida por el usuario
cad:	.space MAX
		
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Almacenar el puntero a la cadena en s0
	#-- ¡OJO! ESTO ES MUY IMPORTANTE! Hay que almacenarlo en 
	#-- cualquiera de los registros estáticos s0-s11...
	#-- PERO NO PODEMOS USAR LOS TEMPORALES t0-t6
	mv s0, a0
	
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	
	li a7, READ_CHAR
	ecall
	mv a1, a0
	
	mv a0,s0
	#-- Llamar a la funcion na = count(a0, 'a')
	jal count
	
	#-- El convenio de uso de registros especifica que tras la ejecucion
	#-- de una subrutina, los registros estáticos s0-s11 deben tener
	#-- el mismo valor que tenian antes de la llamada....
	#-- Sin embargo el valor de los temporales se debe considerar 
	#-- perdido. Por eso hemos almacendo el puntero de la cadena en S0
	
	#-- a0 Contiene el número de 'a'. Lo guardamos en t0
	mv t0, a0
	
	#-- Imprimir mensaje 2
	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cantidad
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	mv a0, s0
	
	jal Longcad
	
	#-- Imprimir mensaje 2
	la a0, msg4
	li a7, PRINT_STRING
	ecall
	#-- Imprimir la cantidad
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	mv a0, s0
	
	jal upper
	
	
	#-- Imprimir mensaje 2
	
	la a0, msg5
	li a7, PRINT_STRING
	ecall
	
	mv a0, s0
	li a7, PRINT_STRING
	ecall
	
	mv a0, s0
	
	jal palindromo
	
	beq a0, zero, no_palindromo
	
	la a0, msg7
	li a7, PRINT_STRING
	ecall
	b fin
no_palindromo:
	
	
	la a0, msg6
	li a7, PRINT_STRING
	ecall
fin:
	#-- Terminar
	li a7, EXIT
	ecall
