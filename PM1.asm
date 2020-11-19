[org 0x0100]
jmp start

sco: db "Score:",0
time: db "Time:",0

; this functions shift each line downwards by a factor of one 
shift_line:
	push ds
	push es
	push si
	push di
	push ax
	push cx
	
	cld
	mov ax,0xB800
	mov ds,ax
	mov es,ax
	
	mov ax,0
	mov si,0x0E60
	mov di,0x0F00
	
	loop_shift:
	push si
	push di
		mov cx,66
		rep movsw
	pop di
	pop si
	sub di,160
	sub si,160
	inc ax
	cmp ax,24
	jne loop_shift
	
	pop cx
	pop ax
	pop di
	pop si
	pop es
	pop ds
	
	ret
	
print_rode:
	push bp
	mov  bp,sp
	push ax
	push es
	push cx
	
	mov ax,0xB800
	mov es,ax
	
	mov di,[bp+4]
	add di,42
	mov cx,0
	
	loop_road:
		mov word [es:di],0x07DB
		inc cx
		add di,2
		cmp cx,30
	jne loop_road
	
	
	mov di,[bp+4]
	mov cx,0
	mov ax,[bp+6]
	cmp ax,1
	jne ter_1
	add di,72
	mov word [es:di],0x0FDB	
	
	ter_1:
		pop cx
		pop es
		pop ax
		pop bp
	
	ret 4

;function to clear screen
clsscr:
	push ax
	push di
	push es
	mov ax,0xB800
	mov es,ax
	mov ax,0720h
	mov di,0
	loop_cs:	mov word[es:di],ax
				add di,2
				cmp di,4000
				jne loop_cs
	pop es
	pop di
	pop ax
	ret
	
;function for delay
delay:
	push bp
	mov bp,sp
	push cx
	
	mov cx,[bp+4]
		d_loop1:
		push cx
			mov cx,0xFFFF
			d_loop2:
			loop d_loop2
			pop cx
		loop d_loop1
	pop cx
	pop bp	
		
	ret 2
	
line1:
	push bp
	mov bp,sp
	push es
	push ax
	push di
	push cx
	
	mov di,[bp+4]
	mov ax,0xB800
	mov es,ax
	mov ax,0
	
	loop_line1:
				cmp ax,6
				jg next1_1
				mov word [es:di],0x0720
				add di,2
				add ax,1
				jmp continue_1
				
		next1_1:cmp ax,20
				jg	next2_1
				mov word [es:di],0x0ADB;color of sides
				cmp ax,20
				jne con1_1
				mov word [es:di],0x08B2;color of boundries
		con1_1:	add di,2
				add ax,1
				jmp continue_1
				
		next2_1:cmp ax,50
				jg next3_1
				mov word [es:di],0x07DB;color of rode
				add di,2
				add ax,1
				jmp continue_1
				
		next3_1:mov word [es:di],0x0ADB;color of sides
				cmp ax,51
				jne con2_1
				mov word [es:di],0x08B2;color of boundries
		con2_1:	add di,2
				add ax,1
				jmp continue_1
				
	continue_1:	cmp ax,65
				jne loop_line1
				
	
	
	
	mov cx,160
	mov ax,[bp+4]
	cmp ax,0
	jne skip
		mul cx
skip:	mov di,ax
		
		add di,26
		mov word[es:di],0x06DB
		
		add di,82
		mov word[es:di],0x02B1
		
		add di,2
		mov word[es:di],0x02DB
		
		add di,2
		mov word[es:di],0x02B1
		
		add di,4
		mov word[es:di],0x06DB
		
		add di,4
		mov word[es:di],0x02B1
							
		add di,2             
		mov word[es:di],0x02DB
							
		add di,2             
		mov word[es:di],0x02B1
	
	pop cx
	pop di
	pop ax
	pop es
	pop bp
	
	ret 2
	
	
