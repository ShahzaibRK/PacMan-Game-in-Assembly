;Shahzaib Khan 

include Irvine32.inc
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

;Macro to convert integer to string
int_to_string macro score

	mov eax, score
	mov ecx, 10
	mov ebx, 0
	mov edx, 0
	div ecx
	add edx, 48
	push edx
	mov edx, 0
	div ecx
	add edx, 48
	push edx
	mov edx, 0
	div ecx
	add edx, 48

	push edx

endm




.data
 
ground BYTE "------------------------------------------------------------------------------------------------------------------------", 0 ;120
sidewall BYTE "|                                                                                                                      |", 0


;initial_pacman BYTE "						______  ___  ________  ___ ___  _   _ ",0
	;	pc1 byte    "			           | ___ \/ _ \/  __ \  \/  |/ _ \| \ | | ",0
	;	pc2 byte	"			           | |_/ / /_\ \ /  \/ .  . / /_\ \  \| | ",0
	;	pc3 byte	"			           |  __/|  _  | |   | |\/| |  _  | . ` | ",0
	;	pc4 byte	"			           | |   | | | | \__/\ |  | | | | | |\  | ",0
;		pc5 byte	"		               \_|   \_| |_/\____|_|  |_|_| |_|_| \_/ ",0
                   
		

pc1 byte"   _______     _        ______  ____    ____       _       ____  _____  ",0
pc2 byte"  |_   __ \   / \     .' ___  ||_   \  /   _|     / \     |_   \|_   _| ",0 
pc3 byte"    | |__) | / _ \   / .'   \_|  |   \/   |      / _ \      |   \ | |   ",0   
pc4 byte"    |  ___/ / ___ \  | |         | |\  /| |     / ___ \     | |\ \| |   ",0   
pc5 byte"   _| |_  _/ /   \ \_\ `.___.'\ _| |_\/_| |_  _/ /   \ \_  _| |_\   |_  ",0  
pc6 byte"  |_____||____| |____|`.____ .'|_____||_____||____| |____||_____|\____| ",0 
                                                                      

                                      
 

display1 Byte "Enter your Name: ", 0
player_name db  100 dup(?)


display2 byte "Press s to START, Press i to view instructions, Press o to view Settings, Press e to EXIT", 0
;Displaying Start 


s1 byte"										           ",0ah,0dh	
   byte"			         _____ _____ ___ ______ _____  ",0ah,0dh
   byte"			        /  ___|_   _/ _ \| ___ \_   _| ",0ah,0dh
   byte"			        \ `--.  | |/ /_\ \ |_/ / | |   ",0ah,0dh
   byte"			         `--. \ | ||  _  |    /  | |   ",0ah,0dh
   byte"			        /\__/ / | || | | | |\ \  | |   ",0ah,0dh
   byte"			        \____/  \_/\_| |_|_| \_| \_/   ",0
                              
                              




;Displaying Instructions button

ins2 byte"	                           _____          _                   _   _                   ",0ah,0dh
	 byte"		                  |_   _|        | |                 | | (_)                  ",0ah,0dh
	 byte"		                    | | _ __  ___| |_ _ __ _   _  ___| |_ _  ___  _ __  ___   ",0ah,0dh
	 byte"		                    | || '_ \/ __| __| '__| | | |/ __| __| |/ _ \| '_ \/ __|  ",0ah,0dh
	 byte"		                   _| || | | \__ \ |_| |  | |_| | (__| |_| | (_) | | | \__ \  ",0ah,0dh
	 byte"		                   \___/_| |_|___/\__|_|   \__,_|\___|\__|_|\___/|_| |_|___/  ",0
                                                          
                                                        

gm1 byte "       _____   ___  ___  ___ _____  _____  _   _  _____ ______	",0ah,0dh
	byte "	 	|  __ \ / _ \ |  \/  ||  ___||  _  || | | ||  ___|| ___ \   ",0ah,0dh
	byte "		| |  \// /_\ \| .  . || |__  | | | || | | || |__  | |_/ /   ",0ah,0dh
	byte "		| | __ |  _  || |\/| ||  __| | | | || | | ||  __| |    /    ",0ah,0dh
	byte "		| |_\ \| | | || |  | || |___ \ \_/ /\ \_/ /| |___ | |\ \    ",0ah,0dh
	byte "		 \____/\_| |_/\_|  |_/\____/  \___/  \___/ \____/ \_| \_|   ",0
   


exit1 byte "				   _____ __   __ _____  _____		",0ah,0dh
      byte "			      |  ___|\ \ / /|_   _||_   _|    ",0ah,0dh
      byte "				  | |__   \ V /   | |    | |      ",0ah,0dh
      byte "				  |  __|  /   \   | |    | |      ",0ah,0dh
      byte "				  | |___ / /^\ \ _| |_   | |      ",0ah,0dh
      byte "				  \____/ \/   \/ \___/   \_/      ",0
                            
   
	  
set1 byte "			         _____  _____  _____  _____  _____  _   _  _____  _____	 ",0ah,0dh	
	 byte "			        /  ___||  ___||_   _||_   _||_   _|| \ | ||  __ \/  ___| ",0ah,0dh
	 byte "			        \ `--. | |__    | |    | |    | |  |  \| || |  \/\ `--.  ",0ah,0dh 
	 byte "			         `--. \|  __|   | |    | |    | |  | . ` || | __  `--. \ ",0ah,0dh
	 byte "			        /\__/ /| |___   | |    | |   _| |_ | |\  || |_\ \/\__/ / ",0ah,0dh
	 byte "			        \____/ \____/   \_/    \_/   \___/ \_| \_/ \____/\____/  ",0
                                                        
                                                        

	
win byte "			__   __ _____  _   _   _    _  _____  _   _	",0ah,0dh
	byte "  		\ \ / /|  _  || | | | | |  | ||  _  || \ | |",0ah,0dh
	byte "	    	 \ V / | | | || | | | | |  | || | | ||  \| |",0ah,0dh
	byte "		      \ /  | | | || | | | | |/\| || | | || . ` |",0ah,0dh
	byte "		      | |  \ \_/ /| |_| | \  /\  /\ \_/ /| |\  |",0ah,0dh
	byte "		      \_/   \___/  \___/   \/  \/  \___/ \_| \_/",0
                                            
                                            

                                                         








;displaying Instructions
instructions BYTE			"		Instructions: ",0
i1 byte						"		1. Use W,A,S,D to move the player",0
i2 byte						"		2. Press P to pause the game",0
i3 byte						"		3. Press R to resume the game",0
i4 byte						"		4. Press X to exit the game",0
exitins byte "Press e to exit", 0


pausedisplay Byte "Press R to resume",0
	
p0 Byte	    "						______   ___   _   _  _____  _____     ",0
p1 Byte	    "						| ___ \ / _ \ | | | |/  ___||  ___|    ",0
p2 Byte	    "						| |_/ // /_\ \| | | |\ `--. | |__      ",0
p3 Byte	    "						|  __/ |  _  || | | | `--. \|  __|     ",0   
p4 Byte	    "						| |    | | | || |_| |/\__/ /| |___     ",0     
p5 Byte	    "						\_|    \_| |_/ \___/ \____/ \____/     ",0  
                                   
;bonuses:
auto_movement db 0
movement_change_message db "Press 1 to enable auto_movement,                          Press 2 to disable auto_movement",0
change_color_message db "Press c to Customize the Background Color of the game", 0
colors_range db "0-Black  1-Blue  2-Green  3-Cyan  4-red  5-Magenta  6-Brown  7-lightGray  8-Gray  9-LightBlue  10-lightGreen  11-LightCyan  12-LightRed  13-LightMagenta  14-Yellow  15-White",0
change_color db "Press 1-15 to set foreground color: ", 0
change_color2 db "Press 1-15 to set background color: ", 0
f_color dd 0
b_color dd 0


strScore BYTE "Your score is: ",0
score dd 0

endname byte "NAME: ",0
endscore byte "SCORE: ", 0

maze1 db 30 dup('-'),0
maze2 db  "|                                                                                         |",0 ;90
maze2_1 db "|                              |",0 ;30

maze2_2 db "|",0
itercount db 2

