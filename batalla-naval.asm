.ORG 100h
     
     
 
     
BIENVENIDA:     ;Cartel de bienvenida y nombre del juego

    ;Coloca la consola en modo video (80x25)
    MOV AH, 00h
    MOV AL, 03h     ;Modo texto
    INT 10h
                        
    ;Muestra en consola cartel de bienvenida
    MOV AH, 09h 
    LEA DX, BV1
    INT 21h 
    MOV AH, 09h 
    LEA DX, BV2
    INT 21h
    MOV AH, 09h 
    LEA DX, BV3
    INT 21h
    MOV AH, 09h 
    LEA DX, BV4
    INT 21h
    MOV AH, 09h 
    LEA DX, BV5
    INT 21h
    MOV AH, 09h 
    LEA DX, BV6
    INT 21h
    MOV AH, 09h 
    LEA DX, BV7
    INT 21h
    ;----------------------------------------------------------------------------   
    MOV AH, 09h       
    LEA DX, LINEA1   ;Linea de separacion despues de bienvenida
    INT 21h
    
    ;Muestra en consola el nombre del juego (BATALLA  NAVAL)
    MOV AH, 09h
    LEA DX, NOMBRE_JUEGO    ;Nombre del juego (BATALLA  NAVAL)
    INT 21h

    MOV AH, 09h       
    LEA DX, LINEA2   ;Linea de separacion despues de nombre del juego
    INT 21h


MENU:       ;Menu principal

    ;Indica al programa en que menu se encuentra el jugador
    MOV NUM_MENU, '1'
    
    ;Muestra en consola menu principal de opciones (Ingresa una opcion: )  
    MOV AH, 09h
    LEA DX, IUO
    INT 21h
    
    MOV AH, 09h
    LEA DX, JUGAR
    INT 21h

    MOV AH, 09H
    LEA DX, REGLAS
    INT 21H
    
    MOV AH, 09h
    LEA DX, SALIR
    INT 21h
    
    MOV AH, 09h
    LEA DX, MSJ_OP
    INT 21h
    
    ;Pide opcion a jugador
    MOV AH, 01h
    INT 21h
    
    ;Valida numero de opcion introducido por jugador    
    CMP AL, '1'    
    JL OP_INC
    JE INICIO
   
    CMP AL, '2'    
    JE MANUAL
   
    CMP AL, '3'    
    JE SALIR_JUEGO
    JG OP_INC
     
    
OP_INC:         ;Opcion incorrecta

    MOV AH, 09h
    LEA DX, MSJ_ERR1
    INT 21h
    
    MOV AH, 09h
    LEA DX, MSJ_ERR2
    INT 21h
    
    MOV AH, 01h
    INT 21h
    
    MOV AH, 00h
    MOV AL, 03h
    INT 10h
    
    MOV AH, 09h
    LEA DX, SDL
    INT 21h
    
    MOV AH, 09h
    LEA DX, SDL
    INT 21h
       
    CMP NUM_MENU, '1'
    JE MENU

    CMP NUM_MENU, '2'
    JE MENU2

    CMP NUM_MENU, '3'
    JE MENU3
               
 
MANUAL:         ;Manual - parte 1
    
    ;Coloca la consola en modo video para limpiar mensajes previos
    MOV AH, 00h
    MOV AL, 03h
    INT 10h
       
    ;Muestra en consola las reglas del juego    
    MOV AH, 09h
    LEA DX, RGL1
    INT 21h
   
    MOV AH, 09h
    LEA DX, RGL2
    INT 21h
   
    MOV AH, 09h
    LEA DX, RGL3
    INT 21h
    
    MOV AH, 09h
    LEA DX, ESP_MAN
    INT 21h
    
    MOV AH, 09h
    LEA DX, ESP_MAN
    INT 21h
    
    MOV AH, 09h
    LEA DX, RGL4
    INT 21h

    MOV AH, 09h
    LEA DX, RGL5
    INT 21h
    
    MOV AH, 09h
    LEA DX, RGL6
    INT 21h
    
    MOV AH, 09h
    LEA DX, RGL7
    INT 21h
    
    MOV AH, 09h
    LEA DX, RGL8
    INT 21h
    
    MOV AH, 09h
    LEA DX, RGL9
    INT 21h
    
    MOV AH, 09h
    LEA DX, RGL10
    INT 21h
    
    MOV AH, 09h
    LEA DX, RGL11
    INT 21h
    
    MOV AH, 09h
    LEA DX, RGL12
    INT 21h    
 
    ;Muestra en consola mensaje: "Presiona (P) cualquier tecla para (P) continuar (C)" = PPC
    MOV AH, 09h
    LEA DX, PPC
    INT 21h
   
    MOV AH, 01h
    INT 21h
   
    JMP MANUAL2
    
 
