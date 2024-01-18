[org 0x0100]
jmp start

cls_s:
mov ax,0xb800
mov es,ax
mov di,0

nextchar:

mov word[es:di],0x0720
add di,2
cmp di,4000
jne nextchar
ret

;...............................................................................

map:

push bp
mov bp, sp
push es
push ax
push cx
push si
push di
mov di, 0

mov ax, 0xb800
mov es, ax
mov si, 5
mov cx, 40
mov  ah, 0x11 ;colour
looap1:

looap2:
mov [es: di], ah
add di, 1

loop looap2
add di ,120
mov cx, 40
dec si 
jnz looap1

pop di
pop si
pop cx
pop ax
pop es
pop bp

ret 


;...............................................................................

sky:

push bp
mov bp, sp
push es
push ax
push cx
push si
push di

mov ax, 0xb800
mov es, ax


mov cx, 1120
mov di,0

mov  ah, 0x33 ;colour

skyloop;

mov [es: di], ah
add di, 1

loop skyloop 
pop di
pop si
pop cx
pop ax
pop es
pop bp

ret
;...............................................................................

speedmeter:

push bp
mov bp, sp
push es
push ax
push cx
push si
push di

mov ax, 0xb800
mov es, ax
mov di,0
mov si, 5
mov cx, 120
mov di,cx
mov dx,160

mov  ah, 0x44 ;colour

maeterloop1:

maeterloop2:

mov [es: di], ah
add di, 1
cmp di,dx
jne maeterloop2
add cx, 160
mov di,cx
add dx,160
dec si
jnz maeterloop1




pop di
pop si
pop cx
pop ax
pop es
pop bp

ret

;...............................................................................

grassroundleft:

push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax
mov di,1120
mov si, 7
mov cx, di
mov bx,di
add bx,80
mov dx,bx

mov  ah, 0x22 ;colour

grassroundloop1:

grassroundloop2:

mov [es: di], ah
add di, 1
cmp di,dx
jne grassroundloop2
mov byte[es: di],0x22
add bx,160
sub bx,10
add cx,160
mov di,cx
mov dx,bx
dec si
jnz grassroundloop1

pop si
pop cx
pop ax
pop es
pop bp

ret 
;...............................................................................

grassroundright:

push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax
mov bx,1250
mov di,bx ; 1120 for left grass add 100 
mov si, 5
mov cx, 1280

mov  ah, 0x22 ;colour

grassrroundloop1:

grassrroundloop2:

mov [es: di], ah
add di, 1
cmp di,cx
jne grassrroundloop2

add bx,160
add bx,6

add cx,160
mov dx,cx
add dx,bx
mov di,bx
dec si
jnz grassrroundloop1

pop si
pop cx
pop ax
pop es
pop bp

ret 
;...............................................................................

grassleft:

push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax
mov di,1110
mov si, 7
mov cx, di
mov bx,di
add bx,70
mov dx,bx

mov  ah, 0x22 ;colour

grassloop1:

grassloop2:

mov [es: di], ah
add di, 1
cmp di,dx
jne grassloop2
mov byte[es: di],0x22
add bx,160
sub bx,9
add cx,160
mov di,cx
mov dx,bx
dec si
jnz grassloop1

pop si
pop cx
pop ax
pop es
pop bp

ret 
;...............................................................................


grassright:

push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax
mov bx,1220
mov di,bx ; 1120 for left grass add 100 
mov si, 7
mov cx, 1280
mov dx,50

mov  ah, 0x22 ;colour

grassrloop1:
mov byte[es: di], 0x22
add di,1
grassrloop2:

mov [es: di], ah
add di, 1
cmp di,cx
jne grassrloop2

add bx,160
add bx,9

add cx,160
mov dx,cx
add dx,bx
mov di,bx
dec si
jnz grassrloop1

pop si
pop cx
pop ax
pop es
pop bp

ret 
;...............................................................................
road:

push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax
mov bx,1190
mov di,bx     ; start at  bx  1190  end   cx  at 1240
mov si, 11
mov cx, 1210
mov dx,30

mov  ah, 0x11 ;colour
mov al,0x20
roadloop1:

roadloop2:

mov word[es: di], 0x80
add di, 1
cmp di,cx
jne roadloop2

add bx,160
sub bx,10
add cx,160
add cx,10
mov dx,cx
add dx,bx
mov di,bx
dec si
jnz roadloop1





pop si
pop cx
pop ax
pop es
pop bp
ret 
;..........................................................................................................

screenblack:

push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax

mov di, 1120; 
mov cx, 2080


mov  ah, 0x80 ;colour
screenblackloop:
mov [es: di], ah
add di, 1
cmp di,cx
jne screenblackloop

pop si
pop cx
pop ax
pop es
pop bp

ret 




;..........................................................................................................


car:

push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax

mov di, 2240; 
mov cx, 4000


mov  ah, 0xff ;colour
carloop:
mov [es: di], ah
add di, 1
cmp di,cx
jne carloop

pop si
pop cx
pop ax
pop es
pop bp

ret 

;................................................................................
steering 