COMMENT @
points byte "                                                                                                                       ",0ah,0dh
       byte ".......................................................................................................................",0ah,0dh
	   byte "                                                                                                                       ",0ah,0dh
       byte "                                                                                                                       ",0ah,0dh                             
	   byte ".......................................................................................................................",0ah,0dh
	   byte ".......................................................................................................................",0ah,0dh
	   byte "                                                                                                                       ",0ah,0dh
	   byte ".......................................................................................................................",0ah,0dh
       byte "                                                                                                                       ",0ah,0dh
	   byte ".......................................................................................................................",0ah,0dh
	   byte ".......................................................................................................................",0ah,0dh
	   byte "                                                                                                                       ",0ah,0dh
	   byte "                                                                                                                       ",0ah,0dh
	   byte ".......................................................................................................................",0ah,0dh
	   byte "                                                                                                                       ",0ah,0dh
	   byte "                                                                                                                       ",0ah,0dh
	   byte ".......................................................................................................................",0ah,0dh
	   byte ".......................................................................................................................",0ah,0dh
	   byte "                                                                                                                       ",0ah,0dh
	   byte ".......................................................................................................................",0ah,0dh
	   byte "                                                                                                                       ",0ah,0dh
	   byte "                                                                                                                       ",0ah,0dh
	   byte ".......................................................................................................................",0ah,0dh
	   byte ".......................................................................................................................",0ah,0dh
	   byte "                                                                                                                       ",0ah,0dh
	   byte ".......................................................................................................................",0ah,0dh
	   byte "                                                                                                                       ",0
@

points  byte "                                                                                                                        ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte ".  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte ".                                                                                                                       ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte ".  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte ".                                                                                                                       ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte ".  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte ".                                                                                                                       ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte ".  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte ".                                                                                                                       ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte ".  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte ".                                                                                                                       ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte ".  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte ".  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte "                                                                                                                        ",0ah,0dh
		byte ".  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  ",0

points2  byte ".......................................................................................................................",0ah,0dh
		 byte ".  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . ",0ah,0dh
hearts byte "       _   _         _   _         _   _         _   _      "
	  byte"		  /   V   \     /   V   \     /   V   \     /   V   \    "
	  byte"		  |       |     |       |     |       |     |       |    "
	  byte"		   \     /       \     /       \     /       \     /     "
	  byte"		  	 \ /           \ /           \ /           \ /       "
      byte"			  *             *             *             *        ",0	

full_level2 byte "                                                                                                                        ",0ah,0dh
			byte "                                                                                                                        ",0ah,0dh
		    byte " ---------------------------------------------------------------------------------------------------------------------- ",0ah,0dh	
			byte "| .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . ||  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  |",0ah,0dh
            byte "|     @ ---------           ----------                 ||  .    ---------    .    ---------             .              |",0ah,0dh 
			byte "| . ---|         |---  .---|          |------     -----||--.@--|         |---.---|         |----------  .  @-----------|",0ah,0dh
			byte "|       ---------           ----------                 ||  .    ---------    .    ---------             .              |",0ah,0dh
			byte "| .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . ||  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  |",0ah,0dh 
			byte "|                                                      ||                                                              |",0ah,0dh 
		    byte "| .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . ||  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  |",0ah,0dh 
			byte "|  --------                  ----------  .       ------||-----          ----------                ---------            |",0ah,0dh 
            byte "| . . . .  |        .        |           .      |             |                   |               |                    |",0ah,0dh 
			byte "|-----  .  |        .        |           .      |             |                   |               |       -------------|",0ah,0dh 
			byte "|. . @| .  |.  .  . . .  .  .|.  .  .  . . .  . |             |  .  .  .  .  .  . |.  .  .  .  .  |  .  . |.  .  .  .  |",0ah,0dh 
			byte "|. .  | .  |_____   .   _____|           .       -------------                    |_____     _____|       |        @   |",0ah,0dh 
			byte "|. .  | . . . . . . . .  . .  .  .  .  . .  .  .  .  .     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . |.  .  .  .  |",0ah,0dh 
		    byte "|. .  ---------------------------                                              ----------------------------            |",0ah,0dh 
			byte "|. . .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  |",0ah,0dh 
            byte "|------------------------------------------                            ------------------------------------------------|",0ah,0dh 
			byte "|. . .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  |",0ah,0dh 
			byte "|. . .  .  |  .  .  .  .  .  .  .  .  .  .  .  .  .  .     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .| .  .  .  .  |",0ah,0dh 
			byte "|. . .  .  |        --------------------------          |             ------------------------------     | .  .  .  .  |",0ah,0dh 
			byte "|----------              | @                            |                          |                     --------------|",0ah,0dh 
		    byte "|. . .  .  .  .  .  .  . |.  .  .  .  .  .  .  .  .  .  |  .  .  .  .  .  .  .  .  |  .  .  .  .  .  .  .  .  .  .  .  |",0ah,0dh 
			byte "|                        |                              |                          |                                   |",0ah,0dh 
            byte "|                                -------------------------------------------                                    @      |",0ah,0dh 
			byte "|. . .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  |",0ah,0dh 
			byte " ---------------------------------------------------------------------------------------------------------------------- ",0



full_level3 byte "                                                                                                                        ",0ah,0dh
			byte "                                                                                                                        ",0ah,0dh
		    byte " ---------------------------------------------------------------------------------------------------------------------- ",0ah,0dh	
			byte "|0   .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .     . ||  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 0|",0ah,0dh
            byte "| .          ---------           -------------            ||  .    --------------    .    ---------                    |",0ah,0dh 
			byte "|           |         |      .  |             |           ||      |              |       |         |                .  |",0ah,0dh
			byte "|            ---------           -------------            ||  .    --------------    .    ---------                    |",0ah,0dh
			byte "| .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . ||  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  |",0ah,0dh 
			byte "|                                                                                                                      |",0ah,0dh 
		    byte "| .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  |",0ah,0dh 
			byte "|            --------      _        |---------------------------------------|        _      --------                   |",0ah,0dh 
            byte "| .  .  .  .     .        | |       |_____________________ _________________|       | |                                |",0ah,0dh 
			byte "|-------------            | |_____                       | |                     ___| |                   -------------|",0ah,0dh 
			byte "|             |  .  .     |  _____| .   .    .           | |     .  .  .  .  .  |___  |  .  .  .    .  . |             |",0ah,0dh 
			byte "|             |           | |                            |_|                        | |                  |             |",0ah,0dh 
			byte "|             |  .  .     |_|  .  .  .  .    .  .  .  .  | | .  .  .  .  .  .  .  . |_|.  . .  .  .  .   |             |",0ah,0dh 
		    byte "|-------------                                           | |                                              -------------|",0ah,0dh 
			byte "< @  .  .  .  .  .  .  .       .  .  .  .   .  .  .  .   |O| .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .   >",0ah,0dh 
            byte "|------------------------------------------                            ------------------------------------------------|",0ah,0dh 
			byte "|.   .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  |",0ah,0dh 
			byte "|.    -----   .  .  .  .  .  .  .  .  .  .  .  .  .  .     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  ----   _____|",0ah,0dh 
			byte "|.   .  .  |        ------------------             |------------|        -------------------------        |      |     |",0ah,0dh 
			byte "|----      |                         |             |            |        |                                |       -----|",0ah,0dh 
		    byte "|    | .  .| .  . |--|  .  .  .  .  .| .  .  .     |            |.  .  . |.  .  .  .  .  .  .  .  . |--|. | .  .    .  |",0ah,0dh 
			byte "|----             |  |_______                      |            |                         __________|  |               |",0ah,0dh 
            byte "|           ______|__________|      -------------------------------------------          |__________|__|____     @     |",0ah,0dh 
			byte "|. . .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  |",0ah,0dh 
			byte " ---------------------------------------------------------------------------------------------------------------------- ",0



extralives_xcoord BYTE 101, 49
extralives_ycoord BYTE 5, 26

extra_xcord BYTE 0
extra_ycord BYTE 0


collisionmessage byte "COLLISION",0	

starttime DWORD ?

xPos BYTE 20
yPos BYTE 20

tempXPos BYTE 0
tempYPos BYTE 0

ghostXPos BYTE 5
ghostYPos BYTE 4

ghostXPos2 BYTE 80
ghostYPos2 BYTE 20

ghostXPos3 BYTE 0
ghostYPos3 BYTE 0

ghostXPos4 BYTE 0
ghostYPos4 BYTE 0

lives BYTE 3
gameover BYTE 0
gameovermessage BYTE "The Game has Ended ",0

strLives BYTE "Lives: ",0

level BYTE 1
levelstr BYTE "Level: ",0

xCoinPos BYTE ?
yCoinPos BYTE ?

backgr_color dd WHITE+(BLACK*16)

ghost db "G"
ghostColor dd 0
ghostColor1 = WHITE+(RED*16)  
ghostColor2 = WHITE+(BLUE*16)
ghostColor3 = WHITE+(YELLOW*16)
ghostColor4 = WHITE+(GREEN*16)
ghostcollision db 0
changecounter db 0
uparr db 3,4
downarr db 3,4
leftarr db 1,2
rightarr db 1,2
rightcount db 0
leftcount db 0