MANUAL2:        ;Manual - parte 2
    
    MOV AH, 09h
    LEA DX, ESP_MAN
    INT 21h
    
    MOV AH, 09h
    LEA DX, RGL13
    INT 21h
    
    MOV AH, 09h
    LEA DX, RGL14
    INT 21h
   
    MOV AH, 09h
    LEA DX, RGL15
    INT 21h
   
    MOV AH, 09h
    LEA DX, RGL16
    INT 21h
   
    MOV AH, 09h
    LEA DX, RGL17
    INT 21h
    
    MOV AH, 09h
    LEA DX, RGL18
    INT 21h 
    
    MOV AH, 09h
    LEA DX, RGL19
    INT 21h 
    
    MOV AH, 09h
    LEA DX, RGL20
    INT 21h 
    
    MOV AH, 09h
    LEA DX, RGL21
    INT 21h
    
    MOV AH, 09h
    LEA DX, ESP_MAN
    INT 21h 
    
    MOV AH, 09h
    LEA DX, RGL22
    INT 21h
   
    JMP MENU2
  
   
MENU2:      ;Bloque correspondiente al segundo menu, mostrado despues del manual
   
    ;Indica al programa en que menu se encuentra el jugador
    MOV NUM_MENU, '2'
    
    ;Muestra en consola pregunta a jugador
    MOV AH, 09h
    LEA DX, QQHA    ;?Que quieres hacer ahora?
    INT 21h
    
    ;Muestra en consola segundo menu de opciones  
    MOV AH, 09h
    LEA DX, JUGAR
    INT 21h
   
    MOV AH, 09h
    LEA DX, REP_REGLAS
    INT 21h

    MOV AH, 09h
    LEA DX, SALIR
    INT 21h
    
    MOV AH, 09h
    LEA DX, MSJ_OP
    INT 21h  
 
    ;Pide opcion a jugador
    MOV AH, 01h
    INT 21h
                            
    ;Valida numero de opcion introducido por jugador    
    CMP AL, '1'    
    JL OP_INC
    JE INICIO
   
    CMP AL, '2'    
    JE MANUAL
   
    CMP AL, '3'    
    JE SALIR_JUEGO
    JG OP_INC 


INICIO:     ;Prepara el tablero para el jugador 

    MOV SI, 0
    MOV CX, 25      ;CAMBIAR A 36
      
    RESET:      ;Llenar tablero del jugador (TABLERO_JUGADOR)
        MOV TABLERO_JUGADOR[SI], 250    ; Caracter ASCII = punto de altura media
        INC SI     
        LOOP RESET      ;Bucle para llenar las filas con caracter ASCII 250
                        
    ;Coloca consola en modo video para limpiar mensajes previos e iniciar el juego
    MOV AH, 00h
    MOV AL, 03h
    INT 10h
   
    MOV SI, 0     ;Encera registro SI para recorrer arreglo LETRAS[SI] 
     
    JMP NAVIOS
          
          
NAVIOS:     ;Calcula los navios del enemigo (computadora/PC) con la hora de la computadora
    
    ;Interrupcion 21h/2Ch guarda el tiempo en los registros CX y DX
    MOV DX, 00h      ;prepara registro DX para almacenar DH=segundos y DL=1/100 segs
    MOV AH, 2Ch
    INT 21h
                        
    ;Operaciones para obtener la posicion
    ;NOTA: CAMBIAR OPERACION PARA SOLO TENER 36 POSICIONES
    ;POSIBLE OPERACION: SEGUNDOS*3/5 -> (segundos se guardan en DH)
    MOV DH, 0
    MOV AX, DX
    MOV DL, 4
    DIV DL
    
    ;Se ubica la posicion obtenida en el tablero real
    MOV AH, 0
    MOV BX, AX    
    MOV TABLERO_REAL[BX], '1'
   
    INC SI          ;Se incrementa el indice para ir a la siguiente fila
    CMP SI, 5       ;CAMBIAR A 6
    JL NAVIOS


ACTUALIZAR:      ;Actualizacion de TABLERO_JUGADOR
     
    ;Limpia la consola
    MOV AH, 00h
    MOV AL, 03h
    INT 10h 
    
    ;Muestra los nombres de las columnas de la matriz
    MOV AH, 09h 
    LEA DX, COLS1    
    INT 21h 
    
    MOV AH, 09h 
    LEA DX, COLS2    
    INT 21h 
    
    MOV AH, 09h 
    LEA DX, COLS3    
    INT 21h 
    
    MOV AH,  09h
    LEA DX,  SDL
    INT 21h
    
    MOV DI, 0
    MOV SI, 0
    
    MOV BL, '1'     ;Numero de fila 
                                                
    MOSTRAR:  
        ;Muestra en consola el digito del numero de fila
        MOV AH, 02h
        MOV DL, BL
        INT 21h 
        
        ;Prepara registro CX para realizar el bucle 5 veces (5 filas)                             
        MOV CX, 5       ;CAMBIAR A 6
           
    MOSTRAR2: 
        MOV AH, 02h
        MOV DL, TABLERO_JUGADOR[SI]
        INT 21h
        INC SI
        LOOP MOSTRAR2     ;Muestra la fila[SI] (indice) como se encuentra actualmente en TABLERO_JUGADOR
                                                                      
        MOV AH, 09h
        LEA DX, SDL
        INT 21h
        
        INC BL          ;Aumenta en 1 el numero de fila (numFila++) para muestra la siguiente
        INC DI      
        CMP DI, 5       ;Repite el proceso 5 veces (matriz 5x5)     ;CAMBIAR A 6  (MATRIZ 6x6)
        JL MOSTRAR
       
        CMP [NUM_MISILES], '0'
        JE FINAL_PARTIDA        ;Si la variable NUM_MISILES == 0 entonces ya no hay mas misiles disponibles y el juego acaba
       
        JMP JUEGO               ;Si la variable NUM_MISILES > 0 aun hay misiles disponibles para jugar


