RPI4 200000 + CONSTANT GPIO

GPIO 00 + CONSTANT GPFSEL0
GPIO 04 + CONSTANT GPFSEL1
GPIO 08 + CONSTANT GPFSEL2
GPIO 0C + CONSTANT GPFSEL3
GPIO 10 + CONSTANT GPFSEL4
GPIO 14 + CONSTANT GPFSEL5

GPIO 1C + CONSTANT GPSET0
GPIO 20 + CONSTANT GPSET1

GPIO 28 + CONSTANT GPCLR0
GPIO 2C + CONSTANT GPCLR1

GPIO 34 + CONSTANT GPLEV0
GPIO 38 + CONSTANT GPLEV1

GPIO 40 + CONSTANT GPEDS0
GPIO 44 + CONSTANT GPEDS1

GPIO 4C + CONSTANT GPREN0
GPIO 50 + CONSTANT GPREN1

GPIO 58 + CONSTANT GPFEN0
GPIO 5C + CONSTANT GPFEN1

GPIO 64 + CONSTANT GPHEN0
GPIO 68 + CONSTANT GPHEN1

GPIO 70 + CONSTANT GPLEN0
GPIO 74 + CONSTANT GPLEN1

GPIO 7C + CONSTANT GPAREN0
GPIO 80 + CONSTANT GPAREN1

GPIO 88 + CONSTANT GPAFEN0
GPIO 8C + CONSTANT GPAFEN1


: ?GPFSEL 
	DUP 9 <= IF GPFSEL0 ELSE 
	DUP 13 <= IF GPFSEL1 ELSE 
	DUP 1D <= IF GPFSEL2 ELSE
	DUP 27 <= IF GPFSEL2 ELSE
	DUP 31 <= IF GPFSEL2 ELSE
	DUP 39 <= IF GPFSEL2 ELSE
	." ERROR: GPIO NUMBER NOT VALID!"
	THEN THEN THEN THEN THEN THEN NIP ;

: GPIO_MODE  DUP ?GPFSEL DUP @ ROT A MOD 3 * TUCK 3BIT_CLEAR ;

: INPUT		GPIO_MODE SWAP 0 SWAP LSHIFT OR SWAP ! ;
: OUTPUT 	GPIO_MODE SWAP 1 SWAP LSHIFT OR SWAP ! ;
: ALT_0 	GPIO_MODE SWAP 4 SWAP LSHIFT OR SWAP ! ;
: ALT_1 	GPIO_MODE SWAP 5 SWAP LSHIFT OR SWAP ! ;
: ALT_2 	GPIO_MODE SWAP 6 SWAP LSHIFT OR SWAP ! ;
: ALT_3 	GPIO_MODE SWAP 7 SWAP LSHIFT OR SWAP ! ;
: ALT_4 	GPIO_MODE SWAP 3 SWAP LSHIFT OR SWAP ! ;
: ALT_5 	GPIO_MODE SWAP 2 SWAP LSHIFT OR SWAP ! ;

: ?GPSETCLR
	DUP 1F <= IF DROP GPSET0 GPCLR0 ELSE 
	DUP 39 <= IF DROP GPSET1 GPCLR1 ELSE 
	." ERROR: GPIO NUMBER NOT VALID!"
	THEN THEN ;

: GPIO_OUTPUT DUP 20 MOD 1 SWAP LSHIFT SWAP ?GPSETCLR ;
: ON GPIO_OUTPUT DROP ! ;
: OFF GPIO_OUTPUT NIP ! ;

: LED DROP ;
: BUTTON NIP ;

: BLINK DUP ON 1F4 MSEC DELAY OFF ;
: TIC DUP ON 64 MSEC DELAY OFF ;


: ?GPAFEN
	DUP 1F <= IF GPAFEN0 ELSE 
	DUP 39 <= IF GPAFEN1 ELSE 
	." ERROR: GPIO NUMBER NOT VALID!"
	THEN THEN NIP ;

: ?GPEDS
	DUP 1F <= IF GPEDS0 ELSE 
	DUP 39 <= IF GPEDS1 ELSE 
	." ERROR: GPIO NUMBER NOT VALID!"
	THEN THEN NIP ;


: ?GPLEV
	DUP 1F <= IF GPLEV0 ELSE 
	DUP 39 <= IF GPLEV1 ELSE 
	." ERROR: GPIO NUMBER NOT VALID!"
	THEN THEN NIP ;

: PRESSED? DUP ?GPEDS @ SWAP 20 MOD RSHIFT 1 AND ;
: LEVEL? DUP ?GPLEV @ SWAP 20 MOD RSHIFT 1 AND ;
: RESET! DUP ?GPEDS SWAP 1 SWAP LSHIFT SWAP ! ;
: RESET_ALL! FFFFFFFF GPEDS0 ! FFFFFFFF GPEDS1 ! ;

: ACTIVATE DUP ?GPAFEN DUP @ ROT 20 MOD BIT_SET SWAP ! ;
: DEACTIVATE DUP ?GPAFEN DUP @ ROT 20 MOD BIT_CLEAR SWAP ! ;
