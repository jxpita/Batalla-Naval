TITLE BATALLA_NAVAL

ORG 100h 


JMP UBICAR_FLOTA
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
    JE PREPARAR_TABLERO_JUGADOR
   
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
    
    CALL PRINT_SDL
    CALL PRINT_SDL
    
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
    LEA DX, MAN1
    INT 21h
   
    MOV AH, 09h
    LEA DX, MAN2
    INT 21h
   
    MOV AH, 09h
    LEA DX, MAN3
    INT 21h
    
    MOV AH, 09h
    LEA DX, ESP_MAN
    INT 21h
    
    MOV AH, 09h
    LEA DX, ESP_MAN
    INT 21h
    
    MOV AH, 09h
    LEA DX, MAN4
    INT 21h

    MOV AH, 09h
    LEA DX, MAN5
    INT 21h
    
    MOV AH, 09h
    LEA DX, MAN6
    INT 21h
    
    MOV AH, 09h
    LEA DX, MAN7
    INT 21h
    
    MOV AH, 09h
    LEA DX, MAN8
    INT 21h
    
    MOV AH, 09h
    LEA DX, MAN9
    INT 21h
    
    MOV AH, 09h
    LEA DX, MAN10
    INT 21h
    
    MOV AH, 09h
    LEA DX, MAN11
    INT 21h
    
    MOV AH, 09h
    LEA DX, MAN12
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
    LEA DX, MAN13
    INT 21h
    
    MOV AH, 09h
    LEA DX, MAN14
    INT 21h
   
    MOV AH, 09h
    LEA DX, MAN15
    INT 21h
   
    MOV AH, 09h
    LEA DX, MAN16
    INT 21h
   
    MOV AH, 09h
    LEA DX, MAN17
    INT 21h
    
    MOV AH, 09h
    LEA DX, MAN18
    INT 21h 
    
    MOV AH, 09h
    LEA DX, MAN19
    INT 21h 
    
    MOV AH, 09h
    LEA DX, MAN20
    INT 21h 
    
    MOV AH, 09h
    LEA DX, MAN21
    INT 21h
    
    MOV AH, 09h
    LEA DX, ESP_MAN
    INT 21h 
    
    MOV AH, 09h
    LEA DX, MAN22
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
    JE PREPARAR_TABLERO_JUGADOR
   
    CMP AL, '2'    
    JE MANUAL
   
    CMP AL, '3'    
    JE SALIR_JUEGO
    JG OP_INC
    

PREPARAR_TABLERO_JUGADOR:     ;Prepara el tablero para el jugador 

    MOV SI, 0
    MOV CX, 36      ;CAMBIAR A 25
      
    REINICIAR_TABLERO_JUGADOR:      ;Inicializa el tablero del jugador (TABLERO_JUGADOR)
        MOV TABLERO_JUGADOR[SI], 250    ; Caracter ASCII = punto de altura media
        INC SI     
        LOOP REINICIAR_TABLERO_JUGADOR      ;Bucle para llenar las filas con caracter ASCII 250
                        