inputChar BYTE "a"
collision BYTE 0
tempdir db 0
direction db 1
direction2 db 1
direction3 db 2
direction4 db 2

;File Handling Data
filename db "file.txt",0
;username db 100 dup(?), 0 
tempbuffer db 1000 dup('@'), 0
tempsize db 0
newbuffer db 100 dup(','), 0
newcount dd 0
extrabuffer db 1000 dup(?), 0
insertbuffer dd 1000 dup(?), 0
 
scorestring db 4 dup(' '), 0

prevscore db 4 dup(' '),0
prevscore2 dd ?
prevlevel dd ?
bytesread dd ?
filehandle DWORD ?
char db ',',0

.code
main PROC

restart:
	
  ;Starting screen
    mov dl, 0
	mov dh,0
	call Gotoxy
	mov eax, YELLOW+(BLUE*16)
	call SetTextColor
	call Clrscr
	call initial_screen
	mov dl, 40
	mov dh, 15
	call Gotoxy
	;mov eax, white
	;call SetTextColor
	mov edx, offset display1
    call WriteString
	mov edx, offset player_name
	mov ecx, 100
	call ReadString				;Taking name as input

   ;Second screen
   second_scr:
   call Clrscr
	
	;mov eax, white
	;call SetTextColor
	
	call second_screen
    
    start:
	call Readchar
	cmp al, 's'
	je resume
	cmp al, 'e'
	je restart
	cmp al, 'i'
	je display_instructions
	cmp al, 'o'
	je options
	
	call Clrscr

	display_instructions:
	call Clrscr
	call draw_instructions
	mov dl, 5
	mov dh, 20
	call Gotoxy
	mov edx, offset exitins
	call WriteString
	call Readchar
	cmp al, 'e'
	je second_scr
	jmp display_instructions

	options:
	call Clrscr
	mov dl, 20
	mov dh, 5
	call Gotoxy
	mov edx, offset movement_change_message
	call WriteString
	call Crlf
	mov edx, offset change_color_message
	call WriteString
	call Readchar
	cmp al, '1'
	je enable_auto_movement
	cmp al, '2'
	je disable_auto_movement
	cmp al, 'e'
	je second_scr
	cmp al, 'c'
	je colorchange

	enable_auto_movement:
	mov auto_movement, 1
	jmp second_scr
	disable_auto_movement:
	mov auto_movement, 0
	jmp second_scr

	colorchange:
	call Clrscr
	call custom_color
	jmp second_scr


	resume:
	cmp level, 1
	je level1
	cmp level, 2
	je level2
	cmp level, 3
	je level3


	level2:
	call Clrscr
	inc score
	mov level,2
	mov XPos, 20
	mov YPos, 20
	mov ghostXPos, 1
	mov ghostYPos, 25
	mov ghostXPos2, 50
	mov ghostYPos2, 20
resume2:
	mov dl, 0
	mov dh, 0
	call Gotoxy
	;mov backgr_color, 15+(0*16)
	mov eax, backgr_color
	call SetTextColor
	mov edx, offset full_level2
	call WriteString
	jmp initialize
	

	level3:
	call Clrscr
	call GetMseconds
	mov starttime, eax
	inc score
	mov level,3
	mov XPos, 20
	mov YPos, 20
	mov ghostXPos, 1
	mov ghostYPos, 25
	mov ghostXPos2, 50
	mov ghostYPos2, 20
	mov ghostXPos3, 70
	mov ghostYPos3, 8
	mov ghostXPos4, 45
	mov ghostYPos4, 10
resume3:	
	mov dl, 0
	mov dh, 0
	call Gotoxy
	;mov backgr_color, 8+(3*16)
	mov eax, backgr_color
	call SetTextColor
	mov edx, offset full_level3
	call WriteString
	jmp initialize


	
	level1:
	resume1:
	mov eax, backgr_color
	call SetTextColor
	call Clrscr
	call draw_points
; draw ground at (0,3):
	mov dl,0
	mov dh,3
	call Gotoxy
	
	mov edx,OFFSET ground
	call WriteString
; draw sidewalls starting at (0,4) and ending at (0,29):
	mov dl,0
    mov dh,4
sidewallLoop1:
	push edx
    call Gotoxy
    mov edx,OFFSET maze2_2
	call WriteString
	pop edx
	inc dh
	cmp dh,29
jne sidewallLoop1
    mov dl,119
    mov dh,4
sidewallLoop2:
	push edx
    call Gotoxy
    mov edx,OFFSET maze2_2
	call WriteString
	pop edx
	inc dh
	cmp dh,29
jne sidewallLoop2
 ;draw ground at bottom	
	mov dl,0
    mov dh,29
	call Gotoxy
	mov edx,OFFSET ground
	call WriteString

	;draw maze
    call draw_maze


	mov eax,white (black * 16)
		call SetTextColor
	
	
	
    ;Draw player and coins
;	call Clrscr
	initialize:
	
	call DrawPlayer

	call Randomize

	;draw ghost:
	;call draw_ghost
	;call draw_ghost2
	mov eax, 0
	call draw_lives
	
	




	;MAin game loop:
	gameLoop:
	    mov eax, 0
		cmp score, 140
		je level2
		cmp score, 340
		je level3
		cmp score, 650
		jge exitgame


		mov collision,0
		;Check collisison of player with ghosts
		call check_ghost_collision
		cmp gameover, 1
		je exitgame
	

		; draw score:
		mov dl,0
		mov dh,0
		call Gotoxy
		mov edx,OFFSET strScore
		call WriteString
		mov eax,score
		call WriteInt
		;Draw level:
		mov dl, 100
		mov dh, 0
		call Gotoxy
		mov edx, offset levelstr
		call WriteString
		push eax
		mov eax, 0
		mov al, level
		call WriteInt
		pop eax

		;draw lives:
		mov dl, 50
		mov dh, 0
		call Gotoxy
		mov edx, offset strLives
		call WriteString
		push eax
		mov eax, 0
		mov al, lives
		call WriteInt
		pop eax
		;Spawn extra lives in level3 :
		call spawn_lives
		call check_lives_coll 


		;move ghosts:
		call move_all_ghosts

	
	    mov eax, backgr_color
		call SetTextColor

		;Check collisison of player with ghosts
		call check_ghost_collision
		cmp gameover, 1
		je exitgame
		

		

		; get user key input:
		cmp auto_movement, 1
		je auto
		call Readkey
		mov inputChar,al
		jz gameLoop
		jmp next1
		auto:
		call Readkey
		jz nothing
		mov inputChar,al
		nothing:

		next1:
		; exit game if user types 'x':
		cmp inputChar,"x"
		je exitGame

		;Pause game if user types 'p':
		cmp inputChar,"p"
		je pausegame

		cmp inputChar,"w"
		je moveUp

		cmp inputChar,"s"
		je moveDown

		cmp inputChar,"a"
		je moveLeft

		cmp inputChar,"d"
		je moveRight

		jmp gameLoop

		moveUp:

		call check_collision_up
		cmp collision, 1
		je gameLoop

		call UpdatePlayer
		dec yPos
		call DrawPlayer
			 
		jmp gameLoop

		moveDown:
	
		call check_collision_down
		cmp collision, 1
		je gameLoop
		
		call UpdatePlayer
		inc yPos
		call DrawPlayer
		jmp gameLoop

		moveLeft:
		
		call check_collision_left
		cmp collision, 1
		je gameLoop

		call UpdatePlayer
		dec xPos
		call DrawPlayer
		jmp gameLoop

		moveRight:
		
		call check_collision_right
		cmp collision, 1
		je gameLoop
		call UpdatePlayer
		inc xPos
		call DrawPlayer
		jmp gameLoop


		


	jmp gameLoop
	
	pausegame:
	call Clrscr
	call pause_screen
	pauseLoop:
	call Readchar
	cmp al, 'r'
	je forward
	cmp al, 'e'
	je exitGame
	cmp al, 'c'
	je colorchng
	jmp pauseLoop
	colorchng:
	call Clrscr
	call custom_color

	forward:
	call Clrscr
	cmp level, 1
	je resume1
	cmp level, 2
	je resume2
	cmp level, 3
	je resume3
	



	exitGame:
	call game_end
	call file_handling
	mov edx, offset gameovermessage
	mov ebx, offset player_name
	call MsgBox

   


    exit

main ENDP


draw_points PROC
mov dl, 1
mov dh, 2
call Gotoxy
mov edx, offset points
call WriteString



draw_points ENDP





DrawPlayer PROC
	; draw player at (xPos,yPos):
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	mov al,"C"
	call WriteChar
	ret
DrawPlayer ENDP

UpdatePlayer PROC uses eax ebx edx

mov eax, backgr_color
call SetTextColor