JUEGO:      ;Bloque para pedirle al jugador los datos de su jugada
    
    ;Muestra en consola la guia del juego   
    MOV AH, 09h
    LEA DX, AYUDA
    INT 21h                                  
    
    ;Muestra en consola mensaje de intentos restantes
    MOV AH, 09h
    LEA DX, MSJ_NUM_MISILES
    INT 21h
    
    ;Muestra en consola numero de misiles disponibles
    MOV AH, 02h
    MOV DL, [NUM_MISILES]  ;Numero de misiles disponibles
    INT 21h


POSICION_X:         ;EJE "X"
    
    ;Muestra en consola mensaje: "COLUMNA [A-F]: "   
    MOV AH, 09h
    LEA DX, X
    INT 21h
    
    ;Pide letra de columna a jugador
    MOV AX, 00h
    MOV AH, 01h
    INT 21h
    
    MOV SI, 0       ;Reinicia registro SI para usarlo como indice y recorrer arreglo LETRAS
    MOV CX, 5       ;CAMBIAR A 12 ( 12 posibles letras = [A, B, C, D, E, f, a, b, c, e, d, f] )
    
    
    CMP AL, "`"     ;Caracter ASCII 96 ('a' = ASCII 97)
    JL MAYUSCULA    ;Si caracter ingresado es menor a 96 ya no puede ser minuscula
    JG MINUSCULA    ;Si caracter ingresado es mayor a 96 ya no puede ser mayuscula
 
 
MAYUSCULA:      ;Valida si el caracter ingresado esta entre 'A' y 'E' (Cambiar el rango hasta caracter 'F')
   
    CMP AL, 'A'
    JL LANZAMIENTO_ILEGAL
   
    CMP AL, 'E'     ;CAMBIAR A 'F' 
    JG LANZAMIENTO_ILEGAL
    
    JMP VERIFICAR_NUMERO
    
    
MINUSCULA:      ;Valida si el caracter ingresado esta entre 'a' y 'e' (Cambiar el rango hasta caracter 'f')

    CMP AL, 'a'
    JL LANZAMIENTO_ILEGAL
   
    CMP AL, 'e'     ;CAMBIAR A 'f'
    JG LANZAMIENTO_ILEGAL      

    JMP VERIFICAR_NUMERO
  
    
VERIFICAR_NUMERO:       ;Verificar numero ASCII del caracter en arreglo LETRAS  

    CMP AL, LETRAS[SI]
    JE X1
    INC SI
    LOOP VERIFICAR_NUMERO 
       
    
X1:         ;EJE "Y"
    
    MOV AX, 00h
    MOV AX, SI
    MOV [PosX], AL     
    
    ;Muestra en consola mensaje: "FILA [1-6]: "
    MOV AH, 09h
    LEA DX, Y
    INT 21h
   
    ;Pide numero de fila a jugador
    MOV AX, 00h
    MOV AH, 01h
    INT 21h
   
    ;Valida que el numero ingresado sea mayor a 1
    CMP AL, '1'
    JL LANZAMIENTO_ILEGAL
   
    ;Valida que el numero ingresado sea menor a 5
    CMP AL, '5'     ;CAMBIAR A 6
    JG LANZAMIENTO_ILEGAL    
    
    ;Se resta 30 hexadecimal para obtener el numero ingresado por el jugador en codigo ASCII
    SUB AL, 30h
    ;Se registra la posicion ingresada por el jugador en PosY
    MOV [PosY], AL
    ;Calcula la posicion real en la matriz (se resta una unidad ya que los indices comienzan desde 0)
    DEC [PosY]
    
    ;Multiplica la posicion real por 5 para recorrer todos los espacios necesarios y llegar a la posicion deseada de la fila
    MOV AL, 5       ;CAMBIAR A 6
    MUL [PosY]
    MOV [PosY], AL
    
    ;A la multiplicacion previa se le suma la posicion de la columna para obtener la posicion real en la matriz
    MOV AX, 0
    MOV AL, [PosY]
    ADD AL, [PosX]
    MOV BX, AX      ;Copia el valor real de la matriz (AX) en BX para verificar lanzamientos ilegales 
    
    ;Verifica que la combinacion de columna+fila no haya sido ingresada previamente
    MOV SI, 0
    MOV CX, 7   ;7 posibles lanzamientos de misil antes de que acabe el juego       ;CAMBIAR A 19
    
    