push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax

mov ah,11
mov di , 2502
mov cx,di
add cx,2
mov si,5
carsloop3:

carsloop4:
mov byte[es: di], 0x11
add di, 1
cmp di,cx
jne carsloop4

add di ,160
mov cx,di
add cx,2

dec si
jnz carsloop3




;////................


mov di, 3944 

mov cx,di

add cx,2

mov si,5

carsloop2:

carsloop1:
mov byte[es: di], 0x11
add di, 1
cmp di,cx
jne carsloop1

sub di ,160
mov cx,di
add cx,2

dec si
jnz carsloop2

;..//............



mov di, 3092 

mov cx,di

add cx,2

mov si,5

stloop2:

stloop1:
mov byte[es: di], 0x11
add di, 1
cmp di,cx
jne stloop1

sub di ,160
mov cx,di
add cx,2

dec si
jnz stloop2

;//////.....................
mov di, 3250

mov cx,di

add cx,2

mov si,5

sloop2:

sloop1:
mov byte[es: di], 0x11
add di, 1
cmp di,cx
jne sloop1

add di ,160
mov cx,di
add cx,2

dec si
jnz sloop2
;////////////////////////////////




mov di,2462
mov cx,2502


sloop3:

mov byte[es: di], 0x11
add di, 1
cmp di,cx

jne sloop3	
;/////////////////


mov di,3900
mov cx,3944


sloop4:

mov byte[es: di], 0x11	
add di, 1
cmp di,cx

jne sloop4
;//////////////////////////////

mov di, 3282

mov cx,di

add cx,4

mov si,5

strloop2:

strloop1:
mov byte[es: di], 0x11
add di, 1
cmp di,cx
jne strloop1

sub di ,160
mov cx,di
add cx,4

dec si
jnz strloop2
mov si,6

add di,160

extlop:
mov byte[es: di], 0x11
add di,1
dec si
jnz extlop

;////////////////////////////////////////////


mov di, 2622
mov si,10
sub di,6

extlop1:
mov byte[es: di], 0x11
add di,1
dec si
jnz extlop1


mov di, 2462

mov cx,di

add cx,4

mov si,5

streloop2:

streloop1:
mov byte[es: di], 0x11
add di, 1
cmp di,cx
jne streloop1

add di ,160
mov cx,di
add cx,4

dec si
jnz streloop2


;////////////////////////////////




mov di, 3282

mov cx,di
mov bx,di
add cx,4

mov si,5

streeloop2:

streeloop1:
mov byte[es: di], 0x11
add di, 1
cmp di,cx
jne streeloop1

add bx ,160
mov di,bx
mov cx,bx
add cx,4

dec si
jnz streeloop2

pop si
pop cx
pop ax
pop es
pop bp

ret 

;...................................................

signal:


push bp
mov bp, sp
push es
push ax
push cx
push si

mov ax, 0xb800
mov es, ax

mov di, 0

mov bx,di
mov si, 10
mov cx, 25
signalloop1:

signalloop2:
mov byte[es: di], 0x80
add di, 1
cmp di,cx
jne signalloop2
add bx ,160
mov di,bx
mov cx,bx
add cx, 25
dec si

jnz signalloop1
;//////////////////////////

mov ax, 0xb800
mov es, ax

mov di, 2

mov bx,di
mov si, 3
mov cx,di
add cx,8
signaloop1:

signaloop2:
mov byte[es: di], 0x44
add di, 1
cmp di,cx
jne signaloop2
add bx ,160
mov di,bx
mov cx,bx
add cx, 8
dec si

jnz signaloop1

;//////////////////////////

mov di, 15

mov bx,di
mov si, 3
mov cx,di

add cx, 8
signp1:

signp2:
mov byte[es: di], 0x44
add di, 1
cmp di,cx
jne signp2
add bx ,160
mov di,bx
mov cx,bx
add cx, 8
dec si
jnz signp1
;/////////////////////////////////////

mov ax, 0xb800
mov es, ax

mov di, 642

mov bx,di
mov si, 2
mov cx,di
add cx,8
sigoop1:

sigoop2:
mov byte[es: di], 0x44
add di, 1
cmp di,cx
jne sigoop2
add bx ,160
mov di,bx
mov cx,bx
add cx, 8
dec si

jnz sigoop1
;/////////////////////////////////////

mov ax, 0xb800
mov es, ax

mov di, 655

mov bx,di
mov si, 2
mov cx,di
add cx,8
sigo2:

sigo1:
mov byte[es: di], 0x44
add di, 1
cmp di,cx
jne sigo1
add bx ,160
mov di,bx
mov cx,bx
add cx, 8
dec si

jnz sigo2

pop si
pop cx
pop ax
pop es
pop bp

ret 


;....................................


firebutton:

push bp
mov bp, sp
push es
push ax
push cx
push si
	
mov di,3720
mov ax,fire
push ax
push word[firelen]
call printstr


mov di,2440
mov ax,zero
push ax
push word[zerolen]
call printstr



mov di,2958
mov ax,rpm
push ax
push word[rpmlen]
call printstr

