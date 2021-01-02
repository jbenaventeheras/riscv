#-- Subrutina print int
#-- ENTRADAS: a0 numero a imprimir leido en main
#-- SALIDAS: Ninguna
#---------------------------------

	#-- Punto de entrada
	.globl print_int
	
	.include "services.asm"

	.data
msg:	.string " -->" 	
			
	.text
	
	
#-------- Punto de entrada
print_int:

	addi sp, sp, -16

     	#-- Almacenar ra en la pila
   	sw a0, 8(sp)
	
	#-- Imprimir el mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	 #-- Recuperar a0 con numero de la pila e imprimir
    	lw a0, 8(sp)
     	li a7, PRINT_INT
	ecall	
     	
    	 #-- Liberar espacio de la pila
     	addi sp, sp, 16
     	
     	ret
