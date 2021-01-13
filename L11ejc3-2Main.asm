#--- Programa principal
#-- Pedir al usuario una cadena e imprimirla del revés
#-- Ej: Hola --> aloH

	.include "services.asm"
	
	.eqv MAX 1024
	
	.data
	
cad:	.space MAX	
msg1:	.string "Introduce una cadena: "
msg2:	.string "Introduce el caracter a contar: "
msg3:	.string "longuitud cadena: "
	
	.text
	
	#-- Imprimri mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall 
	
	#-- Pedir cadena al usuario
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	
	#-- Imprimri mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall 
	
	#-- Pedir caracter
	li a7, READ_CHAR
	ecall
	
	mv a1, a0
	la a0, cad
	
	#-- Llamar a la funcion reverse
	jal count_char
	
	#-- guardar en s1 el resultado del numero que se repite el caracter
	mv s1, a0
	
	
	#-- Imprimri mensaje 2
	la a0, msg3
	li a7, PRINT_STRING
	ecall 
	
	mv a0, s0
	li a7, PRINT_INT
	ecall
	
	
	
	#-- Terminar
	li a7, EXIT
	ecall
