#-- Programa principal

	.include "services.asm"
	
	.data
msg:	.string "INSTRODUCE COORDENADA X: "
msg2:	.string "INSTRODUCE COORDENADA Y: "
msg3:	.string "INSTRODUCE INCREMENTO COORDENADA X: "
msg4:	.string "INSTRODUCE INCREMENTO COORDENADA Y: "
	
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

	#--pedir incremento x e incremento y
	la a0, msg3
	li a7, PRINT_STRING
	ecall
	#-- Pedir INCRMEMENTO X
	li a7, READ_INT
	ecall
	
	mv a2, a0
	
	la a0, msg4
	li a7, PRINT_STRING
	ecall
	#-- Pedir INCRMEMENTO Y
	li a7, READ_INT
	ecall
	
	mv a3, a0
	
	#--llanar a operar
	mv a0, t1
	
 	jal operar
 	
 principal:	
	#-- Terminar
	li a7, EXIT
	ecall
