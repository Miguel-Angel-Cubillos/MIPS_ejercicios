.data     # Programa para seleccionar el número menor
    num1: .asciiz "Ingrese un número: "
    num2: .asciiz "Ingrese un segundo número: "
    num3: .asciiz "Ingrese un tercer número: "
    menornum: .asciiz "El número menor es: "

.text   
.globl main    

main:     
    # Pedir el primer número
    li $v0, 4   
    la $a0, num1  
    syscall 
    li $v0, 5 
    syscall 
    move $t0, $v0  

    # Pedir el segundo número
    li $v0, 4
    la $a0, num2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Pedir el tercer número
    li $v0, 4
    la $a0, num3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    # Comparar los números para encontrar el menor
    move $t3, $t0      
    blt $t3, $t1, comp1 #si es valor en $t3 es menor que el valor en $t1 se saltan las instrucciones hasta la etiqueta comp1
    move $t3, $t1  

comp1:
    blt $t3, $t2, comp2 #si es valor en $t3 es menor que el valor en $t2 se saltan las instrucciones hasta la etiqueta comp2
    move $t3, $t2 

comp2:

    # Mostrar el resultado
    li $v0, 4
    la $a0, menornum 
    syscall

    li $v0, 1 
    move $a0, $t3 
    syscall

    # Salir del programa
    li $v0, 10
    syscall
