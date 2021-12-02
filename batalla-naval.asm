TITLE BATALLA_NAVAL

ORG 100h


BIENVENIDA:     ;Cartel de bienvenida y nombre del juego 
    ;Coloca la consola en modo video (80x25)
    MOV AH, 00h
    MOV AL, 03h     ;Modo texto
    INT 10h
    ;Muestra en consola cartel de bienvenida
    MOV AH, 09h 
    LEA DX, BV1
    INT 21h 
    LEA DX, BV2
    INT 21h
    LEA DX, BV3
    INT 21h
    LEA DX, BV4
    INT 21h
    LEA DX, BV5
    INT 21h
    LEA DX, BV6
    INT 21h
    LEA DX, BV7
    INT 21h
    ;----------------------------------------------------------------------------   
    LEA DX, LINEA1   ;Linea de separacion despues de bienvenida
    INT 21h
    ;Muestra en consola el nombre del juego (BATALLA  NAVAL)
    LEA DX, NOMBRE_JUEGO
    INT 21h
    LEA DX, LINEA2   ;Linea de separacion despues de nombre del juego
    INT 21h


MENU:       ;Menu principal
    ;Indica al programa en que menu se encuentra el jugador
    MOV NUM_MENU, '1'
    
    ;Muestra en consola menu principal de opciones (Ingresa una opcion: )  
    LEA DX, IUO
    INT 21h
    
    LEA DX, JUGAR
    INT 21h

    LEA DX, PRUEBA
    INT 21h

    LEA DX, REGLAS
    INT 21H
    
    LEA DX, SALIR
    INT 21h
    
    LEA DX, MSJ_OP
    INT 21h
    
    ;Pide opcion a jugador
    MOV AH, 01h
    INT 21h
    
    ;Verifica si se elige el modo de prueba
    MOV MDP_FLAG, AL    
    
    ;Valida numero de opcion introducido por jugador    
    CMP AL, '1'    
    JE PANTALLA_CARGA
   
    CMP AL, '2'    
    JE PANTALLA_CARGA
   
    CMP AL, '3'    
    JE MANUAL
   
    CMP AL, '4'    
    JE SALIR_JUEGO
    
    JMP OP_INC
               
 
MANUAL:         ;Manual - parte 1
    ;Coloca la consola en modo video para limpiar mensajes previos
    MOV AH, 00h
    MOV AL, 03h
    INT 10h
       
    ;Muestra en consola las reglas del juego    
    MOV AH, 09h
    LEA DX, MAN1
    INT 21h
   
    LEA DX, MAN2
    INT 21h
   
    LEA DX, MAN3
    INT 21h
    
    LEA DX, ESP_MAN
    INT 21h
    
    LEA DX, MAN4
    INT 21h

    LEA DX, MAN5
    INT 21h
    
    LEA DX, MAN6
    INT 21h
    
    LEA DX, MAN7
    INT 21h
    
    LEA DX, MAN8
    INT 21h
    
    LEA DX, MAN9
    INT 21h
    
    LEA DX, MAN10
    INT 21h
    
    LEA DX, MAN11
    INT 21h
    
    LEA DX, MAN12
    INT 21h    
 
    ;Muestra en consola mensaje: "Presiona (P) cualquier tecla para (P) continuar (C)" = MAN_PPC
    LEA DX, MAN_PPC
    INT 21h
   
    MOV AH, 01h
    INT 21h
   
 
MANUAL2:        ;Manual - parte 2
    MOV AH, 09h
    LEA DX, ESP_MAN
    INT 21h
    
    LEA DX, MAN13
    INT 21h
    
    LEA DX, MAN14
    INT 21h
   
    LEA DX, MAN15
    INT 21h
   
    LEA DX, MAN16
    INT 21h
   
    LEA DX, MAN17
    INT 21h
    
    LEA DX, MAN18
    INT 21h 
    
    LEA DX, MAN19
    INT 21h 
    
    LEA DX, MAN20
    INT 21h 
    
    LEA DX, MAN21
    INT 21h
    
    LEA DX, ESP_MAN
    INT 21h 
    
    LEA DX, MAN22
    INT 21h
   
   
MENU2:      ;Bloque correspondiente al segundo menu, mostrado despues del manual
    ;Indica al programa en que menu se encuentra el jugador
    MOV NUM_MENU, '2'
    
    ;Muestra en consola pregunta a jugador
    LEA DX, QQHA    ;?Que quieres hacer ahora?
    INT 21h
    
    ;Muestra en consola segundo menu de opciones  
    LEA DX, JUGAR
    INT 21h
   
    LEA DX, PRUEBA
    INT 21h

    LEA DX, REP_REGLAS
    INT 21h
    
    LEA DX, SALIR
    INT 21h
    
    LEA DX, MSJ_OP
    INT 21h  
 
    ;Pide opcion a jugador
    MOV AH, 01h
    INT 21h
                            
    ;Verifica si se elige el modo de prueba
    MOV MDP_FLAG, AL    
    
    ;Valida numero de opcion introducido por jugador    
    CMP AL, '1'    
    JE PANTALLA_CARGA
   
    CMP AL, '2'
    JE PANTALLA_CARGA
   
    CMP AL, '3'    
    JE MANUAL
   
    CMP AL, '4'    
    JE SALIR_JUEGO
    
    JMP OP_INC
    

OP_INC:         ;Opcion incorrecta
    MOV AH, 09h
    LEA DX, MSJ_ERR
    INT 21h
    
    MOV AL, 0
    MOV BX, 0
    MOV CX, 0
    MOV DX, 0
    LEA DX, PTPC
    INT 21h
    
    MOV AH, 01h
    INT 21h
    
    MOV AH, 00h
    MOV AL, 03h
    INT 10h
    
    CALL PRINT_SDL
    CALL PRINT_SDL
    
    CMP NUM_MENU, '1'
    JE  MENU

    CMP NUM_MENU, '2'
    JE  MENU2

    CMP NUM_MENU, '3'
    JE  MENU3
    
    CMP NUM_MENU, '4'
    JMP MENU4
    
    
PANTALLA_CARGA:
    MOV AH, 00h
    MOV AL, 03h
    INT 10h
    
    MOV AH, 09h
    LEA DX, MSJ_CARGA 
    INT 21H 
    
    LEA DX, NAVIO1 
    INT 21H
    LEA DX, NAVIO2 
    INT 21H
    LEA DX, NAVIO3 
    INT 21H
    LEA DX, NAVIO4 
    INT 21H
    LEA DX, NAVIO5 
    INT 21H  
    LEA DX, NAVIO6 
    INT 21H 
    LEA DX, NAVIO7 
    INT 21H
    
    LEA DX, NAVIO8 
    INT 21H
    LEA DX, NAVIO9 
    INT 21H
    LEA DX, NAVIO10 
    INT 21H
    LEA DX, NAVIO11 
    INT 21H        
    LEA DX, NAVIO12 
    INT 21H
    LEA DX, NAVIO13 
    INT 21H
    LEA DX, NAVIO14 
    INT 21H
    LEA DX, NAVIO15 
    INT 21H
    LEA DX, NAVIO16 
    INT 21H
          
          