cmp level, 1
je level1
cmp level, 2
je level2
cmp level, 3
je level3

level1:

    mov dl,xPos
	mov dh,yPos
	call Gotoxy
	
	mov al, 122
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	mov bl, [points + eax]
	cmp bl, '.'
    je update

	
	mov al," "
	call WriteChar
	ret

    update:
	
	add score, 1
	mov [points + eax], ' '
	mov al, ' '
	call WriteChar
	ret

level2:
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	
	mov al, 122
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	mov bl, [full_level2 + eax]
	cmp bl, '.'
	je update2
	cmp bl, '@'
	je bonus

		
	mov al," "
	call WriteChar
	ret
		
	update2:
	
	add score, 1
	mov [full_level2 + eax], ' '
	mov al, ' '
	call WriteChar
	ret
	bonus:
	add score, 10
	mov [full_level2 + eax], ' '
	mov al, ' '
	call WriteChar
	ret

level3:
    mov dl,xPos
	mov dh,yPos
	call Gotoxy
	
	mov al, 122
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	mov bl, [full_level3 + eax]
	cmp bl, '.'
	je update3
	cmp bl, '@'
	je bonus2


		
	mov al," "
	call WriteChar
	ret
		
	update3:
	
	add score, 1
	mov [full_level3 + eax], ' '
	mov al, ' '
	call WriteChar
	ret
	bonus2:
	add score, 10
	mov [full_level3 + eax], ' '
	mov al, ' '
	call WriteChar
	ret


UpdatePlayer ENDP

draw_ghost PROC uses eax
	; draw ghost at (ghostXPos,ghostYPos):
	mov eax, ghostColor
	mov bl, ghost
	call SetTextColor
	mov dl, tempXPos
	mov dh, tempYPos
	call Gotoxy
	mov al, ghost
	call WriteChar
	ret
draw_ghost ENDP

update_ghost PROC uses eax ebx ecx  
mov eax,backgr_color
call SetTextColor
cmp level, 1
je level1
cmp level, 2
je level2
cmp level, 3
je level3

level1:
    mov dl, tempXPos
	mov dh, tempYPos
	call Gotoxy
	mov eax, 0
	mov al, 122
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	mov bl, [points + eax]
	cmp bl, '.'
    je update

		inc dh
	mov al," "
	call WriteChar
	ret
		inc dh
    update:
	mov al, "."
	call WriteChar
	ret

level2:
	mov dl, tempXPos
	mov dh, tempYPos
	call Gotoxy
	mov eax, 0
	mov al, 122
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	mov bl, [full_level2 + eax]
	cmp bl, '.'
    je update2
	cmp bl, '@'
	je update3

		
	mov al," "
	call WriteChar
	ret
		
    update2:
	mov al, "."
	call WriteChar
	ret
	update3:
	mov al, "@"
	call WriteChar
	ret

level3:
	mov dl, tempXPos
	mov dh, tempYPos
	call Gotoxy
	mov eax, 0
	mov al, 122
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	mov bl, [full_level3 + eax]
	cmp bl, '.'
	je update4
	cmp bl, '@'
    je update5

		
	mov al," "
	call WriteChar
	ret
		
	update4:
	mov al, "."
	call WriteChar
	ret
	
	update5:
	mov al, "@"
	call WriteChar
	ret


update_ghost ENDP


move_all_ghosts PROC
        


		mov ghost, 'G'
		mov cl, direction
		mov al, ghostXPos
		mov bl, ghostYPos
		mov tempdir, cl
		mov tempXPos, al
		mov tempYPos, bl
		mov GhostColor, ghostColor1
		call move_ghost
		mov al, tempXPos
		mov bl, tempYPos
		mov cl, tempdir
		mov ghostXPos, al
		mov ghostYPos, bl
		mov direction, cl

		mov ghost, 'U'
		mov cl, direction2
		mov al, ghostXPos2
		mov bl, ghostYPos2
		mov tempdir, cl
		mov tempXPos, al
		mov tempYPos, bl
		mov GhostColor, ghostColor2
		call move_ghost
		mov al, tempXPos
		mov bl, tempYPos
		mov cl, tempdir
		mov ghostXPos2, al
		mov ghostYPos2, bl
		mov direction2, cl

		
		cmp level, 3
		je level3
		mov eax,40
		call Delay
		ret
		level3:
		mov ghost, 'H'
		mov cl, direction3
		mov al, ghostXPos3
		mov bl, ghostYPos3
		mov tempdir, cl
		mov tempXPos, al
		mov tempYPos, bl
		mov GhostColor, ghostColor3
		call move_ghost
		mov al, tempXPos
		mov bl, tempYPos
		mov cl, tempdir
		mov ghostXPos3, al
		mov ghostYPos3, bl
		mov direction3, cl

		;Ghost4:
		mov ghost, 'I'
		mov cl, direction4
		mov al, ghostXPos4
		mov bl, ghostYPos4
		mov tempdir, cl
		mov tempXPos, al
		mov tempYPos, bl
		mov GhostColor, ghostColor4
		call move_ghost
		mov al, tempXPos
		mov bl, tempYPos
		mov cl, tempdir
		mov ghostXPos4, al
		mov ghostYPos4, bl
		mov direction4, cl



		mov eax,30
		call Delay
		ret

move_all_ghosts ENDP

check_lives_coll PROC
		mov dl, XPos
		mov dh, YPos
		cmp dl, extra_xcord
		jne finish
		cmp dh, extra_ycord
		jne finish
		add lives, 1

		finish:
		ret
check_lives_coll ENDP


spawn_lives PROC uses eax
		cmp level, 3
		je yes
		ret

		yes:
		call GetMseconds
		sub eax, starttime
		cmp eax, 10000
		jge spawn
		

		ret

		spawn:
		cmp eax, 10700
		jle start
		ret
		start:
		mov eax, 2
		call RandomRange
		mov dl, extralives_xcoord[eax]
		mov dh, extralives_ycoord[eax]
		call Gotoxy
		mov eax, '*'
		call WriteChar
		mov extra_xcord, dl
		mov extra_ycord, dh
		ret
spawn_lives ENDP


game_end PROC
		mov eax, white + (BLUE*16)
		call SetTextColor
		call Clrscr
		
		mov dl, 30
		mov dh, 5
		call Gotoxy
		cmp score, 650
		jge won
		mov edx, offset gm1
		call WriteString
		jmp skip
		won:
		mov edx, offset win
		call WriteString
		
		skip:
		mov dl, 45
		mov dh, 12
		call Gotoxy
		mov edx, offset endname
		call WriteString
		mov edx, offset player_name
		call WriteString
		mov dl, 45
		mov dh, 14
		call Gotoxy
		mov edx, offset endscore
		call WriteString
		mov eax, score
		call WriteDec
	
		ret
game_end ENDP
	


custom_color PROC uses eax
mov dl, 15
mov dh, 3
call Gotoxy
mov edx, offset colors_range
call WriteString
call Crlf
mov edx, offset change_color
call WriteString
call Crlf
call ReadDec
mov f_color, eax
mov edx, offset change_color2
call WriteString
call Crlf
call ReadDec
mov b_color, eax

mov eax, 16
mul b_color
add eax, f_color

mov backgr_color, eax
ret
custom_color ENDP



initial_screen PROC

mov dl, 15
mov dh, 6
call Gotoxy
mov edx, offset pc1
call WriteString

mov dl, 15
mov dh, 5
call Gotoxy
mov edx, offset pc2
call WriteString

mov dl, 15
mov dh, 6
call Gotoxy
mov edx, offset pc3
call WriteString

mov dl, 15
mov dh, 7
call Gotoxy
mov edx, offset pc4
call WriteString

mov dl, 15
mov dh, 8
call Gotoxy
mov edx, offset pc5
call WriteString

mov dl, 15
mov dh, 9
call Gotoxy
mov edx, offset pc6
call WriteString

ret
initial_screen ENDP

pause_screen PROC
mov dl, 30
mov dh, 5
call Gotoxy
mov edx, offset pausedisplay
call WriteString
call Crlf


mov dl, 15
Call Gotoxy
mov edx, offset p0
call WriteString
call Crlf

mov dl, 15
Call Gotoxy
mov edx, offset p1
call WriteString
call Crlf

mov dl, 15
Call Gotoxy
mov edx, offset p2
call WriteString
call Crlf

mov dl, 15
Call Gotoxy
mov edx, offset p3
call WriteString
call Crlf

mov dl, 15
Call Gotoxy
mov edx, offset p4
call WriteString
call Crlf

mov dl, 15
Call Gotoxy
mov edx, offset p5
call WriteString
call Crlf

ret
pause_screen ENDP

;Displays Start, Instructions and Exit buttons
second_screen PROC

