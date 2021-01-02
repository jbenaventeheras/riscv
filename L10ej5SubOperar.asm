#-- Subrutina operar
#-- ENTRADAS: a0 numero a operar leido en main
#-- SALIDAS: Ninguna
#---------------------------------

	#-- Punto de entrada
	.globl operar
	
	.include "services.asm"

	.data
msg:	.string " -->" 	
			
	.text
	
	
#-------- Punto de entrada
operar:

	addi sp, sp, -16

     	#-- Almacenar numero a operar en la pila
   	sw a0, 8(sp)
   	sw ra, 12(sp)
	
	lw a0, 8(sp)
	jal print_int
	
	lw a0, 8(sp)
        jal mult2
        
        jal print_int
        
        
        lw a0, 8(sp)
	jal print_int
	
     	
     	
     	lw ra, 12(sp)
    	 #-- Liberar espacio de la pila
     	addi sp, sp, 16
     	
     	ret
