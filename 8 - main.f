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
		0 
		THEN THEN THEN THEN
	UNTIL
;


: STATE_0
	." STATO 0 "

	RED LED BLINK

	BLUE LED BLINK

	YELLOW LED BLINK 

	RED LED BLINK  

	GREEN LED BLINK 

	GREEN BUTTON RED BUTTON YELLOW BUTTON BLUE BUTTON RED BUTTON
	1 	( GO STATE 1 )
;



: STATE_1
	." STATO 1 "
	DEPTH 0 > IF CHECK_PRESSED CHECK_VALUE  ELSE 3 ( GO STATE 3 COMPLETED ) THEN
;

: STATE_2
	." STATO 2 "
	( LCD SEGNA UN VITA IN MENO )
	STACK_CLEAR
	BUZZER BLINK
	0 ( RITORNA ALLO STATO 0 )
;

: STATE_3 
	." STATO 3 "
	9 COUNTDOWN
	QUIT 
;


: MSG1 	'D 'E 'F 'U 'S 'E 'SPACE 'T 'H 'E 'SPACE 'B 'O 'M 'B 0 >LCD ;

: MAIN
	0 ( INIT STATE )
	>OFF 



	BEGIN 
		CASE
			0 OF STATE_0 ENDOF
			1 OF STATE_1 ENDOF
			2 OF STATE_2 ENDOF
			3 OF STATE_3 ENDOF
		ENDCASE

		RESET BUTTON PRESSED? 
	UNTIL RESET BUTTON RESET! STACK_CLEAR
;