mov dl, 4
mov dh, 0
call Gotoxy
mov edx, offset display2
call WriteString


mov dl, 0
mov dh, 2
call Gotoxy
mov edx, offset s1
call WriteString

;Write instructions
mov dl, 0
mov dh, 9
call Gotoxy
mov edx, offset ins2
call WriteString
;Write Settings
mov dl, 0
mov dh, 16
call Gotoxy
mov edx, offset set1
call WriteString

;Write EXIT
mov dl, 0
mov dh, 23
call Gotoxy
mov edx, offset exit1
call WriteString


ret
second_screen ENDP


draw_maze PROC

;Additional walls
	mov dl, 8
	mov dh, 12
	call Gotoxy
	
	
	iteration:
	mov ecx, 11
	verticalwall6:
	push edx
	mov edx, offset maze2_2
	call WriteString
	pop edx
	inc dh
	call Gotoxy
	loop verticalwall6
	mov dl, 112
	mov dh, 12
	call Gotoxy
	dec itercount
	cmp itercount, 0
	jne iteration

	mov dl, 45
	mov dh, 6
	call Gotoxy
	mov edx, offset maze1
	call WriteString

	mov dl, 45
	mov dh, 27
	call Gotoxy
	mov edx, offset maze1
	call WriteString
	

   ;Drawing all horizontal walls
   mov dl, 15
	mov dh, 8
	call Gotoxy
	mov edx, offset maze1
	call WriteString
	
	mov dl, 75
	mov dh, 8
	call Gotoxy
	mov edx, offset maze1
	call WriteString
	
	 mov dl, 15
	mov dh, 25
	call Gotoxy
	mov edx, offset maze1
	call WriteString
	
	mov dl, 75
	mov dh, 25
	call Gotoxy
	mov edx, offset maze1
	call WriteString
	
	
	
	
 ;Drawing all vertical walls	
	mov dh, 9
	mov dl, 15
	call Gotoxy
	mov ecx, 7
	
	verticalwall1:
	push edx
	mov edx, offset maze2_2
	call WriteString
	pop edx
	inc dh
	call Gotoxy
	loop verticalwall1

	mov dh, 9
	mov dl, 105
	call Gotoxy
	mov ecx, 7
	
	verticalwall2:
	push edx
	mov edx, offset maze2_2
	call WriteString
	pop edx
	inc dh
	call Gotoxy
	loop verticalwall2



	mov dh, 18
	mov dl, 15
	call Gotoxy
	mov ecx, 7
	
	verticalwall3:
	push edx
	mov edx, offset maze2_2
	call WriteString
	pop edx
	inc dh
	call Gotoxy
	loop verticalwall3

	
	mov dh, 18
	mov dl, 105
	call Gotoxy
	mov ecx, 7
	
	verticalwall4:
	push edx
	mov edx, offset maze2_2
	call WriteString
	pop edx
	inc dh
	call Gotoxy
	loop verticalwall4




	;This is the middle box

	mov dh, 13
	mov dl, 44
	call Gotoxy
	mov ecx, 9
	
	verticalwall5:
	push edx
	mov edx, offset maze2_1
	call WriteString
	pop edx
	inc dh
	call Gotoxy
	loop verticalwall5

	mov dl, 45
	mov dh, 12
	call Gotoxy
	mov edx, offset maze1
	call WriteString

	mov dl, 45
	mov dh, 22
	call Gotoxy
	mov edx, offset maze1
	call WriteString




	ret
draw_maze ENDP

draw_lives PROC uses eax
mov dl, 50
mov dh, 0
call Gotoxy
mov edx, offset strLives
call WriteString
mov eax, 0
mov al, lives
call WriteDec
ret
draw_lives ENDP

draw_instructions PROC
	mov eax, white
call SetTextColor
	mov dl, 30
mov dh, 4
call Gotoxy
mov edx, offset instructions
call WriteString
mov dl, 30
mov dh, 5
call Gotoxy
mov edx, offset i1
call WriteString
mov dl, 30
mov dh, 6
call Gotoxy
mov edx, offset i2
call WriteString
mov dl, 30
mov dh, 7
call Gotoxy
mov edx, offset i3
call WriteString
mov dl, 30
mov dh, 8
call Gotoxy
mov edx, offset i4
call WriteString
ret
draw_instructions ENDP



check_collision_down PROC
cmp level, 1
je level1
cmp level, 2
je level2
cmp level, 3
je level3


level1:
mov bl, XPos
mov bh, YPos


cmp bh,28
je cantmove
cmp bh, 7
je checkfurther
cmp bh, 17
je check2
cmp bh, 24
je checkfurther
cmp bh, 11
je addcheck3
cmp bh, 5
je addcheck1
cmp bh, 26
je addcheck1
ret
check2:
cmp bl, 15
je cantmove
cmp bl, 105
je cantmove 
ret


addcheck1:
cmp bl, 45
jge addcheck2
ret
addcheck2:
cmp bl, 75
jle cantmove
ret


addcheck3:
cmp bl, 44
jge addcheck4
cmp bl, 8
je cantmove
ret
addcheck4:
cmp bl, 75
jle cantmove
cmp bl, 112
je cantmove
ret


checkfurther:
cmp bl, 45
jle checkfurther2
jg checkfurther3

checkfurther2:
cmp bl, 15
jge cantmove
ret
checkfurther3:
cmp bl, 75
jge check3
ret
check3:
cmp bl, 105
jle cantmove
ret

cantmove:
mov collision, 1

level2:
mov bl, XPos
mov bh, YPos
mov al, 122
    inc bh
    mul bh
	push ebx
	movzx bx,bl
	add ax, bx
	pop ebx
	mov dl, [full_level2 + eax]
	dec bh
	cmp dl, '-'
	je dontmove
	cmp dl, '|'
	je dontmove
	cmp dl, '_'
	je dontmove
	ret


	dontmove:
	mov collision, 1
	ret

level3:
	mov bl, XPos
	mov bh, YPos
	mov al, 122
    inc bh
    mul bh
	push ebx
	movzx bx,bl
	add ax, bx
	pop ebx
	mov dl, [full_level3 + eax]
	dec bh
	cmp dl, '-'
	je dontmove
	cmp dl, '|'
	je dontmove
	cmp dl, '_'
	je dontmove
	ret
	


check_collision_down ENDP

check_collision_up PROC
mov bl, XPos
mov bh, YPos

cmp level, 1
je level1
cmp level, 2
je level2
cmp level, 3
je level3

level1:

cmp bh,4
je cantmove		
cmp bh, 9
je checkfurther
cmp bh, 16
je check2
cmp bh, 26
je checkfurther
cmp bh, 23
je addcheck3
cmp bh, 28
je addcheck1
cmp bh, 7
je addcheck1
ret
check2:
cmp bl, 15
je cantmove
cmp bl, 105
je cantmove 
ret

addcheck1:
cmp bl, 45
jge addcheck2
ret
addcheck2:
cmp bl, 75
jle cantmove
ret

addcheck3:
cmp bl, 44
jge addcheck4
cmp bl, 8
je cantmove
ret
addcheck4:
cmp bl, 75
jle cantmove
cmp bl, 112
je cantmove
ret



checkfurther:
cmp bl, 45
jle checkfurther2
jg checkfurther3

checkfurther2:
cmp bl, 15
jge cantmove
ret
checkfurther3:
cmp bl, 75
jge check3
ret
check3:
cmp bl, 105
jle cantmove
ret

cantmove:
mov collision, 1
ret

level2:
mov al, 122
    dec bh
    mul bh
	push ebx
	movzx bx,bl
	add ax, bx
	pop ebx
	mov dl, [full_level2 + eax]
	inc bh
	cmp dl, '-'
	je dontmove
	cmp dl, '|'
	je dontmove
	cmp dl, '_'
	je dontmove
	ret


	dontmove:
	mov collision, 1
	ret

level3:
	mov al, 122
    dec bh
    mul bh
	push ebx
	movzx bx,bl
	add ax, bx
	pop ebx
	mov dl, [full_level3 + eax]
	inc bh
	cmp dl, '-'
	je dontmove
	cmp dl, '|'
	je dontmove
	cmp dl, '_'
	je dontmove
	cmp dl, 'O'
	je teleport
	cmp dl,'0'
	je teleport2
	ret
	

	teleport:
	mov eax, 2
	call RandomRange
	cmp eax, 0
	je leftside
	cmp eax, 1
	je rightside

	leftside:
	call UpdatePlayer
	mov XPos, 3
	mov YPos, 4
	call DrawPlayer
	jmp dontmove
	rightside:
	call UpdatePlayer
	mov XPos, 117
	mov YPos, 4
	call DrawPlayer
	jmp dontmove
	
	teleport2:
	call UpdatePlayer
	mov XPos, 60
	mov YPos, 15
	call DrawPlayer
	jmp dontmove