UBICAR_FLOTA:  ;Ubica la flota enemiga de manera aleatoria
    UBICAR_PORTAVIONES:   ;Ubica un PORTAVIONES de manera horizontal o vertical
        CALL GEN_POS_ALEA       ;Genera posicion aleatoria para ubicar un PORTAVIONES (el resultado se almacena en el registro BX)
        
        CALL DIRECCION_NAVIO    ;Determina la direccion del PORTAVIONES (horizonal o vertical)
    
        MOV SI, BX          ;Copia la posicion inicial del PORTAVIONES en el registro SI
        
        MOV CX, TAM_PORT    ;El PORTAVIONES ocupa 5 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle)
        
        CMP HFLAG, 1
        JE  UBICAR_PORT_H
        JNE UBICAR_PORT_V
        
        UBICAR_PORT_H:      ;Ubica un PORTAVIONES horizontalmente
            MOV AX, SI
            MOV BX, 6
            DIV BL 
            
            MOV BX, SI
            
            ;Posiciones criticas
            CMP AH, 1                   ;CASO 1: Un PORTAVIONES solo cabe horizontalmente hacia la DERECHA en las columnas 0 (A) o 1 (B)
            JLE COLISION_DER_PORT       ;Verifica posibles colisiones hacia la DERECHA antes de ubicarlo
            CMP AH, 4                   ;CASO 2: Un PORTAVIONES solo cabe horizontalmente hacia la IZQUIERDA en las columnas 4 (E) o 5 (F)
            JGE COLISION_IZQ_PORT       ;Verifica posibles colisiones hacia la IZQUIERDA antes de ubicarlo
            JMP UBICAR_PORTAVIONES      ;Si el PORTAVIONES no cabe horizontalmente hacia la derecha/izquierda salta al inicio del bloque para generar nueva posicion aleatoria
            
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
                    JMP UBICAR_CRUCERO      ;PORTAVIONES ubicado = ahora colocar CRUCERO
                            
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
                    JMP UBICAR_CRUCERO      ;PORTAVIONES ubicado = ahora colocar CRUCERO
                            
        UBICAR_PORT_V:      ;Ubica un PORTAVIONES verticalmente
            MOV AX, SI
            MOV BX, 6
            DIV BL
            
            MOV BX, SI 
            
            ;Posiciones criticas
            CMP AL, 1                   ;CASO 3: Un PORTAVIONES solo cabe verticalmente hacia la parte INFERIOR en las filas 0 (1) o 1 (2)
            JLE COLISION_INF_PORT       ;Verifica posibles colisiones hacia la parte INFERIOR antes de ubicarlo
            CMP AL, 4                   ;CASO 4: Un PORTAVIONES solo cabe verticalmente hacia la parte SUPERIOR en las filas 4 (5) o 5 (6)
            JGE COLISION_SUP_PORT       ;Verifica posibles colisiones hacia la parte SUPERIOR antes de ubicarlo
            JMP UBICAR_PORTAVIONES      ;Si el PORTAVIONES no cabe verticalmente hacia arriba/abajo salta al inicio del bloque para generar nueva posicion aleatoria
            
            COLISION_INF_PORT:              ;Antes de ubicarlo, verifica si el PORTAVIONES va a colisionar con otro navio hacia ABAJO
                CMP TABLERO_REAL[BX], '0'
                JNE UBICAR_PORTAVIONES      ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                ADD BX, 6                   ;Mueve el indice hacia la parte INFERIOR
                LOOP COLISION_INF_PORT      ;Verifica para todas las celdas que ocupa el PORTAVIONES
                
                MOV CX, TAM_PORT            ;El PORTAVIONES ocupa 5 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle)
                SUMAR_PORT_POS_Y:           ;Si no colisiona, se ubica hacia la parte INFERIOR, en la posicion aleatoria generada
                    MOV TABLERO_REAL[SI], 'P'
                    ADD SI, 6
                    LOOP SUMAR_PORT_POS_Y
                    JMP UBICAR_CRUCERO      ;PORTAVIONES ubicado = ahora colocar CRUCERO
            
            COLISION_SUP_PORT:              ;Antes de ubicarlo, verifica si el PORTAVIONES va a colisionar con otro navio hacia ARRIBA
                CMP TABLERO_REAL[BX], '0'
                JNE UBICAR_PORTAVIONES      ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                SUB BX, 6                   ;Mueve el indice hacia la parte SUPERIOR
                LOOP COLISION_SUP_PORT      ;Verifica para todas las celdas que ocupa el PORTAVIONES 
                
                MOV CX, TAM_PORT            ;El PORTAVIONES ocupa 5 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle)
                RESTAR_PORT_POS_Y:          ;Si no colisiona, se ubica hacia la parte SUPERIOR, en la posicion aleatoria generada
                    MOV TABLERO_REAL[SI], 'P'
                    SUB SI, 6
                    LOOP RESTAR_PORT_POS_Y
                    JMP UBICAR_CRUCERO      ;PORTAVIONES ubicado = ahora colocar CRUCERO
                    
    UBICAR_CRUCERO:     ;Ubica un CRUCERO de manera horizontal o vertical
        CALL GEN_POS_ALEA       ;Genera posicion aleatoria para ubicar un CRUCERO (el resultado se almacena en el registro BX)
        
        CALL DIRECCION_NAVIO    ;Determina la direccion del CRUCERO (horizonal o vertical)
    
        MOV SI, BX          ;Copia la posicion inicial del CRUCERO en el registro SI
        
        MOV CX, TAM_CRUC    ;El CRUCERO ocupa 4 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle)
        
        CMP HFLAG, 1
        JE  UBICAR_CRUC_H
        JNE UBICAR_CRUC_V
        
        UBICAR_CRUC_H:      ;Ubica un CRUCERO horizontalmente
            MOV AX, SI
            MOV BX, 6
            DIV BL 
            
            MOV BX, SI
            
            ;Posiciones criticas
            CMP AH, 2               ;CASO 1: Un CRUCERO solo cabe horizontalmente hacia la DERECHA en las columnas 0 (A), 1 (B) o 2 (C)
            JLE COLISION_DER_CRUC   ;Verifica posibles colisiones hacia la DERECHA antes de ubicarlo
            CMP AH, 3               ;CASO 2: Un CRUCERO solo cabe horizontalmente hacia la IZQUIERDA en las columnas 3 (D), 4 (E) o 5 (F)
            JGE COLISION_IZQ_CRUC   ;Verifica posibles colisiones hacia la IZQUIERDA antes de ubicarlo
            JMP UBICAR_CRUCERO      ;Si el CRUCERO no cabe horizontalmente hacia la derecha/izquierda salta al inicio del bloque para generar nueva posicion aleatoria
            
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
                    JMP UBICAR_SUBMARINO    ;CRUCERO ubicado = ahora colocar SUBMARINO
            
            COLISION_IZQ_CRUC:              ;Antes de ubicarlo, verifica si el CRUCERO va a colisionar con otro navio hacia la IZQUIERDA
                CMP TABLERO_REAL[BX], '0'
                JNE UBICAR_CRUCERO          ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                DEC BX                      ;Mueve el indice hacia la IZQUIERDA
                LOOP COLISION_IZQ_CRUC      ;Verifica para todas las celdas que ocupa el CRUCERO
                
                MOV CX, TAM_CRUC            ;El CRUCERO ocupa 4 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle) 
                RESTAR_CRUC_POS_X:          ;Si no colisiona, se ubica hacia la IZQUIERDA, en la posicion aleatoria generada
                    MOV TABLERO_REAL[SI], 'C'
                    DEC SI
                    LOOP RESTAR_CRUC_POS_X
                    JMP UBICAR_SUBMARINO    ;CRUCERO ubicado = ahora colocar SUBMARINO
                            
        UBICAR_CRUC_V:      ;Ubica un CRUCERO verticalmente
            MOV AX, SI
            MOV BX, 6
            DIV BL
            
            MOV BX, SI 
            
            ;Posiciones criticas
            CMP AL, 2               ;CASO 3: Un CRUCERO solo cabe verticalmente hacia la parte INFERIOR en las filas 0 (A), 1 (B) o 2 (C)
            JLE COLISION_INF_CRUC   ;Verifica posibles colisiones hacia la parte INFERIOR antes de ubicarlo
            CMP AL, 3               ;CASO 4: Un CRUCERO solo cabe verticalmente hacia la parte SUPERIOR en las filas 3 (D), 4 (E) o 5 (F)
            JGE COLISION_SUP_CRUC   ;Verifica posibles colisiones hacia la parte SUPERIOR antes de ubicarlo
            JMP UBICAR_CRUCERO      ;Si el CRUCERO no cabe verticalmente hacia arriba/abajo salta al inicio del bloque para generar nueva posicion aleatoria
            
            COLISION_INF_CRUC:              ;Antes de ubicarlo, verifica si el CRUCERO va a colisionar con otro navio hacia ABAJO
                CMP TABLERO_REAL[BX], '0'
                JNE UBICAR_CRUCERO          ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                ADD BX, 6                   ;Mueve el indice hacia la parte INFERIOR
                LOOP COLISION_INF_CRUC      ;Verifica para todas las celdas que ocupa el CRUCERO
                
                MOV CX, TAM_CRUC            ;El CRUCERO ocupa 4 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle)
                SUMAR_CRUC_POS_Y:           ;Si no colisiona, se ubica hacia la parte INFERIOR, en la posicion aleatoria generada
                    MOV TABLERO_REAL[SI], 'C'
                    ADD SI, 6
                    LOOP SUMAR_CRUC_POS_Y
                    JMP UBICAR_SUBMARINO    ;CRUCERO ubicado = ahora colocar SUBMARINO
            
            COLISION_SUP_CRUC:              ;Antes de ubicarlo, verifica si el CRUCERO va a colisionar con otro navio hacia ARRIBA
                CMP TABLERO_REAL[BX], '0'
                JNE UBICAR_CRUCERO          ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                SUB BX, 6                   ;Mueve el indice hacia la parte SUPERIOR
                LOOP COLISION_SUP_CRUC      ;Verifica para todas las celdas que ocupa el CRUCERO 
                
                MOV CX, TAM_CRUC            ;El CRUCERO ocupa 4 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle)
                RESTAR_CRUC_POS_Y:          ;Si no colisiona, se ubica hacia la parte SUPERIOR, en la posicion aleatoria generada
                    MOV TABLERO_REAL[SI], 'C'
                    SUB SI, 6
                    LOOP RESTAR_CRUC_POS_Y
                    JMP UBICAR_SUBMARINO    ;CRUCERO ubicado = ahora colocar SUBMARINO
        
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
            CMP AH, 3               ;CASO 1: Un SUBMARINO solo cabe horizontalmente hacia la DERECHA en las columnas 0 (A), 1 (B), 2 (C) o 3 (D)
            JLE COLISION_DER_SUBM   ;Verifica posibles colisiones hacia la DERECHA antes de ubicarlo
            CMP AH, 2               ;CASO 2: Un SUBMARINO solo cabe horizontalmente hacia la IZQUIERDA en las columnas 2 (C), 3 (D), 4 (E) o 5 (F)
            JGE COLISION_IZQ_SUBM   ;Verifica posibles colisiones hacia la IZQUIERDA antes de ubicarlo
            JMP UBICAR_SUBMARINO    ;Si el SUBMARINO no cabe horizontalmente hacia la derecha/izquierda salta al inicio del bloque para generar nueva posicion aleatoria
            
            COLISION_DER_SUBM:              ;Antes de ubicarlo, verifica si el SUBMARINO va a colisionar con otro navio hacia la DERECHA
                CMP TABLERO_REAL[BX], '0'
                JNE UBICAR_SUBMARINO        ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                INC BX                      ;Mueve el indice hacia la DERECHA
                LOOP COLISION_DER_SUBM      ;Verifica para todas las celdas que ocupa el SUBMARINO
                
                MOV CX, TAM_SUBM            ;El SUBMARINO ocupa 3 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle)
                SUMAR_SUBM_POS_X:           ;Si no colisiona, se ubica hacia la DERECHA, en la posicion aleatoria generada
                    MOV TABLERO_REAL[SI], 'S'
                    INC SI
                    LOOP SUMAR_SUBM_POS_X
                    JMP MODO_JUEGO          ;SUBMARINO ubicado = ahora proceder con el modo de juego seleccionado
                    
            COLISION_IZQ_SUBM:              ;Antes de ubicarlo, verifica si el SUBMARINO va a colisionar con otro navio hacia la DERECHA
                CMP TABLERO_REAL[BX], '0'
                JNE UBICAR_SUBMARINO        ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                DEC BX                      ;Mueve el indice hacia la IZQUIERDA
                LOOP COLISION_IZQ_SUBM      ;Verifica para todas las celdas que ocupa el SUBMARINO
                
                MOV CX, TAM_SUBM            ;El SUBMARINO ocupa 3 celdas (Con LOOP el registro CX se resta en 1 hasta llegar a 0 y luego sale del bucle)
                RESTAR_SUBM_POS_X:          ;Si no colisiona, se ubica hacia la IZQUIERDA, en la posicion aleatoria generada
                    MOV TABLERO_REAL[SI], 'S'
                    DEC SI
                    LOOP RESTAR_SUBM_POS_X
                    JMP MODO_JUEGO          ;SUBMARINO ubicado = ahora proceder con el modo de juego seleccionado
                            
        UBICAR_SUBM_V:
            MOV AX, BX
            MOV BX, 6
            DIV BL
            
            MOV BX, SI
            
            ;Posiciones criticas
            CMP AL, 3               ;CASO 3: Un SUBMARINO solo cabe verticalmente hacia la parte INFERIOR en las filas 0 (A), 1 (B) o 2 (C)
            JLE COLISION_INF_SUBM   ;Verifica colisiones antes de ubicarlo
            CMP AL, 2               ;CASO 4: Un SUBMARINO solo cabe verticalmente hacia la parte SUPERIOR en las filas 3 (D), 4 (E) o 5 (F)
            JGE COLISION_SUP_SUBM   ;Verifica colisiones antes de ubicarlo
            JMP UBICAR_SUBMARINO    ;Si el SUBMARINO no cabe verticalmente hacia arriba/abajo salta al inicio del bloque para generar nueva posicion aleatoria
            
            COLISION_INF_SUBM:              ;Antes de ubicarlo, verifica si el SUBMARINO va a colisionar con otro navio hacia ABAJO
                CMP TABLERO_REAL[BX], '0'
                JNE UBICAR_SUBMARINO        ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                ADD BX, 6                   ;Mueve el indice hacia la parte INFERIOR
                LOOP COLISION_INF_SUBM      ;Verifica para todas las celdas que ocupa el SUBMARINO
                
                MOV CX, TAM_SUBM
                SUMAR_SUBM_POS_Y:
                    MOV TABLERO_REAL[SI], 'S'
                    ADD SI, 6
                    LOOP SUMAR_SUBM_POS_Y
                    JMP  MODO_JUEGO         ;SUBMARINO ubicado = ahora proceder con el modo de juego seleccionado 
                    
            COLISION_SUP_SUBM:              ;Antes de ubicarlo, verifica si el SUBMARINO va a colisionar con otro navio hacia ARRIBA
                CMP TABLERO_REAL[BX], '0'
                JNE UBICAR_SUBMARINO           ;Si colisiona saltar al inicio del bloque para pedir nueva posicion
                SUB BX, 6                   ;Mueve el indice hacia la parte SUPERIOR
                LOOP COLISION_SUP_SUBM      ;Verifica para todas las celdas que ocupa el SUBMARINO 
                
                MOV CX, TAM_SUBM
                RESTAR_SUBM_POS_Y:
                    MOV TABLERO_REAL[SI], 'S'
                    SUB SI, 6
                    LOOP RESTAR_SUBM_POS_Y
                                            ;SUBMARINO ubicado = ahora proceder con el modo de juego seleccionado