;............ALL BUTTONS ................................................


mov di,2634
mov ax,counting
push ax
push word[countinglen]
call printstr

mov di,2798
mov byte[es: di], 0x44
add di, 1
mov byte[es: di], 0x44
;...........temp car 


mov di,3610
mov ax,temp
push ax
push word[templen]
call printstr

mov di,3286
mov ax,counting
push ax
push word[countinglen]
call printstr


mov di,3446
mov byte[es: di], 0x44
add di, 1
mov byte[es: di], 0x44
;/,,,,,,,,,,,,,,,,,,,,oil 

mov di,3584
mov ax,oil
push ax
push word[oillen]
call printstr

mov di,3256
mov ax,counting
push ax
push word[countinglen]
call printstr


mov di,3432
mov byte[es: di], 0x44
add di, 1
mov byte[es: di], 0x44




;/...........................

mov ax, 0xb800
mov es, ax

mov di, 3880

mov bx,di
mov si, 2
mov cx,di
add cx,8

fireloop1:

fireloop2:
mov byte[es: di], 0x44
add di, 1
cmp di,cx
jne fireloop2
add bx ,160
mov di,bx
mov cx,bx
add cx, 8
dec si

jnz fireloop1

pop si
pop cx
pop ax
pop es
pop bp

ret 
;.............................


fuelbutton:

push bp
mov bp, sp
push es
push ax
push cx
push si
	
mov di,3970
mov ax,fuel
push ax
push word[fuellen]
call printstr



mov ax, 0xb800
mov es, ax

mov di, 3880

mov bx,di
mov si, 2
mov cx,di
add cx,8

fuelloop1:

fuelloop2:
mov byte[es: di], 0x44
add di, 1
cmp di,cx
jne fuelloop2
add bx ,160
mov di,bx
mov cx,bx
add cx, 8
dec si

jnz fuelloop1

pop si
pop cx
pop ax
pop es
pop bp

ret 
;.............................
printstr:

push bp
mov bp, sp
push es
push ax
push cx
push si

mov ax, 0xb800
mov es, ax


mov si, [bp+6]
mov cx, [bp+4]
mov  ah, 0x07
nextchar1:
mov al, [si]
mov [es: di], ax
add di, 2
add si, 1
loop nextchar1

pop si
pop cx
pop ax
pop es
pop bp

ret 4

;..............................
rightmirror:
push bp
mov bp, sp
push es
push ax
push cx
push si

 mov ax, 0xb800 
 mov es, ax  
 mov ds, ax 

mov si,1000
mov di ,2400
mov bx,si
mov dx,di
mov cx,15

mov bp,3

milop1:

milop2:
mov ax,[ds:si]
mov [es:di],ax
add di,2
add si,2
loop milop2
mov cx,15
add bx,160
add dx,160
mov si,bx
mov di,dx
dec bp
jnz milop1



pop si
pop cx
pop ax
pop es
pop bp

ret		
;..............................

leftmirror:
push bp
mov bp, sp
push es
push ax
push cx
push si

 mov ax, 0xb800 
 mov es, ax  
 mov ds, ax 

mov si,1050
mov di,2530
mov bx,si
mov dx,di
mov cx,15

mov bp,3

mirrlop1:

mirrlop2:
mov ax,[ds:si]
mov [es:di],ax
add di,2
add si,2
loop mirrlop2
mov cx,15
add bx,160
add dx,160
mov si,bx
mov di,dx
dec bp
jnz mirrlop1

pop si
pop cx
pop ax
pop es
pop bp

ret		


gearbox:

push bp
mov bp, sp
push es
push ax
push cx
push si

mov ax, 0xb800
mov es, ax

mov di, 3170 ; gear starts at 3180
mov si, 4
mov bx,3200
mov cx, di
mov  ah, 0x80;colour
gearlop3:

gearlop4:
mov [es: di], ah
add di, 1
cmp di, bx
jnz gearlop4

add bx ,160

add cx, 160

mov di,cx
dec si 
jnz gearlop3


mov di, 3175 ; gear starts at 3180
mov si, 4
mov bx,3180
mov cx, di
mov  ah, 0x66;colour
gearlop1:

gearlop2:
mov [es: di], ah
add di, 1
cmp di, bx
jnz gearlop1

add bx ,160

add cx, 160

mov di,cx
dec si 
jnz gearlop2


mov di, 3185 ; gear starts at 3180
mov si, 4
mov bx,3190
mov cx, di
mov  ah, 0x66;colour
garlop1:

garlop2:
mov [es: di], ah
add di, 1
cmp di, bx
jnz garlop1

add bx ,160

add cx, 160

mov di,cx
dec si 
jnz garlop2

mov di, 3195 ; gear starts at 3180
mov si, 4
mov bx,3199
mov cx, di
mov  ah, 0x66;colour
grlop1:

grlop2:
mov [es: di], ah
add di, 1
cmp di, bx
jnz grlop1

add bx ,160

add cx, 160

mov di,cx
dec si 
jnz grlop2



mov di, 3335 ; gear starts at 3180