CMP_LANZAMIENTO:     ;Verifica que la posicion ingresada por el jugador no haya sido ingresada previamente
     
    ;Compara el valor copiado desde AX con los lanzamientos guardados
    CMP BL, LANZAMIENTOS_REALIZADOS[SI]
    JE LANZAMIENTO_ILEGAL
    INC SI
    LOOP CMP_LANZAMIENTO     ;Realiza un bucle recorriendo todos los lanzamientos registrados para verificar que el jugador este realizando un lanzamiento legal
    
    ;Variable AUX contiene el indice actual del arreglo LANZAMIENTOS_REALIZADOS   
    MOV SI, [AUX]
    ;Si el lanzamiento es legal, se lo registra en LANZAMIENTOS_REALIZADOS
    MOV LANZAMIENTOS_REALIZADOS[SI], BL
    
    INC [AUX]       ;Se debe incrementar el indice en uno para no sobreescribir los otros lanzamientos registrados                
    DEC [NUM_MISILES]  ;Como se registro un nuevo lanzamiento, se resta un misil disponible
    
    ;RESETEAR SALTO DE LINEA (POR ALGUNA RAZON, ESTE CAMBIA DE VALOR DURANTE LAS OPERACIONES INC Y DEC DE AUX Y NUM_MISILES)
    MOV SDL[0], 10
   
    ;Verifica si el jugador ha acertado el disparo
    CMP TABLERO_REAL[BX], '1'
    JE ACIERTO
   
    ;Verifica si el jugador ha errado el disparo
    CMP TABLERO_REAL[BX], '0'
    JE FALLO
       
 
LANZAMIENTO_ILEGAL:     ;Verifica si el lanzamiento del jugador es legal                                   

    MOV AH, 09h
    LEA DX, SDL
    INT 21h
 
    ;Muestra mensaje de posicion invalida parte 1  
    MOV AH, 09h
    LEA DX, POS_INV1
    INT 21h
    
    ;Muestra mensaje de posicion invalida parte 2  
    MOV AH, 09h
    LEA DX, POS_INV2
    INT 21h
    
    ;Presiona cualquier tecla para continuar
    MOV AH, 01h
    INT 21h
    
    ;Limpia la consola
    MOV AH, 00h
    MOV AL, 03h
    INT 10h
   
    MOV CX, 7
    JMP ACTUALIZAR
          
          
ACIERTO:        ;Bloque para verificar si el jugador logro impactar un navio
   
    MOV TABLERO_JUGADOR[BX], 'X'    ;Reemplaza caracter 250 de la matriz por X en la posicion indicada por el jugador
   
    INC [NAV_IMP]            ;Aumenta el numero de navios impactados
    CMP [NAV_IMP], '5'       ;Compara con condicion de victoria
    JE VICTORIA
   
    JMP ACTUALIZAR      ;Regresa al bloque donde se actualiza el tablero del jugador
     
 
FALLO:
   
    MOV TABLERO_JUGADOR[BX], '0'    ;Reemplaza caracter 250 de la matriz por 0 en la posicion indicada por el jugador
    JMP ACTUALIZAR      ;Regresa al bloque donde se actualiza el tablero del jugador
 
 
FINAL_PARTIDA:
 
    MOV AH, 09h
    LEA DX, IMP1
    INT 21h
   
    MOV AH, 09h
    LEA DX, NAV_IMP  ;Muestra el numero de navios impactados
    INT 21h
   
    MOV AH, 09h
    LEA DX, IMP2
    INT 21h
   
    JMP RESETEAR_JUEGO   
    
   
RESETEAR_JUEGO: 

    ;Indica al programa en que menu se encuentra el jugador
    MOV NUM_MENU, '3'
    
    ;Reinicia variables auxiliares
    MOV [NUM_MISILES], '8'
    MOV [NAV_IMP], '0'
    MOV [AUX], 0
    MOV SI, 0
    MOV CX, 7       ;CAMBIAR A 19
    
    MOV LANZAMIENTOS_REALIZADOS[SI], 50
    INC SI
    LOOP RESETEAR_JUEGO
    
    JMP MENU3   
    

