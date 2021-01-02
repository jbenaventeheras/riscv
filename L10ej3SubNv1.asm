#---------------------------------
#-- Subrutina Tarea 1
#-- ENTRADAS: Ninguna
#-- SALIDAS: Ninguna
#---------------------------------

	#-- Punto de entrada
	.globl tarea1
	
	.include "services.asm"

	.data
msg:	.string "  Tarea 1\n" 	
			
	.text
	
	
#-------- Punto de entrada
tarea1:

	addi sp, sp, -16

     	#-- Almacenar ra en la pila
   	sw ra, 12(sp)
	
	#-- Imprimir el mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	jal tarea2		
#------- Punto de salida

	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	 #-- Recuperar ra de la pila
    	 lw ra, 12(sp)
     
    	 #-- Liberar espacio de la pila
     	addi sp, sp, 16
     	ret