MODO_JUEGO:     ;Compara si se eligio modo de prueba, caso contrario continuar con el juego normalmente
    CMP MDP_FLAG, '2'
    JNE PREPARAR_TABLERO_JUGADOR


MOSTRAR_TABLERO_REAL:
    MOV AH, 00h
    MOV AL, 03h
    INT 10h 
    
    MOV AH, 09h 
    LEA DX, COLS    
    INT 21h
    
    MOV DI, 0
    MOV SI, 0
    
    MOV BL, '1'
    FILA:
        MOV AH, 02h
        MOV DX, 9
        INT 21h
        INT 21h
        INT 21h
        INT 21h
        
        MOV DX, 32
        INT 21h
        INT 21h
        
        MOV DL, BL
        INT 21h
        
        MOV CX, 6
           
        CONTENIDO:
            MOV DX, 32
            INT 21h
            
            MOV DL, TABLERO_REAL[SI]
            INT 21h
            
            INC SI
            LOOP CONTENIDO
            
        MOV DX, 10
        INT 21h
        MOV DX, 13      
        INT 21h
        
        INC BL          
        INC DI      
        CMP DI, 6       
        JL  FILA
    
    CMP NUM_MISILES, 0
    JE  FINAL_PARTIDA
    JMP INFO_PARTIDA
    
                    
