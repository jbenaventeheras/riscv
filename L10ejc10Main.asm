#-- Programa principal

	.include "services.asm"
	
	.eqv MAX 1024
	
	.data
	
msg:	.string "CADENA: "
msg2:	.string "CLAVE: "
cadena:   .space MAX

	
	.text
	
	#-- Imprimir el mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena
	la a0, cadena
	li a7, READ_STRING
	li a1, MAX
	ecall
	
	#-- guardamos la direccion de la cadena  en s0 o bien llamaos la cada vez ya que no se conserva tras subrutinas
	mv s0, a0
	
	#-- Imprimir el mensaje
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	#-- pedir numero para cifrar
	li a7, READ_INT
	ecall
	
	mv s1, a0
	
	
	#-- configuramos a0 y a1 desde los estaticos ya que argumentos se pierden en cada llamada a subrutina
	mv a0, s0
	mv a1, s1

 	jal cifrar
 	
 	
 	mv a0, s0
	li a7, PRINT_STRING
	ecall
	
	jal descifrar
	
	mv a0, s0
	li a7, PRINT_STRING
	ecall
	
 principal:	
	#-- Terminar
	li a7, EXIT
	ecall