MENU3:      ;Bloque correspondiente al segundo menu, mostrado despues del finalizar una partida

    ;Muestra en consola tercer menu (?Quieres intentar de nuevo?)
    MOV AH, 09h
    LEA DX, QJDN
    INT 21h
    
    MOV AH, 09h
    LEA DX, OPC_SI
    INT 21h
   
    MOV AH, 09h
    LEA DX, OPC_NO
    INT 21h
    
    MOV AH, 09h
    LEA DX, MSJ_OP
    INT 21h
    
    ;Pide opcion a jugador
    MOV AH, 01h
    INT 21h
    
    ;Valida numero de opcion introducido por jugador    
    CMP AL, '1'
    JL OP_INC
    JE INICIO
   
    CMP AL, '2' 
    JE BIENVENIDA
    JG OP_INC
      
       
VICTORIA:
    
    ;Limpia la consola
    MOV AH, 00h
    MOV AL, 03h
    INT 10h

    ;Muestra en consola cartel de felicitaciones
    MOV AH, 09h
    LEA DX, FEL1
    INT 21H
   
    MOV AH, 09h
    LEA DX, FEL2
    INT 21H
   
    MOV AH, 09h
    LEA DX, FEL3
    INT 21H
   
    MOV AH, 09h
    LEA DX, FEL4
    INT 21H
   
    MOV AH, 09h
    LEA DX, FEL5
    INT 21H
    
    MOV AH, 09h
    LEA DX, FEL6
    INT 21H
   
    MOV AH, 09h
    LEA DX, FEL7
    INT 21H

    ;Muestra en consola mensaje de felicitaciones a jugador ganador
    MOV AH, 09h
    LEA DX, GANADOR1
    INT 21H
   
    MOV AH, 09h
    LEA DX, GANADOR2
    INT 21H
   
    MOV AH, 09h
    LEA DX, GANADOR3
    INT 21H
   
    JMP MENU3       ;Saltar al menu para intentar de nuevo o no
         
         
SALIR_JUEGO:    ;Bloque para salir del juego
    
    ;Limpiar consola
    MOV AH, 00h
    MOV AL, 03h     
    INT 10h
    
    ;Muestra en consola dibujo ASCII de un navio
    MOV AH, 09h 
    LEA DX, DBJ1
    INT 21h
    MOV AH, 09h 
    LEA DX, ESP_DBJ
    INT 21h
    MOV AH, 09h 
    LEA DX, ESP_DBJ
    INT 21h 
    MOV AH, 09h 
    LEA DX, DBJ2
    INT 21h
    MOV AH, 09h 
    LEA DX, DBJ3
    INT 21h
    MOV AH, 09h 
    LEA DX, DBJ4
    INT 21h
    MOV AH, 09h 
    LEA DX, DBJ5
    INT 21h
    MOV AH, 09h 
    LEA DX, DBJ6
    INT 21h
    MOV AH, 09h 
    LEA DX, DBJ7
    INT 21h
    MOV AH, 09h 
    LEA DX, DBJ8
    INT 21h
    MOV AH, 09h 
    LEA DX, DBJ9
    INT 21h
    MOV AH, 09h 
    LEA DX, DBJ10
    INT 21h
    MOV AH, 09h 
    LEA DX, MAR1
    INT 21h
    MOV AH, 09h 
    LEA DX, MAR2
    INT 21h
    MOV AH, 09h 
    LEA DX, MAR3
    INT 21h
    MOV AH, 09h 
    LEA DX, ESP_DBJ
    INT 21h
    MOV AH, 09h 
    LEA DX, DBJ11
    INT 21h      
    
    ;Muestra en consola mensaje de finalizacion de juego
    MOV AH, 09h
    LEA DX, MSJ_FIN1
    INT 21h
    MOV AH, 09h
    LEA DX, MSJ_FIN2
    INT 21h
    MOV AH, 09h
    LEA DX, MSJ_FIN3
    INT 21h
    
    ;Interrupcion de salida
    MOV AH, 4Ch
    INT 21h 


;______________________________________
;|************************************|                         
;|***|  DECLARACION DE VARIABLES  |***|
;|************************************|                         
;--------------------------------------

;SALTO DE LINEA 
SDL DB 10, 13, "$"

;ARREGLO PARA COMPARAR LAS OPCIONES VALIDAS
LETRAS DB 'A', 'B', 'C', 'D', 'E'       ;, 'F', 'a', 'b', 'c', 'd', 'e', 'f'    ;AGREGAR DESPUES

;ARREGLO PARA ALMACENAR LA POSICION DE DISPAROS REALIZADOS
LANZAMIENTOS_REALIZADOS DB 7 DUP(50)    ;CAMBIAR A 19 DUP(50)                   ;19 POSIBLES DISPAROS ANTES DE FINALIZAR EL JUEGO

;VARIABLE AUXILIAR
AUX DW 0
    
