;
;
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;
;
;	Name: Alex Molbert

;	File-name: tic
;	To compile: nasm -f elf 32 'file-name'.asm  THEN  gcc -m32 'file-name'.o -o 'exe-name'
;	To Save and Exit:  ':x'
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

		
		hal:           db  "Hal", 0
	
		whoX:          dd  0
	
		pX:            db  "You are player X this game.", 10, 0
		pO:            db  "You are player O this game.", 10, 0
		gameStart:     db  "Game ", 0
		gameStart2:    db  ", START!",10, 0
		gamenum:       dd  0
		askname:       db "Please enter your name: ", 0
	
		data:          db "---------", 0		
		datanl:        db "---, 10, ---, 10, ---", 0
		index:         dd 0
		size:          dd 9

		move:          db  "Please make your move, ", 0 
			
		X:             dd  "X", 0
		O:             dd  "O", 0
		col:           db ": ", 0

		askagain       db "Do you want to play another game? (1 To play again|2 to quit program) ", 0
		no:  	       db "no"
		nol:   equ $ - no
		yes:           db "yes"
		yesl:  equ $ - yes
		wronginputReplay:   db "Please enter either the number 1 or 2. Remember.. 1 to play again, 2 to quit the program. ", 0
		done:          db "Exiting Program ", 0
		space:			db	10, 0
		;format "%s" for string, used in scanf / printf
		format_string:		db	"%s", 0
		;format "d" for int, used in scanf / printf
		format_int:		db	"%d", 0
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
	;Section for uninitialized data
	SECTION	.bss
			
		name    resb 100
		replaychoice resb 4
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
		

		main:
			call getUserName
			call chooseStartPlayer
	;		call movefirst
	s:		call startGame   		
			call playagain
	ss:		mov EAX, [replaychoice]
			cmp EAX, 1
			je s
			
			cmp EAX, 2
			jne reenter
			call finished
				
			
						


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
	
		chooseStartPlayer:
			RDTSC
			mov EDX, 0
			mov ECX, 2
			idiv ECX
			mov EAX, EDX
			mov [whoX], EAX
			
			cmp EAX, 0
			je playerO
			
			push pX
			push format_string
			call printf
			add ESP, 8
			jmp cspend

			playerO:
				push pO
				push format_string
				call printf
				add ESP, 8
			cspend:
				ret



		startGame:
			mov EAX, [gamenum]
			inc EAX
			mov [gamenum], EAX
			
			
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

	       mremain:	call playerMove
			
			mov EAX, [size]
			dec EAX
			mov [size], EAX
			cmp EAX, 0
			jg mremain 
			mov EAX, 9
			mov [size], EAX
			ret



		playerMove:
			push move
			push format_string
			call printf
			add  ESP, 8

			push name
			push format_string
			call printf
			add  ESP, 8
			
			push col
			push format_string
			call printf
			add ESP, 8

			push index
			push format_int
			call scanf
			add ESP, 8
			
			mov EBX, data		
			mov EAX, [whoX]
			mov EDX, [index]
			cmp EAX, 0
			je addO

			;ADD X
			mov AH, [X]
			mov byte[EBX + EdX -1], AH	
			jmp pmend

		addO:   mov AH, [O]
			mov byte[EBX + EDX -1], AH

		pmend:	call printdata
			ret
		

		
		printdata:
			push data
			push format_string
			call printf
			add ESP, 8
		;	call printboard
	
			push datanl
			push format_string
			call printf
			add ESP, 8
			ret		

					


		printboard:
			


		playagain:
			push askagain
			push format_string	
			call printf
			add ESP, 8
		
			push replaychoice
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

			push replaychoice
			push format_int
			call scanf
			add ESP, 8
			jmp ss
