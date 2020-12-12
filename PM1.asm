[org 0x0100]
jmp start

oldisr: dd 0
sco: db "Score:",0
time: db "Time:",0
wel: db "Welcome To",0
sel: db "Select an option : ",0
play: db "Play",0
inst: db "Instructions",0
exit: db "Exit",0
inst_1: db "Controls",0
inst_2: db "Press left or right to navigate your car across the road",0
inst_3: db "Player's Car",0
inst_4: db "Enemeny's Car",0
inst_5: db "If you hit a blue car you will lose the game",0
inst_6: db "Bonus Car",0
inst_7: db "Collect yellow cars to gain points",0
inst_8: db "Press enter key to go to main menu",0
seed: dw 50
score: dw 100
 

start_screen:
		push bp
		mov bp,sp
		push ax
		push bx
		push cx
		push di
		push es
		
		push 0xB800
		pop es
		
		push word wel; string input
		push word 0x0F; color attribute
		push word 74; column 
		push 3; row 
		call print_str;function call
		
		mov ax,-454
		
		mov di,186
		sub di,ax
		mov cx,80
	loop_l_1
		mov word [es:di],0x04DB
		add di,2
		loop loop_l_1
		
		mov di,1786
		sub di,ax
		mov cx,80
	loop_l_2
		mov word [es:di],0x04DB
		add di,2
		loop loop_l_2
		
		mov di,346
		sub di,ax
		mov cx,720
	loop_l_3
		mov word [es:di],0x01DB
		add di,2
		loop loop_l_3
		
	;------------------------	
		mov di,510
		sub di,ax
		mov cx,7
	loop_s_1	
		mov word [es:di], 0x16DB
		add di,160
		loop loop_s_1
		
		mov di,1152
		sub di,ax
		mov word [es:di],0x16DB
		
		mov di,1154
		sub di,ax
		mov cx,0
	loop_s_2
		mov word [es:di],0x16DB
		add di,162
		add cx,1
		cmp cx,3
		jne loop_s_2
		
		mov di,512
		sub di,ax
		mov cx,3
		
	loop_s_3
		mov word [es:di],0x16DB
		add di,2
		loop loop_s_3
		
		mov di,992
		sub di,ax
		mov cx,3
		
	loop_s_4
		mov word [es:di],0x16DB
		add di,2
		loop loop_s_4
		
		mov di,518
		sub di,ax
		mov cx,4
	loop_s_5
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_5
	;------------------------
	
		mov di,1004
		sub di,ax
		mov cx,5
		
	loop_s_6
		mov word [es:di],0x16DB
		add di,2
		loop loop_s_6
		
		mov di,1484
		sub di,ax
		mov cx,5
		
	loop_s_7
		mov word [es:di],0x16DB
		add di,2
		loop loop_s_7
		
		mov di,1164
		sub di,ax
		mov cx,2
		
	loop_s_8
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_8
		
		mov di,1172
		sub di,ax
		mov cx,2
		
	loop_s_9
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_9
	
	;------------------------
		mov di,1178
		sub di,ax
		mov cx,3
		
	loop_s_10
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_10
		
		mov di,1188
		sub di,ax
		mov cx,3
		
	loop_s_11
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_11
		
		mov di,1020
		sub di,ax
		
		mov word [es:di],0x16DB
		add di,2
		mov word [es:di],0x16DF
		add di,2
		mov word [es:di],0x16DF
		add di,2
		mov word [es:di],0x16DB
		
		mov di,1340
		sub di,ax
		mov cx,4
		
	loop_s_12
		mov word [es:di],0x16DC
		add di,2
		loop loop_s_12
		
	;------------------------	
		mov di,1034
		sub di,ax
		mov cx,4
		
	loop_s_13
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_13
		
		mov di,1204
		sub di,ax
		mov cx,2
		
	loop_s_14
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_14
		
		mov di,1036
		sub di,ax
		mov cx,3
	loop_s_15
		mov word [es:di],0x16DF
		add di,2
		loop loop_s_15
		
		mov di,1516
		sub di,ax
		mov cx,3
	loop_s_16
		mov word [es:di],0x16DC
		add di,2
		loop loop_s_16
	
		mov di,1042
		sub di,ax
		
		mov word [es:di],0x16DC
		add di,480
		mov word [es:di],0x16DF
		
	;------------------------
		mov di,574
		sub di,ax
		mov cx,7
		
	loop_s_17
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_17
		
		mov di,576
		sub di,ax
		mov cx,5
	loop_s_18
		mov word [es:di],0x16DB
		add di,2
		loop loop_s_18
		
		mov di,1056
		sub di,ax
		mov cx,3
	loop_s_19
		mov word [es:di],0x16DB
		add di,2
		loop loop_s_19
	;--------------------------
	
		mov di,1066
		sub di,ax
		mov cx,3
	loop_s_20	
		mov word [es:di],0x16DB
		add di,2
		loop loop_s_20
		
		mov di,1546
		sub di,ax
		mov cx,3
	loop_s_21	
		mov word [es:di],0x16DB
		add di,2
		loop loop_s_21
	
		mov di,1228
		sub di,ax
		mov cx,2
	loop_s_22
		mov word [es:di],0x16DB	
		add di,160
		loop loop_s_22
	;---------------------------

		mov di,1076
		sub di,ax
		mov cx,4
	loop_s_23
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_23	
		
		mov di,1078
		sub di,ax
		mov cx,3
	loop_s_24
		mov word [es:di],0x16DF
		add di,2
		loop loop_s_24
		
		mov di,1558
		sub di,ax
		mov cx,3
	loop_s_25	
		mov word [es:di],0x16DC
		add di,2
		loop loop_s_25
		
		mov di,1564
		sub di,ax
		mov word [es:di],0x16DB
		
		sub di,160
		mov word [es:di],0x16DB
		sub di,2
		mov word [eS:di],0x16DF
	;---------------------------
		
		mov di,1090
		sub di,ax
		mov cx,4
	loop_s_26
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_26
		
		mov di,1098
		sub di,ax
		mov cx,4
	loop_s_27
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_27
		
		mov di,1412
		sub di,ax
		mov cx,3
	loop_s_28
		mov word [es:di],0x16DF
		add di,2
		loop loop_s_28
		
	;-------------------------
		
		mov di,1104
		sub di,ax
		mov cx,5
	loop_s_29
		mov word [es:di],0x16DF
		add di,2
		loop loop_s_29
	
		mov di,1108
		sub di,ax
		mov cx,4
	loop_s_30
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_30
		
	;--------------------------
		mov di,1118
		sub di,ax
		mov cx,4
	loop_s_31
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_31	
		
		mov di,1120
		sub di,ax
		mov cx,3
	loop_s_32
		mov word [es:di],0x16DF
		add di,2
		loop loop_s_32
		
		mov di,1440
		sub di,ax
		mov cx,3
	loop_s_33
		mov word [es:di],0x16DF
		add di,2
		loop loop_s_33
		
		mov di,1600
		sub di,ax
		mov cx,3
	loop_s_34
		mov word [es:di],0x16DC
		add di,2
		loop loop_s_34
	;------------------------------
	
		mov di,1130
		sub di,ax
		mov cx,4
	loop_s_35
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_35
		
		mov di,1132
		sub di,ax
		mov cx,3
	loop_s_36
		mov word[es:di],0x16DF
		add di,2
		loop loop_s_36
		
		mov di,1292
		sub di,ax
		mov cx,3
	loop_s_37
		mov word [es:di],0x16DC
		add di,2
		loop loop_s_37
		
		mov di,1138
		sub di,ax
		mov cx,2
	loop_s_38
		mov word [es:di],0x16DB
		add di,160
		loop loop_s_38
		
		mov di,1452
		sub di,ax
		mov word [es:di],0x16DF
		
		add di,2
		mov word [es:di],0x16DC
		
		add di,162
		mov word [es:di],0x16DF
		
		add di,2
		mov word [es:di],0x16DC
	
		pop es
		pop di
		pop cx
		pop bx
		pop ax
		pop bp
		
		ret