PREPARAR_TABLERO_JUGADOR:     ;Prepara el tablero para el jugador 
    MOV SI, 0
    MOV CX, 36
      
    REINICIAR_TABLERO_JUGADOR:      ;Inicializa el tablero del jugador (TABLERO_JUGADOR)
        MOV TABLERO_JUGADOR[SI], 250    ; Caracter ASCII = punto de altura media
        INC SI     
        LOOP REINICIAR_TABLERO_JUGADOR      ;Bucle para llenar las filas con caracter ASCII 250
    
    MOV SI, 0     ;Encera registro SI para recorrer arreglo LETRAS[SI]
    
    
MOSTRAR_TABLERO_JUGADOR:      ;Actualizacion de TABLERO_JUGADOR
    ;Limpia la consola
    MOV AH, 00h
    MOV AL, 03h
    INT 10h 
       
    CMP NUM_MISILES, 0
    JE  MOSTRAR_TABLERO_REAL    ;Si NUM_MISILES == 0 entonces ya no hay mas misiles (intentos) disponibles y el juego acaba
        
    ;Imprime las letras de las columnas de la matriz
    MOV AH, 09h 
    LEA DX, COLS    
    INT 21h
    
    MOV DI, 0
    MOV SI, 0
    
    MOV BL, '1'     ;Numero de fila 
    NUM_FILA:
        MOV AH, 02h
        MOV DX, 9
        INT 21h
        INT 21h
        INT 21h
        INT 21h
        
        MOV DX, 32
        INT 21h
        INT 21h
        
        ;Imprime el digito del numero de fila
        MOV DL, BL
        INT 21h
        
        ;Prepara registro CX para ejecutar CONTENIDO_FILA 6 veces (6 filas)                             
        MOV CX, 6
           
        CONTENIDO_FILA:
            MOV DX, 32      ;Barra espaciadora
            INT 21h
            
            ;Imprime el contenido de la fila de TABLERO_JUGADOR
            MOV DL, TABLERO_JUGADOR[SI]
            INT 21h
            
            INC SI
            LOOP CONTENIDO_FILA     ;Muestra la fila[SI] (indice) como se encuentra actualmente en TABLERO_JUGADOR
                                                                          
        MOV DX, 10      ;Nueva linea (Line feed)
        INT 21h
        MOV DX, 13      ;Retorno de carro (Carriage return)
        INT 21h
        
        INC BL          ;Aumenta en 1 el numero de fila (numFila++) para mostrar la siguiente
        INC DI      
        CMP DI, 6       ;Repite el proceso 6 veces (matriz 6x6)
        JL  NUM_FILA
    
    
INFO_PARTIDA:
    ;Muestra en consola la guia del juego   
    MOV AH, 09h
    LEA DX, AYUDA
    INT 21h
    ;Muestra en consola mensaje de navios hundidos
    LEA DX, MSJ_NAV_HUNDIDOS
    INT 21h
    ;Muestra en consola el numero de navios hundidos
    LEA DX, NAV_IMP
    INT 21h
    ;Muestra en consola mensaje de intentos restantes
    LEA DX, MSJ_NUM_MISILES
    INT 21h
    ;Prepara registros para descomponer y convertir numero de misiles y mostrar en consola
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
    

PEDIR_LETRA_COLUMNA:         ;EJE "X"
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
    MOV CX, 12      ;Asigna el valor de 12 al registro CX para hacer el LOOP (BUCLE)            
    
    CMP AL, "`"     ;Caracter ASCII 96 (uno antes del 'a' = ASCII 97)
    JG MINUSCULA    ;Si caracter ingresado es mayor a 96 ya no puede ser mayuscula
                    ;Si caracter ingresado es menor a 96 ya no puede ser minuscula
    
 
MAYUSCULA:      ;Valida si el caracter ingresado esta entre 'A' y 'F'
    CMP AL, 'A'
    JL COLUMNA_ILEGAL
   
    CMP AL, 'F' 
    JG COLUMNA_ILEGAL
    
    JMP OBTENER_INDICE_COLUMNA
    
    
MINUSCULA:      ;Valida si el caracter ingresado esta entre 'a' y 'f'
    CMP AL, 'a'
    JL COLUMNA_ILEGAL
   
    CMP AL, 'f'
    JG COLUMNA_ILEGAL      


OBTENER_INDICE_COLUMNA:    ;Obtiene el indice de la columna (el resultado se guarda en el registro SI)  
    CMP AL, LETRAS[SI]  
    JE PEDIR_NUMERO_FILA
    INC SI
    LOOP OBTENER_INDICE_COLUMNA
    
   
CORREGIR_EJE_X:     ;Si la letra es minuscula se resta 6 al indice de la columna
    SUB SI, 6                                                             
                                                             

