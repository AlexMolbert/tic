;
;
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;
;
;	Name: Alex Molbert
;		Gauge Pendergrass
;	File-name: tic
;	To compile: nasm -f elf 32 'file-name'.asm  THEN  gcc -m32 'file-name'.o -o 'exe-name'
;	To Save and Exit:  ':x'
;
;
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;
;
;			AVOID ALL WHO ENTERS
;
;
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;
;
		;Command Calls / Numbers from System
		%define STDOUT	 	 1
		%define SYS_EXIT 	 1
		%define SYS_WRITE 	 4
		%define SYS_READ	 3 
		%define STDIN	  	 0
;
;
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;
;

;
;
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;
;
	;Section for initialized data
	SECTION	.data
		
		checkNumber:   dd 0
		checkk:        db 0
		hal:           db  "Hal", 0
		mid:		db "mid", 0
		corn:		db "corn", 0
		edg:		db "edg", 0
		whoX:          dd  0
		m1:            dd  0
		m4:            dd  0
		p1:	       dd  0
		p2:	       dd  0
		pHal:	       dd  0	
		askpvppve      db  "Do you want to play pvp or pvHAL? (1 to play against player|2 to play HAL) ", 0
		pX:            db  "You are player X this game, ", 0
		pO:            db  "You are player O this game, ", 0
		HalX:         db  "Hal is player X this game. ", 10, 0
		HalO:          db "Hal is player O this game. ", 10, 0
	
		gameStart:     db  "Game ", 0
		gameStart2:    db  ", START!",10, 0
		gamenum:       dd  0
		askname:       db "Please enter your name: ", 0
	
		data:          db "---------", 0		
		index:         dd 0
		size:          dd 9

		move:          db  " Please make your move, ", 0 
			
		X:             dd  "X", 0
		O:             dd  "O", 0
		;dash:	       db  "-", 0	
		col:           db ": ", 0
		per:	       db ". ", 10, 0	
		askagain       db " Do you want to play another game? (1 To play again|2 to quit program) ", 0
		no:  	       db "no"
		nol:   equ $ - no
		yes:           db "yes"
		yesl:  equ $ - yes
		
		wronginputDup:	    db "That location is already ocupied, please try again: ", 0
		wronginputRange:    db "Invalid input. Please enter a number 1 through 9. ", 0
		wronginputFull:	    db "Box is full. Please enter another number. ", 0
		wronginputReplay:   db "Please enter either the number 1 or 2. Remember.. 1 to play again, 2 to quit the program. ", 0
		wronginputpvppve:   db "Please enter either the number 1 or 2. Remember.. 1 to play against another player, 2 to play against HAL. ", 0
		promptpve:	db  "You are now playing against HAL. ", 0
		promptpvp:     db   "You are now playing against another player. Please enter your name Player 2: ",0
		done:          db "Exiting Program ", 0
		space:			db	10, 0
		;format "%s" for string, used in scanf / printf
		format_string:		db	"%s", 0
		;format "d" for int, used in scanf / printf
		format_int:		db	"%d", 0
		waitt:		db "Not yet implemented... Sorry. ", 0
		xwinner:	db "X WINS!", 0
		owinner:        db "O WINS!", 0
		tiegame:        db "GAME IS TIE!", 0

		win:  		dd 0
		p1wins:		dd 0
		p1losses:	dd 0
		p2wins:		dd 0
		p2losses:	dd 0

		pausenum:	dd 0	
		p1wl:		db "Player 1 Win/Loss Record: ", 0
		p2wl:		db "Player 2 Win/Loss Record: ", 0
;
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;		GAUGES BOARD VARIABLES
;		DO NOT ENTER: AWFUL VARIABLE NAMES
;
;			I
;				REPEAT

;				TURN AROUND NOW




;        	spaces:		db	179, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0

			space1:		db	179, 32, 32, 32, 32, 32, 32, 32, 32 ,32, 10, 179, 32, 32, 32, 32, 32, 32, 32, 32, 32, 10, 179, 32, 32, 32, 32, 32, 32, 32, 32, 32, 10, 179, 32, 32, 32, 32, 32, 32, 32, 32, 32, 10, 179, 32, 32, 32, 32, 32, 32, 32, 32, 32, 10, 179, 32, 32, 32, 32, 32, 32, 32, 32, 32, 10, 0
		
			barspace:	db	179, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0

			barspacebar:	db	179, 32, 32, 32, 32, 32, 32, 32, 32, 32, 179, 0

	;		layout:		db	"Think of the board as 1 2 3, 10 4 5 6, 10 7 8 9"
	;		layoutl:	equ	$ - layout

		;WHAT THE HECK IS ALL THIS GAUGE!!!!!!!!!!!!!!!!!!!!!!!!!!!
			firstX:		db	179, "  X   X  ", 0
			secondX:	db	179, "  X   X  ", 10 , 179,"   X X   ", 10 , 179,"    X    ", 10 , 179,"   X X  ", 10 , 179,"  X   X  ", 10, 0 
			thirdX:		db	179, "   X X   ", 0
			forthX:         db	179, "    X    ", 0
							
			Y:		db	179, "   OOO   ", 10 , 179, "  O   O  ", 10 , 179, " O     O ", 10 , 179, "  O   O  ", 10 , 179, "   OOO   ", 10 , 0 
			firstY:		db	179, "   000   ", 0
			secondY:	db	179, "  O   O  ", 0
			thirdY:		db	179, " O     O ", 0

			ob1:		db	179, "   OOO   ", 179, 0
			ob2:		db	179, "  O   O  ", 179, 0
			ob3:		db	179, " O     O ", 179, 0


			xb1:		db	179, "    X    ", 179, 0
			xb2:		db	179, "   X X   ", 179, 0
			xb3:		db	179, "  X   X  ", 179, 0

			
	
			tobp:		db	179, 196, 196, 196, 196, 196, 196, 196 ,196 ,196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 179, 10, 0
 			tob: 		db	"-----------------------------", 0
			lob1:		db	"|", 0
			lob1p:		db	179, 0
			lobp:		db	179, 10, 179, 10, 179, 10, 179, 10, 179, 10, 0
			lob:		db      "|", 10 , "|", 10 , "|" , 10 , "|", 10 , "|", 10, 0
			dash:		db	"-", 0
			vdash:		db      "|", 10, 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


		;Escape:
			clear: 		db	27,"[H", 27,"[2J", 0		
			reset:		db	27,"[30d", 0
			altc:		db	27,"(0", 0
			n:		db	27,"(B", 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Escape statments for first row 2nd column box.
			sb:		db	27,"[2d", 0
			sb1:		db	27,"[10G", 0
			sbr:		db	27,"[3d", 0
			sbc:		db	27,"[10G", 0
			sbr1:		db	27,"[4d", 0
			sbc1:		db	27,"[10G", 0
			sbr2:		db	27,"[5d", 0
			sbc2:		db	27,"[10G", 0
			sbr3:		db	27,"[6d", 0
			sbc3:		db	27,"[10G", 0
			sbr4:		db	27,"[7d", 0
			sbc5:		db	27,"[10G", 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Escape statements for first row 3rd column box.
		;Will reuse rows from above
			frtc:		db	27,"[20G", 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Escape statements for second row and 2nd column box(5)

			b:		db	27,"[8d", 0
			b1:		db	27,"[9d", 0
			b2:		db	27,"[10d", 0
			b3:		db	27,"[11d", 0
			b4:		db	27,"[12d", 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Escape statements for second row and 4rd column box(6)
		;Will use same b's as above and the frtc numbers.
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Escape statements for 3rd row 2nd columb box(8)
		;Will use sb1 for columns cause 10

			c:		db	27,"[14d", 0
			c1:		db	27,"[15d", 0
			c2:		db	27,"[16d", 0
			c3:		db	27,"[17d", 0
			c4:		db	27,"[18d", 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Escape statemtns for the 3rd row and 3rd column box(9)
		; will use same column as frtc and same rows as c


;
;
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;
;
	;Section for uninitialized data
	SECTION	.bss
			
		name    resb 100
		name2   resb 100
		choice resb 4
		;HAL
	
		m2      resb 4
		m3      resb 4
		m5      resb 4
		
