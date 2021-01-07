#-- Subrutina print int
#-- ENTRADAS: a0 coordenada x a1 coodenada y
#-- SALIDAS: Ninguna
#---------------------------------

	#-- Punto de entrada
	.globl print_vec
	
	.include "services.asm"


	
			
	.text
	
	
#-------- Punto de entrada
print_vec:

	addi sp, sp, -16

     	#-- Almacenar x e y en la pila
   	sw a0, 8(sp)
   	sw a1, 4(sp)
	
	li a0, '('
	li a7, PRINT_CHAR
	ecall
	
	 #-- Recuperar a0 con x de la pila e imprimir
    	lw a0, 8(sp)
     	li a7, PRINT_INT
	ecall
	
	#-- Imprimir la coma
	li a0, ','
	li a7, PRINT_CHAR
	ecall	
     	
     	 #-- Recuperar a1 con Y de la pila e imprimir
    	lw a0, 4(sp)
     	li a7, PRINT_INT
	ecall
	
	li a0, ')'
	li a7, PRINT_CHAR
	ecall
	
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall	
    	 #-- Liberar espacio de la pila
     	addi sp, sp, 16
     	
     	ret
