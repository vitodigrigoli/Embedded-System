A_SEGMENT OUTPUT
B_SEGMENT OUTPUT
C_SEGMENT OUTPUT
D_SEGMENT OUTPUT
E_SEGMENT OUTPUT
F_SEGMENT OUTPUT
G_SEGMENT OUTPUT

: >ON 
	A_SEGMENT OFF
	B_SEGMENT OFF
	C_SEGMENT OFF
	D_SEGMENT OFF
	E_SEGMENT OFF
	F_SEGMENT OFF
	G_SEGMENT OFF
;

: >OFF
	A_SEGMENT ON
	B_SEGMENT ON
	C_SEGMENT ON
	D_SEGMENT ON
	E_SEGMENT ON
	F_SEGMENT ON
	G_SEGMENT ON
;



: 0>DISP 

	A_SEGMENT OFF
	B_SEGMENT OFF
	C_SEGMENT OFF
	D_SEGMENT OFF
	E_SEGMENT OFF
	F_SEGMENT OFF
	G_SEGMENT ON
;

: 1>DISP 

	A_SEGMENT ON
	B_SEGMENT OFF
	C_SEGMENT OFF
	D_SEGMENT ON
	E_SEGMENT ON
	F_SEGMENT ON
	G_SEGMENT ON
;

: 2>DISP 

	A_SEGMENT OFF
	B_SEGMENT OFF
	C_SEGMENT ON
	D_SEGMENT OFF
	E_SEGMENT OFF
	F_SEGMENT ON
	G_SEGMENT OFF
;

: 3>DISP 

	A_SEGMENT OFF
	B_SEGMENT OFF
	C_SEGMENT OFF
	D_SEGMENT OFF
	E_SEGMENT ON
	F_SEGMENT ON
	G_SEGMENT OFF
;

: 4>DISP 

	A_SEGMENT ON
	B_SEGMENT OFF
	C_SEGMENT OFF
	D_SEGMENT ON
	E_SEGMENT ON
	F_SEGMENT OFF
	G_SEGMENT OFF
;

: 5>DISP 

	A_SEGMENT OFF
	B_SEGMENT ON
	C_SEGMENT OFF
	D_SEGMENT OFF
	E_SEGMENT ON
	F_SEGMENT OFF
	G_SEGMENT OFF
;

: 6>DISP 

	A_SEGMENT OFF
	B_SEGMENT ON
	C_SEGMENT OFF
	D_SEGMENT OFF
	E_SEGMENT OFF
	F_SEGMENT OFF
	G_SEGMENT OFF
;

: 7>DISP 

	A_SEGMENT OFF
	B_SEGMENT OFF
	C_SEGMENT OFF
	D_SEGMENT ON
	E_SEGMENT ON
	F_SEGMENT ON
	G_SEGMENT ON
;

: 8>DISP 

	A_SEGMENT OFF
	B_SEGMENT OFF
	C_SEGMENT OFF
	D_SEGMENT OFF
	E_SEGMENT OFF
	F_SEGMENT OFF
	G_SEGMENT OFF
;

: 9>DISP 

	A_SEGMENT OFF
	B_SEGMENT OFF
	C_SEGMENT OFF
	D_SEGMENT OFF
	E_SEGMENT ON
	F_SEGMENT OFF
	G_SEGMENT OFF
;

: >DISP
		CASE
			0 OF 0>DISP  ENDOF
			1 OF 1>DISP ENDOF
			2 OF 2>DISP ENDOF
			3 OF 3>DISP ENDOF
			4 OF 4>DISP ENDOF
			5 OF 5>DISP ENDOF
			6 OF 6>DISP ENDOF
			7 OF 7>DISP ENDOF
			8 OF 8>DISP ENDOF
			9 OF 9>DISP ENDOF
		ENDCASE
;


: COUNTDOWN

	DUP A < IF 
		BEGIN 

			DUP >DISP BUZZER TIC 1 SEC DELAY 1 - DUP 
		
		0 < RESET BUTTON PRESSED? IF 0 RESET BUTTON RESET! THEN
		UNTIL >OFF
	ELSE ." THE NUMBER MUST BE LESS THAN 10" THEN
	
;