;
;
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;
;

;
;
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;
;
	;Section for the actual program
	SECTION	.text
		;How to call printf function and make it usuable in my program
		extern printf

		;How to call scanf function and make it usuable in my program
		extern scanf
 
		;calling golabl main instead of start is used for the gcc compiler to see the c-functions
		global	main
		
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& MAIN &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
		main:
			call getm1
			call print_board
			call getUserName
			call getm2
			call chooseStartPlayer
			
					

	wrongpvppve	call pvppve
			mov EAX, [choice]
			cmp EAX, 1
			je getp2
			
			cmp EAX, 2
			jne reen2
			call playvshal			
			jmp vshal

	reen2:		call reenter2
			jmp wrongpvppve

	s:		mov EAX, [p1]
			mov EBX, [p2]
			mov [p1], EBX
			mov [p2], EAX
			call print_board
			call startGame
			call resetsize
	wrong:		call playagain

			mov EAX, [choice]
			cmp EAX, 1
			je s
			
			cmp EAX, 2
			jne reen
			call finished
			jmp exit	
	reen:		call reenter
			jmp wrong		
								

	getp2:		call getp2name		
			jmp s		


	vshal:		call startGameHal
			call checkwin
			call resetsize
			mov EAX, [p1]
			mov EBX, [pHal]
			mov [p1], EBX
			mov [pHal], EAX
	wronghal:	call playagain
	
			mov EAX, [choice]
			cmp EAX, 1
			je vshal

			cmp EAX, 2
			jne reenvshal
			call finished
			jmp exit
	reenvshal:      call reenter
			jmp wronghal
	exit:
			ret

;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& END MAIN &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


		getm1:
			RDTSC
			mov EDX, 0
			mov ECX, 3
			idiv ECX
			mov EAX, EDX
			mov [m1], EAX
			ret

		getm2:
			RDTSC
			mov EDX, 0
			mov ECX, 4
			idiv ECX
			mov [m2], EDX
			ret
		
		getm3:
			RDTSC
			mov EDX, 0
			mov ECX, 2
			idiv ECX
			mov [m3], EDX
			ret
		
		randomizeM4:
			RDTSC
			mov EDX, 0
			mov ECX, 9 
			idiv ECX
			mov [m4], EDX
			ret


		getUserName:
			push  askname
			push  format_string
			call  printf
			add   ESP, 8

			push  name
			push  format_string
			call  scanf
			add   ESP, 8
			ret
		
		pausefunc:
		reloop:	mov EAX, [pausenum]
			inc EAX
			mov [pausenum], EAX
			cmp EAX, 500000000
			jne reloop

			mov EAX, 0
			mov [pausenum], EAX
			ret
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
		chooseStartPlayer:
			;PICK RANDOM NUMBER BETWEEN 1 and 2
			RDTSC
			mov EDX, 0
			mov ECX, 2
			idiv ECX
			mov EAX, EDX
			mov [whoX], EAX
			
			;Print that the player is either X or O
			;Player 0 if whoX = 0
			cmp EAX, 0
			je playerO

			mov EAX, [X]
			mov [p1], EAX
			mov EAX, [O]
			mov [p2], EAX		
			mov [pHal], EAX
		;	push pO     ;pO BECAUSE LETTER IS SWAPPED BEFORE FIRST GAME BEGINS
		;	push format_string
		;	call printf
		;	add ESP, 8

		;	push name
		;	push format_string
		;	call printf
		;	add ESP, 8

		;	push per
		;	push format_string
		;	call printf
		;	add ESP, 8

			jmp cspend

			playerO:
				mov EAX, [O]
				mov [p1], EAX
				mov EAX, [X]
				mov [p2], EAX
				mov [pHal], EAX
			;	push pX        ;pX BECAUSE LETTER IS SWAPPED BEFORE FIRST GAME BEGINS
			;	push format_string
			;	call printf
			;	add ESP, 8
			;
			;	push name
			;	push format_string
			;	call printf
			;	add ESP, 8
				
			;	push per
			;	push format_string
			;	call printf
			;	add ESP, 8
			cspend:
				ret

;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

		startGame:
			;RESET BOARD HERE
			mov EBX, data
			mov ECX, 0
			mov EDX, 9	
			mov AH, [dash]

		rest:	mov byte[EBX + ECX], AH
			dec EDX
			inc ECX
			cmp EDX, 0
			jne rest


			call print_board
			;ADD ONE TO GAME NUMBER
			mov EAX, [gamenum]
			inc EAX
			mov [gamenum], EAX
			

			;PRINT START GAME MESSAGE AND GAME #
			push gameStart
			push format_string
			call printf
			add ESP, 8
			
			push DWORD[gamenum]
			push format_int
			call printf
			add ESP, 8
			
			push gameStart2
			push format_string
			call printf
			add ESP, 8		

	;		SHIT CODE
	;		mov EAX, [p2]
	;		cmp EAX, 88
	;		je pm
	;		call playermove2
	;		jmp done
		       	call playerMove


;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& SEG FAULTS YOOOOOOOOOOOO &&&&&&&&&&&&&&
	;		mov EAX, [win]
	;		mov EBX, 69
	;		cmp EAX, EBX
	;		je  addp1win
;
;			mov EBX, 70
;;			cmp EAX, EBX
;			je  addp2win
;			jmp done
;
;
 ;;          addp1win:	call addingp1win
;			jmp done
;	   addp2win:   call addingp2win
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& SEG FAULTS YOOOOOOOOOOOO &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
		.done:	
			call print_board
		;	call checkwin
			mov EAX, 0
			mov DWORD[win], EAX
			call resetsize
			ret


		addingp1win:
			mov EAX, [p1wins]
			inc EAX
			mov [p1wins], EAX

			mov EAX, [p2losses]
			inc EAX
			mov [p2losses], EAX
			ret

		addingp2win:
			mov EAX, [p2wins]
			inc EAX
			mov [p2wins], EAX

			mov EAX, [p1losses]
			inc EAX
			mov [p1losses], EAX
			ret

		resetsize:
			mov EAX, 9
			mov [size], EAX
			ret

		printwins:
			push p1wl
			push format_string
			call printf
			add ESP, 8
		
			push p1wins
			push format_string
			call printf
			add ESP, 8
			ret
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& PVP MOVEMENT &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

		playerMove:
			push move
			push format_string
			call printf
			add  ESP, 8

			push name
			push format_string
			call printf
			add  ESP, 8
		
			push p1
			push format_string
			call printf
			add ESP, 8
			push col
			push format_string
			call printf
			add ESP, 8

	indxp1:		push index
			push format_int
			call scanf
			add ESP, 8
			
			mov EAX, [index]
			cmp EAX, 0
			jle newIndexp1
		
			mov EAX, [index]
			cmp EAX, 9
			jg newIndexp1

			mov AH, [dash]
			mov EBX, data
			mov EDX, [index]
			cmp BYTE[EBX + EDX - 1], AH
			jne p1indexfull

			jmp goodinputp1

	newIndexp1:	call reenterIndex
			jmp indxp1
		
	p1indexfull	call reenterIndexFull
			jmp indxp1

	goodinputp1:	mov EBX, data		
			mov EAX, [p1]
			mov EDX, [index]
			cmp EAX, 79 ;ASCI of O
			je addO

			;ADD X
			mov AH, [X]
			mov byte[EBX + EDX -1], AH	
			jmp pm2

		addO:   mov AH, [O]
			mov byte[EBX + EDX -1], AH
			
		pm2:	mov EAX, [size] 
			dec EAX
			mov [size], EAX
			;cmp EAX, 0
	;		call checkwin
		;	mov EAX, [win]
		;	cmp EAX, 69
		;	jge outofmove
	;		mov EAX, [size]
			cmp EAX, 0
			je outofmove

			call print_board
			call checkwin
			mov EAX, [win]
			cmp EAX, 69
			jge outofmove
			
			;call printdata
		        call playermove2

	outofmove:	ret
	

		playermove2:
			push move
			push format_string
			call printf
			add ESP, 8
		
			push name2
			push format_string
			call printf
			add ESP, 8

			push p2
			push format_string
			call printf
			add ESP, 8
			push col
			push format_string
			call printf
			add ESP, 8

	indxp2:		push index
			push format_int
			call scanf
			add ESP, 8
			
			mov EAX, [index]
			cmp EAX, 0
			jle newIndexp2
		
			mov EAX, [index]
			cmp EAX, 9
			jg newIndexp2
			
			mov AH, [dash]
			mov EBX, data
			mov EDX, [index]
			cmp BYTE[EBX + EDX - 1], AH
			jne p2indexfull

			
			jmp goodinputp2

	newIndexp2:	call reenterIndex
			jmp indxp2

	p2indexfull:	call reenterIndexFull
			jmp indxp2

	goodinputp2:	mov EBX, data
			mov EAX, [p2]
			mov EDX, [index]
			cmp EAX, 79
			je ad0

			;ADD X
			mov AH, [X]
			mov byte[EBX + EDX -1], AH
			jmp pm

		ad0:    mov AH, [O]
			mov byte[EBX + EDX -1], AH


		pm:     mov EAX, [size]
			dec EAX
			mov [size], EAX
			;cmp EAX, 0
	;		call checkwin
		;	mov EAX, [win]
		;	cmp EAX, 69
		;	jge oom
	;		mov EAX, [size]
			cmp EAX, 0
			je oom
	
			call print_board
			call checkwin
			mov EAX, [win]
			cmp EAX, 69
			jge oom

			;call printdata
			call playerMove
	
		oom:	ret
	
		reenterIndex:
			push wronginputRange
			push format_string
			call printf
			add ESP, 8
			ret

		reenterIndexFull:
			push wronginputFull
			push format_string
			call printf
			add ESP, 8
			ret
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& END PVP MOVEMENT &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
	
		printdata:
			push data
			push format_string
			call printf
			add ESP, 8
		;	call printboard
	
					
	
			ret		

					


		printboard:
			


		playagain:

			mov EAX, 0
			mov [win], EAX
			push askagain
			push format_string	
			call printf
			add ESP, 8
		
			push choice
			push format_int
			call scanf
			add ESP, 8

			ret

		finished:
			push done
			push format_string
			call printf
			add ESP, 8
			ret





		reenter:
			push wronginputReplay
			push format_string
			call printf
			add ESP, 8

			
			ret

		reenter2:
			push wronginputpvppve
			push format_string
			call printf
			add ESP, 8
		
			ret


		pvppve:
			push askpvppve
			push format_string
			call printf
			add ESP, 8

			push choice
			push format_int
			call scanf
			add ESP, 8

			ret

		
		playvshal:
			push promptpve
			push format_string
			call printf
			add ESP, 8
			ret