;    ;Limpia la consola (preparar para mostrar tablero de juego
;    MOV AH, 00h
;    MOV AL, 03h
;    INT 10h
   
    MOV SI, 0     ;Encera registro SI para recorrer arreglo LETRAS[SI] 
     
    JMP UBICAR_FLOTA
          
          
UBICAR_FLOTA:  ;Ubica la flota enemiga de manera aleatoria
    
    MOV DI, 2       ;Contador para ubicar 2 navios  (Ref: linea 384 => CMP DI, 0)
    
    UBICAR_NAVIOS:  ;NOTA: Los navios ubicados pueden ser   [[ 2 PORTAVIONES | 2 CRUCEROS | 1 PORTAVIONES + 1 CRUCERO ]]
        CMP DI, 0               ;Si contador (registro DI) == 0  ---> Ya se ubicaron los 2 navios
        JE  UBICAR_SUBMARINO    ;Entonces saltar directamente a MOSTRAR_TABLERO_JUGADOR
        
        
        MOV DX, 00h
        MOV AH, 2Ch
        INT 21h

        MOV AL, DL
        MOV AH, 0
        MOV DX, 2
        DIV DL
        CMP AH, 1
        JE  UBICAR_CRUCERO
        JNE UBICAR_PORTAVIONES
                
        UBICAR_PORTAVIONES:   ;Ubica un PORTAVIONES de manera horizontal o vertical
            CALL GEN_POS_ALEA       ;Genera posicion aleatoria para ubicar un PORTAVIONES (el resultado se almacena en el registro BX)
            
            CALL DIRECCION_NAVIO    ;Determina la direccion del PORTAVIONES (horizonal o vertical)
        
            MOV SI, BX          ;Copia la posicion inicial del PORTAVIONES en el registro SI
            
            MOV CX, TAM_PORT
            
            CMP HFLAG, 1
            JE  UBICAR_PORT_H
            JNE UBICAR_PORT_V
            
            UBICAR_PORT_H:      ;Ubica un PORTAVIONES horizontalmente
                MOV AX, SI
                MOV BX, 6
                DIV BL 
                
                MOV BX, SI
                
                ;Posiciones criticas
                CMP AH, 1       ;CASO 1: Un PORTAVIONES solo cabe horizontalmente hacia la DERECHA en las columnas 0 (A) o 1 (B)
                JLE COLISION_DER_PORT   ;Verifica colisiones antes de ubicarlo
                
                CMP AH, 4       ;CASO 2: Un PORTAVIONES solo cabe horizontalmente hacia la IZQUIERDA en las columnas 4 (E) o 5 (F)
                JGE COLISION_IZQ_PORT   ;Verifica colisiones antes de ubicarlo
                
                JMP UBICAR_PORTAVIONES    ;Si el PORTAVIONES no cabe horizontalmente hacia los lados salta al inicio del bloque para generar nueva posicion aleatoria
                
                COLISION_DER_PORT:              ;Antes de ubicarlo, verifica si el PORTAVIONES va a colisionar con otro navio hacia la DERECHA
                    CMP TABLERO_REAL[BX], '0'
                    JNE UBICAR_PORTAVIONES      ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                    INC BX                      ;Mueve el indice hacia la DERECHA
                    LOOP COLISION_DER_PORT      ;Verifica para todas las celdas que ocupa el PORTAVIONES
                    
                    MOV CX, TAM_PORT            ;El PORTAVIONES ocupa 5 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle) 
                        
                    SUMAR_PORT_POS_X:           ;Si no colisiona, se ubica hacia la DERECHA, en la posicion aleatoria generada 
                        MOV TABLERO_REAL[SI], 'P'
                        INC SI
                        LOOP SUMAR_PORT_POS_X
                        
                        DEC DI      ;Reduce el contador para ubicar navios (MAXIMO: 2) 
                        JMP UBICAR_NAVIOS
                                
                COLISION_IZQ_PORT:              ;Antes de ubicarlo, verifica si el PORTAVIONES va a colisionar con otro navio hacia la IZQUIERDA
                    CMP TABLERO_REAL[BX], '0'
                    JNE UBICAR_PORTAVIONES      ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                    DEC BX                      ;Mueve el indice hacia la IZQUIERDA
                    LOOP COLISION_IZQ_PORT      ;Verifica para todas las celdas que ocupa el PORTAVIONES
                    
                    MOV CX, TAM_PORT            ;El PORTAVIONES ocupa 5 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle) 
                        
                    RESTAR_PORT_POS_X:          ;Si no colisiona, se ubica hacia la IZQUIERDA, en la posicion aleatoria generada
                        MOV TABLERO_REAL[SI], 'P'
                        DEC SI
                        LOOP RESTAR_PORT_POS_X
                        
                        DEC DI      ;Reduce el contador para ubicar navios (MAXIMO: 2)
                        JMP UBICAR_NAVIOS
                                
            UBICAR_PORT_V:      ;Ubica un PORTAVIONES verticalmente
                MOV AX, SI
                MOV BX, 6
                DIV BL
                
                MOV BX, SI 
                
                ;Posiciones criticas
                CMP AL, 1       ;CASO 3: Un PORTAVIONES solo cabe verticalmente hacia la ABAJO en las filas 0 (1) o 1 (2)
                JLE COLISION_INF_PORT   ;Verifica colisiones antes de ubicarlo
                
                CMP AL, 4       ;CASO 4: Un PORTAVIONES solo cabe verticalmente hacia la ARRIBA en las filas 4 (5) o 5 (6)
                JGE COLISION_SUP_PORT   ;Verifica colisiones antes de ubicarlo
                
                JMP UBICAR_PORTAVIONES  ;Si el PORTAVIONES no cabe verticalmente hacia arriba/abajo salta al inicio del bloque para generar nueva posicion aleatoria
                
                COLISION_INF_PORT:              ;Antes de ubicarlo, verifica si el PORTAVIONES va a colisionar con otro navio hacia ABAJO
                    CMP TABLERO_REAL[BX], '0'
                    JNE UBICAR_PORTAVIONES      ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                    ADD BX, 6                   ;Mueve el indice hacia la ABAJO
                    LOOP COLISION_INF_PORT      ;Verifica para todas las celdas que ocupa el PORTAVIONES
                    
                    MOV CX, TAM_PORT 
                        
                    SUMAR_PORT_POS_Y:           ;Si no colisiona, se ubica hacia la ABAJO, en la posicion aleatoria generada
                        MOV TABLERO_REAL[SI], 'P'
                        ADD SI, 6
                        LOOP SUMAR_PORT_POS_Y
                        
                        DEC DI      ;Reduce el contador para ubicar navios (MAXIMO: 2)
                        JMP UBICAR_NAVIOS
                
                COLISION_SUP_PORT:              ;Antes de ubicarlo, verifica si el PORTAVIONES va a colisionar con otro navio hacia ARRIBA
                    CMP TABLERO_REAL[BX], '0'
                    JNE UBICAR_PORTAVIONES      ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                    SUB BX, 6                   ;Mueve el indice hacia la ARRIBA
                    LOOP COLISION_SUP_PORT      ;Verifica para todas las celdas que ocupa el PORTAVIONES 
                    
                    MOV CX, TAM_PORT 
                        
                    RESTAR_PORT_POS_Y:          ;Si no colisiona, se ubica hacia la ARRIBA, en la posicion aleatoria generada
                        MOV TABLERO_REAL[SI], 'P'
                        SUB SI, 6
                        LOOP RESTAR_PORT_POS_Y
                        
                        DEC DI      ;Reduce el contador para ubicar navios (MAXIMO: 2) 
                        JMP UBICAR_NAVIOS
                        
        UBICAR_CRUCERO:     ;Ubica un CRUCERO de manera horizontal o vertical
            CALL GEN_POS_ALEA       ;Genera posicion aleatoria para ubicar un CRUCERO (el resultado se almacena en el registro BX)
            
            CALL DIRECCION_NAVIO    ;Determina la direccion del CRUCERO (horizonal o vertical)
        
            MOV SI, BX          ;Copia la posicion inicial del CRUCERO en el registro SI
            
            MOV CX, TAM_CRUC
            
            CMP HFLAG, 1
            JE  UBICAR_CRUC_H
            JNE UBICAR_CRUC_V
            
            UBICAR_CRUC_H:      ;Ubica un CRUCERO horizontalmente
                MOV AX, SI
                MOV BX, 6
                DIV BL 
                
                MOV BX, SI
                
                ;Posiciones criticas
                CMP AH, 2       ;CASO 1: Un CRUCERO solo cabe horizontalmente hacia la DERECHA en las columnas 0 (A), 1 (B) o 2 (C)
                JLE COLISION_DER_CRUC
                
                CMP AH, 3       ;CASO 2: Un CRUCERO solo cabe horizontalmente hacia la IZQUIERDA en las columnas 3 (D), 4 (E) o 5 (F)
                JGE COLISION_IZQ_CRUC
                
                JMP UBICAR_CRUCERO      ;Si el CRUCERO no cabe horizontalmente hacia los lados salta al inicio del bloque para generar nueva posicion aleatoria
                
                COLISION_DER_CRUC:              ;Antes de ubicarlo, verifica si el CRUCERO va a colisionar con otro navio hacia la DERECHA
                    CMP TABLERO_REAL[BX], '0'
                    JNE UBICAR_CRUCERO          ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                    INC BX                      ;Mueve el indice hacia la DERECHA
                    LOOP COLISION_DER_CRUC      ;Verifica para todas las celdas que ocupa el CRUCERO
                    
                    MOV CX, TAM_CRUC            ;El CRUCERO ocupa 4 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle) 
                        
                    SUMAR_CRUC_POS_X:           ;Si no colisiona, se ubica hacia la DERECHA, en la posicion aleatoria generada 
                        MOV TABLERO_REAL[SI], 'C'
                        INC SI
                        LOOP SUMAR_CRUC_POS_X
                        
                        DEC DI      ;Reduce el contador para ubicar navios (MAXIMO: 2) 
                        JMP UBICAR_NAVIOS
                
                COLISION_IZQ_CRUC:              ;Antes de ubicarlo, verifica si el CRUCERO va a colisionar con otro navio hacia la IZQUIERDA
                    CMP TABLERO_REAL[BX], '0'
                    JNE UBICAR_CRUCERO           ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                    DEC BX                      ;Mueve el indice hacia la IZQUIERDA
                    LOOP COLISION_IZQ_CRUC      ;Verifica para todas las celdas que ocupa el CRUCERO
                    
                    MOV CX, TAM_CRUC            ;El CRUCERO ocupa 4 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle) 
                        
                    RESTAR_CRUC_POS_X:          ;Si no colisiona, se ubica hacia la IZQUIERDA, en la posicion aleatoria generada
                        MOV TABLERO_REAL[SI], 'C'
                        DEC SI
                        LOOP RESTAR_CRUC_POS_X
                        
                        DEC DI      ;Reduce el contador para ubicar navios (MAXIMO: 2)
                        JMP UBICAR_NAVIOS
                                
            UBICAR_CRUC_V:      ;Ubica un CRUCERO verticalmente
                MOV AX, SI
                MOV BX, 6
                DIV BL
                
                MOV BX, SI 
                
                ;Posiciones criticas
                CMP AL, 2       ;CASO 3: Un CRUCERO solo cabe verticalmente hacia la ABAJO en las filas 0 (A), 1 (B) o 2 (C)
                JLE COLISION_INF_CRUC   ;Verifica colisiones antes de ubicarlo
                
                CMP AL, 3       ;CASO 4: Un CRUCERO solo cabe verticalmente hacia la ARRIBA en las filas 3 (D), 4 (E) o 5 (F)
                JGE COLISION_SUP_CRUC   ;Verifica colisiones antes de ubicarlo
                
                JMP UBICAR_CRUCERO    ;Si el CRUCERO no cabe verticalmente hacia arriba/abajo salta al inicio del bloque para generar nueva posicion aleatoria
                
                COLISION_INF_CRUC:              ;Antes de ubicarlo, verifica si el CRUCERO va a colisionar con otro navio hacia ABAJO
                    CMP TABLERO_REAL[BX], '0'
                    JNE UBICAR_CRUCERO           ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                    ADD BX, 6                   ;Mueve el indice hacia la ABAJO
                    LOOP COLISION_INF_CRUC      ;Verifica para todas las celdas que ocupa el CRUCERO
                    
                    MOV CX, TAM_CRUC 
                        
                    SUMAR_CRUC_POS_Y:           ;Si no colisiona, se ubica hacia la ABAJO, en la posicion aleatoria generada
                        MOV TABLERO_REAL[SI], 'C'
                        ADD SI, 6
                        LOOP SUMAR_CRUC_POS_Y
                        
                        DEC DI      ;Reduce el contador para ubicar navios (MAXIMO: 2)
                        JMP UBICAR_NAVIOS
                
                COLISION_SUP_CRUC:              ;Antes de ubicarlo, verifica si el CRUCERO va a colisionar con otro navio hacia ARRIBA
                    CMP TABLERO_REAL[BX], '0'
                    JNE UBICAR_CRUCERO           ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                    SUB BX, 6                   ;Mueve el indice hacia la ARRIBA
                    LOOP COLISION_SUP_CRUC      ;Verifica para todas las celdas que ocupa el CRUCERO 
                    
                    MOV CX, TAM_CRUC 
                        
                    RESTAR_CRUC_POS_Y:          ;Si no colisiona, se ubica hacia la ARRIBA, en la posicion aleatoria generada
                        MOV TABLERO_REAL[SI], 'C'
                        SUB SI, 6
                        LOOP RESTAR_CRUC_POS_Y
                        
                        DEC DI      ;Reduce el contador para ubicar navios (MAXIMO: 2) 
                        JMP UBICAR_NAVIOS
        
    UBICAR_SUBMARINO:
        CALL GEN_POS_ALEA       ;Genera posicion aleatoria para ubicar SUBMARINO (el resultado se almacena en el registro BX)    
    
        CALL DIRECCION_NAVIO    ;Determina la direccion del SUBMARINO (horizonal o vertical)

        MOV SI, BX          ;Copia la posicion inicial del SUBMARINO en el registro SI
        
        MOV CX, TAM_SUBM    ;El SUBMARINO ocupa 3 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle)
        
        CMP HFLAG, 1
        JE  UBICAR_SUBM_H
        JNE UBICAR_SUBM_V
        
        UBICAR_SUBM_H:
            MOV AX, BX
            MOV BX, 6
            DIV BL
            
            MOV BX, SI
            
            ;Posiciones criticas
            CMP AH, 3       ;CASO 1: Un SUBMARINO solo cabe horizontalmente hacia la DERECHA en las columnas 0 (A), 1 (B), 2 (C) o 3 (D)
            JLE COLISION_DER_SUBM
            
            CMP AH, 2       ;CASO 2: Un SUBMARINO solo cabe horizontalmente hacia la IZQUIERDA en las columnas 2 (C), 3 (D), 4 (E) o 5 (F)
            JGE COLISION_IZQ_SUBM
            
            JMP UBICAR_SUBMARINO      ;Si el SUBMARINO no cabe horizontalmente hacia los lados salta al inicio del bloque para generar nueva posicion aleatoria
            
            COLISION_DER_SUBM:              ;Antes de ubicarlo, verifica si el SUBMARINO va a colisionar con otro navio hacia la DERECHA
                CMP TABLERO_REAL[BX], '0'
                JNE UBICAR_SUBMARINO           ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                INC BX                      ;Mueve el indice hacia la DERECHA
                LOOP COLISION_DER_SUBM      ;Verifica para todas las celdas que ocupa el SUBMARINO
                
                MOV CX, TAM_SUBM
            
                SUMAR_SUBM_POS_X:
                    MOV TABLERO_REAL[SI], 'S'
                    INC SI
                    LOOP SUMAR_SUBM_POS_X
                    JMP MOSTRAR_TABLERO_JUGADOR
                    
            COLISION_IZQ_SUBM:              ;Antes de ubicarlo, verifica si el SUBMARINO va a colisionar con otro navio hacia la DERECHA
                CMP TABLERO_REAL[BX], '0'
                JNE UBICAR_SUBMARINO           ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                DEC BX                      ;Mueve el indice hacia la DERECHA
                LOOP COLISION_IZQ_SUBM      ;Verifica para todas las celdas que ocupa el SUBMARINO
                
                MOV CX, TAM_SUBM
                
                RESTAR_SUBM_POS_X:
                    MOV TABLERO_REAL[SI], 'S'
                    DEC SI
                    LOOP RESTAR_SUBM_POS_X
                    JMP MOSTRAR_TABLERO_JUGADOR
                            
        UBICAR_SUBM_V:
            MOV AX, BX
            MOV BX, 6
            DIV BL
            
            MOV BX, SI
            
            ;Posiciones criticas
            CMP AL, 3       ;CASO 3: Un SUBMARINO solo cabe verticalmente hacia la ABAJO en las filas 0 (A), 1 (B) o 2 (C)
            JLE COLISION_INF_SUBM   ;Verifica colisiones antes de ubicarlo
            
            CMP AL, 2       ;CASO 4: Un SUBMARINO solo cabe verticalmente hacia la ARRIBA en las filas 3 (D), 4 (E) o 5 (F)
            JGE COLISION_SUP_SUBM   ;Verifica colisiones antes de ubicarlo
            
            JMP UBICAR_SUBMARINO      ;Si el SUBMARINO no cabe verticalmente hacia arriba/abajo salta al inicio del bloque para generar nueva posicion aleatoria
            
            COLISION_INF_SUBM:              ;Antes de ubicarlo, verifica si el SUBMARINO va a colisionar con otro navio hacia ABAJO
                CMP TABLERO_REAL[BX], '0'
                JNE UBICAR_SUBMARINO           ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                ADD BX, 6                   ;Mueve el indice hacia la ABAJO
                LOOP COLISION_INF_SUBM      ;Verifica para todas las celdas que ocupa el SUBMARINO
                
                MOV CX, TAM_SUBM
                
                SUMAR_SUBM_POS_Y:
                    MOV TABLERO_REAL[SI], 'S'
                    ADD SI, 6
                    LOOP SUMAR_SUBM_POS_Y
                    JMP  MOSTRAR_TABLERO_JUGADOR 
                    
            COLISION_SUP_SUBM:              ;Antes de ubicarlo, verifica si el SUBMARINO va a colisionar con otro navio hacia ARRIBA
                CMP TABLERO_REAL[BX], '0'
                JNE UBICAR_SUBMARINO           ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                SUB BX, 6                   ;Mueve el indice hacia la ARRIBA
                LOOP COLISION_SUP_SUBM      ;Verifica para todas las celdas que ocupa el SUBMARINO 
                
                MOV CX, TAM_SUBM
                
                RESTAR_SUBM_POS_Y:
                    MOV TABLERO_REAL[SI], 'S'
                    SUB SI, 6
                    LOOP RESTAR_SUBM_POS_Y
                    JMP  MOSTRAR_TABLERO_JUGADOR
                    
                    
