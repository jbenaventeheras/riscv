#-------------------------------------------------
#--- Subrutina Reverse(pcad)
#--- Imprimimr la cadena al revés
#--- El algoritmo es recursivo
#-- ENTRADAS:
#--    a0: Punter a la cadena a dar la vuelta
#-- SALIDAS:
#--    Ninguna
#--------------------------------------------------

	.include "services.asm"

	#-- Punto de entrada	
	.globl count_char
	
	.text 

count_char:
	

	#-- Leer primer caracter
	lb t0, 0(a0)
	
	#-- Comprobar si es el ultimo (\n)
	li t1, '\n'
	bne t1, t0, count_char_rec
	
	li a0, 0
	
	#-- Es el último: retornar
	b fin
	
	
	#-- No es el ultimo caracter
count_char_rec:	

	#-- Reservar memoria en la pila
	addi sp, sp, -16
	
	#-- Guardar dir. de retorno
	sw ra, 12(sp)

	#-- guardar primer caracter
	sw t0, 0(sp)
	#-- guardar caracter a buscar que veine a1
	sw a1, 4(sp)
	
	#-- siguiente caracter
	addi a0, a0, 1
	jal count_char
	
	#-- cargar primer caracter para comprobar si es el buscado
	lw t0, 0(sp)
	lw a1, 4(sp)
	beq a1, t0, found
	
	


	#-- Recuperar dir. de retorno
	lw ra, 12(sp)

	addi sp, sp, 16
	b fin
	
found:

	addi a0, a0, 1

#-- Punto de salida		
fin:	
	ret