mov bx,3355
mov cx, di
mov  ah, 0x66;colour
garlp1:

mov [es: di], ah
add di, 1
cmp di, bx
jnz garlp1



mov di, 3175 ; gear starts at 3180

mov bx,3180
mov cx, di
mov  ah, 0x11;colour
gelp:
mov [es: di], ah
add di, 1
cmp di, bx
jnz gelp





pop si
pop cx
pop ax
pop es
pop bp
ret

;..................................................

startgame:

push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax



mov di,360
mov cx,440
mov bx,di
mov si,4
mov  ah, 0x77 ;colour

startloop2;

startloop1;

mov [es: di], ah
add di, 1
cmp di,cx
jne startloop1
add bx,160
add cx,160
mov di,bx

dec si
jnz startloop2


mov di,1000
mov cx,1003
mov bx,di
mov si,5
mov  ah, 0x77 ;colour

sttloop2;

sttloop1;

mov [es: di], ah
add di, 1
cmp di,cx
jne sttloop1
add bx,160
add cx,160
mov di,bx

dec si
jnz sttloop2

;.......................................................


mov di,1078
mov cx,1081
mov bx,di
mov si,5
mov  ah, 0x77 ;colour

staloop2;

staloop1;

mov [es: di], ah
add di, 1
cmp di,cx
jne staloop1
add bx,160
add cx,160
mov di,bx

dec si
jnz staloop2


pop si
pop cx
pop ax
pop es
pop bp

ret
;................video ...........................................

tickcount:	dw	1197
s:dw 0
s1: db 0
roadmarks:
push bp
mov bp, sp
push es
push ax
push cx
push si

mov ax, 0xb800
mov es, ax
mov bx,1198
mov di,bx     
mov si, 5
mov cx, bx
add cx,2
mov dx,60
mov ah,[s1]
roadmloop1:

roadmloop2:

mov byte[es: di], ah
add di, 1
cmp di,cx
jne roadmloop2

add bx,160
add cx,160
mov di,bx
cmp ah,0x77
je roadlinechange

cmp ah,0x80
je roadlinechange1

roadback:

dec si
jnz roadmloop1

jmp roadend

roadlinechange:
mov ah,0x80
jmp roadback

roadlinechange1:
mov ah,0x77
jmp roadback

roadend:

pop si
pop cx
pop ax
pop es
pop bp
ret 
;.............................................................

;...................................................................

roadpathmarks:
push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax

mov bx,1180
mov dx,bx
mov di,bx
add dx,2
mov ah,[s1]
mov si,7
pathm1r:

pathm2r:
mov byte[es: di], ah
add di, 1
cmp di,dx
jne pathm2r
sub bx,9
add bx,160
mov di,bx
add dx,160
sub dx,9

cmp ah,0x77
je roadlinechangepath

cmp ah,0x80
je roadlinechange1path

roadbackpath:

dec si
jnz  pathm2r

jmp roadendpath

roadlinechangepath:
mov ah,0x80
jmp roadbackpath

roadlinechange1path:
mov ah,0x77
jmp roadbackpath

roadendpath:


pop si
pop cx
pop ax
pop es
pop bp
ret 


;.................................................................
roadpathmarksl:
push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax

mov bx,1220
mov dx,bx
mov di,bx
add dx,2
mov ah,[s1]
mov si,7
pathm1l:

pathm2l:
mov byte[es: di], ah
add di, 1
cmp di,dx

jne pathm2l

add bx,169
mov di,bx
mov dx,bx
add dx,2

cmp ah,0x77
je chngecolorl

cmp ah,0x80
je chngecolorf

backend:
dec si
jnz  pathm1l
jmp eenndd

chngecolorl:
mov ah,0x80
jmp backend
chngecolorf:
mov ah,0x77
jmp backend

eenndd:


pop si
pop cx
pop ax
pop es
pop bp
ret 


;............................................................................................
carloc:dw 160
caronroad:
push bp
mov bp, sp
push es
push ax
push cx
push si

mov bx, 324
mov dx,bx
mov di,bx
add dx,30
mov ah,0x77
caronroadlop1:
mov byte[es: di], ah
add di,1
cmp di,dx
jne caronroadlop1


mov ax, 0xb800
mov es, ax
mov di,[carloc]


mov byte[es: di], 0x55
add di,1
mov byte[es: di], 0x55
add di,1
mov byte[es: di], 0x55


pop si
pop cx
pop ax
pop es
pop bp
ret
;......................................................
print_mountain:
mounloop1:

mounloop2:
mov byte[es: di], 0xff
add di, 1
cmp di,bx
jne mounloop2

add dx,160
sub dx,2
mov di,dx
add bx,162

add si,1
cmp si,4
jne mounloop1
ret


mountain:

push bp
mov bp, sp
push es
push ax
push cx
push si
mov di, 560
mov bx,di
mov dx,bx
sub dx,4
mov di,dx
mov ax, 0xb800
mov es, ax
mov si, 0
call print_mountain


mov di, 520
mov bx,di
mov dx,bx
sub dx,4
mov di,dx
mov ax, 0xb800
mov es, ax
mov si, 0
call print_mountain

