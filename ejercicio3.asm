.data
enunciado: .asciiz "Ingrese el n�mero de t�rminos de la serie de Fibonacci que desea: "
newline: .asciiz "\n"

.text
.globl main

main:
    # Solicitar al usuario el n�mero de t�rminos de la serie de Fibonacci que deseo
    li $v0, 4  # sentencia para especificar que se va a imprimir una cadena
    la $a0, enunciado  #poner el valor de enunciado en el registro $a0 que es el que se usa para imprimir
    syscall #llamada al sistema

    # Leer el n�mero ingresado por el usuario
    li $v0, 5 # poner en $v0 lo ingresado por el usuario
    syscall # llamada al sistema
    move $t0, $v0   # en $t0 queda el n�mero de t�rminos que se quiere de la serie Fibonacci


    # Inicializar la serie de Fibonacci
    li $t1, 0    # Serie Fibonacci empieza siempre con 0
    li $t2, 1    # Segundo n�mero de la serie Fibonacci es 1
    move $t3, $t0 # En $t3 dejar el n�mero de t�rminos que se quiere

    # Calcular y mostrar la serie de Fibonacci
    terminos_fibonacci:
        # Mostrar primer t�rmino en pantalla
        move $a0, $t1
        li $v0, 1
        syscall

        # Calcular el siguiente t�rmino de Fibonacci
        add $t4, $t1, $t2   # en el registro $t4 dejar la suma de los dos primeros t�rminos de la serie
        move $t1, $t2       # mover a $t1 el valor del siguiente t�rmino de la serie que no se ha mostrado
        move $t2, $t4       # mover a $t2 el siguiente valor de la serie fibonacci posterior al que est� en $t1

        # Mostrar un salto de l�nea
        li $v0, 4
        la $a0, newline
        syscall

        # Decrementar el contador de t�rminos restantes
        subi $t3, $t3, 1  #restarle uno al n�mero de t�rminos que nos falta por imprimir

        # Comprobar si hemos mostrado suficientes t�rminos
        beqz $t3, final  #saltar a la etiqueta final si lo que est� en $t3 es cero

        # Continuar calculando la serie de Fibonacci
        j terminos_fibonacci  # j significa saltar a la etiqueta, en este caso a la etiqueta terminos_fibonacci 

    final:
    # Salir del programa
    li $v0, 10
    syscall