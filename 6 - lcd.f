: SEND_4BIT_MORE   
  0 4BIT_CLEAR DUP
  D OR >I2C 
  9 OR >I2C
  ;

: SEND_4BIT_LESS  
  4 4BIT_CLEAR 4 LSHIFT DUP
  D OR >I2C 
  9 OR >I2C
  ;

: >LCD DUP SEND_4BIT_MORE SEND_4BIT_LESS ;

: SMILE
  00 >LCD
  0A >LCD
  0A >LCD
  00 >LCD
  11 >LCD
  0E >LCD
  00 >LCD
  00 >LCD
 ;

 : HEART_EMPTY 
  00 >LCD
  00 >LCD
  1B >LCD
  15 >LCD
  11 >LCD
  0A >LCD
  04 >LCD
  00 >LCD
;

 : HEART
  00 >LCD
  00 >LCD
  1B >LCD
  1F >LCD
  1F >LCD
  0E >LCD
  04 >LCD
  00 >LCD
;

: BOMB
  07 >LCD
  04 >LCD
  0E >LCD
  1F >LCD
  1F >LCD
  1F >LCD
  0E >LCD
  00 >LCD
;


: SKULL 
  00 >LCD
  0E >LCD
  15 >LCD
  1B >LCD
  1F >LCD
  0A >LCD
  0E >LCD
  00 >LCD
;

: LOCK 
  0E >LCD
  11 >LCD
  11 >LCD
  1F >LCD
  1B >LCD
  1B >LCD
  1F >LCD
  00 >LCD
;

: BELL 
  04 >LCD
  0E >LCD
  0E >LCD
  0E >LCD
  1F >LCD
  00 >LCD
  04 >LCD
  00 >LCD
;

: CHECK 
  00 >LCD
  01 >LCD
  03 >LCD
  16 >LCD
  1C >LCD
  08 >LCD
  00 >LCD
  00 >LCD
;


: 'SPACE 20 >LCD ;
: '! 21 >LCD ;
: '" 22 >LCD ;
: '# 23 >LCD ;
: '$ 24 >LCD ;
: '% 25 >LCD ;
: '& 26 >LCD ;
: '' 27 >LCD ;
: '( 28 >LCD ;
: '* 2A >LCD ;
: '+ 2B >LCD ;
: ', 2C >LCD ;
: '. 2D >LCD ;
: '. 2E >LCD ;
: '/ 2F >LCD ;


: '0 30 >LCD ;
: '1 31 >LCD ;
: '2 32 >LCD ;
: '3 33 >LCD ;
: '4 34 >LCD ;
: '5 35 >LCD ;
: '6 36 >LCD ;
: '7 37 >LCD ;
: '8 38 >LCD ;
: '9 39 >LCD ;
: ': 3A >LCD ;
: '; 3B >LCD ;
: '< 3C >LCD ;
: '= 3D >LCD ;
: '> 3E >LCD ;
: '? 3F >LCD ;

: '@ 40 >LCD ;
: 'A 41 >LCD ;
: 'B 42 >LCD ;
: 'C 43 >LCD ;
: 'D 44 >LCD ;
: 'E 45 >LCD ;
: 'F 46 >LCD ;
: 'G 47 >LCD ;
: 'H 48 >LCD ;
: 'I 49 >LCD ;
: 'J 4A >LCD ;
: 'K 4B >LCD ;
: 'L 4C >LCD ;
: 'M 4D >LCD ;
: 'N 4E >LCD ;
: 'O 4F >LCD ;

: 'P 50 >LCD ;
: 'Q 51 >LCD ;
: 'R 52 >LCD ;
: 'S 53 >LCD ;
: 'T 54 >LCD ;
: 'U 55 >LCD ;
: 'V 56 >LCD ;
: 'W 57 >LCD ;
: 'X 58 >LCD ;
: 'Y 59 >LCD ;
: 'Z 5A >LCD ;
: '[ 5B >LCD ;
: '\ 5C >LCD ;
: '] 5D >LCD ;
: '^ 5E >LCD ;
: '_ 5F >LCD ;

: '` 60 >LCD ;

: '{ 7B >LCD ;
: '| 7C >LCD ;
: '} 7D >LCD ;
: '~ 7E >LCD ;
: 'DEL 7F >LCD ;



: 4BIT-CONFIG 
  ( FUNCTION SET )
  3C 38 SEND
  3C 38 SEND
  3C 38 SEND

  ( SET INTERFACE TO 4-BIT )
  2C 28 SEND


  ( SET 2 LINE, 5X8 FONT)
  2C 28 SEND
  8C 88 SEND

  ( THE NUMBER OF DISPLAY LINE AND CHARACTER FONT CANNOT BE CHANGED AFTERWARES )
  0C 08 SEND
  8C 88 SEND
  0C 08 SEND
  1C 18 SEND

  ( LCD OFF )
  0C 08 SEND

  ( ENTRY SET MODE: INCREMENT, DISPLAY SHFT )
  4C 48 SEND
;



: LCD 0C 08 SEND ;
: CLEAR 1C 18 SEND 1F4 MSEC DELAY ;
: SWITCH_ON EC E8 SEND ;
: SWITCH_OFF 84 40 SEND ;
: SHIFT_LEFT 7C 78 SEND ;
: SHIFT_RIGHT 6C 68 SEND ;


: CURSOR LCD ;
: UP 8C 88 SEND ;
: DOWN CC C8 SEND ;
: TURN_ON EC E8 SEND ;
: TURN_OFF CC C8 SEND ;
: BLINKS FC F8 SEND ;
: !BLINKS EC E8 SEND ;


: MOVE 1C 18 SEND ;
: CURSOR_LEFT 0C 08 SEND ;
: CURSOR_RIGHT 4C 48 SEND ;

: DISPLAY_RIGHT CC C8 SEND ;
: DISPLAY_LEFT 8C 88 SEND ;



: LCD_RESET
  4BIT-CONFIG
  LCD SWITCH_ON
  LCD SHIFT_RIGHT
;

: SAVE-0 4C 48 SEND 0C 08 SEND ; ( ADDRESS: 0 )

: SAVE-1 4C 48 SEND 8C 88 SEND ; ( ADDRESS: 8 )

: SAVE-2 5C 58 SEND 0C 08 SEND ; ( ADDRESS: 16 )

: SAVE-3 5C 58 SEND 8C 88 SEND ; ( ADDRESS: 24 )

: SAVE-4 6C 68 SEND 0C 08 SEND ; ( ADDRESS: 32 )

: SAVE-5 6C 68 SEND 8C 88 SEND ; ( ADDRESS: 40 )

: SAVE-6 7C 78 SEND 0C 08 SEND ; ( ADDRESS: 48 )

: SAVE-7 7C 78 SEND 8C 88 SEND ; ( ADDRESS: 56 )

: MYCHAR 

  CASE
    0 OF SAVE-0 ENDOF
    1 OF SAVE-1 ENDOF
    2 OF SAVE-2 ENDOF
    3 OF SAVE-3 ENDOF
    4 OF SAVE-4 ENDOF
    5 OF SAVE-5 ENDOF
    6 OF SAVE-6 ENDOF
    7 OF SAVE-7 ENDOF
    ." THE AVAILABLE SLOTS RANGE FROM 0 TO 7" CR
  ENDCASE
;




: DEL MOVE CURSOR_LEFT 'SPACE MOVE CURSOR_LEFT ;
: RETURN 2C 28 SEND ;