line2:
	push bp
	mov bp,sp
	push es
	push ax
	push di
	push cx
	
	mov di,[bp+4]
	mov ax,0xB800
	mov es,ax
	mov ax,0
	
	loop_line2:
				cmp ax,6
				jg next1_2
				mov word [es:di],0x0720
				add di,2
				add ax,1
				jmp continue_2
				
		next1_2:cmp ax,20
				jg	next2_2
				mov word [es:di],0x0ADB;color of sides
				cmp ax,20
				jne con1_2
				mov word [es:di],0x08B2;color of boundries
		con1_2:	add di,2
				add ax,1
				jmp continue_2
				
		next2_2:cmp ax,50
				jg next3_2
				mov word [es:di],0x07DB;color of rode
				cmp ax,36
				jne con3_2
				mov word [es:di],0x0FDB;color of divider 
		con3_2:	add di,2
				add ax,1
				jmp continue_2
				
		next3_2:mov word [es:di],0x0ADB;color of sides
				cmp ax,51
				jne con2_2
				mov word [es:di],0x08B2;color of boundries
		con2_2:	add di,2
				add ax,1
				jmp continue_2
				
	continue_2:	cmp ax,65
				jne loop_line2
				
				
	mov cx,160
	mov ax,[bp+4]
	;mul cx
	mov di,ax
	add di,18
	mov word[es:di],0x02B1
	
	add di,2
	mov word[es:di],0x02DB
	
	add di,2
	mov word[es:di],0x02B1
	
	add di,4
	mov word[es:di],0x06DB
	
	add di,4
	mov word[es:di],0x02B1
						 
	add di,2             
	mov word[es:di],0x02DB
						 
	add di,2             
	mov word[es:di],0x02B1
	
	add di,82
	mov word [es:di],0x06DB
	
	pop cx
	pop di
	pop ax
	pop es
	pop bp
		
	ret 2	

; function to print the level	
print_level:

	push ax
	push cx
	
	mov ax,0x0000
	mov cx,0
	loop_screen:
		push ax
		call line2
		add ax,160
		inc cx
		
		push ax
		call line2
		add ax,160
		inc cx
		
		push ax
		call line1
		add ax,160	
		inc cx
		
		push ax
		call line1
		add ax,160
		inc cx
		
		cmp cx,25
	jbe loop_screen
	
	pop cx
	pop ax
	
	ret

; function to clear a given line
clear_line:
	push bp
	mov bp,sp
	push ax
	push di
	push es
	
	mov di,[bp+4]
	mov ax,0xB800
	mov es,ax
	mov ax,0
	
	loop_clear_line:
		mov word [es:di],0x0720
		add di,2
		inc ax
		cmp ax,80
	jne loop_clear_line

	pop es
	pop di
	pop ax
	pop bp
	
	ret 2

;this function adds a line to the top
add_line_top:
	push bp
	mov bp,sp
	push ax
	
	mov ax,[bp+4]
	cmp ax,1
	jg p_l_2
	push 0x0000
	call line1
	jmp ter
	
	p_l_2:
		push 0x0000
		call line2
	jmp ter
	
	ter:
	pop ax
	pop bp
	
	ret 2
	
clear_road:		
				push bp
				mov bp,sp
				push ax
				
				mov ax,[bp+4]
				
				cmp ax,1
				jg c_r_1
					push word 0
					push 0x0E60
					call print_rode
					push word 0
					push 0x0F00
					call print_rode
					jmp ter_3
				
				c_r_1:
					push word 1
					push 0x0E60
					call print_rode
					push word 1
					push 0x0F00
					call print_rode
				
		ter_3:
			pop ax
			pop bp
			ret 2
	

	
print_str:
		push bp
		mov bp,sp
		push es
		push ax
		push di
		push bx
		push cx
		
		mov ax,0xB800
		mov es,ax
		
		mov cx,160
		mov ax,[bp+4]
		mul cx
		
		mov di,ax
		add di,[bp+6]
		
		mov bx,[bp+10]
		
		mov ch,[bp+8]
		
loop_str:		mov cl,[bx]
				cmp cl,0
				je ret_4
				mov [es:di],cx
				add di,2
				add bx,1
				jmp loop_str
		
	
	
print_number:
		push bp
		mov bp,sp
		push ax
		push cx
		push dx
		push es
		push di
		
		mov ax,[bp+10]
		mov bx,10
		mov cx,0
		
loop_digits:		mov dx,0
					div bx
					add dx,30h
					push dx
					inc cx
					cmp ax,0
					jnz loop_digits 
	
	mov ax,0xB800
	mov es,ax
	
	mov ax,[bp+4]
	mov dx,160
	mul dx
	mov di,ax
	add di,[bp+6]
	
