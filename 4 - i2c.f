RPI4 804000 + CONSTANT BSC1 

BSC1 00 + CONSTANT I2C_CONTROL
BSC1 04 + CONSTANT I2C_STATUS
BSC1 08 + CONSTANT I2C_DATA_LENGTH
BSC1 0C + CONSTANT I2C_SLAVE_ADDRESS
BSC1 10 + CONSTANT I2C_DATA_FIFO
BSC1 14 + CONSTANT I2C_CLOCK_DIVIDER
BSC1 18 + CONSTANT I2C_DATA_DELAY
BSC1 1C + CONSTANT I2C_CLOCK_STRETCH_TIMEOUT

: RESET_FIFO I2C_CONTROL DUP @ 4 BIT_SET SWAP ! ;
: RESET_STATUS 
	I2C_STATUS DUP @ 1 BIT_SET SWAP ! 
	I2C_STATUS DUP @ 8 BIT_SET SWAP ! 
	I2C_STATUS DUP @ 9 BIT_SET SWAP !  ;

: SET_SLAVE 27 I2C_SLAVE_ADDRESS ! ;

: I2C_SETUP 
	2 GPIO_MODE ALT_0
	3 GPIO_MODE ALT_0
	RESET_FIFO
	RESET_STATUS
	SET_SLAVE
;

: I2C_STORE I2C_DATA_FIFO ! ;

: I2C_SEND
	I2C_CONTROL DUP @ 0 BIT_CLEAR SWAP !
	I2C_CONTROL DUP @ 7 BIT_SET SWAP ! 
	I2C_CONTROL DUP @ F BIT_SET SWAP !  
;

: I2C_DELAY 1000 DELAY ;

: >I2C
  RESET_STATUS
  RESET_FIFO
  1 I2C_DATA_LENGTH !
  SET_SLAVE
  I2C_STORE
  I2C_SEND 
  I2C_DELAY 
;