check_collision_up ENDP

check_collision_left PROC
mov bl, XPos
mov bh, YPos

cmp level,1
je level1
cmp level,2
je level2
cmp level, 3
je level3


level1:
cmp bl, 1
je cantmove
cmp bl, 16
je checkfurther
cmp bl, 46
je check2
cmp bl, 106
je checkfurther
cmp bl, 9
je addcheck1
cmp bl, 113
je addcheck1
cmp bl, 76
je addcheck3
ret
check2:
cmp bh, 8
je cantmove
cmp bh, 25
je cantmove 
ret


addcheck1:
cmp bh, 12
jge addcheck2
ret
addcheck2:
cmp bh, 23
jle cantmove
cmp  bh, 27
je cantmove
ret


addcheck3:
cmp bh, 12
jge addcheck2
cmp bh, 6
je cantmove
ret
addcheck4:
cmp bh, 24
jle cantmove
ret


checkfurther:
cmp bh, 15
jle checkfurther2
jg checkfurther3

checkfurther2:
cmp bh, 8
jge cantmove
ret
checkfurther3:
cmp bh, 18
jge check3
ret
check3:
cmp bh, 24
jle cantmove
ret

cantmove:
mov collision, 1
ret

level2:
mov al, 122
    dec bl
    mul bh
	push ebx
	movzx bx,bl
	add ax, bx
	pop ebx
	mov dl, [full_level2 + eax]
	inc bl
	cmp dl, '-'
	je dontmove
	cmp dl, '|'
	je dontmove
	cmp dl, '_'
	je dontmove
	ret


	dontmove:
	mov collision, 1
	ret

level3:
	mov al, 122
    dec bl
    mul bh
	push ebx
	movzx bx,bl
	add ax, bx
	pop ebx
	mov dl, [full_level3 + eax]
	inc bl
	cmp dl, '-'
	je dontmove
	cmp dl, '|'
	je dontmove
	cmp dl, '_'
	je dontmove
	cmp dl, '0'
	je teleport2
	cmp dl, '<'
	je teleport3
	ret


	teleport2:
	call UpdatePlayer
	mov XPos, 60
	mov YPos, 18
	call DrawPlayer
	jmp dontmove

	teleport3:
	call UpdatePlayer
	mov XPos, 118
	call DrawPlayer
	jmp dontmove


check_collision_left ENDP

check_collision_right PROC
mov bl, XPos
mov bh, YPos

cmp level,1
je level1
cmp level,2
je level2
cmp level,3
je level3


level1:
cmp bl, 118
je cantmove
cmp bl, 14
je checkfurther
cmp bl, 74
je check2
cmp bl, 104
je checkfurther
cmp bl, 7
je addcheck1
cmp bl, 111
je addcheck1
cmp bl, 43
je addcheck3
ret
check2:
cmp bh, 8
je cantmove
cmp bh, 25
je cantmove 
ret



addcheck1:
cmp bh, 13
jge addcheck2
ret
addcheck3:
cmp bh, 12
jge addcheck2
cmp bh, 6
je cantmove
ret
addcheck2:
cmp bh, 22
jle cantmove
ret


checkfurther:
cmp bh, 15
jle checkfurther2
jg checkfurther3

checkfurther2:
cmp bh, 8
jge cantmove
ret
checkfurther3:
cmp bh, 18
jge check3
ret
check3:
cmp bh, 25
jle cantmove
ret

cantmove:
mov collision, 1
ret


level2:
mov al, 122
    inc bl
    mul bh
	push ebx
	movzx bx,bl
	add ax, bx
	pop ebx
	mov dl, [full_level2 + eax]
	dec bl
	cmp dl, '-'
	je dontmove
	cmp dl, '|'
	je dontmove
	cmp dl, '_'
	je dontmove
	ret


	dontmove:
	mov collision, 1
	ret

level3:
	mov al, 122
    inc bl
    mul bh
	push ebx
	movzx bx,bl
	add ax, bx
	pop ebx
	mov dl, [full_level3 + eax]
	dec bl
	cmp dl, '-'
	je dontmove
	cmp dl, '|'
	je dontmove
	cmp dl, '_'
	je dontmove
	cmp dl, '0'
	je teleport2
	cmp dl, '>'
	je teleport3
	ret
	


	teleport2:
	call UpdatePlayer
	mov XPos, 60
	mov YPos, 18
	call DrawPlayer
	jmp dontmove

	teleport3:
	call UpdatePlayer
	mov XPos, 2
	call DrawPlayer
	jmp dontmove
check_collision_right ENDP



check_ghost_collision PROC uses ebx eax
        mov bl, xPos
		mov bh, yPos
		cmp bh, ghostYPos
		je checkfurther
		check2:
		cmp bh, ghostYPos2
		je checkfurther2
		check3:
		cmp bh, ghostYPos3
		je checkfurther3
		check4:
		cmp bh, ghostYPos4
		je checkfurther4
		ret
		checkfurther:
		cmp bl, ghostXPos
		je minuslives
		jmp check2
		checkfurther2:
		cmp bl, ghostXPos2
		je minuslives
		jmp check3
		checkfurther3:
		cmp bl, ghostXPos3
		je minuslives
		jmp check4
		checkfurther4:
		cmp bl, ghostXPos4
		je minuslives
		ret
		minuslives:
		dec lives
		mov dl, Xpos
		mov dh, Ypos
		call Gotoxy
		mov edx, ' '
		call WriteChar
		
		mov Xpos, 20
		mov Ypos, 20
	
		call DrawPlayer

		cmp lives, 0
		je gameover1
		ret
		gameover1:
		mov gameover, 1
		ret

check_ghost_collision ENDP


move_ghost PROC uses eax ebx ecx edx
cmp level, 1
je start
cmp level, 2
je start2
cmp level, 3
je start3

start: 
    mov ghostcollision, 0
	cmp tempdir, 1
	je checkup
	cmp tempdir, 2
	je checkdown
	cmp tempdir, 3
	je checkleft
	cmp tempdir, 4
	je checkright


	checkup:
	
	call ghost_collision_up
	
	jmp part2
	checkdown:
	
	call ghost_collision_down
	
	jmp part2
	checkleft:

	call ghost_collision_left
	
	jmp part2
	checkright:

	call ghost_collision_right
	

	part2:
	cmp ghostcollision, 1
	je update

	cmp tempdir, 1
	je moveup
	cmp tempdir, 2
	je movedown
	cmp tempdir, 3
	je moveleft
	cmp tempdir, 4
	je moveright

	moveup:
	call update_ghost
	dec tempYPos
	call draw_ghost
	jmp endoffunc

	movedown:
	call update_ghost
	inc tempYPos
	call draw_ghost
	jmp endoffunc

	moveleft:
	call update_ghost
	dec tempXPos
	call draw_ghost
	jmp endoffunc

	moveright:
	call update_ghost
	inc tempXPos
	call draw_ghost
	jmp endoffunc
	

	update:
	cmp tempdir, 1
	je updateup
	cmp tempdir, 2
	je updatedown
	cmp tempdir, 3
	je updateleft
	cmp tempdir, 4
	je updateright

	updateup:
	mov eax, 2
	call RandomRange
	mov esi, eax
	mov bl, uparr[esi]
	mov tempdir, bl
	jmp start

	updatedown:
	mov eax, 2
	call RandomRange
	mov esi, eax
	mov bl, downarr[esi]
	mov tempdir, bl
	jmp start

	updateleft:
	mov eax, 2
	call RandomRange
	mov esi, eax
	mov bl, leftarr[esi]
	mov tempdir, bl
	jmp start

	updateright:
	mov eax, 2
	call RandomRange
	mov esi, eax
	mov bl, rightarr[esi]
	mov tempdir, bl
	jmp start

	
endoffunc:
	
	ret