game_over:
		push ax
		push bx
		push cx
		push di
		push si
		push es
		
		mov ax,0xb800
		mov es,ax
		mov ax,0
		mov cx,80
		mov bx,2
		mov ax,3
		mul cx
		add ax,20
		mul bx
		mov di,ax
		mov cx,6
		loop1:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne loop1
		mov si,ax
		
		sub di,12
		add di,160
		mov cx,3
		
		loop2:
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne loop2
		
		mov cx,6
		loop3:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne loop3
		
		sub di,326
		
		mov cx,4
		loop4: 
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne loop4
		
		mov cx,3
		loop5:
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne loop5
		
		mov cx,80
		;A
		mov ax,0
		mov ax,3
		mul cx
		add ax,30
		shl ax,1
		mov di,0
		mov di,ax
		mov cx,5	
		
		Aloop1:;left side
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne Aloop1
		
		sub di,800
		mov cx,5
		Aloop2:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne Aloop2
		
		mov cx,5
		Aloop3:
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne Aloop3
		
		sub di,480
		mov cx,5
		Aloop4:
		mov word[es:di],0x87B0
		sub di,2
		dec cx
		cmp cx,0
		jne Aloop4
		
		;M
		mov ax,0
		mov ax,3
		mov cx,80
		mul cx
		add ax,38
		shl ax,1
		mov di,0
		mov di,ax
		mov cx,5
		
		Mloop1:
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne Mloop1
		
		sub di,800
		mov cx,4
		Mloop2:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne Mloop2
		
		mov cx,5
		Mloop3:
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne Mloop3
		
		sub di,800
		mov cx,4
		Mloop4:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne Mloop4
		
		mov cx,5
		Mloop5:
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne Mloop5
		
		;E
		mov ax,0 
		mov ax,3
		mov cx,80
		mul cx
		add ax,49
		shl ax,1
		mov di,ax
		mov cx,4
		Eloop1:
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne Eloop1
		
		mov cx,5
		Eloop2:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne Eloop2
		
		sub di,10
		sub di,320
		mov cx,5
		
		Eloop3:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne Eloop3
		
		sub di,10
		sub di,320
		mov cx,5
		
		Eloop4:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne Eloop4
		
		;O
		mov ax,0
		mov ax,22
		mov cx,80
		mul cx
		add ax,40
		mov di,ax
		
		mov cx,6
		Oloop1:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne Oloop1
		
		sub di,12
		
		mov cx,4
		Oloop2:
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne Oloop2
		
		mov cx,6
		Oloop3:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne Oloop3
		
		mov cx,5
		Oloop4:
		mov word[es:di],0x87B0
		sub di,160
		dec cx
		cmp cx,0
		jne Oloop4
		
		;V
		mov ax,0
		mov ax,11
		mov cx,80
		mul cx
		add ax,30
		shl ax,1
		mov di,ax
		
		mov cx,1
		Vloop1:
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne Vloop1
		
		mov cx,3
		Vloop2:
		mov word[es:di],0x87B0
		add di,162
		dec cx
		cmp cx,0
		jne Vloop2
		
		mov cx,3
		Vloop3:
		mov word[es:di],0x87B0
		sub di,158
		dec cx
		cmp cx,0
		jne Vloop3
		mov cx,2
		Vloop4:
		mov word[es:di],0x87B0
		sub di,160
		dec cx
		cmp cx,0
		jne Vloop4
		
		;E
		
		mov ax,0
		mov ax,11
		mov cx,80
		mul cx
		add ax,40
		shl ax,1
		mov di,ax
		mov cx,4
		EEloop1:
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne EEloop1
		
		mov cx,5
		EEloop2:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne EEloop2
		
		sub di,10
		sub di,320
		mov cx,5
		
		EEloop3:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne EEloop3
		
		sub di,10
		sub di,320
		mov cx,5
		
		EEloop4:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne EEloop4
		
		;R
		mov ax,0
		mov ax,22
		mov cx,80
		mul cx
		add ax,96
		mov di,ax
		
		mov cx,5
		Rloop1:
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne Rloop1
		
		sub di,800
		mov cx,5
		Rloop2:
		mov word[es:di],0x87B0
		add di,162
		dec cx
		cmp cx,0
		jne Rloop2
		
		mov ax,0
		mov ax,22
		mov cx,80
		mul cx
		add ax,96
		mov di,ax
		mov cx,4
		Rloop3:
		mov word[es:di],0x87B0
		add di,2
		dec cx
		cmp cx,0
		jne Rloop3
		
		mov cx,1
		Rloop4:
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne Rloop4
		
		mov cx,4
		Rloop5:
		mov word[es:di],0x87B0
		sub di,2
		dec cx
		cmp cx,0
		jne Rloop5
		
		;!
		mov ax,0
		mov ax,22
		mov cx,80
		mul cx
		add ax,112
		mov di,ax
		mov cx,3
		l:
		mov word[es:di],0x87B0
		add di,160
		dec cx
		cmp cx,0
		jne l
		
		add di,160
		mov word [es:di],0x87B0
		
		
		mov ax,0
		mov ax,20
		mov cx,80
		mul cx
		add ax,5
		shl ax,1
		mov di,ax
		
		;aloop1:
		mov word[es:di],0x0741
		add di,2
		;jmp aloop1
		
		pop es
		pop si
		pop di
		pop cx
		pop bx
		pop ax
		
	ret
	
