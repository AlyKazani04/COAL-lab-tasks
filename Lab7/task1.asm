INCLUDE Irvine32.inc

.data
	on BYTE "Bit 0 is ON", 0
	off BYTE "Bit 0 is OFF", 0
	val1 db 01010101b
	val2 db 10101010b
	val3 db 10110111b

.code
main PROC
	movzx eax, val1
	movzx ebx, val2
	movzx edx, val3

	; clear odd bits
	AND al, 01010101b

	; set even bits
	OR bl, 01010101b
	
	; toggle all bits
	XOR dl, 11111111b

	test al, 00000001b
	jz BITOFF
	jnz BITON
COMPARED:
	test bl, 00000001b
	mov bl, dl
	jz BITOFF
	jnz BITON
	jmp ENDPROG
BITON:	
	mov eax, OFFSET on
	call writestring
	call crlf
	jmp COMPARED
BITOFF:
	mov eax, OFFSET off
	call writestring
	call crlf
	jmp COMPARED
ENDPROG: 
	exit
main ENDP
END main