;UBICACION MENU
NUM_MENU DW "1$"

      
;CARTEL DE BIENVENIDA
BV1 DB 13, 2 DUP(10), 8 DUP(32), 63 DUP(176), 10, "$" 
BV2 DB 13, 8 DUP(32), 2 DUP(176), "  ___  ___  ___  _  _ __   __ ___  _  _  ___  ___    ___   ", 2 DUP(176), 10, "$"       
BV3 DB 13, 8 DUP(32), 2 DUP(176), " | _ )|_ _|| __|| \| |\ \ / /| __|| \| ||_ _||   \  / _ \  ", 2 DUP(176), 10, "$"      
BV4 DB 13, 8 DUP(32), 2 DUP(176), " | _ \ | | | _| | .` | \ V / | _| | .` | | | | |) || (_) | ", 2 DUP(176), 10, "$"   
BV5 DB 13, 8 DUP(32), 2 DUP(176), " |___/|___||___||_|\_|  \_/  |___||_|\_||___||___/  \___/  ", 2 DUP(176), 10, "$"   
BV6 DB 13, 8 DUP(32), 2 DUP(176), "                                                           ", 2 DUP(176), 10, "$"
BV7 DB 13, 8 DUP(32), 63 DUP(176), 2 DUP(10), "$" 
;NOMBRE DEL JUEGO
LINEA1       DB 13, 201, 78 DUP(205), 187, "$"
NOMBRE_JUEGO DB 13, 186, 5 DUP(196), 5 DUP(176), 5 DUP(177), 5 DUP(178), 5 DUP(219), 204, 4 DUP(205), "  BATALLA  NAVAL  ", 4 DUP(205), 185, 5 DUP(219), 5 DUP(178), 5 DUP(177), 5 DUP(176), 5 DUP(196), 186, "$"  
LINEA2       DB 13, 200, 78 DUP(205), 188, 10, "$"

   
;MENSAJE PARA PEDIR OPCION
IUO DB 13, 10, "Ingresa una opci", 162,"n:", 2 DUP(10), 13, "$"

;MENU PRINCIPAL
JUGAR  DB 13, 9, "1. Jugar", 10, "$"
REGLAS DB 13, 9, "2. Reglas del juego", 10, "$"
SALIR  DB 13, 9, "3. Salir del juego", 10, "$"
;SEGUNDO MENU (DESPUES DE MOSTRAR LAS REGLAS DEL JUEGO)
REP_REGLAS DB 13, 9, "2. Repetir las reglas", 10, "$" 

;MENSAJE PARA PEDIR OPCION
MSJ_OP DB 13, 10, 9, 16, " $"

;MENSAJE DE OPCION INCORRECTA
MSJ_ERR1 DB 2 DUP(10), 13, 9, 173, "La opci", 162, "n que ingresaste es incorrecta!", 10, 13, "$"
MSJ_ERR2 DB 9, "Intenta de nuevo. (Presiona cualquier tecla para continuar.)  $"


;REGLAS DEL JUEGO
RGL1  DB 13, 2 DUP(10), 25 DUP(32), 201, 28 DUP(205), 187, 10, "$"
RGL2  DB 13, 201, 24 DUP(205), 185, "  INSTRUCCIONES DEL JUEGO:  ", 204, 24 DUP(205), 187, "$"
RGL3  DB 13, 186, 24 DUP(32), 200, 28 DUP(205), 188, 24 DUP(32), 186, "$"
RGL4  DB 186, "  Batalla naval es un juego de mesa para dos jugadores, en el cual ambos      ", 186, "$"
RGL5  DB 186, "  tienen que intentar adivinar en qu", 130, " celdas est", 160, "n los nav", 161, "os del ememigo.    ", 186, "$"
RGL6  DB 186, "  El objetivo es derribar los nav", 161, "os del enemigo y gana quien logre derribar  ", 186, "$"
RGL7  DB 186, "  primero todos los nav", 161, "os de su adversario. El juego original se juega en    ", 186, "$"
RGL8  DB 186, "  dos rejillas. Una que representa la disposici", 162, "n de tus nav", 161, "os y el otro     ", 186, "$"
RGL9  DB 186, "  que representa los nav", 161, "os del enemigo. Las rejillas son t", 161, "picamente         ", 186, "$"
RGL10 DB 186, "  cuadradas, y se identifican horizontalmente por n", 163, "meros y verticalmente     ", 186, "$"
RGL11 DB 186, "  por letras. En cada rejilla respectiva, cada jugador coloca sus nav", 161, "os y    ", 186, "$"
RGL12 DB 186, "  registra los disparos de su oponente.                                       ", 186, "$"
PPC   DB 186, "  (Presiona cualquier tecla para continuar)                                   ", 186, "$"
RGL13 DB 186, "  Antes de que comience el juego, cada jugador debe colocar sus nav", 161, "os en     ", 186, "$"
RGL14 DB 186, "  los tableros, alineados en celdas adyacentes seguidas, horizontal o         ", 186, "$"
RGL15 DB 186, "  verticalmente. El n", 163, "mero de nav", 161, "os permitido es igual para ambos jugadores  ", 186, "$"
RGL16 DB 186, "  y estos no pueden superponerse. Una vez colocados los nav", 161, "os, el juego      ", 186, "$"
RGL17 DB 186, "  contin", 163, "a en una serie de turnos. En cada turno, un jugador indica una       ", 186, "$"
RGL18 DB 186, "  posici", 162, "n (ejemplo: B6 ", 162, " F2) en la rejilla de su oponente. Si hay un nav", 161, "o   ", 186, "$"
RGL19 DB 186, "  en esa celda, se coloca una marca roja. Si no, se coloca una marca blanca.  ", 186, "$"
RGL20 DB 186, "  Los tipos de nav", 161, "os son: PORTAAVIONES (5 celdas), CRUCERO (4 celdas) y      ", 186, "$"
RGL21 DB 186, "  SUBMARINO (3 celdas).                                                       ", 186, "$"
RGL22 DB 200, 78 DUP(205), 188, 10, "$"
ESP_MAN DB 13, 186, 78 DUP(32), 186, "$"

