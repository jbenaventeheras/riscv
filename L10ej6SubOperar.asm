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

	addi sp, sp, -32
	sw ra, 28(sp)
	
     	#-- Almacenar x e y en pila
   	sw a0, 24(sp)
   	sw a1, 20(sp)
   	sw a2, 16(sp)
   	sw a3, 12(sp)
   	#-- Almacenar ra 
   	
	
	#-- RECUPERAR X E Y ORIGINALES DE LA PILA Y PASARSELOS POR AO Y A1 A PRINT
	lw a0, 24(sp)
	lw a1, 20(sp)
	jal print_vec
       
       #-- RECUPERAR X E Y ORIGINALES DE LA PILA INCRIMETAR EN UNA UNIDAD Y PASARSELOS POR AO Y A1 A PRINT
       	lw a0, 24(sp)
	lw a1, 20(sp)
	lw a2, 16(sp)
   	lw a3, 12(sp)
       
       add a0, a0, a2
       add a1, a1, a3
	
       jal print_vec	
     	
     	lw ra, 28(sp)
    	 #-- Liberar espacio de la pila
     	addi sp, sp, 32
     	
     	ret