MOSTRAR_TABLERO_JUGADOR:      ;Actualizacion de TABLERO_JUGADOR
     
    ;Limpia la consola
    MOV AH, 00h
    MOV AL, 03h
    INT 10h 
    
;    ;Muestra las letras de las columnas de la matriz
;    MOV AH, 09h 
;    LEA DX, L_SUPERIOR_MATRIZ    
;    INT 21h 
    
    MOV AH, 09h 
    LEA DX, COLS    
    INT 21h 
    
;    MOV AH, 09h 
;    LEA DX, L_INTERMEDIA_MATRIZ    
;    INT 21h 
    
    CALL PRINT_SDL
    
    MOV DI, 0
    MOV SI, 0
    
    MOV BL, '1'     ;Numero de fila 
                                                
    NUM_FILA:  
        ;Muestra en consola el digito del numero de fila
        ;MOV AH, 02h
;        MOV DL, 179
;        INT 21h
;        MOV AH, 02h
;        MOV DL, 32
;        INT 21h 
        MOV AH, 02h
        MOV DL, BL
        INT 21h
        ;MOV AH, 02h
;        MOV DL, 32
;        INT 21h
;        MOV AH, 02h
;        MOV DL, 179
;        INT 21h 
        
        ;Prepara registro CX para ejecutar CONTENIDO_FILA 6 veces (6 filas)                             
        MOV CX, 6       ;CAMBIAR A 5
           
    CONTENIDO_FILA: 