;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& VS HAL &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

		startGameHal:
			mov EBX, data
			mov ECX, 0
			mov EDX, 9	
			mov AH, [dash]

		reseti:	mov byte[EBX + ECX], AH
			dec EDX
			inc ECX
			cmp EDX, 0
			jne reseti
				
			mov EAX, [p1]
			cmp EAX, 88
			je pplayerX
			
			jmp pplayerO

	pplayerO:	push pO
			push format_string
			call printf
			add ESP, 8

			push name
			push format_string
			call printf
			add ESP, 8

			push per
			push format_string
			call printf
			add ESP, 8
			

			push HalX
			push format_string
			call printf
			add ESP, 8
			jmp nxtt

	pplayerX:	push pX
			push format_string
			call printf
			add ESP, 8
			
			push name
			push format_string
			call printf
			add ESP, 8
			
			push per
			push format_string 
			call printf
			add ESP, 8
			
		
			push HalO
			push format_string
			call printf
			add ESP, 8


	nxtt:		call pausefunc
			mov EAX, [p1]
			cmp EAX, 88
			je pvHalMoveLabel
			
			jmp HalMoveLabel


	pvHalMoveLabel: call pvHalMove
			jmp doooone

	HalMoveLabel:	call HalMove

			call print_board
	doooone:
			ret


;								%%%%%%%%%%%%START PLAYER MOVEMENT&&&&&&&&&&&&&&&&&

	pvHalMove:	
			call print_board

			push move
			push format_string
			call printf
			add ESP, 8
		
			push name
			push format_string
			call printf
			add ESP, 8
			
			push col
			push format_string
			call printf
			add ESP, 8

	indxph:		push index
			push format_int
			call scanf
			add ESP, 8
			
			mov EAX, [index]
			cmp EAX, 0
			jle newIndexph
		
			mov EAX, [index]
			cmp EAX, 9
			jg newIndexph

			mov AH, [dash]
			mov EBX, data
			mov EDX, [index]
			cmp BYTE[EBX + EDX - 1], AH
			jne phindexfull

			jmp goodinputph

	newIndexph:	call reenterIndex
			jmp indxph
		
	phindexfull	call reenterIndexFull
			jmp indxph

	goodinputph:	mov EBX, data		
			mov EAX, [p1]
			mov EDX, [index]
			cmp EAX, 79 ;ASCI of O
			je addOh

			;ADD X
			mov AH, [X]
			mov byte[EBX + EDX -1], AH	
			jmp pm2h

		addOh:   mov AH, [O]
			mov byte[EBX + EDX -1], AH
			
		pm2h:	call print_board
			mov EAX, [size] 
			dec EAX
			mov [size], EAX
			;cmp EAX, 0
	;		call checkwin
		;	mov EAX, [win]
		;	cmp EAX, 69
		;	jge outofmove
	;		mov EAX, [size]
			cmp EAX, 0
			je outofmoveh

			
			call checkwin
			mov EAX, [win]
			cmp EAX, 69
			jge outofmoveh
			
			;call printdata
		        call HalMove

	outofmoveh:	
			ret
		
			

;&&&&&&&&&&&&&&%% END PLAYER MOVEMENT&^&&&&&&&&&&&&&&&&&



;^^^^^^^^^^^^^^^^ START HAL MOVEMENT ^$#%$#%%%$%%%%%%%%%%%%%%%%%%%%%%%%%%%

	
	HalMove:	
			call pausefunc
			
			mov EAX, [pHal]
			cmp EAX, 88
			je HalMovXLabel
			
			jmp HalMoveOLabel
	
	HalMovXLabel:   call HalMoveX
			jmp chksize

	HalMoveOLabel:  call HalMoveO
			
	chksize:	;check size
			call print_board
			call checkwin
			mov EAX, [win]
			cmp EAX, 69
			jge endddd

			mov EAX, [size] 
			dec EAX
			mov [size], EAX
			cmp EAX, 0
			je endddd
			
			

			call pvHalMove
	endddd:		ret






	HalMoveX:
			mov EAX, [size] ;CHECKING FOR FIRST MOVE
			cmp EAX, 9
			je HalFMLabel
			
			call checkHalWin
		;	mov EAX, [size] ;CHECKING FOR HALS SECOND MOVE
		;	cmp EAX, 7
		;	je HalM2Label

			jmp notfirst

	HalFMLabel:	call HalFMX	
			jmp endHalMoveX		
		
	HalM2Label:	call HalM2X
			jmp endHalMoveX
	notfirst:

	endHalMoveX:	ret



	

	HalFMX:		mov EAX, [m1]
			cmp EAX, 0
			je HalFMMiddleLabel ;Hal First Move Middle
		
			mov EAX, [m1]
			cmp EAX, 1
			je HalFMCornerLabel ;Hall First Move Corner

			mov EAX, [m1]
			cmp EAX, 2
			je HalFMEdgeLabel ;Hall First Move EDGE

	HalFMMiddleLabel: call HalFMMiddle
			  jmp HalFMend

	HalFMCornerLabel: call HalFMCorner
			  jmp HalFMend

	HalFMEdgeLabel:   call HalFMEdge
			   jmp HalFMend	
	HalFMend:	ret
		

	
		
	HalMoveO:
			push HalO
			push format_string
			call printf
			add ESP, 8
			
			call checkHalWin
			ret