finish_line
		push di
		push es 
		push cx
		
		push 0xB800
		pop es
		
		mov cx,15
		mov di,42
		
	loop_fl_1
		mov word [es:di],0x00DB
		add di,2
		mov word [es:di],0x0FDB
		add di,2
		loop loop_fl_1
		
		;add di,2
		;mov word [es:di],0x00BD
		;sub di,2
		
		mov cx,15
		sub di,60
		add di,160
		
	loop_fl_2
		mov word [es:di],0x0FDB
		add di,2
		mov word [es:di],0x00DB
		add di,2
		loop loop_fl_2

		;add di,2
		;mov word [es:di],0x0FBD
		;sub di,2	
		
		pop cx
		pop es
		pop di
		
	ret		
	

random_num:
		push bp
		mov bp,sp
		push bx
		push dx	 
		push ax
		
		mov ax, 25173
		mul word [seed]
		add ax, 13849
		mov [seed], ax    ; save the seed for the next call
		ror ax,8 
		
		mov bx,[bp+4]  ; maximum value
		inc bx
		mov dx,0
		div bx      ; divide by max value
		mov [bp+6],dx  ; return the remainder
		
		pop ax
		pop dx
		pop bx
		pop bp

	ret 2


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
clrscr:
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
	push dx
	
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
		
	pop dx
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
	push dx
	
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
	
	pop dx
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
		push dx
		
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
				