;        MOV AH, 02h
;        MOV DL, 32
;        INT 21h
        MOV AH, 02h
        MOV DL, TABLERO_REAL[SI]        ;AQUI USAR TABLERO_JUGADOR
        INT 21h
        ;MOV AH, 02h
;        MOV DL, 32
;        INT 21h
;        MOV AH, 02h
;        MOV DL, 179
;        INT 21h
        INC SI
        LOOP CONTENIDO_FILA     ;Muestra la fila[SI] (indice) como se encuentra actualmente en TABLERO_JUGADOR
                                                                      
        ;CALL PRINT_SDL
        
;        CMP DI, 4
;        JLE LINEA_INTERMEDIA
;        CMP DI, 4
;        JG  LINEA_INFERIOR
;        
;        LINEA_INTERMEDIA:
            ;MOV AH, 09h 
            ;LEA DX, L_INTERMEDIA_MATRIZ    
            ;INT 21h
        
       ; LINEA_INFERIOR:    
;            MOV AH, 09h
;            LEA DX, L_INFERIOR_MATRIZ
;            INT 21h 
    
        CALL PRINT_SDL
        
        INC BL          ;Aumenta en 1 el numero de fila (numFila++) para muestra la siguiente
        INC DI      
        CMP DI, 5       ;Repite el proceso 6 veces (matriz 6x6)     ;CAMBIAR A 5  (MATRIZ 5x5)
        JLE NUM_FILA
       
        CMP NUM_MISILES, 0
        JE  FINAL_PARTIDA       ;Si la variable NUM_MISILES == 0 entonces ya no hay mas misiles (intentos) disponibles y el juego acaba
       
        JMP INFO_PARTIDA        ;Si la variable NUM_MISILES > 0 aun hay misiles (intentos) disponibles para jugar