;$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ CHECK FOR WIN CONDITIONS
	checkHalWin:
			mov EBX, data
		firstcheck:
			mov EDX, 0
			add DL, byte[EBX]
			add DL, byte[EBX + 3]
			add DL, byte[EBX + 6]

			mov CL, 221
			cmp DL, CL
			je firstInsert
				
			mov CL, 203
			cmp DL, CL
			je firstInsert
			
			jmp secondcheck
		firstInsert:
			mov AH, [dash]
			cmp BYTE[EBX], AH
			je add1phal1
			cmp BYTE[EBX + 3], AH
			je add1phal2
			cmp BYTE[EBX + 6], AH
			je add1phal3
			jmp checkHalWinend
			add1phal1:
				mov AH, [pHal]
				mov BYTE[EBX], AH
				jmp checkHalWinend
			add1phal2:
				mov AH, [pHal]
				mov BYTE[EBX + 3], AH
				jmp checkHalWinend
			add1phal3:
				mov AH, [pHal]
				mov BYTE[EBX + 6], AH
				jmp checkHalWinend		
secondcheck:
			mov EDX, 0
			add DL, byte[EBX + 1]
			add DL, byte[EBX + 4]
			add DL, byte[EBX + 7]

			mov CL, 221
			cmp DL, CL
			je secondInsert
				
			mov CL, 203
			cmp DL, CL
			je secondInsert
			jmp thirdcheck
		secondInsert:
			mov AH, [dash]
			cmp BYTE[EBX + 1], AH
			je add2phal1
			cmp BYTE[EBX + 4], AH
			je add2phal2
			cmp BYTE[EBX + 7], AH
			je add2phal3
			jmp checkHalWinend
			add2phal1:
				mov AH, [pHal]
				mov BYTE[EBX + 1], AH
				jmp checkHalWinend
			add2phal2:
				mov AH, [pHal]
				mov BYTE[EBX + 4], AH
				jmp checkHalWinend
			add2phal3:
				mov AH, [pHal]
				mov BYTE[EBX + 7], AH
				jmp checkHalWinend
			
thirdcheck:
			mov EDX, 0
			add DL, byte[EBX + 2]
			add DL, byte[EBX + 5]
			add DL, byte[EBX + 8]

			mov CL, 221
			cmp DL, CL
			je thirdInsert
				
			mov CL, 203
			cmp DL, CL
			je thirdInsert
			jmp fourthcheck
		thirdInsert:
			mov AH, [dash]
			cmp BYTE[EBX + 2], AH
			je add3phal1
			cmp BYTE[EBX + 5], AH
			je add3phal2
			cmp BYTE[EBX + 8], AH
			je add3phal3
			jmp checkHalWinend
			add3phal1:
				mov AH, [pHal]
				mov BYTE[EBX + 2], AH
				jmp checkHalWinend
			add3phal2:
				mov AH, [pHal]
				mov BYTE[EBX + 5], AH
				jmp checkHalWinend
			add3phal3:
				mov AH, [pHal]
				mov BYTE[EBX + 8], AH
				jmp checkHalWinend
			
