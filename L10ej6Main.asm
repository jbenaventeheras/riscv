#-- Programa principal

	.include "services.asm"
	
	.data
msg:	.string "INSTRODUCE COORDENADA X: "
msg2:	.string "INSTRODUCE COORDENADA Y: "
	
	.text
	
	#-- Imprimir el mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir PRIMERA COORDENADA 
	li a7, READ_INT
	ecall
	
	mv t1, a0
	
	#-- Imprimir el mensaje
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	#-- Pedir SEGUNDA COORDENADA
	li a7, READ_INT
	ecall
	
	mv a1, a0
	mv a0, t1
	#--llanar a imprinir entero
 	jal operar
 	
 principal:	
	#-- Terminar
	li a7, EXIT
	ecall