ret_4:	pop dx
		pop cx	
		pop bx
		pop di
		pop ax
		pop es
		pop bp
		
		ret 8
		
	
	
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

	
	
car:
	push bp
	mov bp,sp
	push ax
	push cx
	push di
	push es
	push dx
	
	mov ax,0xB800
	mov es,ax
	
	mov ax,[bp+4]
	mov cx,160
	mul cx
	
	mov di,ax
	add di,[bp+6]
	
	mov dl,0x7F
	mov byte dh,[bp+8]
	mov cx,2
loop_car_1_0:	mov word [es:di],dx
			add di,4
			dec cx
			cmp cx,0
			jne loop_car_1_0
		
	sub di,8
	add di,160
	
	mov cx,3
	
	mov dl,0x10
	mov byte dh,[bp+8]
	sub di,2
	mov word[es:di],dx
	add di,2
	
	mov dl,0xDB
	mov byte dh,[bp+8]
loop_car_1_1:	mov word [es:di],dx
			add di,2
			dec cx
			cmp cx,0
			jne loop_car_1_1
	
	mov dl,0x11
	mov byte dh,[bp+8]
	mov word[es:di],dx
			
	sub di,6
	add di,160
	
	mov cx,3
	
	mov dl,0x10
	mov byte dh,[bp+8]
	sub di,2
	mov word[es:di],dx
	add di,2
	
	mov dl,0xDB
	mov byte dh,[bp+8]
loop_car_1_2:	mov word [es:di],dx
			add di,2
			dec cx
			cmp cx,0
			jne loop_car_1_2
	
	mov dl,0x11
	mov byte dh,[bp+8]
	mov word[es:di],dx
	
	pop dx
	pop es
	pop di
	pop cx
	pop ax
	pop bp
	
	ret 6


car_2
	push bp
	mov bp,sp
	push ax
	push cx
	push di
	push es
	push dx
	
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
	
	sub di,2
	mov word[es:di],0x7410
	add di,2
	
loop_car_1:	mov word [es:di],0x04DB
			add di,2
			dec cx
			cmp cx,0
			jne loop_car_1
			
	mov word[es:di],0x7411
			
	sub di,6
	add di,160
	
	mov cx,3
	
	sub di,2
	mov word[es:di],0x7410
	add di,2
	