PEDIR_NUMERO_FILA:         ;EJE "Y" 
    CMP SI, 6
    JGE CORREGIR_EJE_X
    
    MOV AX, 00h     ;Reinicia registro AX
    MOV AX, SI      ;Guarda la posicion ingresada por el usuario en AX
    MOV [PosX], AL  ;Guarda la posicion en el eje X
   
    ;Pide numero de fila a jugador
    MOV AX, 00h     ;Reinicia registro AX
    MOV AH, 01h
    INT 21h
   
    ;Valida que el numero ingresado sea mayor a 1
    CMP AL, '1'
    JL FILA_ILEGAL
   
    ;Valida que el numero ingresado sea menor a 6
    CMP AL, '6'
    JG FILA_ILEGAL    
    
    ;Se resta 30 hexadecimal para convertir el caracter ingresado de ASCII a numero hexadecimal 
    SUB AL, 30h
    ;Se registra la posicion ingresada por el jugador en PosY
    MOV [PosY], AL
    ;Calcula la posicion real en la matriz (se resta una unidad ya que los indices comienzan desde 0)
    DEC [PosY]
    
    ;Multiplica la posicion real por 6 para recorrer todos los espacios necesarios y llegar a la posicion deseada de la fila
    MOV AL, 6
    MUL [PosY]
    MOV [PosY], AL
    
    ;A la multiplicacion previa se le suma la posicion de la columna para obtener la posicion real en la matriz
    MOV AX, 0
    MOV AL, [PosY]
    ADD AL, [PosX]
    MOV BX, AX      ;Copia el valor real de la matriz (AX) en BX para verificar disparos ilegales 
    
    ;Verifica que la combinacion de columna+fila no haya sido ingresada previamente
    MOV SI, 0
    MOV CX, 19      ;19 posibles disparos de misil antes de que acabe el juego
    
    
CMP_DISPARO:    ;Verifica que la posicion ingresada por el jugador no haya sido ingresada previamente
    ;Compara el valor copiado desde AX con los disparos guardados
    CMP BL, DISPAROS_REALIZADOS[SI]
    JE COORDENADAS_REPETIDAS
    INC SI
    LOOP CMP_DISPARO     ;Realiza un bucle recorriendo todos los disparos registrados para verificar que el jugador este realizando un lanzamiento legal
    
    ;Variable AUX contiene el indice actual del arreglo DISPAROS_REALIZADOS   
    MOV SI, AUX
    ;Si el lanzamiento es legal, se lo registra en DISPAROS_REALIZADOS
    MOV DISPAROS_REALIZADOS[SI], BL
    
    INC AUX             ;Se debe incrementar el indice en uno para no sobreescribir los otros disparos registrados                
    DEC NUM_MISILES     ;Como se registro un nuevo lanzamiento, se resta un misil disponible
       
    ;Verifica si el jugador ha acertado o errado el disparo
    CMP TABLERO_REAL[BX], '0'
    JE FALLO
    JNE ACIERTO
       

COLUMNA_ILEGAL:
    CALL PRINT_SDL
 
    ;Muestra mensaje de columna invalida
    MOV AH, 09h
    LEA DX, C_INV
    INT 21h
    
    ;Presiona tecla para continuar  (PTPC)
    LEA DX, PTPC
    INT 21h
    
    ;Presiona cualquier tecla para continuar
    MOV AH, 01h
    INT 21h
     
    CMP MDP_FLAG, '2'
    JE  MOSTRAR_TABLERO_REAL
    JNE MOSTRAR_TABLERO_JUGADOR 

    
FILA_ILEGAL:
    CALL PRINT_SDL
 
    ;Muestra mensaje de fila invalida
    MOV AH, 09h
    LEA DX, F_INV
    INT 21h
    
    ;Presiona tecla para continuar  (PTPC)
    LEA DX, PTPC
    INT 21h
    
    ;Presiona cualquier tecla para continuar
    MOV AH, 01h
    INT 21h
                                
    CMP MDP_FLAG, '2'
    JE  MOSTRAR_TABLERO_REAL
    JNE MOSTRAR_TABLERO_JUGADOR
    
    
COORDENADAS_REPETIDAS:
    CALL PRINT_SDL
 
    ;Muestra mensaje de coordenadas ingresadas previamente
    MOV AH, 09h
    LEA DX, P_INV
    INT 21h
    
    ;Presiona tecla para continuar  (PTPC)
    LEA DX, PTPC
    INT 21h
    
    ;Presiona cualquier tecla para continuar
    MOV AH, 01h
    INT 21h
                                
    CMP MDP_FLAG, '2'
    JE  MOSTRAR_TABLERO_REAL
    JNE MOSTRAR_TABLERO_JUGADOR
          
          
ACIERTO:        ;Jugador logra impactar un navio
    MOV AH, 09h
    LEA DX, MSJ_CON_IMP
    INT 21h
    
    MOV TABLERO_JUGADOR[BX], '1'    ;Reemplaza caracter 250 de la matriz por 1 en la posicion indicada por el jugador
   
    CMP TABLERO_REAL[BX], 'S'
    JE  INC_IMP_SUBM
    
    CMP TABLERO_REAL[BX], 'C'
    JE  INC_IMP_CRUC
    
    CMP TABLERO_REAL[BX], 'P'
    JE  INC_IMP_PORT
    
    INC_IMP_SUBM:
        INC SUBM_IMP
        MOV DX, TAM_SUBM
        CMP SUBM_IMP, DL
        JE  SUBM_HUNDIDO
        JMP CONDICION_VICTORIA
    
    INC_IMP_CRUC:
        INC CRUC_IMP
        MOV DX, TAM_CRUC
        CMP CRUC_IMP, DL
        JE  CRUC_HUNDIDO
        JMP CONDICION_VICTORIA
        
    INC_IMP_PORT:
        INC PORT_IMP
        MOV DX, TAM_PORT
        CMP PORT_IMP, DL
        JE  PORT_HUNDIDO
        JMP CONDICION_VICTORIA
    
    SUBM_HUNDIDO:
        INC [NAV_IMP]           ;Aumenta el numero de navios HUNDIDOS
        
        MOV AH, 09h
        LEA DX, MSJ_SUBM_HUNDIDO
        INT 21h
        
        MOV AH, 02h
        MOV DX, 7       ;BEEP!
        INT 21h
        INT 21h
        
        JMP CONDICION_VICTORIA
        
    CRUC_HUNDIDO:
        INC [NAV_IMP]           ;Aumenta el numero de navios HUNDIDOS
        
        MOV AH, 09h
        LEA DX, MSJ_CRUC_HUNDIDO
        INT 21h
        
        MOV AH, 02h
        MOV DX, 7       ;BEEP!
        INT 21h
        INT 21h
        INT 21h
        
        JMP CONDICION_VICTORIA
        
    PORT_HUNDIDO:
        INC [NAV_IMP]           ;Aumenta el numero de navios HUNDIDOS
        
        MOV AH, 09h
        LEA DX, MSJ_PORT_HUNDIDO
        INT 21h
        
        MOV AH, 02h
        MOV DX, 7       ;BEEP!
        INT 21h
        INT 21h
        INT 21h
        INT 21h
        
    CONDICION_VICTORIA:    
        MOV AH, 02h
        MOV DX, 7       ;BEEP!
        INT 21h
        
        CMP [NAV_IMP], '3'      ;Compara con condicion de victoria
        JE VICTORIA
       
    MOV AH, 09h
    LEA DX, PTPC
    INT 21h
    
    MOV AH, 01h
    INT 21h

    CMP MDP_FLAG, '2'
    JE  MOSTRAR_TABLERO_REAL         ;Regresa al bloque para revelar las posiciones de los navios (modo de PRUEBA)
    JNE MOSTRAR_TABLERO_JUGADOR      ;Regresa al bloque donde se actualiza el tablero del jugador (modo NORMAL)
     
 
