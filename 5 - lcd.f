
: CARLO  
  4D >I2C 49 >I2C 3D >I2C 39 >I2C 
  4D >I2C 49 >I2C 1D >I2C 19 >I2C
  5D >I2C 59 >I2C 2D >I2C 29 >I2C
  4D >I2C 49 >I2C CD >I2C C9 >I2C
  4D >I2C 49 >I2C FD >I2C F9 >I2C
  ;

: 4BIT-CONFIG 
  3C >I2C 38 >I2C
  3C >I2C 38 >I2C
  3C >I2C 38 >I2C

  2C >I2C 28 >I2C
  2C >I2C 28 >I2C

  C >I2C 8 >I2C
  C >I2C 8 >I2C

  8C >I2C 88 >I2C

  C >I2C 8 >I2C

  1C >I2C 18 >I2C

  C >I2C 8 >I2C
  4C >I2C 48 >I2C
;


: LCD 0C >I2C 08 >I2C ;
: CLEAR 1C >I2C 18 >I2C ;
: ON EC >I2C E8 >I2C ;
: OFF 84 >I2C 40 >I2C ;
: BLINK FC >I2C F8 >I2C ;

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

: SETUP_LCD 
  4BIT-CONFIG
  SETUP_CURSOR
  LCD ON
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

