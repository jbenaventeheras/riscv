#-- Subrutina operar
#-- ENTRADAS: a0: coordenada x
#--           a1: coordenada y

#-- SALIDAS:  a0: coordenada x
#--           a1: coordenada y
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

     	#-- Almacenar x e y en pila
   	sw a0, 8(sp)
   	sw a1, 4(sp)
   	#-- Almacenar ra 
   	sw ra, 12(sp)
	
	
	
	lw a0, 8(sp)
	lw a1, 4(sp)
	jal print_vec
       
	
     	
     	
     	lw ra, 12(sp)
    	 #-- Liberar espacio de la pila
     	addi sp, sp, 16
     	
     	ret