loop_car_2:	mov word [es:di],0x04DB
			add di,2
			dec cx
			cmp cx,0
			jne loop_car_2
			
	mov word[es:di],0x7411
	
	pop dx
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
	
	sub di,2
	mov word[es:di],0x7110
	add di,2
	
loop_ob_1:	mov word[es:di],0x01DB
			add di,2
			dec ax
			cmp ax,0
			jnz loop_ob_1
					
	mov word[es:di],0x7111
	
	sub di,6
	add di,160
	
	mov ax,3
	
	sub di,2
	mov word[es:di],0x7110
	add di,2
	
loop_ob_2:	mov word[es:di],0x01DB
			add di,2
			dec ax
			cmp ax,0
			jnz loop_ob_2
			
	mov word[es:di],0x7111
	
	pop di
	pop es
	pop ax
	pop bp
	
	ret 2
	
draw_hurdle:
		push bp
		mov bp,sp
		
		push di
		push es
		push cx
		
		push 0xB800
		pop es
		
		mov di,[bp+4]
		
		mov cx,3
	loop_h_1:
		mov word [es:di],0x08DB
		add di,2
	loop loop_h_1	
	
		add di,154
		mov cx,3
	loop_h_2:
		mov word [es:di],0x08DB
		add di,2
	loop loop_h_2
	
		pop cx
		pop es
		pop di
		pop bp
		
	ret 2
	
draw_bonus:
	push bp
	mov bp,sp
	
	push ax
	push es
	push di
	
	push 0xB800
	pop es
	mov di,[bp+4]
	
	mov ax,3
	sub di,2
	mov word[es:di],0x7E10
	add di,2
	
	loop_b_1:	
			mov word[es:di],0x0EDB
			add di,2
			dec ax
			cmp ax,0
			jnz loop_b_1
					
	mov word[es:di],0x7E11
	
	sub di,6
	add di,160
	
	mov ax,3
	
	sub di,2
	mov word[es:di],0x7E10
	add di,2
	
	loop_b_2:	
			mov word[es:di],0x0EDB
			add di,2
			dec ax
			cmp ax,0
			jnz loop_b_2
			
	mov word[es:di],0x7E11
	
	pop di
	pop es
	pop ax
	pop bp
	
	ret 2
	
obstacle:
	push bp
	mov bp,sp
	push cx
	push ax
	push dx
	push bx
	
	mov cx,[bp+4]
	
	mov ax,cx
	mov dx,0
	mov bx,7
	div bx
	
	cmp dx,0
	jne cont_o_1
	
	;mov [seed],cx
	push 0
	push word 25
	call random_num
	
	pop ax
	add ax,ax
	add ax,44
	
	push ax
	call draw_obstacle
	jmp cont_o
	
	cont_o_1:
	mov ax,cx
	mov dx,0
	mov bx,5
	div bx
	
	cmp dx,0
	jne cont_o_2
	
	;mov [seed],cx
	push 0
	push word 25
	call random_num
	
	pop ax
	add ax,ax
	add ax,44
	
	push ax
	call draw_hurdle
	jmp cont_o
	
	cont_o_2:
	mov ax,cx
	mov dx,0
	mov bx,13
	div bx
	
	cmp dx,0
	jne cont_o
	
	;mov [seed],cx
	push 0
	push word 25
	call random_num
	
	pop ax
	add ax,ax
	add ax,44
	
	push ax
	call draw_bonus
	jmp cont_o	
	
cont_o:	pop bx
		pop dx
		pop ax
		pop cx
		pop bp
	
	ret 2
	
	
menu:

		push word sel; string input
		push word 0x04; color attribute
		push word 60; column 
		push 17; row 
		call print_str;function call
		
		push word play; string input
		push word 0x04; color attribute
		push word 66; column 
		push 19; row 
		call print_str;function call
		
		push word inst; string input
		push word 0x04; color attribute
		push word 66; column 
		push 21; row 
		call print_str;function call
		
		push word exit; string input
		push word 0x04; color attribute
		push word 66; column 
		push 23; row 
		call print_str;function call
		
		ret
		
pointer:
		push bp
		mov bp,sp
		push es
		push di
		push ax
		push cx
		push dx
		
		push 0xB800
		pop es
		
		mov cx,160
		mov ax,[bp+4]
		mul cx
		mov dx,[bp+6]
		mov di,ax
		add di,62
		
		cmp dx,1
		jne con_p_1
		mov word [es:di],0x0710
		jmp con_p_2
		
		con_p_1:
		cmp dx,2
		jne con_p_2
		mov word [es:di],0x000
		
		con_p_2:
		
		pop dx
		pop cx
		pop ax
		pop di
		pop es
		pop bp
		
		ret 4
		
		
