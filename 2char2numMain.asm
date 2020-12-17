#-- Soluci�n al ejericio 4: Conversion de una  
#-- cadena de caracteres de 2 d�gitos a un n�mero

	.include "services.asm"
	
	#-- Numero maximo de caracteres: 3, dos digitos m�s el 0
	.eqv MAX 3


	.data

cadnum: .space MAX  #-- Se reservan 3 bytes de espaci

msg1:   .string "\nIntroduzca cadena de dos d�gitos: "
msg2:   .string "\nNumero: "
			
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall

	#-- Pedir cadena al usuario
	la a0, cadnum
	li a1, MAX
	li a7, READ_STRING
	ecall
	
		
	#-- Leer los digitos d1 y d0
	#-- t0 = d0
	lb t0, 1(a0)
	
	#-- t1 = d1
	lb t1, 0(a0)
	
	mv a0, t0
	mv a1, t1	
	
	jal calcular				
	
	mv t5,a0

	
	#-- Imprimir el mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el numero calculado
	mv a0, t5
	li a7, PRINT_INT
	ecall
 
	#-- Terminar
	li a7, EXIT
	ecall