print_digits:		pop dx
					mov dh,[bp+8]
					mov [es:di],dx
					add di,2
					dec cx
					cmp cx,0
					jnz print_digits
		pop di
		pop es
		pop dx
		pop cx
		pop ax
		pop bp
		
		ret 8
	
ret_4:	pop cx	
		pop bx
		pop di
		pop ax
		pop es
		pop bp
		
		ret 8


	car:
		push bp
		mov bp,sp
		push 0
		push ax
		push bx 
		push cx
		push dx 
		push si
		push di
		mov ax,0x0b800
		mov es,ax
		mov ax,0
		mov cx,80
		mov bx,2
		mov ax,17
		mul cx
		add ax,34
		mul bx
		mov di,ax
		push di
		loop1:;bumper
			mov word[es:di],0x74db
			add di,2
			cmp di,2796
		jne loop1
		mov [bp-2],di
		mov di,0
		pop di
		add di,158
		mov bx,0
		loop2:;left body
			mov word[es:di],0x04db
			add di,160
			inc bx
			cmp bx,3
		jne loop2
		mov si,di
		mov di,[bp-2]
		add di,160
		mov bx,0
		loop3:;right body
			mov word[es:di],0x04db
			add di,160
			inc bx
			cmp bx,3
		jne loop3
		add di,2
		loop4:;back bumper
			mov word[es:si],0x04db
			add si,2
			cmp si,di
		jne loop4

popout:
		pop di
		pop si
		pop dx
		pop cx
		pop bx
		pop ax
		mov sp,bp
		pop bp

ret


car_2
	push bp
	mov bp,sp
	push ax
	push cx
	push di
	push es
	
	mov ax,0xB800
	mov es,ax
	
	mov ax,[bp+4]
	mov cx,160
	mul cx
	
	mov di,ax
	add di,[bp+6]
	
	mov cx,2
loop_car_0:	mov word [es:di],0x747F
			add di,4
			dec cx
			cmp cx,0
			jne loop_car_0
		
	sub di,8
	add di,160
	
	mov cx,3
loop_car_1:	mov word [es:di],0x04DB
			add di,2
			dec cx
			cmp cx,0
			jne loop_car_1
			
	sub di,6
	add di,160
	
	mov cx,3
loop_car_2:	mov word [es:di],0x04DB
			add di,2
			dec cx
			cmp cx,0
			jne loop_car_2
			
			
	pop es
	pop di
	pop cx
	pop ax
	pop bp
	
	ret 4
	
draw_obstacle
	push bp
	mov bp,sp
	push ax
	push es
	push di
	
	push 0xB800
	pop es
	mov di,[bp+4]
	
	mov ax,3
	
loop_ob_1:	mov word[es:di],0x01DB
			add di,2
			dec ax
			cmp ax,0
			jnz loop_ob_1
			
	
	sub di,6
	add di,160
	
	mov ax,3
	
loop_ob_2:	mov word[es:di],0x01DB
			add di,2
			dec ax
			cmp ax,0
			jnz loop_ob_2
			
	pop di
	pop es
	pop ax
	pop bp
	
	ret 2

start:
	call clsscr
	call print_level
	push 70
	push 21	
	call car_2
	mov ax,0
	mov cx,0
	
		push word sco; string input
		push word 0x0F; color attribute
		push word 132; column 
		push 4; row 
		call print_str;function call
		
		push word time; string input
		push word 0x0F; color attribute
		push word 132; column 
		push 10; row 
		call print_str;function call
		
		push cx
		push 0x07
		push 146
		push 4
		call print_number
		
		push cx
		push 0x07
		push 146
		push 10
		call print_number
		
		push 50
		call draw_obstacle
		
		push 90
		call draw_obstacle
loop_screen_1:

				push 70; function parameter
				push 21; function parameter
				call car_2;function call
				
				push 5; function parameter
				call delay;function call
				
				call shift_line;function call
				
				push cx
				push 0x0F
				push 146
				push 4
				call print_number
				
				push cx
				push 0x0F
				push 146
				push 10
				call print_number
				
				push ax; function parameter
				call clear_road;function call
				
				push 0x0000; function parameter
				call clear_line;function call
				
				push ax; function parameter
				call add_line_top;function call
				
				add ax,1
				cmp ax,4
				jne con
				mov ax,0
				
		con:	add cx,1
				cmp cx,25
			jbe loop_screen_1
	call print_level
	
mov ax,0x4c00
int 21h