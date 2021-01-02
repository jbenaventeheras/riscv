#---------------------------------
#-- Subrutina Tarea 1
#-- ENTRADAS: Ninguna
#-- SALIDAS: Ninguna
#---------------------------------

	#-- Punto de entrada
	.globl tarea2
	
	.include "services.asm"

	.data
msg:	.string "  Tarea 2\n" 	
			
	.text
	
	
#-------- Punto de entrada
tarea2:

	
	#-- Imprimir el mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
			
#------- Punto de salida
	ret