mov di, 580
mov bx,di
mov dx,bx
sub dx,4
mov di,dx
mov ax, 0xb800
mov es, ax
mov si, 0
call print_mountain

mov di, 500
mov bx,di
mov dx,bx
sub dx,4
mov di,dx
mov ax, 0xb800
mov es, ax
mov si, 0
call print_mountain


mov di, 620
mov bx,di
mov dx,bx
sub dx,4
mov di,dx
mov ax, 0xb800
mov es, ax
mov si, 0
call print_mountain

pop si
pop cx
pop ax
pop es
pop bp

ret 

;....................................................................


print_building:
builloop1:

builloop2:
mov byte[es: di], al
add di, 1
cmp di,bx
jne builloop2

add dx,160
sub dx,1
mov di,dx
add bx,161

add si,1
cmp si,4
jne builloop1
ret


building:

push bp
mov bp, sp
push es
push ax
push cx
push si

mov di, 560
mov bx,di
mov dx,bx
sub dx,2
mov di,dx
mov ax, 0xb800
mov es, ax
mov si, 0
mov al,0xff
call print_building


mov di, 520
mov bx,di
mov dx,bx
sub dx,2
mov di,dx
mov ax, 0xb800
mov es, ax
mov si, 0
mov al,0xff
call print_building

mov di, 580
mov bx,di
mov dx,bx
sub dx,2
mov di,dx
mov ax, 0xb800
mov es, ax
mov si, 0
mov al,0x80
call print_building

mov di, 500
mov bx,di
mov dx,bx
sub dx,2
mov di,dx
mov ax, 0xb800
mov es, ax
mov si, 0
mov al,0xff
call print_building


mov di, 620
mov bx,di
mov dx,bx
sub dx,2
mov di,dx
mov ax, 0xb800
mov es, ax
mov si, 0
mov al,0x80
call print_building

pop si
pop cx
pop ax
pop es
pop bp

ret
;..................................................

change_color:

cmp al,0x55
je ksk
cmp al,0x44
je ksk1

ksk:
mov al,0x44
jmp endksk
ksk1:
mov al,0x55
jmp endksk


endksk:



ret
;...............................................
audience:

push bp
mov bp, sp
push es
push ax
push cx
push si

mov di, 910
mov bx,di
mov dx,bx
sub dx,70
mov di,dx
mov ax, 0xb800
mov es, ax
mov si, 0
mov al,0x44
aclop1:

mov byte[es: di], al
add di, 1
mov byte[es: di], al
add di, 1
call change_color

cmp di,bx
jne aclop1


mov di, 1110
mov bx,di
mov dx,bx
sub dx,140
mov di,dx
mov ax, 0xb800
mov es, ax
mov si, 0
mov al,0x44
ac1lop1:

mov byte[es: di], al
add di, 1
mov byte[es: di], al
add di, 1
call change_color

cmp di,bx
jne ac1lop1



pop si
pop cx
pop ax
pop es
pop bp

ret
roadpathmarksforleft:
push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax

mov bx,1210
mov dx,bx
mov di,bx
add dx,2
mov ah,[s1]
mov si,6
pathm1rforleft:

pathm2rforleft:
mov byte[es: di], ah
add di, 1
cmp di,dx
jne pathm2rforleft
sub bx,9
add bx,160
mov di,bx
add dx,160
sub dx,9

cmp ah,0x77
je roadlinechangepathforleft

cmp ah,0x80
je roadlinechange1pathforleft

roadbackpathforleft:

dec si
jnz  pathm2rforleft

jmp roadendpathforleft

roadlinechangepathforleft:
mov ah,0x80
jmp roadbackpathforleft

roadlinechange1pathforleft:
mov ah,0x77
jmp roadbackpathforleft

roadendpathforleft:


pop si
pop cx
pop ax
pop es
pop bp
ret 


;.................................................................
roadpathmarkslforleft:
push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax

mov bx,1240
mov dx,bx
mov di,bx
add dx,2
mov ah,[s1]
mov si,5
pathm1lforleft:

pathm2lforleft:
mov byte[es: di], ah
add di, 1
cmp di,dx

jne pathm2lforleft

add bx,169
mov di,bx
mov dx,bx
add dx,2

cmp ah,0x77
je chngecolorlforleft

cmp ah,0x80
je chngecolorfforleft

backendforleft:
dec si
jnz  pathm1lforleft
jmp eennddforleft

chngecolorlforleft:
mov ah,0x80
jmp backendforleft
chngecolorfforleft:
mov ah,0x77
jmp backendforleft

eennddforleft:


pop si
pop cx
pop ax
pop es
pop bp
ret 


;............................................................................................

grassleftforleft:

push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax
mov di,1120
mov si, 6
mov cx, di
mov bx,di
add bx,90
mov dx,bx

mov  ah, 0x22 ;colour

grassloop1forleft:

grassloop2forleft:

mov [es: di], ah
add di, 1
cmp di,dx
jne grassloop2forleft
mov byte[es: di],0x22
add bx,160
sub bx,9
add cx,160
mov di,cx
mov dx,bx
dec si
jnz grassloop1forleft