;?Que quieres hacer ahora?   
QQHA DB 10, 13, 168, "Qu", 130, " quieres hacer ahora?", 2 DUP(10), 13, "$"
 

;DIBUJO DE UN NAVIO
DBJ1  DB 13, 2 DUP(10), 1 DUP(32), 78 DUP(178), 10, "$"                           
DBJ2  DB 13, 1 DUP(32), 2 DUP(178), "                                      # #   \                             ", 2 DUP(178), 10, "$"       
DBJ3  DB 13, 1 DUP(32), 2 DUP(178), "                                      # #  (_)                            ", 2 DUP(178), 10, "$"       
DBJ4  DB 13, 1 DUP(32), 2 DUP(178), "                                  ", 201, 3 DUP(205), "#", 205, "#", 2 DUP(205), 188, " ", 200, 205, 187, "                          ", 2 DUP(178), 10, "$"      
DBJ5  DB 13, 1 DUP(32), 2 DUP(178), "                              ", 201, 205, 203, 205, 206, 12 DUP(205), 206, 205, 203, 205, 187, "                      ", 2 DUP(178), 10, "$"   
DBJ6  DB 13, 1 DUP(32), 2 DUP(178), "                       ", 201, 205, 203, 4 DUP(205), 185, " ", 186, " ", 186, "            ", 186, " ", 186, " ", 204, 4 DUP(205), 203, 205, 187, "               ", 2 DUP(178), 10, "$"   
DBJ7  DB 13, 1 DUP(32), 2 DUP(178), "                  ", 201, 4 DUP(205), 185, " ", 186, 201, 3 DUP(205), 202, 205, 202, 205, 202, 12 DUP(205), 202, 205, 202, 205, 188, 2 DUP(205), 187, " ", 186, " ", 186, 3 DUP(205), 187, "           ", 2 DUP(178), 10, "$"
DBJ8  DB 13, 1 DUP(32), 2 DUP(178), "    <<", 12 DUP(205), 202, 4 DUP(205), 202, 205, 202, 188, "  ", 247, "  ", 247, "  ", 247, "  ", 247, "  ", 247, "  ", 247, "  ", 247, "  ", 247, "   ", 200, 205, 202, 205, 202, 3 DUP(205), 202, 6 DUP(205), "//   ", 2 DUP(178), 10, "$"
DBJ9  DB 13, 1 DUP(32), 2 DUP(178), "     \\                                                             //    ", 2 DUP(178), 10, "$"
DBJ10 DB 13, 1 DUP(32), 2 DUP(178), "      \\_______________________________________________", 240, "_", 240, "_________//     ", 2 DUP(178), 10, "$"
MAR1 DB 13, 1 DUP(32), 2 DUP(178), 3 DUP(32), 69 DUP(126), 2 DUP(32), 2 DUP(178), 10, "$"       
MAR2 DB 13, 1 DUP(32), 2 DUP(178), 32, 72 DUP(126), 32, 2 DUP(178), 10, "$"       
MAR3 DB 13, 1 DUP(32), 2 DUP(178), 4 DUP(32), 67 DUP(126), 3 DUP(32), 2 DUP(178), 10, "$"       
DBJ11 DB 13, 1 DUP(32), 78 DUP(178), 2 DUP(10), "$"
ESP_DBJ DB 13, 1 DUP(32), 2 DUP(178), 74 DUP(32), 2 DUP(178), 10, "$"       
;MENSAJE DE DESPEDIDA
MSJ_FIN1 DB 13, 20 DUP(32), 218, 38 DUP(196), 191, 10, "$"    
MSJ_FIN2 DB 13, 32, 5 DUP(60), 14 DUP(196), 180, " Gracias por jugar, hasta la pr", 162, "xima! ", 195, 14 DUP(196), 5 DUP(62), 32, "$"    
MSJ_FIN3 DB 13, 20 DUP(32), 192, 38 DUP(196), 217, "$"      


