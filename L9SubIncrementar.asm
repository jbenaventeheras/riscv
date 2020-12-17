
	#---------------------------------------------------------SUBRUTINA--------------------------------	
#--------------------------------------------
#-- Funcion de incremento:
#--   Entradas: a0: numero a incrementar
#-- Salidas:
#--   a0: Numero incrementado
#--------------------------------------------	

.globl incrementar2	
	
	#-- La funcion se encuentra en el segmento de texto
	.text

incrementar2:

	#-- Incrementar a0
	addi a0, a0, 1
	
	#-- Retornar
	ret