pop si
pop cx
pop ax
pop es
pop bp

ret 
;...............................................................................


grassrightforleft:

push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax
mov bx,1240
mov di,bx ; 1120 for left grass add 100 
mov si, 5
mov cx, 1280
mov dx,50

mov  ah, 0x22 ;colour

grassrloop1forleft:
mov byte[es: di], 0x22
add di,1
grassrloop2forleft:

mov [es: di], ah
add di, 1
cmp di,cx
jne grassrloop2forleft

add bx,160
add bx,9

add cx,160
mov dx,cx
add dx,bx
mov di,bx
dec si
jnz grassrloop1forleft

pop si
pop cx
pop ax
pop es
pop bp

ret 
;////////////////////////////////////////

roadpathmarksforright:
push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax

mov bx,1160
mov dx,bx
mov di,bx
add dx,2
mov ah,[s1]
mov si,5
pathm1rforright:

pathm2rforright:
mov byte[es: di], ah
add di, 1
cmp di,dx
jne pathm2rforright
sub bx,9
add bx,160
mov di,bx
add dx,160
sub dx,9

cmp ah,0x77
je roadlinechangepathforright

cmp ah,0x80
je roadlinechange1pathforright

roadbackpathforright:

dec si
jnz  pathm2rforright

jmp roadendpathforright

roadlinechangepathforright:
mov ah,0x80
jmp roadbackpathforright

roadlinechange1pathforright:
mov ah,0x77
jmp roadbackpathforright

roadendpathforright:


pop si
pop cx
pop ax
pop es
pop bp
ret 


;.................................................................
roadpathmarkslforright:
push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax

mov bx,1200
mov dx,bx
mov di,bx
add dx,2
mov ah,[s1]
mov si,6
pathm1lforright:

pathm2lforright:
mov byte[es: di], ah
add di, 1
cmp di,dx

jne pathm2lforright

add bx,169
mov di,bx
mov dx,bx
add dx,2

cmp ah,0x77
je chngecolorlforright

cmp ah,0x80
je chngecolorfforright

backendforright:
dec si
jnz  pathm1lforright
jmp eennddforright

chngecolorlforright:
mov ah,0x80
jmp backendforright
chngecolorfforright:
mov ah,0x77
jmp backendforright

eennddforright:


pop si
pop cx
pop ax
pop es
pop bp
ret 
;..............................................................................
grassleftforright:

push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax
mov di,1110
mov si,6
mov cx, di
mov bx,di
add bx,50
mov dx,bx

mov  ah, 0x22 ;colour

grassloop1forright:

grassloop2forright:

mov [es: di], ah
add di, 1
cmp di,dx
jne grassloop2forright
mov byte[es: di],0x22
add bx,160
sub bx,9
add cx,160
mov di,cx
mov dx,bx
dec si
jnz grassloop1forright

pop si
pop cx
pop ax
pop es
pop bp

ret 
;...............................................................................

grassrightforright:

push bp
mov bp, sp
push es
push ax
push cx
push si


mov ax, 0xb800
mov es, ax
mov bx,1200
mov di,bx ; 1120 for left grass add 100 
mov si, 6
mov cx, 1280
mov dx,50

mov  ah, 0x22 ;colour

grassrloop1forright:
mov byte[es: di], 0x22
add di,1
grassrloop2forright:

mov [es: di], ah
add di, 1
cmp di,cx
jne grassrloop2forright

add bx,160
add bx,9

add cx,160
mov dx,cx
add dx,bx
mov di,bx
dec si
jnz grassrloop1forright

pop si
pop cx
pop ax
pop es
pop bp

ret 


;.....................................
gamechanger: dw 0
gamechanger1: dw 0

movRL: dw 2


kbisr:
push ax 
push es
mov ax, 0xb800 
mov es, ax
in al, 0x60 
cmp al, 0x4b
jne nextcmp
call screenblack
		call grassleftforright
		call grassrightforright
		call sky
		;call roadmarks
		call roadpathmarksforright
		call roadpathmarkslforright
		call steeringmoving
mov ax, 0xb800
mov es, ax
mov di , 2300
mov byte[es: di], 0x55
add di, 1
mov byte[es: di], 0x55
add di, 1
nextcmp:

cmp al, 0x48
jne nextcmp1
mov word[speedcont],0x10
mov word[wossd],1
call steeringmoving
mov ax, 0xb800
mov es, ax
mov di , 2320
mov byte[es: di], 0x55
add di, 1
mov byte[es: di], 0x55
add di, 1
nextcmp1:

cmp al, 0x50
jne nextcmp2
mov word[speedcont],0x44
add word [cs:tickra],30
nextcmp2:
cmp al, 0x4d
jne nomatch
call screenblack
		call grassleftforleft
		call grassrightforleft
		call sky
		;call roadmarks
		call roadpathmarksforleft
		call roadpathmarkslforleft
		call steeringmoving