;CABECERA DE LA MATRIZ
COLS1 DB 218, 3 DUP(196), 194, 3 DUP(196), 194, 3 DUP(196), 194, 3 DUP(196), 194, 3 DUP(196), 194, 3 DUP(196), 194, 3 DUP(196), 191, 10, 13, "$"
COLS2 DB 179, "   ", 179, " A ", 179, " B ", 179, " C ", 179, " D ", 179, " E ", 179, " F ", 179, 10, 13, "$"       ;"\ A B C D E F $"
COLS3 DB 195, 3 DUP(196), 197, 3 DUP(196), 197, 3 DUP(196), 197, 3 DUP(196), 197, 3 DUP(196), 197, 3 DUP(196), 197, 3 DUP(196), 180, 10, 13, "$"
;TABLERO REAL DEL JUEGO
TABLERO_REAL DB 25 DUP('0')
;TABLERO PARA VISUALIZACION DEL JUGADOR
TABLERO_JUGADOR DB 25 DUP(250)


;MENSAJE DE AYUDA PARA EL JUGADOR
AYUDA DB 10, 13, 9, "Acertaste = X  ", 3 DUP(219), "  0 = Fallaste", 10, "$"
;MENSAJE DE MISILES (INTENTOS) RESTANTES
MSJ_NUM_MISILES DB 13, 9, "Misiles (intentos) restantes: $"
;CONTADOR DE NUMERO DE MISILES (INTENTOS) DEL JUGADOR
NUM_MISILES DB "8$"
;CONTADOR PARA NAVIOS QUE JUGADOR LOGRO IMPACTAR
NAV_IMP DB "0$"

;CAMBIAR A UN SOLO DATO DE ENTRADA PARA LUEGO DESCOMPONER LA POSICION
;POSICION 'X' INGRESADA POR JUGADOR
X DB 10, 13, 9, "COLUMNA [A-E]: $"
;POSICION 'Y' INGRESADA POR JUGADOR
Y DB 10, 13, 9, "FILA [1-5]: $"

;POSICION 'X' REAL EN EL TABLERO
PosX DB 0  
;POSICION 'Y' REAL EN EL TABLERO
PosY DB 0

;MENSAJE DE POSICION INCORRECTA
POS_INV1 DB 10, 13, 9, 173, "Posici", 162, "n inv", 160, "lida! (presiona cualquier tecla", 10, "$"
POS_INV2 DB 13, 9, "para continuar)  $"

 
;RESUMEN DE PARTIDA
IMP1 DB 2 DUP(10), 13, "Lograste impactar $"
IMP2 DB " nav", 161, "o(s) ...", 3 DUP(10), "$"

;TERCER MENU (DESPUES DE FINALIZAR PARTIDA)
QJDN DB 13, 168, "Quieres jugar de nuevo?", 2 DUP(10), "$"
OPC_SI DB 13, 9, "1. Si!", 10, "$"
OPC_NO DB 13, 9, "2. No!", 10, "$"


;FELICITACIONES!
FEL1 DB 2 DUP(10), 13, 7 DUP(32), 201, 64 DUP(205), 187, 10, "$"
FEL2 DB 13, 7 DUP(32),  186, "  ___ ___ _    ___ ___ ___ _____ _   ___ ___ ___  _  _ ___ ___  ", 186, 10, "$"    
FEL3 DB 13, 7 DUP(32),  186, " | __| __| |  |_ _/ __|_ _|_   _/_\ / __|_ _/ _ \| \| | __/ __| ", 186, 10, "$"
FEL4 DB 13, 7 DUP(205), 185, " | _|| _|| |__ | | (__ | |  | |/ _ \ (__ | | (_) | .` | _|\__ \ ", 204, 7 DUP(205), "$"
FEL5 DB 13, 7 DUP(32),  186, " |_| |___|____|___\___|___| |_/_/ \_\___|___\___/|_|\_|___|___/ ", 186, 10, "$"
FEL6 DB 13, 7 DUP(32),  186, "                                                                ", 186, 10, "$"    
FEL7 DB 13, 7 DUP(32), 200, 64 DUP(205), 188, 10, "$"      
;MENSAJE SI JUGADOR GANA PARTIDA
GANADOR1  DB 13, 10, 6 DUP(32), 218, 66 DUP(196), 191, 10, "$"
GANADOR2  DB 13, ">>>", 3 DUP(196), 180, "  Lograste hundir la flota naval enemiga. Has ganado el juego!!!  ", 195, 3 DUP(196), "<<<$"
GANADOR3  DB 13, 6 DUP(32), 192, 66 DUP(196), 217, 3 DUP(10), "$"

    
;NV1 = Navio del jugador    
NV1 DB "Indica las coordenadas de tu nav", 161, "o (por ejemplo: C3): $"

;NE1 = Navio del enemigo
NE1 DB "Indica las coordenadas donde crees que est", 160, "n las naves del oponente (por ejemplo: A4): $"

CA1 DB " $"


 
 
 
 
                                                               