FALLO:      ;Jugador no logra impactar navio
    MOV AH, 09h
    LEA DX, MSJ_SIN_IMP
    INT 21h
    
    MOV TABLERO_JUGADOR[BX], '0'    ;Reemplaza caracter 250 (UMLAUT) de la matriz por 0 en la posicion indicada por el jugador
                                    ;revelando que no habia un navio en esa posicion
    LEA DX, PTPC
    INT 21h
    
    MOV AH, 01h
    INT 21h
    
    CMP MDP_FLAG, '2'
    JE  MOSTRAR_TABLERO_REAL        ;Regresa al bloque para revelar las posiciones de los navios (modo de PRUEBA)
    JNE MOSTRAR_TABLERO_JUGADOR     ;Regresa al bloque donde se actualiza el tablero del jugador (modo NORMAL)
    

FINAL_PARTIDA:  ;Imprime cuantos navios logro hundir el jugador
    MOV AH, 09h
    LEA DX, IMP1
    INT 21h
   
    LEA DX, NAV_IMP  ;Muestra el numero de navios impactados
    INT 21h
   
    LEA DX, IMP2
    INT 21h
    
   
RESET_VARS:     ;Reinicia variables auxiliares
    MOV NUM_MISILES, 20
    MOV [NAV_IMP]  , '0'
    MOV AUX         , 0
    MOV SUBM_IMP    , 0
    MOV CRUC_IMP, 0
    MOV PORT_IMP, 0
    
    MOV SI, 0
    MOV CX, 35
    
    RESET_TABLERO_REAL:
        MOV TABLERO_REAL[SI], '0'
        INC SI
        LOOP RESET_TABLERO_REAL
    
    MOV SI, 0
    MOV CX, 19

    RESET_JUGADAS:
        MOV DISPAROS_REALIZADOS[SI], 50
        INC SI
        LOOP RESET_JUGADAS
        
    CMP MDP_FLAG, '2'
    JE MENU4
    

MENU3:      ;Bloque correspondiente al segundo menu, mostrado despues del finalizar una partida
    ;Indica al programa en que menu se encuentra el jugador
    MOV NUM_MENU, '3'
    
    ;Muestra en consola tercer menu (?Quieres intentar de nuevo?)
    MOV AH, 09h
    LEA DX, QJDN
    INT 21h
    
    LEA DX, OPC_SI
    INT 21h
   
    LEA DX, OPC_NO
    INT 21h
    
    LEA DX, MSJ_OP
    INT 21h
    
    ;Pide opcion a jugador
    MOV AH, 01h
    INT 21h
    
    ;Valida numero de opcion introducido por jugador    
    CMP AL, '1'
    JE PANTALLA_CARGA
   
    CMP AL, '2' 
    JE SALIR_JUEGO
    
    JMP OP_INC
    
    
MENU4:
    ;Indica al programa en que menu se encuentra el jugador
    MOV NUM_MENU, '4'
    
    ;Muestra en consola tercer menu (?Que quieres hacer ahora?)
    MOV AH, 09h
    LEA DX, QQHA
    INT 21h
    
    LEA DX, OPC_SALIR_MDP
    INT 21h
   
    LEA DX, OPC_SALIR_JUEGO
    INT 21h
    
    LEA DX, MSJ_OP
    INT 21h
    
    ;Pide opcion a jugador
    MOV AH, 01h
    INT 21h
    
    ;Valida numero de opcion introducido por jugador    
    CMP AL, '1'
    JE BIENVENIDA
   
    CMP AL, '2' 
    JE SALIR_JUEGO
    
    JMP OP_INC
          
       
VICTORIA:
    MOV AH, 09h
    LEA DX, PTPC
    INT 21h
    
    MOV AH, 01h
    INT 21h
    
    ;Limpia la consola
    MOV AH, 00h
    MOV AL, 03h
    INT 10h
    ;Muestra en consola cartel de felicitaciones
    MOV AH, 09h
    LEA DX, FEL1
    INT 21h
    LEA DX, FEL2
    INT 21h
    LEA DX, FEL3
    INT 21h
    LEA DX, FEL4
    INT 21h
    LEA DX, FEL5
    INT 21h
    LEA DX, FEL6
    INT 21h
    LEA DX, FEL7
    INT 21h
    ;Muestra en consola mensaje de felicitaciones a jugador ganador
    LEA DX, GANADOR1
    INT 21h
    LEA DX, GANADOR2
    INT 21h
    LEA DX, GANADOR3
    INT 21h
    
    JMP RESET_VARS
         
         
SALIR_JUEGO:    ;Bloque para salir del juego
    ;Limpiar consola
    MOV AH, 00h
    MOV AL, 03h     
    INT 10h
    ;Muestra en consola dibujo ASCII de un navio
    MOV AH, 09h 
    LEA DX, DBJ1
    INT 21h
    LEA DX, ESP_DBJ
    INT 21h
    LEA DX, ESP_DBJ
    INT 21h 
    LEA DX, DBJ2
    INT 21h
    LEA DX, DBJ3
    INT 21h
    LEA DX, DBJ4
    INT 21h
    LEA DX, DBJ5
    INT 21h
    LEA DX, DBJ6
    INT 21h
    LEA DX, DBJ7
    INT 21h
    LEA DX, DBJ8
    INT 21h
    LEA DX, DBJ9
    INT 21h
    LEA DX, DBJ10
    INT 21h
    LEA DX, MAR1
    INT 21h
    LEA DX, MAR2
    INT 21h
    LEA DX, MAR3
    INT 21h
    LEA DX, ESP_DBJ
    INT 21h
    LEA DX, DBJ11
    INT 21h
    ;Muestra en consola mensaje de finalizacion de juego
    LEA DX, MSJ_FIN1
    INT 21h
    LEA DX, MSJ_FIN2
    INT 21h
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
DISPAROS_REALIZADOS DB 19 DUP(50)

;VARIABLE AUXILIAR
AUX DW 0

;BANDERA MODO DE PRUEBA
MDP_FLAG DB 0
    
;BANDERA UBICACION MENU
NUM_MENU DB "1$" 

;BANDERAS HORIZONTAL/VERTICAL
HFLAG DB 0

