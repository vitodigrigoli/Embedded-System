RED LED OUTPUT
BLUE LED OUTPUT
GREEN LED OUTPUT
YELLOW LED OUTPUT
BUZZER OUTPUT

RED BUTTON INPUT
BLUE BUTTON INPUT
GREEN BUTTON INPUT
YELLOW BUTTON INPUT
RESET BUTTON INPUT
POWER BUTTON INPUT

RESET BUTTON ACTIVATE
RED BUTTON ACTIVATE
BLUE BUTTON ACTIVATE
GREEN BUTTON ACTIVATE
YELLOW BUTTON ACTIVATE
(
I2C_SETUP
LCD_RESET

SET_CGRAM-0
BOMB
SET_CGRA-8
HEART_EMPTY
SET_CGRAM-16
HEART
SET_CG-CURSOR

>OFF
)

: MSG0 LCD CLEAR 'SPACE 'SPACE 'SPACE 'D 'E 'F 'U 'S 'E 'SPACE 'T 'H 'E DOWN CURSOR 'SPACE 'SPACE 'SPACE 'SPACE 0 >LCD 'SPACE 'B 'O 'M 'B 'SPACE 0 >LCD ;
: MSG1 LCD CLEAR 'SPACE 'SPACE 1 >LCD 'SPACE 'R 'E 'P 'L 'Y 'SPACE 'T 'H 'E DOWN CURSOR 'C 'O 'R 'R 'E 'C 'T 'SPACE 'S 'E 'Q 'U 'E 'N 'C 'E ;
: MSG2 LCD CLEAR 'SPACE 'SPACE 2 >LCD 'SPACE 'P 'R 'O 'T 'E 'C 'T 'I 'O 'N DOWN CURSOR 'SPACE 'SPACE 'M 'E 'C 'H 'A 'N 'I 'S 'M 'SPACE 'O 'N ;
: MSG3 LCD CLEAR 'SPACE 'SPACE 3 >LCD 'SPACE 'G 'R 'E 'A 'T 'SPACE 'J 'O 'B DOWN CURSOR 'SPACE 'SPACE 'SPACE 'SPACE 'B 'L 'A 'S 'T 'E 'R  ;
: MSG4 LCD CLEAR 'SPACE 'SPACE 'SPACE 5 >LCD 4 >LCD 'SPACE 'G 'A 'M 'E 'SPACE 4 >LCD 5 >LCD DOWN CURSOR 'SPACE 'SPACE 'SPACE 'SPACE 6 >LCD 'SPACE 'O 'V 'E 'R 'SPACE 6 >LCD ;

: RAINBOW RED LED BLINK BLUE LED BLINK GREEN LED BLINK YELLOW LED BLINK ;

: CHECK_VALUE
	." CHECK_VALUE "
	= IF 1 ( STATE_1 ) ELSE
		2 ( STATE_2 ) THEN
;


: CHECK_PRESSED
	." CHECK_PRESSED "
	BEGIN 
		RED BUTTON PRESSED? 1 = IF RED LED BLINK RED BUTTON RESET! RED BUTTON 1 ELSE
		BLUE BUTTON PRESSED? 1 = IF BLUE LED BLINK BLUE BUTTON RESET! BLUE BUTTON 1 ELSE
		GREEN BUTTON PRESSED? 1 = IF GREEN LED BLINK GREEN BUTTON RESET! GREEN BUTTON 1 ELSE
		YELLOW BUTTON PRESSED? 1 = IF YELLOW LED BLINK YELLOW BUTTON RESET! YELLOW BUTTON 1 ELSE
		POWER BUTTON LEVEL? 0 = IF QUIT ELSE
		0 
		THEN THEN THEN THEN THEN
	UNTIL
;


: STATE_0
	." STATO 0 " CR

	MSG1

	RED LED BLINK

	BLUE LED BLINK

	YELLOW LED BLINK 

	RED LED BLINK  

	GREEN LED BLINK 

	GREEN BUTTON RED BUTTON YELLOW BUTTON BLUE BUTTON RED BUTTON
	1 	( GO STATE 1 )
;



: STATE_1
	." STATO 1 " CR
	DEPTH 0 > IF CHECK_PRESSED CHECK_VALUE  ELSE 3 ( GO STATE 3 COMPLETED ) THEN
;

: STATE_2
	." STATO 2 " CR
	( LCD SEGNA UN VITA IN MENO )
	STACK_CLEAR
	BUZZER BLINK
	0 ( RITORNA ALLO STATO 0 )
;

: STATE_3 
	." STATO 3 " CR
	MSG2
	9 COUNTDOWN

	MSG3
	QUIT 
;


: MAIN
	0 ( INIT STATE )
	>OFF 

	BEGIN POWER BUTTON LEVEL?  UNTIL

	BEGIN POWER BUTTON LEVEL? 
	
	WHILE 

		CASE
			0 OF STATE_0 ENDOF
			1 OF STATE_1 ENDOF
			2 OF STATE_2 ENDOF
			3 OF STATE_3 ENDOF
		ENDCASE

	REPEAT RESET BUTTON RESET! STACK_CLEAR
;

