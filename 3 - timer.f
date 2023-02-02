RPI4 003000 + CONSTANT TIMER 

TIMER 00 + CONSTANT TIMER_CONTROL_STATUS
TIMER 04 + CONSTANT TIMER_COUNTER_LOW
TIMER 08 + CONSTANT TIMER_COUNTER_HIGH
TIMER 0C + CONSTANT TIMER_COMPARE_0
TIMER C1 + CONSTANT TIMER_COMPARE_1
TIMER C2 + CONSTANT TIMER_COMPARE_2
TIMER C3 + CONSTANT TIMER_COMPARE_3

: NOW TIMER_COUNTER_LOW @ ;

: DELAY NOW + BEGIN DUP NOW - 0 <= UNTIL DROP ;

: USEC ;
: MSEC 3E8 * ;
: SEC 3E8 MSEC * ; 