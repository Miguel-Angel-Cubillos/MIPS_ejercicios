.data     # Secci�n para definir los datos est�ticos del programa
          # Programa para seleccionar el n�mero mayor
    num1: .asciiz "Ingrese un n�mero: "
    num2: .asciiz "Ingrese un segundo n�mero: "
    num3: .asciiz "Ingrese un tercer n�mero: "
    mayornum: .asciiz "El n�mero mayor es: "

.text   # secci�n contiene el c�digo ejecutable del programa 
.globl main    #definir la etiqueta main como el punto de entrada del programa

main:      #etiqueta punto de inicio del programa
    # Pedir el primer n�mero
    li $v0, 4    #cargar el valor 4 en el registro $v0, 
                 #es el c�digo de llamada al sistema para imprimir cadena caracteres
    la $a0, num1  #carga la direcci�n de la cadena num1 en el registro $a0, 
                  #que es el argumento para la llamada al sitema de impresi�n
    syscall # realiza la llamada al sistema para imprimir la cadena almacenada en la direcci�n que est� en $a0
    li $v0, 5 # cargar el valor 5 en el registro $v0, 
              # es el cod�go de la llamada al sistema para leer un entero desde la entrada est�ndar
    syscall #realiza la llamada al sistema (en este caso para leer un entero y asignar el valor a $v0
    move $t0, $v0  # mueve el valor que est� en $v0 al registro temporal $t0

    # Pedir el segundo n�mero
    li $v0, 4
    la $a0, num2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Pedir el tercer n�mero
    li $v0, 4
    la $a0, num3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    # Comparar los n�meros para encontrar el mayor
    move $t3, $t0      # en $t3 se guardar� el valor mayor, para empezar se pone el primer n�mero ingresado en $t3
    bgt $t3, $t1, comp1 # si el valor de $t3 es mayor que el valor de $t1 se saltan instrucciones hasta la etiqueta comp1
    move $t3, $t1  # asignar el valor de $t1 a $t3, instrucci�n que se ejecuta si $t3 no es mayor que $t1

comp1:
    bgt $t3, $t2, comp2 # si el valor de $t3 es mayor que el valor de $t2 se saltan instrucciones hasta la etiqueta comp1
    move $t3, $t2 # asignar el valor de $t2 a $t3, instrucci�n que se ejecuta si $t3 no es mayor que $t2

comp2:
    # $t3 qued� col el valor mayor

    # Mostrar el resultado
    li $v0, 4
    la $a0, mayornum  #imprimir en pantalla "El n�mero mayor es: "
    syscall

    li $v0, 1 #Carga el valor 1 en $v0, que es el c�digo de la llamada al sistema para imprimir un entero.
    move $a0, $t3 #copiar el valor de $t3 en $a0, el registro $a0 es el que se usa para imprimir
    syscall

    # Salir del programa
    li $v0, 10 #Carga el valor 10 en $v0, que es el c�digo de la llamada al sistema para salir del programa
    syscall