fourthcheck:
			mov EDX, 0
			add DL, byte[EBX]
			add DL, byte[EBX + 1]
			add DL, byte[EBX + 2]

			mov CL, 221
			cmp DL, CL
			je fourthInsert
				
			mov CL, 203
			cmp DL, CL
			je fourthInsert
			jmp fifthcheck
		fourthInsert:
			mov AH, [dash]
			cmp BYTE[EBX], AH
			je add4phal1
			cmp BYTE[EBX + 1], AH
			je add4phal2
			cmp BYTE[EBX + 2], AH
			je add4phal3
			jmp checkHalWinend
			add4phal1:
				mov AH, [pHal]
				mov BYTE[EBX], AH
				jmp checkHalWinend
			add4phal2:
				mov AH, [pHal]
				mov BYTE[EBX + 1], AH
				jmp checkHalWinend
			add4phal3:
				mov AH, [pHal]
				mov BYTE[EBX + 2], AH
				jmp checkHalWinend
	fifthcheck:
			mov EDX, 0
			add DL, byte[EBX + 3]
			add DL, byte[EBX + 4]
			add DL, byte[EBX + 5]

			mov CL, 221
			cmp DL, CL
			je fifthInsert
				
			mov CL, 203
			cmp DL, CL
			je fifthInsert
			jmp sixthcheck
		fifthInsert:
			mov AH, [dash]
			cmp BYTE[EBX + 3], AH
			je add5phal1
			cmp BYTE[EBX + 4], AH
			je add5phal2
			cmp BYTE[EBX + 5], AH
			je add5phal3
			jmp checkHalWinend
			add5phal1:
				mov AH, [pHal]
				mov BYTE[EBX + 3], AH
				jmp checkHalWinend
			add5phal2:
				mov AH, [pHal]
				mov BYTE[EBX + 4], AH
				jmp checkHalWinend
			add5phal3:
				mov AH, [pHal]
				mov BYTE[EBX + 5], AH
				jmp checkHalWinend

	sixthcheck:
			mov EDX, 0
			add DL, byte[EBX + 6]
			add DL, byte[EBX + 7]
			add DL, byte[EBX + 8]

			mov CL, 221
			cmp DL, CL
			je sixthInsert
				
			mov CL, 203
			cmp DL, CL
			je sixthInsert
			jmp seventhcheck
		sixthInsert:
			mov AH, [dash]
			cmp BYTE[EBX + 6], AH
			je add6phal1
			cmp BYTE[EBX + 7], AH
			je add6phal2
			cmp BYTE[EBX + 8], AH
			je add6phal3
			jmp checkHalWinend
			add6phal1:
				mov AH, [pHal]
				mov BYTE[EBX + 6], AH
				jmp checkHalWinend
			add6phal2:
				mov AH, [pHal]
				mov BYTE[EBX + 7], AH
				jmp checkHalWinend
			add6phal3:
				mov AH, [pHal]
				mov BYTE[EBX + 8], AH
				jmp checkHalWinend
	seventhcheck:
			mov EDX, 0
			add DL, byte[EBX]
			add DL, byte[EBX + 4]
			add DL, byte[EBX + 8]

			mov CL, 221
			cmp DL, CL
			je seventhInsert
				
			mov CL, 203
			cmp DL, CL
			je seventhInsert
			jmp eighthcheck
		seventhInsert:
			mov AH, [dash]
			cmp BYTE[EBX], AH
			je add7phal1
			cmp BYTE[EBX + 4], AH
			je add7phal2
			cmp BYTE[EBX + 8], AH
			je add7phal3
			jmp checkHalWinend
			add7phal1:
				mov AH, [pHal]
				mov BYTE[EBX], AH
				jmp checkHalWinend
			add7phal2:
				mov AH, [pHal]
				mov BYTE[EBX + 4], AH
				jmp checkHalWinend
			add7phal3:
				mov AH, [pHal]
				mov BYTE[EBX + 8], AH
				jmp checkHalWinend
	eighthcheck:
			mov EDX, 0
			add DL, byte[EBX + 2]
			add DL, byte[EBX + 4]
			add DL, byte[EBX + 6]

			mov CL, 221
			cmp DL, CL
			je eighthInsert
				
			mov CL, 203
			cmp DL, CL
			je eighthInsert
			jmp randHalMove
		eighthInsert:
			mov AH, [dash]
			cmp BYTE[EBX + 2], AH
			je add8phal1
			cmp BYTE[EBX + 4], AH
			je add8phal2
			cmp BYTE[EBX + 6], AH
			je add8phal3
			jmp randHalMove
			add8phal1:
				mov AH, [pHal]
				mov BYTE[EBX + 2], AH
				jmp checkHalWinend
			add8phal2:
				mov AH, [pHal]
				mov BYTE[EBX + 4], AH
				jmp checkHalWinend
			add8phal3:
				mov AH, [pHal]
				mov BYTE[EBX + 6], AH
				jmp checkHalWinend
	randHalMove:
	    beginnn:	mov AH, [dash]
			mov EBX, data
			mov ECX, [m4]
			cmp BYTE[EBX + ECX], AH
			jne rollM4
			
			jmp enterRandom
		rollM4: call randomizeM4
			jmp beginnn

	   enterRandom: mov AH, [pHal]
			mov BYTE[EBX + ECX], AH
			jmp checkHalWinend

	checkHalWinend:	ret

  

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ HAL SECOND MOVE X
;%^%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NOT IMPLEMENTED/WORKING
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
	HalM2X:		
			mov EBX, data
			mov AL, BYTE[EBX + 4] ;CHECK MID
			cbw
			cwde
			cmp EAX, 88		
			je HalM2XFromMidEdgeLabel ;Move second X if Mid is X and O is edge
		
			
			;jmp CheckHalM2XFromCornerLabel
			
			jmp HalM2Xend
 
	HalM2XFromMidEdgeLabel: 
			call HalM2XFromMidEdge
		;	call HalM2XFromMidCorner
			jmp HalM2Xend
			;call HalM2XFromMidCorner

	CheckHalM2XFromCornerLabel:
		;	call HalM2XFromMidCorner
			jmp HalM2Xend

	HalM2Xend:     
			ret


 ;IF PLAYER MOVES CORNER AFTER COMPUTER MOVES MIDDLE
	HalM2XFromMidCorner:
			mov EBX, data
			mov AL, BYTE[EBX]
			cbw
			cwde
			cmp EAX, 79
			je HalToBRC

			mov AL, BYTE[EBX + 2]
			cbw 
			cwde
			cmp EAX, 79
			je HalToBLC

			mov AL, BYTE[EBX + 6]
			cbw 	
			cwde
			cmp EAX, 79
			je HalToTRC

			mov AL, BYTE[EBX + 8]
			cbw
			cwde
			cmp EAX, 79
			je HalToTLC
			
			jmp HalM2XFromMidCornerend

		HalToBRC: mov AH, [X]
			  mov EBX, data
			  mov BYTE[EBX + 8], AH
			  jmp HalM2XFromMidCornerend

		HalToBLC: mov AH, [X]
			  mov EBX, data
			  mov BYTE[EBX + 6], AH
			  jmp HalM2XFromMidCornerend

		HalToTRC: mov AH, [X]
			  mov EBX, data
			  mov BYTE[EBX + 2], AH
			  jmp HalM2XFromMidCornerend

		HalToTLC: mov AH, [X]
			  mov EBX, data
			  mov BYTE[EBX], AH
			  jmp HalM2XFromMidCornerend

	HalM2XFromMidCornerend: ret



 ;  IF PLAYER MOVES EDGE AFTER COMPUTER MOVES MIDDLE  

	HalM2XFromMidEdge:
			mov EBX, data
			mov AL, BYTE[EBX + 1] ;Check top edge if O
			cbw
			cwde
			cmp EAX, 79
			je topedgeO
			
			mov AL, BYTE[EBX + 3] ;Check left edge if O
			cbw
			cwde
			cmp EAX, 79
			je leftedgeO
			
			mov AL, BYTE[EBX + 5] ;Check right edge if O
			cbw
			cwde
			cmp EAX, 79
			je rightedgeO
		
			mov AL, BYTE[EBX + 7] ;Check bottom edge if O
			cbw
			cwde
			cmp EAX, 79
			je bottomedgeO	
			
	rightedgeO:
			mov AH, [X]
			mov EBX, data
			mov ECX, [m3];m3 can be 0 or 1, if 0 move left, 1 move right
			cmp ECX, 0
			je topleftedger
			
			mov BYTE[EBX + 6], AH
			jmp HalM2XFromMidend
				topleftedger:
					mov BYTE[EBX], AH
					jmp HalM2XFromMidend

	leftedgeO:
			mov AH, [X]
			mov EBX, data
			mov ECX, [m3];m3 can be 0 or 1, if 0 move left, 1 move right
			cmp ECX, 0
			je toprightedgel
			
			mov BYTE[EBX + 8], AH
			jmp HalM2XFromMidend
				toprightedgel:
					mov BYTE[EBX + 2], AH
					jmp HalM2XFromMidend

	bottomedgeO:
			mov AH, [X]
			mov EBX, data
			mov ECX, [m3];m3 can be 0 or 1, if 0 move left, 1 move right
			cmp ECX, 0
			je topleftedgeb
			
			mov BYTE[EBX + 2], AH
			jmp HalM2XFromMidend
				topleftedgeb:
					mov BYTE[EBX], AH
					jmp HalM2XFromMidend


	topedgeO:	
			mov AH, [X]
			mov EBX, data
			mov ECX, [m3];m3 can be 0 or 1, if 0 move left, 1 move right
			cmp ECX, 0
			je bottomleftedget
			
			mov BYTE[EBX + 8], AH
			jmp HalM2XFromMidend
				bottomleftedget:
					mov BYTE[EBX + 6], AH
					jmp HalM2XFromMidend
	HalM2XFromMidend:	ret
			
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ HAL SECOND MOVE END X

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  HAL FIRST MOVE X
	HalFMMiddle:
			push mid
			push format_string
			call printf
			add ESP, 8
	
			mov AH, [X]
			mov EBX, data
			mov BYTE[EBX + 4], AH
			ret

	HalFMCorner:
			push corn
			push format_string
			call printf
			add ESP, 8

			mov EAX, [m2]
			cmp EAX, 0
			je corn1
	
			mov EAX, [m2]
			cmp EAX, 1
			je corn2
			
			mov EAX, [m2]
			cmp EAX, 2
			je corn3
			
			mov EAX, [m2]
			cmp EAX, 3
			je corn4

	corn1:		mov AH, [X]
			mov EBX, data
			mov BYTE[EBX], AH
			jmp endHalFMCorner

	corn2:		mov AH, [X]
			mov EBX, data
			mov BYTE[EBX + 2], AH
			jmp endHalFMCorner
	
	corn3:		mov AH, [X]
			mov EBX, data
			mov BYTE[EBX + 6], AH
			jmp endHalFMCorner
	
	corn4:		mov AH, [X]
			mov EBX, data
			mov BYTE[EBX + 8], AH

	endHalFMCorner:	ret


	HalFMEdge:
			push edg
			push format_string
			call printf
			add ESP, 8
		

			mov EAX, [m2]
			cmp EAX, 0
			je edge1

			mov EAX, [m2] 
			cmp EAX, 1
			je edge2

			mov EAX, [m2]
			cmp EAX, 2
			je edge3
		
			mov EAX, [m2]
			cmp EAX, 3
			je edge4
	
	edge1:		mov AH, [X]
			mov EBX, data
			mov BYTE[EBX + 1], AH
			jmp endHalFMEdge
	
	edge2:		mov AH, [X]
			mov EBX, data
			mov BYTE[EBX + 3], AH
			jmp endHalFMEdge

	edge3:		mov AH, [X]
			mov EBX, data
			mov BYTE[EBX + 5], AH
			jmp endHalFMEdge

	edge4:		mov AH, [X]
			mov EBX, data
			mov BYTE[EBX + 7], AH

	endHalFMEdge:   ret

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ END HAL FIRST MOVE X









		getp2name:
			push promptpvp
			push format_string
			call printf
			add ESP, 8

			push name2
			push format_string
			call scanf
			add ESP, 8
		
			mov EAX, [whoX]
			cmp EAX, 0
			je playerX

			push pO
			push format_string
			call printf
			add ESP, 8

			push name2
			push format_string
			call printf
			add ESP, 8

			push per
			push format_string
			call printf
			add ESP, 8

			jmp cspend

			playerX:
				push pX
				push format_string
				call printf
				add ESP, 8
	
				push name2
				push format_string
				call printf
				add ESP, 8

				push per
				push format_string
				call printf
				add ESP, 8
			.cspend:
				ret


