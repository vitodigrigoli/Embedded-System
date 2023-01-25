
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
: SHIFT 6C >I2C 68 >I2C ;

: CURSOR 1C >I2C 18 >I2C ;
: LEFT 8C >I2C 88 >I2C ;
: RIGHT CC >I2C C8 >I2C ;


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
  LCD ON
  LCD SHIFT
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

