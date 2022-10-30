PORTB = $6000
PORTA = $6001
DDRB = $6002
DDRA = $6003
E = %10000000
RW = %01000000
RS = %00100000
	.org $8000

reset:
	lda #%11111111 ; Set all pins to output
	sta DDRB

	lda #%11100000 ; Set 3 pins to output
	sta DDRA
	
	lda #%00000001 ; Clear
	sta PORTB
	lda #0
	sta PORTA
	lda #E
	sta PORTA
	lda #0
	sta PORTA

	lda #%00111000 ; Set 8bit mode 2line 5x8
	sta PORTB
	lda #0 ; Clear RSRWE
	sta PORTA
	lda #E
	sta PORTA	
	lda #0
	sta PORTA
	
	lda #%00001110 ; Display on, cursor on, blink off
	sta PORTB
	lda #0 ; Clear RSRWE
	sta PORTA
	lda #E
	sta PORTA
	lda #0
	sta PORTA
	
	lda #%00000110 ; Set 8bit mode 2line 5x8
	sta PORTB
	lda #0 ; Clear RSRWE
	sta PORTA
	lda #E
	sta PORTA
	lda #0
	sta PORTA
	
	lda #"H"
	sta PORTB
	lda #RS ; SET RS
	sta PORTA
	lda #(RS | E)
	sta PORTA	
	lda #RS
	sta PORTA
loop:
	jmp loop
	
	.org $fffc
	.word reset
	.word $0000
