#-- Programa principal

	.include "services.asm"
	
	.data
msg:	.string "INSTRODUCE UN NUMERO: "
	
	.text
	
	#-- Imprimir el mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir numero al usuario
	li a7, READ_INT
	ecall
	
	#--llanar a imprinir entero
 	jal operar
 principal:	
	#-- Terminar
	li a7, EXIT
	ecall