;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& CHECK WIN &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

		checkwin:
		;	call tie
			call row1
			call row2
			call row3
			call col1
			call col2
			call col3
			call dag1
			call dag2
			ret

		tie:	mov EAX, [size]
			cmp EAX, 0
			je tye
			jmp notye
		
		tye:    mov EAX, 68	
			mov [win], EAX

			push tiegame
			push format_string
			push printf
			add ESP, 8
		notye:	ret
	



		row1:   mov EAX, [X]
			mov EBX, data
			mov EDX, 0

			add DL, byte[EBX]
			add DL, byte[EBX + 1]
			add DL, byte[EBX + 2]

			mov CL, 8	;8 = ASCI OF X + X + X
			cmp DL, CL
			je xwin
	
			mov CL, 237    ;237 = ASCI OF O + O + O
			cmp DL, CL
			je owin
			
			jmp retuuurn


		xwin:   call xwins
			jmp retuuurn
		owin:   call owins	
	retuuurn:	ret




		row2:   mov EAX, [X]
			mov EBX, data
			mov EDX, 0

			add DL, byte[EBX + 3]
			add DL, byte[EBX + 4]
			add DL, byte[EBX + 5]

			mov CL, 8
			cmp DL, CL
			je xwin
	
			mov CL, 237
			cmp DL, CL
			je owin
			
			jmp retuuurn


		.xwin:   call xwins
			jmp retuuurn
		.owin:   call owins	
	.retuuurn:	ret
			

		row3:   mov EAX, [X]
			mov EBX, data
			mov EDX, 0

			add DL, byte[EBX + 6]
			add DL, byte[EBX + 7]
			add DL, byte[EBX + 8]

			mov CL, 8
			cmp DL, CL
			je xwin
	
			mov CL, 237
			cmp DL, CL
			je owin
			
			jmp retuuurn


		.xwin:   call xwins
			jmp retuuurn
		.owin:   call owins	
	.retuuurn:	ret
			

		col1:   mov EAX, [X]
			mov EBX, data
			mov EDX, 0

			add DL, byte[EBX]
			add DL, byte[EBX + 3]
			add DL, byte[EBX + 6]

			mov CL, 8
			cmp DL, CL
			je xwin
	
			mov CL, 237
			cmp DL, CL
			je owin
			
			jmp retuuurn


		.xwin:   call xwins
			jmp retuuurn
		.owin:   call owins	
	.retuuurn:	ret
			
		
		col2:   mov EAX, [X]
			mov EBX, data
			mov EDX, 0

			add DL, byte[EBX + 1]
			add DL, byte[EBX + 4]
			add DL, byte[EBX + 7]

			mov CL, 8
			cmp DL, CL
			je xwin
	
			mov CL, 237
			cmp DL, CL
			je owin
			
			jmp retuuurn


		.xwin:   call xwins
			jmp retuuurn
		.owin:   call owins	
	.retuuurn:	ret
			

		col3:   mov EAX, [X]
			mov EBX, data
			mov EDX, 0

			add DL, byte[EBX + 2]
			add DL, byte[EBX + 5]
			add DL, byte[EBX + 8]

			mov CL, 8
			cmp DL, CL
			je xwin
	
			mov CL, 237
			cmp DL, CL
			je owin
			
			jmp retuuurn


		.xwin:   call xwins
			jmp retuuurn
		.owin:   call owins	
	.retuuurn:	ret
			

		dag1:   mov EAX, [X]
			mov EBX, data
			mov EDX, 0

			add DL, byte[EBX]
			add DL, byte[EBX + 4]
			add DL, byte[EBX + 8]

			mov CL, 8
			cmp DL, CL
			je xwin
	
			mov CL, 237
			cmp DL, CL
			je owin
			
			jmp retuuurn


		.xwin:   call xwins
			jmp retuuurn
		.owin:   call owins	
	.retuuurn:	ret
			
	
		dag2:   mov EAX, [X]
			mov EBX, data
			mov EDX, 0

			add DL, byte[EBX + 2]
			add DL, byte[EBX + 4]
			add DL, byte[EBX + 6]

			mov CL, 8
			cmp DL, CL
			je xwin
	
			mov CL, 237
			cmp DL, CL
			je owin
			jmp retuuurn


		.xwin:   call xwins
			jmp retuuurn
		.owin:   call owins	
	.retuuurn:	ret
			

		xwins:
			push xwinner
			push format_string
			call printf
			add ESP, 8
		
			mov EAX, 69
			mov [win], EAX
			ret

		owins:
			push owinner
			push format_string
			call printf
			add ESP, 8
			
			mov EAX, 70
			mov [win], EAX
			ret