start2:;uses full_level2 array
	
	mov eax, 0
	mov dl, tempXPos
	mov dh, tempYPos
	mov al, 122



	cmp tempdir, 1
	je checkup2
	cmp tempdir, 2
	je checkdown2
	cmp tempdir, 3
	je checkleft2
	cmp tempdir, 4
	je checkright2


	checkup2:
	

	cmp dh, 3
	je update1

	dec dh
	
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	mov bl, [full_level2 + eax]
	cmp bl, '-'
	je update1
	cmp bl, '|'
	je update1
	cmp bl, '_'
	je update1
	inc dh
	call update_ghost
	dec tempYPos
	call draw_ghost
	jmp endfunc

	checkdown2:
	
	inc dh
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	
	mov bl, [full_level2 + eax]
	cmp bl, '-'
	je update2
	cmp bl, '|'
	je update2
	cmp bl, '_'
	je update2
	dec dh
	call update_ghost
	inc tempYPos
	call draw_ghost
	jmp endfunc

	ret
	checkleft2:
	inc changecounter
	cmp changecounter, 50
	jge update3
	dec dl
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	mov bl, [full_level2 + eax]
	cmp bl, '-'
	je update3
	cmp bl, '|'
	je update3
	cmp bl, '_'
	je update3
	inc dl
	 
	call update_ghost
	dec tempXPos
	call draw_ghost
	jmp endfunc

	checkright2:
	inc changecounter
	cmp changecounter, 50
	jge update4
	inc dl
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	mov bl, [full_level2 + eax]
	cmp bl, '-'
	je update4
	cmp bl, '|'
	je update4
	cmp bl, '_'
	je update4
	dec dl
	
	call update_ghost
	inc tempXPos
	call draw_ghost
	jmp endfunc
	
	update1:		;direction was up
	
	mov eax, 2
	call RandomRange
	mov esi, eax
	mov bl, uparr[esi]
	mov tempdir, bl
	
	jmp start2


	update2:
	
	mov eax, 2
	call RandomRange
	mov esi, eax
	mov bl, downarr[esi]
	mov tempdir, bl
	
	jmp start2


	update3:
	cmp changecounter, 50
	jge resetcounter
    jmp skip
	resetcounter:
    mov changecounter, 0
	skip:
	mov eax, 2
	call RandomRange
	mov esi, eax
	mov bl, leftarr[esi]
	mov tempdir, bl

	jmp start2


	update4:
	cmp changecounter, 50
	jge resetcounter2
    jmp skip2
	resetcounter2:
    mov changecounter, 0
	skip2:
	inc rightcount
	mov eax, 2
	call RandomRange
	mov esi, eax
	mov bl, rightarr[esi]
	mov tempdir, bl
	jmp start2

	endfunc:
	
	ret
	

start3:;uses full_level3 array
    mov eax, 0
	mov dl, tempXPos
	mov dh, tempYPos
	mov al, 122



cmp tempdir, 1
	je checkup3
	cmp tempdir, 2
	je checkdown3
	cmp tempdir, 3
	je checkleft3
	cmp tempdir, 4
	je checkright3


    checkup3:
	

	cmp dh, 3
	je update1

	dec dh
	
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	mov bl, [full_level3 + eax]
	cmp bl, '-'
	je update2_1
	cmp bl, '|'
	je update2_1
	cmp bl, '_'
	je update2_1
	cmp bl, '0'
	je teleport2
	cmp bl, 'O'
	je teleport
	inc dh
	call update_ghost
	dec tempYPos
	call draw_ghost
	jmp endfunc

	checkdown3:
	
	inc dh
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	
	mov bl, [full_level3 + eax]
	cmp bl, '-'
	je update2_2
	cmp bl, '|'
	je update2_2
	cmp bl, '_'
	je update2_2
	cmp bl, '0'
	je teleport2
	cmp bl, 'O'
	je teleport
	dec dh
	call update_ghost
	inc tempYPos
	call draw_ghost
	jmp endfunc

	ret
	checkleft3:
	inc changecounter
	cmp changecounter, 50
	jge update2_3
	dec dl
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	mov bl, [full_level3 + eax]
	cmp bl, '-'
	je update2_3
	cmp bl, '|'
	je update2_3
	cmp bl, '_'
	je update2_3
	cmp bl, '0'
	je teleport2
	cmp bl, 'O'
	je teleport
	cmp bl, '<'
	je teleport3
	inc dl
	 
	call update_ghost
	dec tempXPos
	call draw_ghost
	jmp endfunc

	checkright3:
	inc changecounter
	cmp changecounter, 50
	jge update2_4
	inc dl
	mul dh
	push edx
	movzx dx,dl
	add ax, dx
	pop edx
	mov bl, [full_level3 + eax]
	cmp bl, '-'
	je update2_4
	cmp bl, '|'
	je update2_4
	cmp bl, '_'
	je update2_4
	cmp bl, '0'
	je teleport2
	cmp bl, '>'
	je teleport4
	
    dec dl
	
	call update_ghost
	inc tempXPos
	call draw_ghost
	jmp endfunc
	
	update2_1:		;direction was up
	
	mov eax, 2
	call RandomRange
	mov esi, eax
	mov bl, uparr[esi]
	mov tempdir, bl
	
	jmp start3


    update2_2:
	
	mov eax, 2
	call RandomRange
	mov esi, eax
	mov bl, downarr[esi]
	mov tempdir, bl
	
	jmp start3


    update2_3:

	cmp changecounter, 50
	jge resetcounter3
	jmp skip3
	resetcounter3:
	mov changecounter, 0
	skip3:
	mov eax, 2
	call RandomRange
	mov esi, eax
	mov bl, leftarr[esi]
	mov tempdir, bl

	jmp start3


    update2_4:
	cmp changecounter, 50
	jge resetcounter4
	jmp skip4
	resetcounter4:
	mov changecounter, 0
	skip4:
	inc rightcount
	mov eax, 2
	call RandomRange
	mov esi, eax
	mov bl, rightarr[esi]
	mov tempdir, bl
	jmp start3

	

	teleport:
	mov eax, 2
	call RandomRange
	cmp eax, 0
	je leftside
	cmp eax, 1
	je rightside

	leftside:
	call update_ghost
	mov tempXPos, 3
	mov tempYPos, 4
	call draw_ghost
	jmp endfunc
	rightside:
	call update_ghost
	mov tempXPos, 117
	mov tempYPos, 4
	call draw_ghost
	jmp endfunc
	
	teleport2:
	call update_ghost
	mov tempXPos, 58
	mov tempYPos, 18
	call draw_ghost
	jmp endfunc

	
	teleport3:
	call update_ghost
	mov tempXPos, 118
	call draw_ghost
	jmp endfunc

	teleport4:
	call update_ghost
	mov tempXPos, 2
	call draw_ghost
	jmp endfunc
	


move_ghost ENDP

COMMENT @
move_ghost2 PROC uses eax  
start: 
    mov ghostcollision, 0
	cmp direction2, 1
	je checkup
	cmp direction2, 2
	je checkdown
	cmp direction2, 3
	je checkleft
	cmp direction2, 4
	je checkright


	checkup:
	mov bl, ghostXPos2
	mov bh, ghostYPos2
	mov tempXPos, bl
	mov tempYPos, bh
	call ghost_collision_up
	mov ghostXPos2, bl
	mov ghostYPos2, bh
	jmp part2
	checkdown:
	mov bl, ghostXPos2
	mov bh, ghostYPos2
	mov tempXPos, bl
	mov tempYPos, bh
	call ghost_collision_down
    mov ghostXPos2, bl
	mov ghostYPos2, bh
	jmp part2
	checkleft:
	mov bl, ghostXPos2
	mov bh, ghostYPos2
	mov tempXPos, bl
	mov tempYPos, bh
	call ghost_collision_left
	mov ghostXPos2, bl
	mov ghostYPos2, bh
	jmp part2
	checkright:
	mov bl, ghostXPos2
	mov bh, ghostYPos2
	mov tempXPos, bl
	mov tempYPos, bh
	call ghost_collision_right
	mov ghostXPos2, bl
	mov ghostYPos2, bh


	part2:
	cmp ghostcollision, 1
	je update

	cmp direction2, 1
	je moveup
	cmp direction2, 2
	je movedown
	cmp direction2, 3
	je moveleft
	cmp direction2, 4
	je moveright

	moveup:
	call update_ghost2
	dec ghostYpos2
	call draw_ghost2
	jmp endoffunc

	movedown:
	call update_ghost2
	inc ghostYpos2
	call draw_ghost2
	jmp endoffunc

	moveleft:
	call update_ghost2
	dec ghostXpos2
	call draw_ghost2
	jmp endoffunc

	moveright:
	call update_ghost2
	inc ghostXpos2
	call draw_ghost2
	jmp endoffunc
	

	update:
	cmp direction2, 1
	je updateup
	cmp direction2, 2
	je updatedown
	cmp direction2, 3
	je updateleft
	cmp direction2, 4
	je updateright

	updateup:
	mov eax, 3
	call RandomRange
	mov esi, eax
	mov bl, uparr[esi]
	mov direction2, bl
	jmp start

	updatedown:
	mov eax, 3
	call RandomRange
	mov esi, eax
	mov bl, downarr[esi]
	mov direction2, bl
	jmp start

	updateleft:
	mov eax, 3
	call RandomRange
	mov esi, eax
	mov bl, leftarr[esi]
	mov direction2, bl
	jmp start

	updateright:
	mov eax, 3
	call RandomRange
	mov esi, eax
	mov bl, rightarr[esi]
	mov direction2, bl
	jmp start

	