INFO_PARTIDA:       ;Bloque para pedir al jugador los datos de su jugada
    
    ;Muestra en consola la guia del juego   
    MOV AH, 09h
    LEA DX, AYUDA
    INT 21h                                  
    
    ;Muestra en consola mensaje de intentos restantes
    MOV AH, 09h
    LEA DX, MSJ_NUM_MISILES
    INT 21h
    
    MOV AX, NUM_MISILES
    MOV CX, 0
    
    DESCOMPONER_NUM_MISILES:    ;Descompone los digitos de la variable NUM_MISILES
        MOV BX, 10
        DIV BL          ;Divide numero de misiles para 10
        MOV DX, AX
        MOV AH, 0       
        MOV AL, DH      ;Guarda el residuo (segundo digito) en AL
        PUSH AX         ;Coloca en la pila residuo (segundo digito)
        MOV AX, 0
        MOV AL, DL      ;Guarda el cociente (primer digito) en AL
        INC CX
        CMP DL, 0       ;Verifica si el cociente es cero
        JNZ DESCOMPONER_NUM_MISILES     ;Si el cociente no es cero aun hay digitos para mostrar y salta al inicio del bloque para repetir el proceso
        JZ CONVERTIR_NUM_MISILES        ;Si el cociente es cero ya no hay mas digitos para mostrar
        
    CONVERTIR_NUM_MISILES:
        SUB CX, 1
        POP AX
        MOV AH, 02h
        MOV DX, AX
        ADD DX, 30h     ;Se suma 30 hexadecimal al numero para convertiro en caracter ASCII
        INT 21h
        CMP CX, 0
        JNZ CONVERTIR_NUM_MISILES
    

POSICION_X:         ;EJE "X"

    MOV AH, 09h
    LEA DX, MSJ_COORDS_ATAQUE
    INT 21h
    
    MOV AH, 09h
    LEA DX, MSJ_OP
    INT 21h
    
    ;Pide letra de columna a jugador
    MOV AX, 00h     ;Reinicia registro
    MOV AH, 01h     
    INT 21h         ;Interrupcion para pedir un caracter (resultado se almacena en registro AL)
    
    MOV SI, 0       ;Reinicia registro SI para usarlo como indice y recorrer arreglo LETRAS
    MOV CX, 12      ;CAMBIAR A 5 (ORIGINAL)            
    
    CMP AL, "`"     ;Caracter ASCII 96 (uno antes del 'a' = ASCII 97)
    JL MAYUSCULA    ;Si caracter ingresado es menor a 96 ya no puede ser minuscula
    JG MINUSCULA    ;Si caracter ingresado es mayor a 96 ya no puede ser mayuscula
 
 
MAYUSCULA:      ;Valida si el caracter ingresado esta entre 'A' y 'F' (Cambiar el rango hasta caracter 'E')
   
    CMP AL, 'A'
    JL DISPARO_ILEGAL
   
    CMP AL, 'F'     ;CAMBIAR A 'E' 
    JG DISPARO_ILEGAL
    
    JMP VERIFICAR_NUMERO
    
    