;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&END CHECK WIN &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	print_board:
			mov EBX, data

			push clear
			call printf
			add ESP, 4

			call board_bar
			call box1
			call box2
			call box3
			call board_bar
			call box4
			call box5
			call box6
			call board_bar
			call box7
			call box8
			call box9
			call board_bar

			ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	board_bar:

	
			push	tobp
			push	format_string
			call	printf
			add	ESP, 8
	
			ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	box1:
			;CHECK FOR 'X' 
			mov AH, [X]
			cmp BYTE[EBX], AH
			je printX	

			mov AH, [O]
			cmp BYTE[EBX], AH
			je printO

			mov AH, [dash]
			cmp BYTE[EBX], AH
			je printempty



		printX:		;SECOND X IS LITERALLY X
				push secondX
				push format_string
				call printf
				add ESP, 8
				jmp endd			

		printO:		;WHAT THE FUCK THIS IS O
				push Y
				push format_string	
				call printf
				add ESP,8 
				jmp endd
	

		printempty:
				push space1
				push format_string
				call printf
				add ESP, 8
				jmp endd


		endd:
			ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	box4:		mov AH, [X]
			cmp BYTE[EBX + 3], AH
			je printX

			mov AH, [O]
			cmp BYTE[EBX + 3], AH
			je printO

			mov AH, [dash]
			cmp BYTE[EBX + 3], AH
			je printempty
		
		.printX:		
				push secondX
				push format_string
				call printf
				add ESP, 8
				jmp endd

				
		.printO:	push Y
				push format_string
				call printf
				add ESP, 8
				jmp endd

		.printempty:
				push space1
				push format_string
				call printf
				add ESP, 8
				jmp endd


		.endd:		ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	box9:
			mov	AH, [X]
			cmp	BYTE[EBX + 8], AH
			je	printX9

			mov	AH, [O]
			cmp	BYTE[EBX + 8], AH
			je	printO9

			mov	AH, [dash]
			cmp	BYTE[EBX + 8], AH
			je	printempty9

		printX9:
				call nine_boxX
				jmp endd9 

		printO9:	
				call nine_boxO				
				jmp endd9

		printempty9:
				call nine_boxE
				jmp endd9




		endd9:		
				ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	nine_boxE:

			push 	c
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4

			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8
		
			push	c1
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4
			
			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8	

			push	c2
			call	printf
			add	ESP, 4
			
			push	frtc
			call	printf
			add	ESP, 4
			
	
			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8

			push	c3
			call	printf
			add	ESP, 4
	
			push	frtc
			call	printf
			add	ESP, 4

			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8

			push	c4
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4

			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	nine_boxO:

			push 	c
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4

			push	ob1
			push	format_string
			call	printf
			add	ESP, 8
		
			push	c1
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4
			
			push	ob2
			push	format_string
			call	printf
			add	ESP, 8	

			push	c2
			call	printf
			add	ESP, 4
			
			push	frtc
			call	printf
			add	ESP, 4
			
	
			push	ob3
			push	format_string
			call	printf
			add	ESP, 8

			push	c3
			call	printf
			add	ESP, 4
	
			push	frtc
			call	printf
			add	ESP, 4

			push	ob2
			push	format_string
			call	printf
			add	ESP, 8

			push	c4
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4

			push	ob1
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	nine_boxX:

			push 	c
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4

			push	xb3
			push	format_string
			call	printf
			add	ESP, 8
		
			push	c1
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4
			
			push	xb2
			push	format_string
			call	printf
			add	ESP, 8	

			push	c2
			call	printf
			add	ESP, 4
			
			push	frtc
			call	printf
			add	ESP, 4
			
	
			push	xb1
			push	format_string
			call	printf
			add	ESP, 8

			push	c3
			call	printf
			add	ESP, 4
	
			push	frtc
			call	printf
			add	ESP, 4

			push	xb2
			push	format_string
			call	printf
			add	ESP, 8

			push	c4
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4

			push	xb3
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	box8:		mov AH, [X]
			cmp BYTE[EBX + 7], AH
			je printX8

			mov AH, [O]
			cmp BYTE[EBX + 7], AH
			je printO8

			mov AH, [dash]
			cmp BYTE[EBX + 7], AH
			je printempty8
		
		printX8:		
				call eight_boxX
				jmp endd8

				
		printO8:	call eight_boxO
				jmp endd8

		printempty8:
				call eight_boxE
				jmp endd8


		endd8:		ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	eight_boxE:

			push 	c
			call	printf
			add	ESP, 4
		
			push	sb1
			call	printf
			add	ESP, 4

			push	barspace
			push	format_string
			call	printf
			add	ESP, 8
		
			push	c1
			call	printf
			add	ESP, 4
		
			push	sb1
			call	printf
			add	ESP, 4
			
			push	barspace
			push	format_string
			call	printf
			add	ESP, 8	

			push	c2
			call	printf
			add	ESP, 4
			
			push	sb1
			call	printf
			add	ESP, 4
			
	
			push	barspace
			push	format_string
			call	printf
			add	ESP, 8

			push	c3
			call	printf
			add	ESP, 4
	
			push	sb1
			call	printf
			add	ESP, 4

			push	barspace
			push	format_string
			call	printf
			add	ESP, 8

			push	c4
			call	printf
			add	ESP, 4
		
			push	sb1
			call	printf
			add	ESP, 4

			push	barspace
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	eight_boxX:

			push 	c
			call	printf
			add	ESP, 4
		
			push	sb1
			call	printf
			add	ESP, 4

			push	xb3
			push	format_string
			call	printf
			add	ESP, 8
		
			push	c1
			call	printf
			add	ESP, 4
		
			push	sb1
			call	printf
			add	ESP, 4
			
			push	xb2
			push	format_string
			call	printf
			add	ESP, 8	

			push	c2
			call	printf
			add	ESP, 4
			
			push	sb1
			call	printf
			add	ESP, 4
			
	
			push	xb1
			push	format_string
			call	printf
			add	ESP, 8

			push	c3
			call	printf
			add	ESP, 4
	
			push	sb1
			call	printf
			add	ESP, 4

			push	xb2
			push	format_string
			call	printf
			add	ESP, 8

			push	c4
			call	printf
			add	ESP, 4
		
			push	sb1
			call	printf
			add	ESP, 4

			push	xb3
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	eight_boxO:


			push 	c
			call	printf
			add	ESP, 4
		
			push	sb1
			call	printf
			add	ESP, 4

			push	ob1
			push	format_string
			call	printf
			add	ESP, 8
		
			push	c1
			call	printf
			add	ESP, 4
		
			push	sb1
			call	printf
			add	ESP, 4
			
			push	ob2
			push	format_string
			call	printf
			add	ESP, 8	

			push	c2
			call	printf
			add	ESP, 4
			
			push	sb1
			call	printf
			add	ESP, 4
			
	
			push	ob3
			push	format_string
			call	printf
			add	ESP, 8

			push	c3
			call	printf
			add	ESP, 4
	
			push	sb1
			call	printf
			add	ESP, 4

			push	ob2
			push	format_string
			call	printf
			add	ESP, 8

			push	c4
			call	printf
			add	ESP, 4
		
			push	sb1
			call	printf
			add	ESP, 4

			push	ob1
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	
	box7:		mov AH, [X]
			cmp BYTE[EBX + 6], AH
			je printX

			mov AH, [O]
			cmp BYTE[EBX + 6], AH
			je printO

			mov AH, [dash]
			cmp BYTE[EBX + 6], AH
			je printempty
		
		.printX:		
				push secondX
				push format_string
				call printf
				add ESP, 8
				jmp endd

				
		.printO:	push Y
				push format_string
				call printf
				add ESP, 8
				jmp endd

		.printempty:
				push space1
				push format_string
				call printf
				add ESP, 8
				jmp endd


		.endd:		ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	box6:
			mov	AH, [X]
			cmp	BYTE[EBX + 5], AH
			je	printX6

			mov	AH, [O]
			cmp	BYTE[EBX + 5], AH
			je	printO6

			mov	AH, [dash]
			cmp	BYTE[EBX + 5], AH
			je	printempty6

		printX6:
				call six_boxX
				jmp endd6 

		printO6:	
				call six_boxO				
				jmp endd6

		printempty6:
				call six_boxE
				jmp endd6




		endd6:		
				ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	six_boxE:

			push 	b
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4

			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8
		
			push	b1
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4
			
			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8	

			push	b2
			call	printf
			add	ESP, 4
			
			push	frtc
			call	printf
			add	ESP, 4
			
	
			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8

			push	b3
			call	printf
			add	ESP, 4
	
			push	frtc
			call	printf
			add	ESP, 4

			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8

			push	b4
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4

			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	six_boxX:

			push 	b
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4

			push	xb3
			push	format_string
			call	printf
			add	ESP, 8
		
			push	b1
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4
			
			push	xb2
			push	format_string
			call	printf
			add	ESP, 8	

			push	b2
			call	printf
			add	ESP, 4
			
			push	frtc
			call	printf
			add	ESP, 4
			
	
			push	xb1
			push	format_string
			call	printf
			add	ESP, 8

			push	b3
			call	printf
			add	ESP, 4
	
			push	frtc
			call	printf
			add	ESP, 4

			push	xb2
			push	format_string
			call	printf
			add	ESP, 8

			push	b4
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4

			push	xb3
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	six_boxO:

			push 	b
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4

			push	ob1
			push	format_string
			call	printf
			add	ESP, 8
		
			push	b1
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4
			
			push	ob2
			push	format_string
			call	printf
			add	ESP, 8	

			push	b2
			call	printf
			add	ESP, 4
			
			push	frtc
			call	printf
			add	ESP, 4
			
	
			push	ob3
			push	format_string
			call	printf
			add	ESP, 8

			push	b3
			call	printf
			add	ESP, 4
	
			push	frtc
			call	printf
			add	ESP, 4

			push	ob2
			push	format_string
			call	printf
			add	ESP, 8

			push	b4
			call	printf
			add	ESP, 4
		
			push	frtc
			call	printf
			add	ESP, 4

			push	ob1
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	box2:
			mov	AH, [X]
			cmp	BYTE[EBX + 1], AH
			je	printX2

			mov	AH, [O]
			cmp	BYTE[EBX + 1], AH
			je	printO2

			mov	AH, [dash]
			cmp	BYTE[EBX + 1], AH
			je	printempty2

		printX2:
				call second_boxX
				jmp endd2 

		printO2:	
				call second_boxO				
				jmp endd2

		printempty2:
				call second_boxE
				jmp endd2




		endd2:		
				ret

			

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	box3:
			mov	AH, [X]
			cmp	BYTE[EBX + 2], AH
			je	printX3

			mov	AH, [O]
			cmp	BYTE[EBX + 2], AH
			je	printO3

			mov	AH, [dash]
			cmp	BYTE[EBX + 2], AH
			je	printempty3

		printX3:
				call third_boxX
				jmp endd3

		printO3:	
				call third_boxO				
				jmp endd3

		printempty3:
				call third_boxE
				jmp endd3




		endd3:		
				ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	box5:
			mov	AH, [X]
			cmp	BYTE[EBX + 4], AH
			je	printX5

			mov	AH, [O]
			cmp	BYTE[EBX + 4], AH
			je	printO5

			mov	AH, [dash]
			cmp	BYTE[EBX + 4], AH
			je	printempty5

		printX5:
				call five_boxX
				jmp endd5

		printO5:	
				call five_boxO				
				jmp endd5

		printempty5:
				call five_boxE
				jmp endd5




		endd5:		
				ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	five_boxE:

			push 	b
			call	printf
			add	ESP, 4
		
			push	sbc
			call	printf
			add	ESP, 4

			push	barspace
			push	format_string
			call	printf
			add	ESP, 8
		
			push	b1
			call	printf
			add	ESP, 4
		
			push	sbc
			call	printf
			add	ESP, 4
			
			push	barspace
			push	format_string
			call	printf
			add	ESP, 8	

			push	b2
			call	printf
			add	ESP, 4
			
			push	sbc
			call	printf
			add	ESP, 4
			
	
			push	barspace
			push	format_string
			call	printf
			add	ESP, 8

			push	b3
			call	printf
			add	ESP, 4
	
			push	sbc
			call	printf
			add	ESP, 4

			push	barspace
			push	format_string
			call	printf
			add	ESP, 8

			push	b4
			call	printf
			add	ESP, 4
		
			push	sbc
			call	printf
			add	ESP, 4

			push	barspace
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	five_boxO:

			push 	b
			call	printf
			add	ESP, 4
		
			push	sbc
			call	printf
			add	ESP, 4

			push	ob1
			push	format_string
			call	printf
			add	ESP, 8
		
			push	b1
			call	printf
			add	ESP, 4
		
			push	sbc
			call	printf
			add	ESP, 4
			
			push	ob2
			push	format_string
			call	printf
			add	ESP, 8	

			push	b2
			call	printf
			add	ESP, 4
			
			push	sbc
			call	printf
			add	ESP, 4
			
	
			push	ob3
			push	format_string
			call	printf
			add	ESP, 8

			push	b3
			call	printf
			add	ESP, 4
	
			push	sbc
			call	printf
			add	ESP, 4

			push	ob2
			push	format_string
			call	printf
			add	ESP, 8

			push	b4
			call	printf
			add	ESP, 4
		
			push	sbc
			call	printf
			add	ESP, 4

			push	ob1
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	five_boxX:

			push 	b
			call	printf
			add	ESP, 4
		
			push	sbc
			call	printf
			add	ESP, 4

			push	xb3
			push	format_string
			call	printf
			add	ESP, 8
		
			push	b1
			call	printf
			add	ESP, 4
		
			push	sbc
			call	printf
			add	ESP, 4
			
			push	xb2
			push	format_string
			call	printf
			add	ESP, 8	

			push	b2
			call	printf
			add	ESP, 4
			
			push	sbc
			call	printf
			add	ESP, 4
			
	
			push	xb1
			push	format_string
			call	printf
			add	ESP, 8

			push	b3
			call	printf
			add	ESP, 4
	
			push	sbc
			call	printf
			add	ESP, 4

			push	xb2
			push	format_string
			call	printf
			add	ESP, 8

			push	b4
			call	printf
			add	ESP, 4
		
			push	sbc
			call	printf
			add	ESP, 4

			push	xb3
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	second_boxO:

			push 	sb
			call	printf
			add	ESP, 4
		
			push	sb1
			call	printf
			add	ESP, 4

			push	firstY
			push	format_string
			call	printf
			add	ESP, 8
		
			push	sbr
			call	printf
			add	ESP, 4
		
			push	sbc
			call	printf
			add	ESP, 4
			
			push	secondY
			push	format_string
			call	printf
			add	ESP, 8	

			push	sbr1
			call	printf
			add	ESP, 4
			
			push	sbc1
			call	printf
			add	ESP, 4
			
	
			push	thirdY
			push	format_string
			call	printf
			add	ESP, 8

			push	sbr2
			call	printf
			add	ESP, 4
	
			push	sbc2
			call	printf
			add	ESP, 4

			push	secondY
			push	format_string
			call	printf
			add	ESP, 8

			push	sbr3
			call	printf
			add	ESP, 4
		
			push	sbc3
			call	printf
			add	ESP, 4

			push	firstY
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	second_boxX:
			push 	sb
			call	printf
			add	ESP, 4
		
			push	sb1
			call	printf
			add	ESP, 4

			push	firstX
			push	format_string
			call	printf
			add	ESP, 8
		
			push	sbr
			call	printf
			add	ESP, 4
		
			push	sbc
			call	printf
			add	ESP, 4
			
			push	thirdX
			push	format_string
			call	printf
			add	ESP, 8	

			push	sbr1
			call	printf
			add	ESP, 4
			
			push	sbc1
			call	printf
			add	ESP, 4
			
	
			push	forthX
			push	format_string
			call	printf
			add	ESP, 8

			push	sbr2
			call	printf
			add	ESP, 4
	
			push	sbc2
			call	printf
			add	ESP, 4

			push	thirdX
			push	format_string
			call	printf
			add	ESP, 8

			push	sbr3
			call	printf
			add	ESP, 4
		
			push	sbc3
			call	printf
			add	ESP, 4

			push	firstX
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
second_boxE:
			push 	sb
			call	printf
			add	ESP, 4
		
			push	sb1
			call	printf
			add	ESP, 4

			push	barspace
			push	format_string
			call	printf
			add	ESP, 8
		
			push	sbr
			call	printf
			add	ESP, 4
		
			push	sbc
			call	printf
			add	ESP, 4
			
			push	barspace
			push	format_string
			call	printf
			add	ESP, 8	

			push	sbr1
			call	printf
			add	ESP, 4
			
			push	sbc1
			call	printf
			add	ESP, 4
			
	
			push	barspace
			push	format_string
			call	printf
			add	ESP, 8

			push	sbr2
			call	printf
			add	ESP, 4
	
			push	sbc2
			call	printf
			add	ESP, 4

			push	barspace
			push	format_string
			call	printf
			add	ESP, 8

			push	sbr3
			call	printf
			add	ESP, 4
		
			push	sbc3
			call	printf
			add	ESP, 4

			push	barspace
			push	format_string
			call	printf
			add	ESP, 8
	
			push 	space
			push 	format_string
			call 	printf
			add     ESP, 8
	
			ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	third_boxX:

			push	sb
			call	printf
			add	ESP, 4

			push	frtc
			call	printf
			add	ESP, 4

			push	xb3
			push	format_string
			call	printf
			add	ESP, 8

			push	sbr
			call	printf
			add	ESP, 4
			
			push	frtc
			call	printf
			add	ESP, 4

			push	xb2
			push	format_string
			call	printf
			add	ESP, 8

			push 	sbr1
			call	printf
			add	ESP, 4
			
			push	frtc
			call	printf
			add	ESP, 4

			push	xb1
			push	format_string
			call	printf
			add	ESP, 8

			push	sbr2
			call	printf
			add	ESP, 4

			push	frtc
			call	printf
			add	ESP, 4
			
			push	xb2
			push	format_string
			call	printf
			add	ESP, 8


			push	sbr3
			call	printf
			add	ESP, 4

			push	frtc
			call	printf
			add	ESP, 4

						
			push	xb3
			push	format_string
			call	printf
			add	ESP, 8

			push	space
			push	format_string
			call	printf
			add	ESP, 8

			ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	third_boxO:

			push	sb
			call	printf
			add	ESP, 4

			push	frtc
			call	printf
			add	ESP, 4

			push	ob1
			push	format_string
			call	printf
			add	ESP, 8

			push	sbr
			call	printf
			add	ESP, 4
			
			push	frtc
			call	printf
			add	ESP, 4

			push	ob2
			push	format_string
			call	printf
			add	ESP, 8

			push 	sbr1
			call	printf
			add	ESP, 4
			
			push	frtc
			call	printf
			add	ESP, 4

			push	ob3
			push	format_string
			call	printf
			add	ESP, 8

			push	sbr2
			call	printf
			add	ESP, 4

			push	frtc
			call	printf
			add	ESP, 4
			
			push	ob2
			push	format_string
			call	printf
			add	ESP, 8


			push	sbr3
			call	printf
			add	ESP, 4

			push	frtc
			call	printf
			add	ESP, 4

						
			push	ob1
			push	format_string
			call	printf
			add	ESP, 8

			push	space
			push	format_string
			call	printf
			add	ESP, 8

			ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

third_boxE:

			push	sb
			call	printf
			add	ESP, 4

			push	frtc
			call	printf
			add	ESP, 4

			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8

			push	sbr
			call	printf
			add	ESP, 4
			
			push	frtc
			call	printf
			add	ESP, 4

			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8

			push 	sbr1
			call	printf
			add	ESP, 4
			
			push	frtc
			call	printf
			add	ESP, 4

			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8

			push	sbr2
			call	printf
			add	ESP, 4

			push	frtc
			call	printf
			add	ESP, 4
			
			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8


			push	sbr3
			call	printf
			add	ESP, 4

			push	frtc
			call	printf
			add	ESP, 4

						
			push	barspacebar
			push	format_string
			call	printf
			add	ESP, 8

			push	space
			push	format_string
			call	printf
			add	ESP, 8

			ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;












;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