instructions:

		push word inst; string input
		push word 0x0F; color attribute
		push word 70; column 
		push 2; row 
		call print_str;function call
		
		push word inst_1; string input
		push word 0x04; color attribute
		push word 4; column 
		push 5; row 
		call print_str;function call
		
		push word inst_2; string input
		push word 0x04; color attribute
		push word 4; column 
		push 6; row 
		call print_str;function call
		
		push word inst_3; string input
		push word 0x04; color attribute
		push word 4; column 
		push 8; row 
		call print_str;function call
		
		push word 0x04
		push 40
		push 8
		call car
		
		push word inst_4; string input
		push word 0x04; color attribute
		push word 4; column 
		push 12; row 
		call print_str;function call
		
		push word 0x01
		push 40
		push 12
		call car
		
		push word inst_5; string input
		push word 0x04; color attribute
		push word 4; column 
		push 16; row 
		call print_str;function call
		
		push word inst_6; string input
		push word 0x04; color attribute
		push word 4; column 
		push 18; row 
		call print_str;function call
		
		push word 0x0E
		push 40
		push 18
		call car
		
		push word inst_7; string input
		push word 0x04; color attribute
		push word 4; column 
		push 22; row 
		call print_str;function call
		
		push word inst_8; string input
		push word 0x0F; color attribute
		push word 44; column 
		push 24; row 
		call print_str;function call
		
		ret
		
new_int:

		;left 4B
		;right 4D
	
		push ax
		push es 
	
		in al,0x60
		cmp al,0x4B
		jne cmp_next
		cmp dx,44
		jbe con_int
		sub dx,2
		jmp con_int
		
		cmp_next:
		cmp al,0x4D
		jne con_int
		cmp dx,94
		jge con_int
		add dx,2
		jmp con_int
		
		con_int:
		
		pop es
		pop ax
		
		jmp far[cs:oldisr]	
		
hook_int:
		
		push ax
		push es
		
		mov ax,0
		xor ax,ax
		mov es,ax
		mov ax,[es:9*4]
		mov [oldisr],ax
		mov ax,[es:9*4+2]
		mov [oldisr+2],ax
		cli
		mov word [es:9*4],new_int
		mov [es:9*4+2],cs
		sti
	
		pop es
		pop ax
		
		ret

unhook_int:

		push ax
		push bx
		push es
		
		mov ax,0
		mov es,ax
		mov ax,[oldisr]
		mov bx,[oldisr+2]
		cli
		mov [es:9*4],ax
		mov [es:9*4+2],bx
		sti
		
		pop es
		pop bx
		pop ax
		
		ret 
		
collision:
		push bp
		mov bp,sp

		push es
		push ax
		push dx
		push cx
		push di
		push bx
		
		mov ax,21
		mov cx,160
		mul cx
		
		mov di,ax
		mov cx,480
		
		push 0xB800
		pop es
		
		loop_c_1:
			mov word bx,[es:di]
			cmp bx,0x7110
			je cmp_col
			add di,2
		loop loop_c_1
		mov word [bp+6],0
		jmp con_c
		

		cmp_col:
			mov ax,[bp+4]
			add ax,3360
			
			cmp di,ax
			jge cmp_col_1
			mov word [bp+6],0
			jmp con_c
		cmp_col_1:
			add di,4
			cmp di,ax
			jbe col_dec
			mov word [bp+6],0
			jmp con_c
		col_dec:
			mov word [bp+6],1
			jmp con_c
		
	con_c:	
		pop bx
		pop di
		pop cx
		pop dx
		pop ax
		pop es
		pop bp
		
		ret 2
		