;LONGITUD DE LOS NAVIOS (NUMERO DE CELDAS QUE OCUPA CADA NAVIO
TAM_SUBM DW 3
TAM_CRUC DW 4
TAM_PORT DW 5

;CARACTERES DE LOS NAVIOS EN EL TABLERO REAL
CHAR_PORT DB 'P$'
CHAR_CRUC DB 'C$'

;PRESIONA TECLA PARA CONTINUAR
PTPC DB 10, 13, 9, "(Presiona cualquier tecla para continuar) $"
      
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
NOMBRE_JUEGO DB 13, 186, 2 DUP(240), 5 DUP(176), 5 DUP(177), 5 DUP(178), 5 DUP(219), 204, 4 DUP(205), ">>>  BATALLA  NAVAL  <<<", 4 DUP(205), 185, 5 DUP(219), 5 DUP(178), 5 DUP(177), 5 DUP(176), 2 DUP(240), 186, "$"  
LINEA2       DB 13, 200, 78 DUP(205), 188, 10, "$"

   
;MENSAJE PARA PEDIR OPCION
IUO DB 13, 10, "Ingresa una opci", 162,"n:", 2 DUP(10), 13, "$"

;MENU PRINCIPAL
JUGAR  DB 13, 9, "1. Jugar", 10, "$"
PRUEBA DB 13, 9, "2. Jugar en modo de prueba", 10, "$"
REGLAS DB 13, 9, "3. Reglas del juego", 10, "$"
SALIR  DB 13, 9, "4. Salir del juego", 10, "$"
;SEGUNDO MENU (DESPUES DE MOSTRAR LAS REGLAS DEL JUEGO)
REP_REGLAS DB 13, 9, "3. Repetir las reglas", 10, "$" 

;MENSAJE PARA PEDIR OPCION
MSJ_OP DB 13, 10, 9, 16, " $"

;MENSAJE DE OPCION INCORRECTA
MSJ_ERR DB 2 DUP(10), 13, 9, 173, "La opci", 162, "n que ingresaste es incorrecta! Intenta de nuevo.$"


;REGLAS DEL JUEGO
MAN1    DB 13, 10, 29 DUP(32), 201, 20 DUP(205), 187, 10, "$"
MAN2    DB 13, 201, 28 DUP(205), 185, "  REGLAS DEL JUEGO  ", 204, 28 DUP(205), 187, "$"
MAN3    DB 13, 186, 28 DUP(32), 200, 20 DUP(205), 188, 28 DUP(32), 186, "$"
MAN4    DB 186, "  Batalla naval es un juego de mesa para dos jugadores, en el cual ambos      ", 186, "$"
MAN5    DB 186, "  tienen que intentar adivinar en qu", 130, " celdas est", 160, "n los nav", 161, "os del ememigo.    ", 186, "$"
MAN6    DB 186, "  El objetivo es derribar los nav", 161, "os del enemigo y gana quien logre derribar  ", 186, "$"
MAN7    DB 186, "  primero todos los nav", 161, "os de su adversario. El juego original se juega en    ", 186, "$"
MAN8    DB 186, "  dos rejillas. Una que representa la disposici", 162, "n de tus nav", 161, "os y el otro     ", 186, "$"
MAN9    DB 186, "  que representa los nav", 161, "os del enemigo. Las rejillas son t", 161, "picamente         ", 186, "$"
MAN10   DB 186, "  cuadradas, y se identifican horizontalmente por n", 163, "meros y verticalmente     ", 186, "$"
MAN11   DB 186, "  por letras. En cada rejilla respectiva, cada jugador coloca sus nav", 161, "os y    ", 186, "$"
MAN12   DB 186, "  registra los disparos de su oponente.                                       ", 186, "$"
MAN_PPC DB 186, "  (Presiona cualquier tecla para continuar)                                   ", 186, "$"
MAN13   DB 186, "  Antes de que comience el juego, cada jugador debe colocar sus nav", 161, "os en     ", 186, "$"
MAN14   DB 186, "  los tableros, alineados en celdas adyacentes seguidas, horizontal o         ", 186, "$"
MAN15   DB 186, "  verticalmente. El n", 163, "mero de nav", 161, "os permitido es igual para ambos jugadores  ", 186, "$"
MAN16   DB 186, "  y estos no pueden superponerse. Una vez colocados los nav", 161, "os, el juego      ", 186, "$"
MAN17   DB 186, "  contin", 163, "a en una serie de turnos. En cada turno, un jugador indica una       ", 186, "$"
MAN18   DB 186, "  posici", 162, "n (ejemplo: B6 ", 162, " F2) en la rejilla de su oponente. Si hay un nav", 161, "o   ", 186, "$"
MAN19   DB 186, "  en esa celda, se coloca una marca roja. Si no, se coloca una marca blanca.  ", 186, "$"
MAN20   DB 186, "  Los tipos de nav", 161, "os son: PORTAAVIONES (5 celdas), CRUCERO (4 celdas) y      ", 186, "$"
MAN21   DB 186, "  SUBMARINO (3 celdas).                                                       ", 186, "$"
MAN22   DB 200, 78 DUP(205), 188, 10, "$"
ESP_MAN DB 13, 186, 78 DUP(32), 186, "$"

;?Que quieres hacer ahora?   
QQHA DB 10, 13, 168, "Qu", 130, " quieres hacer ahora?", 2 DUP(10), 13, "$" 


;NAVIOS PARA UBICAR EN PANTALLA DE CARGA
MSJ_CARGA DB 13, 3 DUP(10), 9, " C A R G A N D O____P O S I C I O N E S____A L E A T O R I A S ", 3 DUP(10), "$" 

NAVIO1 DB 13, 9, "~~~", 186, "~~~~~~ ", 10, "$"
NAVIO2 DB 13, 9, "~~", 178, 186, "~~~~~~", 10, "$"
NAVIO3 DB 13, 9, "~", 2 DUP(178), 186, "~~~~~~", 10, "$" 
NAVIO4 DB 13, 9, 3 DUP(178), 186, "~~~~~~", 10, "$"
NAVIO5 DB 13, 9, 223, 10 DUP(219), 223, 2 DUP(196), 10, "$"
NAVIO6 DB 13, 5 DUP(32), 18 DUP(126), 10, "$"
NAVIO7 DB 13, 3 DUP(32), 18 DUP(126), 2 DUP(10), "$" 

NAVIO8  DB 13, 2 DUP(9), 7 DUP(196), 201, 205, 46, 3, 46, 9 DUP(205), 187, 10, "$" 
NAVIO9  DB 13, 2 DUP(9), 7 DUP(196), 186, " NO CUENTES", 10, "$"
NAVIO10 DB 13, 2 DUP(9), 6 DUP(196), 177, 186, " LOS DIAS", 10, "$"
NAVIO11 DB 13, 2 DUP(9), 5 DUP(196), 2 DUP(177), 186, " HAZ QUE LOS", 10, "$"
NAVIO12 DB 13, 2 DUP(9), 3 DUP(196), 4 DUP(177), 186, " DIAS CUENTEN", 10, "$"
NAVIO13 DB 13, 2 DUP(9), DUP(196), 6 DUP(177), 200, 8 DUP(205), 46, 3, 46, 2 DUP(205),188, 10, "$"
NAVIO14 DB 13, 2 DUP(9), 223, 21 DUP(219), 223, 10, "$"
NAVIO15 DB 13, 10 DUP(32), 32 DUP(126), 10, "$" 
NAVIO16 DB 13, 12 DUP(32), 32 DUP(126), "$" 
 

;DIBUJO DE UN NAVIO
DBJ1  DB 13, 2 DUP(10), 32, 78 DUP(178), 10, "$"                           
DBJ2  DB 13, 32, 2 DUP(178), "                                      # #   \                             ", 2 DUP(178), 10, "$"       
DBJ3  DB 13, 32, 2 DUP(178), "                                      # #  (_)                            ", 2 DUP(178), 10, "$"       
DBJ4  DB 13, 32, 2 DUP(178), "                                  ", 201, 3 DUP(205), "#", 205, "#", 2 DUP(205), 188, " ", 200, 205, 187, "                          ", 2 DUP(178), 10, "$"      
DBJ5  DB 13, 32, 2 DUP(178), "                              ", 201, 205, 203, 205, 206, 12 DUP(205), 206, 205, 203, 205, 187, "                      ", 2 DUP(178), 10, "$"   
DBJ6  DB 13, 32, 2 DUP(178), "                       ", 201, 205, 203, 4 DUP(205), 185, " ", 186, " ", 186, "            ", 186, " ", 186, " ", 204, 4 DUP(205), 203, 205, 187, "               ", 2 DUP(178), 10, "$"   
DBJ7  DB 13, 32, 2 DUP(178), "                  ", 201, 4 DUP(205), 185, " ", 186, 201, 3 DUP(205), 202, 205, 202, 205, 202, 12 DUP(205), 202, 205, 202, 205, 188, 2 DUP(205), 187, " ", 186, " ", 186, 3 DUP(205), 187, "           ", 2 DUP(178), 10, "$"
DBJ8  DB 13, 32, 2 DUP(178), "    <<", 12 DUP(205), 202, 4 DUP(205), 202, 205, 202, 188, "  ", 247, "  ", 247, "  ", 247, "  ", 247, "  ", 247, "  ", 247, "  ", 247, "  ", 247, "   ", 200, 205, 202, 205, 202, 3 DUP(205), 202, 6 DUP(205), "//   ", 2 DUP(178), 10, "$"
DBJ9  DB 13, 32, 2 DUP(178), "     \\                                                             //    ", 2 DUP(178), 10, "$"
DBJ10 DB 13, 32, 2 DUP(178), "      \\_______________________________________________", 240, "_", 240, "_________//     ", 2 DUP(178), 10, "$"
MAR1 DB 13, 32, 2 DUP(178), 3 DUP(32), 69 DUP(126), 2 DUP(32), 2 DUP(178), 10, "$"       
MAR2 DB 13, 32, 2 DUP(178), 32, 72 DUP(126), 32, 2 DUP(178), 10, "$"       
MAR3 DB 13, 32, 2 DUP(178), 4 DUP(32), 67 DUP(126), 3 DUP(32), 2 DUP(178), 10, "$"       
DBJ11 DB 13, 32, 78 DUP(178), 2 DUP(10), "$"
ESP_DBJ DB 13, 32, 2 DUP(178), 74 DUP(32), 2 DUP(178), 10, "$"       
;MENSAJE DE DESPEDIDA
MSJ_FIN1 DB 13, 20 DUP(32), 218, 38 DUP(196), 191, 10, "$"    
MSJ_FIN2 DB 13, 32, 5 DUP(60), 14 DUP(196), 180, " Gracias por jugar, hasta la pr", 162, "xima! ", 195, 14 DUP(196), 5 DUP(62), 32, "$"    
MSJ_FIN3 DB 13, 20 DUP(32), 192, 38 DUP(196), 217, "$"


;LETRAS DE COLUMNAS (CABECERA DE LA MATRIZ)
COLS DB 2 DUP(10), 4 DUP(9), "  \ A B C D E F", 10, 13, "$"

;TABLERO REAL DEL JUEGO
TABLERO_REAL DB 36 DUP('0')     ;TABLERO_REAL DB 25 DUP('0')    (ORIGINAL)
;TABLERO PARA VISUALIZACION DEL JUGADOR
TABLERO_JUGADOR DB 36 DUP(250)  ;TABLERO_JUGADOR DB 25 DUP(250) (ORIGINAL) 


;MENSAJE DE AYUDA PARA EL JUGADOR
AYUDA DB 2 DUP(10), 13, 9, "Acertaste = 1  ", 4 DUP(219), "  0 = Fallaste$"
;MENSAJE DE NAVIOS HUNDIDOS:
MSJ_NAV_HUNDIDOS DB 10, 13, 9, "Nav", 161, "os hundidos: $"
;CONTADOR PARA NAVIOS QUE JUGADOR LOGRO IMPACTAR
NAV_IMP DB "0$"
;MENSAJE DE MISILES (INTENTOS) RESTANTES
MSJ_NUM_MISILES DB 10, 13, 9, "Misiles (intentos) restantes: $"
;CONTADOR DE NUMERO DE MISILES (INTENTOS) DEL JUGADOR
NUM_MISILES DW 20       ;DESCOMPONER Y CONVERTIR NUMERO PARA MOSTRAR EN CONSOLA
                                                                     
;MENSAJE COORDENADAS DE ATAQUE
MSJ_COORDS_ATAQUE DB 2 DUP(10), 13, 9, "Ingresa la celda que quieres atacar (Ejemplo: A5) $"

;POSICION 'X' EN EL TABLERO_REAL
PosX DB 0  
;POSICION 'Y' EN EL TABLERO_REAL
PosY DB 0

;MENSAJES DE POSICION INCORRECTA
C_INV DB 10, 13, 9, 173, "Columna inv", 160, "lida! Intenta de nuevo. (NOTA: Columna: A-F)$"
F_INV DB 10, 13, 9, 173, "Fila inv", 160, "lida! Intenta de nuevo. (NOTA: Fila: 1-6)$"
P_INV DB 10, 13, 9, "Ya ingresaste esas coordenadas anteriormente. Intenta de nuevo.$"


;MENSAJES DE IMPACTO DE MISIL
MSJ_CON_IMP DB 2 DUP(10), 13, 9, 173, "Impacto confirmado! $"
MSJ_SIN_IMP DB 2 DUP(10), 13, 9, "Sin impacto ...$"


;CONTADORES DE NAVIOS IMPACTADOS (POSTERIORMENTE PARA VERIFICAR SI SE HUNDIERON) 
SUBM_IMP DB 0
CRUC_IMP DB 0
PORT_IMP DB 0

;MENSAJES QUE SE MUESTRAN LUEGO DE HUNDIR UN NAVIO
MSJ_SUBM_HUNDIDO DB 3 DUP(205), "> ", 3 DUP(173), "Submarino hundido!!!$"
MSJ_CRUC_HUNDIDO DB 3 DUP(205), "> ", 4 DUP(173), "Crucero hundido!!!!$"
MSJ_PORT_HUNDIDO DB 3 DUP(205), "> ", 5 DUP(173), "Portaviones hundido!!!!!$"


;RESUMEN DE PARTIDA
IMP1 DB 2 DUP(10), 13, "Lograste hundir $"
IMP2 DB " nav", 161, "o(s) ...", 3 DUP(10), "$"

;TERCER MENU (DESPUES DE FINALIZAR PARTIDA)
QJDN DB 13, 168, "Quieres jugar de nuevo?", 2 DUP(10), "$"
OPC_SI DB 13, 9, "1. ", 173, "Si!", 10, "$"
OPC_NO DB 13, 9, "2. ", 173, "No!", 10, "$"

;CUARTO MENU (DESPUES DE FINALIZAR PARTIDA EN MODO DE PRUEBA)
OPC_SALIR_MDP   DB 13, 9, "1. Salir del modo de prueba", 10, "$"
OPC_SALIR_JUEGO DB 13, 9, "2. Salir del juego", 10, "$"


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

    ;Esta operacion resulta en un numero aleatorio del 0 al 35 (rango de posiciones posibles para tablero 6x6)
    ;El registro DL almacenara valores del 0 al 99 (centesimas de segundo) [ MAXIMO: 99 ]
    ;ALGORITMO: (99 + 8) / 3 ---> Cociente = 35 | 2 = Residuo (el residuo simplemente se desprecia) 
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

