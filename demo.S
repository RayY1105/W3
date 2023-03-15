#include <avr/io.h> // Include register definitions

.section .init0  

entry:
    ldi r16, PIN5_bm // 0x20 = 0b00100000
    sts PORTB_OUT, r16 // set high (Turn LED off)

    sts PORTB_DIR, r16 // enable PB5 as output

    // sts PORTB_OUTTGL, r16 // turn on the decimal point

    sts PORTB_OUTCLR, r16 // set low (turn LED on)

//    ldi r17, PORTB_OUT
//    andi r17, 0b11011111
//    sts PORTB_OUT, r17
 loop:
    in r16, VPORTA_IN
    andi r16, PIN4_bm

    cpi r16, 0
    breq notzero

    in r16, VPORTB_OUT
    andi r16, 0xDf
    out VPORTB_OUT, r16 // set low ( LED on )
    rjmp loop
notzero:
    ldi r16, PIN5_bm
    sts PORTB_OUTSET, r16 // set high (turn LED off)
    rjmp loop
    