MINUSCULA:      ;Valida si el caracter ingresado esta entre 'a' y 'e' (Cambiar el rango hasta caracter 'f')

    CMP AL, 'a'
    JL DISPARO_ILEGAL
   
    CMP AL, 'f'     ;CAMBIAR A 'e'
    JG DISPARO_ILEGAL      

    JMP VERIFICAR_NUMERO


VERIFICAR_NUMERO:       ;Verificar numero ASCII del caracter en arreglo LETRAS  

    CMP AL, LETRAS[SI]  
    JE X1
    INC SI
    LOOP VERIFICAR_NUMERO
    
   
CORREGIR_EJE_X:

    SUB SI, 6                                                             
                                                             

X1:         ;EJE "Y" 

    CMP SI, 6
    JGE CORREGIR_EJE_X
    
    MOV AX, 00h     ;Reinicia registro AX
    MOV AX, SI      ;Guarda la posicion ingresada por el usuario en AX
    MOV [PosX], AL  ;Guarda la posicion en el eje X
    
;    ;Muestra en consola mensaje: "FILA [1-6]: "
;    MOV AH, 09h
;    LEA DX, Y
;    INT 21h
   
    ;Pide numero de fila a jugador
    MOV AX, 00h     ;Reinicia registro AX
    MOV AH, 01h
    INT 21h
   
    ;Valida que el numero ingresado sea mayor a 1
    CMP AL, '1'
    JL DISPARO_ILEGAL
   
    ;Valida que el numero ingresado sea menor a 6
    CMP AL, '6'     ;CAMBIAR A 5
    JG DISPARO_ILEGAL    
    
    ;Se resta 30 hexadecimal para convertir el caracter ingresado de ASCII a numero hexadecimal 
    SUB AL, 30h
    ;Se registra la posicion ingresada por el jugador en PosY
    MOV [PosY], AL
    ;Calcula la posicion real en la matriz (se resta una unidad ya que los indices comienzan desde 0)
    DEC [PosY]
    
    ;Multiplica la posicion real por 6 para recorrer todos los espacios necesarios y llegar a la posicion deseada de la fila
    MOV AL, 6       ;CAMBIAR A 5
    MUL [PosY]
    MOV [PosY], AL
    
    ;A la multiplicacion previa se le suma la posicion de la columna para obtener la posicion real en la matriz
    MOV AX, 0
    MOV AL, [PosY]
    ADD AL, [PosX]
    MOV BX, AX      ;Copia el valor real de la matriz (AX) en BX para verificar disparos ilegales 
    
    ;Verifica que la combinacion de columna+fila no haya sido ingresada previamente
    MOV SI, 0
    MOV CX, 19      ;19 posibles disparos de misil antes de que acabe el juego       ;CAMBIAR A 7    (ORIGINAL)
    
    
CMP_DISPARO:    ;Verifica que la posicion ingresada por el jugador no haya sido ingresada previamente
     
    ;Compara el valor copiado desde AX con los disparos guardados
    CMP BL, DISPAROS_REALIZADOS[SI]
    JE DISPARO_ILEGAL
    INC SI
    LOOP CMP_DISPARO     ;Realiza un bucle recorriendo todos los disparos registrados para verificar que el jugador este realizando un lanzamiento legal
    
    ;Variable AUX contiene el indice actual del arreglo DISPAROS_REALIZADOS   
    MOV SI, [AUX]
    ;Si el lanzamiento es legal, se lo registra en DISPAROS_REALIZADOS
    MOV DISPAROS_REALIZADOS[SI], BL
    
    INC [AUX]       ;Se debe incrementar el indice en uno para no sobreescribir los otros disparos registrados                
    DEC [NUM_MISILES]  ;Como se registro un nuevo lanzamiento, se resta un misil disponible
    
    ;RESETEAR SALTO DE LINEA (POR ALGUNA RAZON, ESTE CAMBIA DE VALOR DURANTE LAS OPERACIONES INC Y DEC DE AUX Y NUM_MISILES)
    MOV SDL[0], 10
   
    ;Verifica si el jugador ha acertado el disparo
    CMP TABLERO_REAL[BX], '0'
    JE FALLO
    JNE ACIERTO
       
 