endoffunc:
	mov eax,40
	call Delay


	ret
move_ghost2 ENDP

@

ghost_collision_up PROC

mov bl, tempXPos
mov bh, tempYPos 


cmp bh,4
je cantmove
cmp bh, 9
je checkfurther
cmp bh, 16
je check2
cmp bh, 26
je checkfurther
cmp bh, 23
je addcheck3
cmp bh, 28
je addcheck1
cmp bh, 7
je addcheck1
ret
check2:
cmp bl, 15
je cantmove
cmp bl, 105
je cantmove 
ret

addcheck1:
cmp bl, 45
jge addcheck2
ret
addcheck2:
cmp bl, 75
jle cantmove
ret

addcheck3:
cmp bl, 44
jge addcheck4
cmp bl, 8
je cantmove
ret
addcheck4:
cmp bl, 75
jle cantmove
cmp bl, 112
je cantmove
ret



checkfurther:
cmp bl, 45
jle checkfurther2
jg checkfurther3

checkfurther2:
cmp bl, 15
jge cantmove
ret
checkfurther3:
cmp bl, 75
jge check3
ret
check3:
cmp bl, 105
jle cantmove
ret

cantmove:
mov ghostcollision, 1

ghost_collision_up ENDP

ghost_collision_down PROC
mov bl, tempXPos
mov bh, tempYPos

cmp bh, 28
je cantmove
cmp bh, 7
je checkfurther
cmp bh, 17
je check2
cmp bh, 24
je checkfurther
cmp bh, 11
je addcheck3
cmp bh, 5
je addcheck1
cmp bh, 26
je addcheck1
ret
check2:
cmp bl, 15
je cantmove
cmp bl, 105
je cantmove 
ret


addcheck1:
cmp bl, 45
jge addcheck2
ret
addcheck2:
cmp bl, 75
jle cantmove
ret


addcheck3:
cmp bl, 44
jge addcheck4
cmp bl, 8
je cantmove
ret
addcheck4:
cmp bl, 75
jle cantmove
cmp bl, 112
je cantmove
ret


checkfurther:
cmp bl, 45
jle checkfurther2
jg checkfurther3

checkfurther2:
cmp bl, 15
jge cantmove
ret
checkfurther3:
cmp bl, 75
jge check3
ret
check3:
cmp bl, 105
jle cantmove
ret

cantmove:
mov ghostcollision, 1
ret
ghost_collision_down ENDP

ghost_collision_left PROC

mov bl, tempXPos
mov bh,	tempYPos 

cmp bl,1
je cantmove
cmp bl, 16
je checkfurther
cmp bl, 46
je check2
cmp bl, 106
je checkfurther
cmp bl, 9
je addcheck1
cmp bl, 113
je addcheck1
cmp bl, 76
je addcheck3
ret
check2:
cmp bh, 8
je cantmove
cmp bh, 25
je cantmove 
ret


addcheck1:
cmp bh, 12
jge addcheck2
ret
addcheck2:
cmp bh, 23
jle cantmove
ret


addcheck3:
cmp bh, 12
jge addcheck2
ret
addcheck4:
cmp bh, 24
jle cantmove
ret


checkfurther:
cmp bh, 15
jle checkfurther2
jg checkfurther3

checkfurther2:
cmp bh, 8
jge cantmove
ret
checkfurther3:
cmp bh, 18
jge check3
ret
check3:
cmp bh, 24
jle cantmove
ret

cantmove:
mov ghostcollision, 1
ret
ghost_collision_left ENDP

ghost_collision_right PROC

mov bl, tempXPos
mov bh, tempYPos

cmp bl, 118
je cantmove
cmp bl, 14
je checkfurther
cmp bl, 74
je check2
cmp bl, 104
je checkfurther
cmp bl, 7
je addcheck1
cmp bl, 111
je addcheck1
cmp bl, 43
je addcheck3
ret
check2:
cmp bh, 8
je cantmove
cmp bh, 25
je cantmove 
ret



addcheck1:
cmp bh, 13
jge addcheck2
ret
addcheck3:
cmp bh, 12
jge addcheck2
ret
addcheck2:
cmp bh, 22
jle cantmove
ret



checkfurther:
cmp bh, 15
jle checkfurther2
jg checkfurther3

checkfurther2:
cmp bh, 8
jge cantmove
ret
checkfurther3:
cmp bh, 18
jge check3
ret
check3:
cmp bh, 24
jle cantmove
ret

cantmove:
mov ghostcollision, 1
ret
ghost_collision_right ENDP


file_handling PROC

int_to_string score
	pop eax
mov scorestring[0], al
	pop eax
mov scorestring[1], al
	pop eax
mov scorestring[2], al
	pop eax
mov scorestring[3], al

	

	;make the new string from name,score and level
	
	INVOKE Str_copy, offset player_name, offset newbuffer
	mov esi, 0
	newstring:
	mov bl, newbuffer[esi]
	inc esi 
	cmp bl, ','
	jne newstring

	;adding score to newbuffer
	 mov ecx, 4
	 mov edi, 0
	 addscore:
	 mov bl, scorestring[edi]
	 mov newbuffer[esi], bl
	 inc esi
	 inc edi
	 loop addscore
	 
	inc esi
	mov al, level
	;convert level to Ascii
	add al, 48
	mov newbuffer[esi], al
	inc esi 
	mov newbuffer[esi], '.'
	

	;First copy the content in file to tempbuffer
	mov edx, offset filename
	call OpenInputFile
		
	mov filehandle, eax
	mov edx, offset tempbuffer
	mov ecx, 100
	call ReadFromFile
	mov bytesread, eax
	
	mov eax, filehandle
	call CloseFile

	cmp bytesread, 0
	je emptyfile



	;Finding total entries in file
	mov esi, offset tempbuffer
	entries:
	mov bl, [esi]
	cmp bl, '.'
	jne no
	inc tempsize
	no:
	inc esi
	cmp bl, '@'
	jne entries

	mov ecx, 0
	mov cl, tempsize 
	
	mov esi, 0
	add esi, bytesread
	sub esi, 2
	
	iteration:

	L1:
	mov bl, [tempbuffer+esi]
	dec esi
	cmp bl, ','
	jne L1

	mov edi, 3
	mov bl, [tempbuffer+esi]
	L2:
	mov [prevscore+edi], bl
	dec edi 
	dec esi
	mov bl, [tempbuffer+esi]
	
	cmp bl, ','
	jne L2

	mov edx, offset prevscore
	
	push ecx
	mov ecx, 3
	call ParseDecimal32
	mov prevscore2, eax
	pop ecx
	
	cmp eax, score
	jg greater
	dec esi
	loop iteration
	mov esi, 0
	mov edi, 0
	push esi
	jmp extra



	greater:
	mov bl, [tempbuffer+esi]
	inc esi
	cmp bl, '.'
	jne greater

	push esi

	mov edi, 0
	extra:					;remove the extra entries
	mov bl, [tempbuffer+esi]
	mov [extrabuffer+edi], bl
	mov [tempbuffer+esi], '@'
	inc esi
	inc edi
	cmp bl, '@'
	jne extra

	pop esi
	mov edi, 0
	mov ebx, 0
	addnewbuffer:			;add the new entry to tempbuffer
	mov bl, [newbuffer+edi]
	mov [tempbuffer+esi], bl
	inc esi
	inc edi
	cmp bl, '.'
	jne addnewbuffer

	mov edi, 0
	;adding the extra entries
addextra:
	mov bl, [extrabuffer+edi]
	mov [tempbuffer+esi], bl
	inc esi
	inc edi
	cmp bl, '@'
	jne addextra

	
	mov edi, 0
	templen:
	mov bl, [tempbuffer+edi]
	inc edi
	cmp bl, '@'
	jne templen

	
	;Now rewrite the tempbuffer to file
	mov edx, offset filename
	call CreateOutputFile
	mov filehandle, eax
	;INVOKE Str_trim, offset tempbuffer, offset char
	mov edx, offset tempbuffer
	mov ecx, edi
	call WriteToFile
	mov eax, filehandle
	call CloseFile

	ret

	emptyfile:

	mov edi, 0
	newlen:
	mov bl, [newbuffer+edi]
	inc edi
	cmp bl, '.'
	jne newlen


	mov edx, offset filename
	call CreateOutputFile
	mov filehandle, eax
	;INVOKE Str_trim, offset newbuffer,  char
	mov edx, offset newbuffer
	mov ecx, edi
	call WriteToFile
	mov eax, filehandle
	call CloseFile

	ret

file_handling ENDP






END main