mov ax, 0xb800
mov es, ax
mov di , 2340
mov byte[es: di], 0x55
add di, 1
mov byte[es: di], 0x55
add di, 1

jmp nomatch


ckey3:
mov word[movRL],1
ckey4:
mov word[movRL],2



nomatch:
mov al, 0x20 
out 0x20, al
pop es 
pop ax
iret

changekeys:
call screenblack
	

		call grassleft
		call grassright
		call sky
		call roadmarks
		call roadpathmarks
		call roadpathmarksl
		
ret

speedcont: dw 0xff
;........................................
timer:		

while1:

mov si,[speedcont]
timerl2:

mov cx,0xffff
timerl1:
loop timerl1
dec si

jne timerl2


     	mov	di, [cs:tickcount]

		cmp  word[s],1
		je cha
		mov word[s],1
		mov  byte[s1],0x77
	
		jmp end 
		cha: 
		mov word[s],0
		mov byte[s1],0x80
		end:

		add word[gamechanger],1

		cmp word[gamechanger],20
		je	chnback1
		cmp word[gamechanger],40
		je	chnback2
		cmp word[gamechanger],60
		je	chnback3
		cmp word[gamechanger],80
		je	chnback4

		jmp kisp

		chnback1:
		mov word[gamechanger1],1
		call grassleftforright
		call grassrightforright
		call sky
		;call roadmarks
		call roadpathmarksforright
		call roadpathmarkslforright
		call building
		 call map
		 call caronroad
		 call rightmirror
		call leftmirror
		 call speedmeter
			call screenblack
		jmp dne
		chnback2:
	call grassleftforright
		call grassrightforright
		call sky
		;call roadmarks
		call roadpathmarksforright
		call roadpathmarkslforright
		mov word[gamechanger1],2
		call grassroundleft
		call grassroundright
			call screenblack
		jmp dne
		chnback3:
		call grassleftforright
		call grassrightforright
		call sky
		;call roadmarks
		call roadpathmarksforright
		call roadpathmarkslforright
		
		mov word[gamechanger1],3
		call grassroundleft
		call grassroundright

			call screenblack
		jmp dne
		chnback4:
		call grassleftforright
		call grassrightforright
		call sky
		;call roadmarks
		call roadpathmarksforright
		call roadpathmarkslforright
		
		mov word[gamechanger1],4
		call grassroundleft
		call grassroundright
		call screenblack
		dne:

		kisp:

		cmp word[gamechanger1],1
		je	cback1
		cmp word[gamechanger1],2
		je	cback2
		cmp word[gamechanger1],3
		je	cback3
		cmp word[gamechanger1],4
		je	cback4



		cback1:
		
		cmp word[carloc],170
		je skimap1
		add word[carloc],1
		skimap1:

		call changekeys
		call map
		
		call speedmeter
		 call rightmirror
		call leftmirror
		call caronroad
		jmp dneee
		cback2:
		mov word[carloc],520
		skimap2:
		call changekeys
		call building
		 call map
		
		call rightmirror
		call leftmirror
		 call speedmeter
		  call caronroad

		 jmp dneee
		cback3:
		sub word[carloc],1
		skimap3
		call changekeys
		call mountain
		call map
		call caronroad
		call speedmeter
		 call caronroad

		 jmp dneee
		cback4:
		sub word[carloc],160
		call changekeys
		call audience
		call map
		call caronroad
		call rightmirror
		call leftmirror
		call speedmeter
		 call caronroad

		dneee:
		call time
		
		mov di,0
		cmp word[gamechanger],110

		jne while1
		ret	
;.................................................................

printnum:
		push bp
		mov bp, sp
		push es
		push ax
		push bx
		push cx
		push dx
		push di

		mov ax, 0xb800
		mov es, ax
		mov ax, [bp+4]
		mov bx, 10
		mov cx, 0

nextdigitt2:
		mov dx, 0
		div bx
		add dl, 0x30
		push dx
		inc cx
		cmp ax, 0
		jnz nextdigitt2

		mov di, 280


nextpost2:	
		pop dx
		mov dh, 0x07
		mov [es:di], dx
		add di, 2
		loop nextpost2

		pop di
		pop dx
		pop cx
		pop bx
		pop ax
		pop es
		pop bp
		ret 2


		printnum2:	push bp
		mov bp, sp
		push es
		push ax
		push bx
		push cx
		push dx
		push di

		mov ax, 0xb800
		mov es, ax
		mov ax, [bp+4]
		mov bx, 10
		mov cx, 0

nextdigitt22:
		mov dx, 0
		div bx
		add dl, 0x30
		push dx
		inc cx
		cmp ax, 0
		jnz nextdigitt22

		mov di, 286


nextpost22:	
		pop dx
		mov dh, 0x07
		mov [es:di], dx
		add di, 2
		loop nextpost22

		pop di
		pop dx
		pop cx
		pop bx
		pop ax
		pop es
		pop bp
		ret 2
		