DISPARO_ILEGAL:     ;Verifica si el lanzamiento del jugador es legal                                   

    CALL PRINT_SDL
 
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
   
    ;MOV CX, 7      (POSIBLEMENTE NO SIRVA YA QUE EN BLOQUE MOSTRAR_TABLERO_JUGADOR CX = 6
    JMP MOSTRAR_TABLERO_JUGADOR
          
          
ACIERTO:        ;Bloque para verificar si el jugador logro impactar un navio
   
    MOV AH, 09h
    LEA DX, MSJ_CON_IMP
    INT 21h
    
    MOV TABLERO_JUGADOR[BX], '1'    ;Reemplaza caracter 250 de la matriz por X en la posicion indicada por el jugador
   
    INC [NAV_IMP]           ;Aumenta el numero de navios impactados
    CMP [NAV_IMP], '9'      ;Compara con condicion de victoria       ;CONDICION REAL DE VICTORIA = 3 NAVIOS HUNDIDOS     ;CAMBIAR A '5' (ORIGINAL)
    JE VICTORIA
   
    MOV AH, 09h
    LEA DX, CONT_IMP
    INT 21h
    
    MOV AH, 01h
    INT 21h
    
    JMP MOSTRAR_TABLERO_JUGADOR      ;Regresa al bloque donde se actualiza el tablero del jugador
     
 
FALLO:
   
    MOV AH, 09h
    LEA DX, MSJ_SIN_IMP
    INT 21h
    
    MOV TABLERO_JUGADOR[BX], '0'    ;Reemplaza caracter 250 de la matriz por 0 en la posicion indicada por el jugador
    
    MOV AH, 09h
    LEA DX, CONT_IMP
    INT 21h
    
    MOV AH, 01h
    INT 21h
    
    JMP MOSTRAR_TABLERO_JUGADOR      ;Regresa al bloque donde se actualiza el tablero del jugador
 
 
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
   
    JMP MENU3   
    
   
MENU3:      ;Bloque correspondiente al segundo menu, mostrado despues del finalizar una partida

    ;Indica al programa en que menu se encuentra el jugador
    MOV NUM_MENU, '3'
    
    ;Reinicia variables auxiliares
    MOV NUM_MISILES, 20
    MOV [NAV_IMP], '0'
    MOV [AUX], 0                                                  
    
    
    MOV SI, 0
    MOV CX, 35
    
    RESET_TABLERO_REAL:
        MOV TABLERO_REAL[SI], '0'
        INC SI
        LOOP RESET_TABLERO_REAL
    
    MOV SI, 0
    MOV CX, 19       ;CAMBIAR A 7
    
    JMP RESET_JUEGO   


RESET_JUEGO: 
    
    MOV DISPAROS_REALIZADOS[SI], 0
    INC SI
    LOOP RESET_JUEGO
    
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
    JE PREPARAR_TABLERO_JUGADOR
   
    CMP AL, '2' 
    JE SALIR_JUEGO
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
LETRAS DB 'A', 'B', 'C', 'D', 'E', 'F', 'a', 'b', 'c', 'd', 'e', 'f'    

;ARREGLO PARA ALMACENAR LA POSICION DE DISPAROS REALIZADOS
DISPAROS_REALIZADOS DB 19 DUP(50)    ;CAMBIAR A 7 DUP(50)           ;7 POSIBLES DISPAROS ANTES DE FINALIZAR EL JUEGO

;VARIABLE AUXILIAR
AUX DW 0
    
;UBICACION MENU
NUM_MENU DB "1$" 

;BANDERAS HORIZONTAL/VERTICAL
HFLAG DB 0

;LONGITUD DE LOS NAVIOS (NUMERO DE CELDAS QUE OCUPA CADA NAVIO
TAM_SUBM DW 3
TAM_CRUC DW 4
TAM_PORT DW 5

      
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
MAN1  DB 13, 2 DUP(10), 25 DUP(32), 201, 28 DUP(205), 187, 10, "$"
MAN2  DB 13, 201, 28 DUP(205), 185, "  REGLAS DEL JUEGO  ", 204, 28 DUP(205), 187, 10, "$"
MAN3  DB 13, 186, 24 DUP(32), 200, 28 DUP(205), 188, 24 DUP(32), 186, "$"
MAN4  DB 186, "  Batalla naval es un juego de mesa para dos jugadores, en el cual ambos      ", 186, "$"
MAN5  DB 186, "  tienen que intentar adivinar en qu", 130, " celdas est", 160, "n los nav", 161, "os del ememigo.    ", 186, "$"
MAN6  DB 186, "  El objetivo es derribar los nav", 161, "os del enemigo y gana quien logre derribar  ", 186, "$"
MAN7  DB 186, "  primero todos los nav", 161, "os de su adversario. El juego original se juega en    ", 186, "$"
MAN8  DB 186, "  dos rejillas. Una que representa la disposici", 162, "n de tus nav", 161, "os y el otro     ", 186, "$"
MAN9  DB 186, "  que representa los nav", 161, "os del enemigo. Las rejillas son t", 161, "picamente         ", 186, "$"
MAN10 DB 186, "  cuadradas, y se identifican horizontalmente por n", 163, "meros y verticalmente     ", 186, "$"
MAN11 DB 186, "  por letras. En cada rejilla respectiva, cada jugador coloca sus nav", 161, "os y    ", 186, "$"
MAN12 DB 186, "  registra los disparos de su oponente.                                       ", 186, "$"
PPC   DB 186, "  (Presiona cualquier tecla para continuar)                                   ", 186, "$"
MAN13 DB 186, "  Antes de que comience el juego, cada jugador debe colocar sus nav", 161, "os en     ", 186, "$"
MAN14 DB 186, "  los tableros, alineados en celdas adyacentes seguidas, horizontal o         ", 186, "$"
MAN15 DB 186, "  verticalmente. El n", 163, "mero de nav", 161, "os permitido es igual para ambos jugadores  ", 186, "$"
MAN16 DB 186, "  y estos no pueden superponerse. Una vez colocados los nav", 161, "os, el juego      ", 186, "$"
MAN17 DB 186, "  contin", 163, "a en una serie de turnos. En cada turno, un jugador indica una       ", 186, "$"
MAN18 DB 186, "  posici", 162, "n (ejemplo: B6 ", 162, " F2) en la rejilla de su oponente. Si hay un nav", 161, "o   ", 186, "$"
MAN19 DB 186, "  en esa celda, se coloca una marca roja. Si no, se coloca una marca blanca.  ", 186, "$"
MAN20 DB 186, "  Los tipos de nav", 161, "os son: PORTAAVIONES (5 celdas), CRUCERO (4 celdas) y      ", 186, "$"
MAN21 DB 186, "  SUBMARINO (3 celdas).                                                       ", 186, "$"
MAN22 DB 200, 78 DUP(205), 188, 10, "$"
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


;LETRAS DE COLUMNAS (CABECERA DE LA MATRIZ)
COLS DB 179, "   ", 179, " A ", 179, " B ", 179, " C ", 179, " D ", 179, " E ", 179, " F ", 179, 10, 13, "$"       ;"\ A B C D E F $"
L_SUPERIOR_MATRIZ   DB 218, 3 DUP(196), 194, 3 DUP(196), 194, 3 DUP(196), 194, 3 DUP(196), 194, 3 DUP(196), 194, 3 DUP(196), 194, 3 DUP(196), 191, 10, 13, "$"
L_INTERMEDIA_MATRIZ DB 195, 3 DUP(196), 197, 3 DUP(196), 197, 3 DUP(196), 197, 3 DUP(196), 197, 3 DUP(196), 197, 3 DUP(196), 197, 3 DUP(196), 180, "$"
L_INFERIOR_MATRIZ   DB 192, 3 DUP(196), 193, 3 DUP(196), 193, 3 DUP(196), 193, 3 DUP(196), 193, 3 DUP(196), 193, 3 DUP(196), 193, 3 DUP(196), 217, 10, 13, "$"

;TABLERO REAL DEL JUEGO
TABLERO_REAL DB 36 DUP('0')     ;TABLERO_REAL DB 25 DUP('0')    (ORIGINAL)
;TABLERO PARA VISUALIZACION DEL JUGADOR
TABLERO_JUGADOR DB 36 DUP(250)  ;TABLERO_JUGADOR DB 25 DUP(250) (ORIGINAL) 


;MENSAJE DE AYUDA PARA EL JUGADOR
AYUDA DB 10, 13, 9, "Acertaste = X  ", 3 DUP(219), "  0 = Fallaste", 10, "$"
;MENSAJE DE MISILES (INTENTOS) RESTANTES
MSJ_NUM_MISILES DB 13, 9, "Misiles (intentos) restantes: $"
;CONTADOR DE NUMERO DE MISILES (INTENTOS) DEL JUGADOR
NUM_MISILES DW 20       ;DESCOMPONER Y CONVERTIR NUMERO PARA MOSTRAR EN CONSOLA
;CONTADOR PARA NAVIOS QUE JUGADOR LOGRO IMPACTAR
NAV_IMP DB "0$"
                                                                     
;MENSAJE COORDENADAS DE ATAQUE
MSJ_COORDS_ATAQUE DB 2 DUP(10), 13, 9, "Ingresa la celda que quieres atacar (ejemplo: A5) $"
;POSICION 'X' INGRESADA POR JUGADOR
X DB 10, 13, 9, "COLUMNA [A-F]: $"
;POSICION 'Y' INGRESADA POR JUGADOR
Y DB 10, 13, 9, "FILA [1-6]: $"

;POSICION 'X' REAL EN EL TABLERO
PosX DB 0  
;POSICION 'Y' REAL EN EL TABLERO
PosY DB 0

;MENSAJE DE POSICION INCORRECTA
POS_INV1 DB 10, 13, 9, 173, "Posici", 162, "n inv", 160, "lida! (presiona cualquier tecla", 10, "$"
POS_INV2 DB 13, 9, "para continuar)  $"


;MENSAJES DE IMPACTO DE MISIL
MSJ_CON_IMP DB 2 DUP(10), 13, 9, "Impacto confirmado! $"
MSJ_SIN_IMP DB 2 DUP(10), 13, 9, "Sin impacto... $"
CONT_IMP DB 10, 13, 9, "(Presiona cualquier tecla para continuar) $"

 
;RESUMEN DE PARTIDA
IMP1 DB 2 DUP(10), 13, "Lograste impactar $"
IMP2 DB " nav", 161, "o(s) ...", 3 DUP(10), "$"

;TERCER MENU (DESPUES DE FINALIZAR PARTIDA)
QJDN DB 13, 168, "Quieres jugar de nuevo?", 2 DUP(10), "$"
OPC_SI DB 13, 9, "1. Si!", 10, "$"
OPC_NO DB 13, 9, "2. No!", 10, "$"


;FELICITACIONES
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


;___________________________________________
;|*****************************************|                         
;|***|  DECLARACION DE PROCEDIMIENTOS  |***|
;|*****************************************|                         
;-------------------------------------------

;IMPRIMIE UN SALTO DE LINEA EN LA CONSOLA
PRINT_SDL PROC
    
    MOV AH, 09h
    LEA DX, SDL
    INT 21h 
    
    RET
    
PRINT_SDL ENDP
            

;GENERA UNA POSICION ALEATORIA EN EL TABLERO (EL RESULTADO SE GUARDA EN EL REGISTRO BX)
GEN_POS_ALEA PROC
    
    ;Interrupcion 21h/2Ch guarda el tiempo en los registros CX y DX
    MOV DX, 00h      ;prepara registro DX para almacenar DH=segundos y DL=1/100 segs
    MOV AH, 2Ch
    INT 21h

    ;Esta porcion de codigo resulta en un numero aleatorio del 0 al 35 (rango de posiciones posibles para tablero 6x6)
    MOV DH, 0
    ADD DX, 8
    MOV AX, DX
    MOV DL, 3
    DIV DL
    
    ;Se ubica la posicion obtenida en el tablero real
    MOV AH, 0       ; Se elimina el residuo de la operacion anterior
    MOV BX, AX 
    
    RET
    
GEN_POS_ALEA ENDP


;ELIGE ALEATORIAMENTE LA POSICION DEL NAVIO (HORIZONAL O VERTICAL) [NOTA: SI HFLAG == 1 ENTONCES YA NO ES VERTICAL]
DIRECCION_NAVIO PROC

    MOV DX, 00h
    MOV AH, 2Ch
    INT 21h
    
    MOV AL, DL
    MOV AH, 0
    MOV DX, 2
    DIV DL
    CMP AH, 1
    JE  HORIZONTAL
    JNE VERTICAL
    
    HORIZONTAL:
        MOV HFLAG, 1
        JMP RETORNAR
   
    VERTICAL:
        MOV HFLAG, 0
        
    RETORNAR:
        RET

DIRECCION_NAVIO ENDP


;IMPORTANTE!!!
;EN LA MATRIZ: NUMERO_POSICION/6
;COCIENTE = INDICE_FILA
;RESIDUO  = INDICE_COLUMNA