collision_detection:
		push bp
		mov bp,sp
		
		push di
		push es
		push ax
		push cx
		
		push 0xB800
		pop es
		
		mov di,3360
		add di,[bp+4]
		
		mov cx,3
	loop_1_c:
			mov ax,[es:di]
			cmp ah,0x71
			je ene
			cmp ah,0x08
			je hur
			cmp ah,0x7E
			je bonus
			add di,2
		loop loop_1_c

		add di,152
		mov cx,5
	loop_2_c:
			mov ax,[es:di]
			cmp ah,0x71
			je ene
			cmp ah,0x08
			je hur
			cmp ah,0x7E
			je bonus
			add di,2
		loop loop_2_c	
		
		add di,150
		mov cx,5
	loop_3_c:
			mov ax,[es:di]
			cmp ah,0x71
			je ene
			cmp ah,0x08
			je hur
			cmp ah,0x7E
			je bonus
			add di,2
		loop loop_3_c
		jmp con_cd
		
		ene:
			mov word [bp+6],1
			jmp con_cd
		
		hur:
			mov word [bp+6],2
			jmp con_cd
			
		bonus:
			mov word [bp+6],3
			jmp con_cd
			
		con_cd:
		pop cx
		pop ax
		pop es
		pop di
		pop bp
		
		ret 2
		
move_frame:
		
		call shift_line;function call
		
		push ax; function parameter
		call clear_road;function call
		
		push 0x0000; function parameter
		call clear_line;function call
		
		push ax; function parameter
		call add_line_top;function call

		add ax,1
		cmp ax,4
		jne con_mov
		mov ax,0
		
		con_mov:
		
		ret		
		
		
print_text:
		
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
		
		ret
		
print_info
		push word [score]
		push 0x07
		push 146
		push 4
		call print_number
		
		push cx
		push 0x07
		push 146
		push 10
		call print_number
		
		ret
red_car:
		push word 0x74
		push dx
		push 21	
		call car	
		ret 	
	
flashing_car:
		push word 0xF4
		push dx
		push 21	
		call car
		ret
	
start:
	call clrscr
	call start_screen
	
	call menu
	
	mov dx,19
	push 1
	push dx
	call pointer

loop_m_1:	
	mov al,0
	mov ah,0
	int 0x16
	cmp ah,0x1C
	je con_m_1
	
	cmp ah,0x48
	jne down
	cmp dx,19
	jbe con_m_2
	
	
	push 2
	push dx
	call pointer
	sub dx,2
	push 1
	push dx
	call pointer
	jmp con_m_2
	
	down:
	cmp ah,0x50
	jne con_m_2
	cmp dx,23
	jge con_m_2
	
	push 2
	push dx
	call pointer
	add dx,2
	push 1
	push dx
	call pointer
	
	con_m_2:
	jmp loop_m_1
	
con_m_1:
	cmp dx,19
	je con_m_3
	
	cmp dx,23
	jne con_m_4
	jmp ter_m
	con_m_4:
	
	call clrscr
	call instructions
loop_m_2:	mov ax,0
			int 0x16
			cmp ah,0x1C
			jne loop_m_2
			
			jmp start	
	
	con_m_3:
	
	
	
	call clrscr
	call print_level
	
	mov ax,0
	mov cx,0
	mov dx,70
	mov word [score],100
	mov si,0
	
	call red_car
	call hook_int
	call print_text
	call print_info
			
		
loop_screen_1:
				push 0
				push dx
				call collision_detection
				pop si	
				
				cmp si,2
				jne con_m_6
				sub word [score],5
				
				call flashing_car;function call
				
				push 20
				call delay
				
				call move_frame
				call move_frame
				
			
				jmp con_m_8
				
				con_m_6:	
				cmp si,3
				jne con_m_7
				add word [score],25
				
				call flashing_car;function call
				
				push 20
				call delay

				call move_frame
				call move_frame
				
				jmp con_m_8
				
				con_m_7:
				cmp si,1
				jne con_m_8
				
				call flashing_car
				
				push 20
				call delay
				
				jmp ter_m_1
				
				
				con_m_8:
				
				call red_car
				
				push 4; function parameter
				call delay;function call
				
				;add word [score],5
				
				call print_info
				
				call move_frame
				
				cmp cx,480
				jne con
				call finish_line
				
			con:	
				cmp cx,460
				jg con_m_5
				cmp ax,2
				je con_m_5
				cmp ax,0
				je con_m_5
				push cx
				call obstacle
				con_m_5:
				
				
				add cx,1
				cmp cx,500

			jbe loop_screen_1
	call print_level
	jmp ter_win
	
ter_m_1:
	call clrscr
	call game_over
ter_win;	
	push 50
	call delay
	call unhook_int
	jmp start
ter_m:
mov ax,0x4c00
int 21h