tickra : dw 0
tickr1a : dw 0
dipos1a: dw 290
time:
		
		add word [cs:tickra],1
		cmp word [cs:tickra],60
		jb sko1
		
		mov word [cs:tickra],0
		inc word [cs:tickr1a]
		sko1:
		
		push word [cs:tickr1a]
		call printnum
		add word[dipos1a],5

		push word [cs:tickra]
		call printnum2
		sub word[dipos1a],5

		ret
;..................................................................

steeringmoving

push bp
mov bp, sp
push es
push ax
push cx
push si

mov ax, 0xb800
mov es, ax
mov di , 2300

mov cx,46
l212:
mov byte[es: di], 0x11
add di, 1

loop l212

pop si
pop cx
pop ax
pop es
pop bp
ret 
;..................................................................


 strlen1: 
 push bp 
 mov bp,sp 
 push es 
 push cx 
 push di 
 les di, [bp+4]
 mov cx, 0xffff
 xor al, al 
 repne scasb 
 mov ax, 0xffff
 sub ax, cx 
 dec ax
 pop di 
 pop cx 
 pop es 
 pop bp 
 ret 4
 ;...........
 printstr1:
 push bp 
 mov bp, sp 
 push es 
 push ax 
 push cx 
 push si 
 push di 
 push ds 
 mov ax, [bp+4] 
 push ax 
 call strlen1
 cmp ax, 0 
 jz asdexit 
 mov cx, ax 
 mov ax, 0xb800 
 mov es, ax 

 mov di,2000
 mov si, [bp+4] 
 mov ah, 0x07 
 cld 
asdnextchar:
 lodsb
 stosw 
 loop asdnextchar 
asdexit:
pop di 
 pop si 
 pop cx 
 pop ax 
 pop es 
 pop bp 
 ret 2
 ;................
 stopping1:
 push si
 push cx
 mov si,0xffee
 mov cx,0xf1ee
 asdlop2:
 asdlop1:
loop  asdlop1
 mov cx,0xf1
 dec si
 jnz asdlop2
 pop cx
 pop si
 ret


  results:
 		push bp
		mov bp, sp
		push es
		push ax
		push bx
		push cx
		push dx
		push di
 call cls_s
 mov di,200
 mov ax, message
 push ax 
call printstr1
 mov di,320
 mov ax, message
 push ax 
call printstr1
 mov di,480
 mov ax, message1
 push ax 
 call printstr1
  mov di,640
 mov ax, message2
 push ax 
 call printstr1
  mov di,800
 mov ax, message3
 push ax 
call printstr1
 mov di,960
 mov ax, message4
 push ax 
 call printstr1
  mov di,1120
 mov ax, message5
 push ax 
call printstr1
 mov di,1280
 mov ax, message6
 push ax 
call printstr1
 mov di,1440
 mov ax, message7
 push ax 
call printstr1
 mov di,1600
 mov ax, message8
 push ax 
call printstr1
 mov di,1760
 mov ax, message9
 push ax 
call printstr1
 mov di,1920
 mov ax, message10
 push ax 
call printstr1
mov ax, 0xb800
mov es, ax
mov di,0

mov cx,4000
mov ah,0x33
	pop di
		pop dx
		pop cx
		pop bx
		pop ax
		pop es
		pop bp

 ret
 oldisr: dd 0
;..................................................................
start:

call cls_s
call grassleft
call grassright
call roadpathmarks
call roadpathmarksl
call sky

;call building
;call mountain
call map
call speedmeter
;call road
call car
call steering

call firebutton
call fuelbutton
call rightmirror
call leftmirror
call gearbox
call startgame
call caronroad
call signal
call steeringmoving

xor ax, ax 
mov es, ax
mov ax, [es:9*4] 
mov [oldisr], ax
mov ax, [es:9*4+2] 
mov [oldisr+2], ax


xor ax, ax
mov es, ax
cli
mov word [es:9*4], kbisr 
mov [es:9*4+2], cs
sti


while11:
cmp word[wossd],1
jne while11
call timer


call startgame

mov ax, [oldisr] 
mov bx, [oldisr+2]
cli
mov [es:9*4], ax 
mov [es:9*4+2], bx
sti
call cls_s
call  results

mov ax, 0x4c00 
int 0x21


fire: db "Fire"
firelen: dw 4
fuel: db "fuel"
fuellen: dw 4
zero: db"000"
zerolen: dw 3
temp: db"temp"
templen: dw 4
rpm: db"R.P.M."
rpmlen: dw 6
counting:db "0 1 2 3 4 5 "
countinglen : dw 11
oil : db "OIL"
oillen :dw 3
finalround : db" F I N I S H "
finalroundlen : dw 13
wossd:dw 0

wor1 : db 61

 message :db 'Qualifying Result Sheet', 0

 message1 :db '1      driver1   1.55', 0
 message2 :db '2      driver2 2.33', 0
 message3 :db '3      driver3 3.53', 0
 message4 :db '4      driver4 4.11', 0
 message5 :db '5      driver5 4.22', 0
 message6 :db '6      driver6 4.32', 0
 message7 :db '7      driver7 4.33', 0
 message8 :db '8      driver8 4.55', 0
 message9 :db '9      driver9 5.11', 0
 message10 :db '10    driver10  5.44', 0