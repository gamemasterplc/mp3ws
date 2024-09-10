.n64

.open "mp3.z64", "mp3_temprom.z64", 0

SCREEN_W equ 424
SCREEN_W_FLOAT equ 424.0
SCREEN_H equ 240
CFB_ADDR equ 0x80400000
ZBUF_ADDR equ 0x80700000
BG_TILE_CNT_X equ (((SCREEN_W+63)/64)+1)
BG_TILE_CNT equ (12*6)

BG_MSGQ1_ADDR equ (ZBUF_ADDR+(SCREEN_W*SCREEN_H*2))
BG_MSGQ2_ADDR equ (BG_MSGQ1_ADDR+(4*BG_TILE_CNT))
BG_MSGQ3_ADDR equ (BG_MSGQ2_ADDR+(4*BG_TILE_CNT))
BG_TILEINFO_ADDR equ (BG_MSGQ3_ADDR+(4*BG_TILE_CNT))
BG_TILEINFO_LIST_ADDR equ (BG_TILEINFO_ADDR+(20*BG_TILE_CNT))

RESULT_MAX_COLS equ 6

.headersize 0x80000400-0x1000 //Main Segment

.org 0x8000E6B4
lui v0, 0x8031 //Move Audio Heap

.org 0x8000E764
lui a1, hi(ZBUF_ADDR) //High Part of Z Buffer Address

.org 0x8000E76C
addiu a1, a1, lo(ZBUF_ADDR) //Low Part of Z Buffer Address

.org 0x800125D8
li.u a3, (SCREEN_W_FLOAT/SCREEN_H) //Load Aspect Ratio Low Part
li.l a3, (SCREEN_W_FLOAT/SCREEN_H) //Load Aspect Ratio High Part

.org 0x80012A70
li.u at, (SCREEN_W_FLOAT/SCREEN_H) //Load Aspect Ratio Low Part
li.l at, (SCREEN_W_FLOAT/SCREEN_H) //Load Aspect Ratio High Part

.org 0x80012AAC
li.u at, (SCREEN_W_FLOAT/2) //Scale for 3D to 2D Conversions

.org 0x80012DD4
li.u at, (SCREEN_W_FLOAT/SCREEN_H) //Load Aspect Ratio Low Part
li.l at, (SCREEN_W_FLOAT/SCREEN_H) //Load Aspect Ratio High Part

.org 0x80012DEC
li.u at, SCREEN_W_FLOAT //Scale for 2D to 3D Conversions

.org 0x8001BC34
li s0, ((SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Fade Scissor

.org 0x8001BFF8
ori v1, v1, (SCREEN_W-1) //Width of Framebuffer

.org 0x800354F4
lui a1, 0x1D //Expand Heap

.org 0x80036D0C
li.u at, (SCREEN_W_FLOAT/2) //Fix Default X Position of Sequences

.org 0x80036DE4
li.u at, (SCREEN_W_FLOAT/2) //Fix Default X Position of New Record

.org 0x80036F2C
li.u at, (SCREEN_W_FLOAT/2) //Fix Default X Position of Timers

.org 0x80037610
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Start Word

.org 0x80037948
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Growing Start Word

.org 0x80037B60
addiu a2, r0, (SCREEN_W/2) //Fix End X Position of Duel Start Word

.org 0x80037D00
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Falling Start Word

.org 0x80037DD4
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Falling Start Word

.org 0x8003830C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Duel Start Word

.org 0x800384A0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of 4-Player Start Word

.org 0x800387F0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of 4-Player Waiting Start Word

.org 0x80038C88
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Start Word

.org 0x80038DF0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Start Word

.org 0x800391A8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Start Word

.org 0x800396D8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Dizzy Dinghies Start Word

.org 0x80039978
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Dizzy Dinghies Start Word

.org 0x80039AE0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Start Word

.org 0x80039D84
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Start Word

.org 0x80039EE0
li.u at, (SCREEN_W_FLOAT-55) //Fix Screen Width of Stardust Start Word
li.l at, (SCREEN_W_FLOAT-55) //Fix Screen Width of Stardust Start Word

.org 0x8003A0F8
li.u at, (SCREEN_W_FLOAT/2) //Fix Screen Width of Stardust Start Word

.org 0x8003A16C
li.u at, (SCREEN_W_FLOAT/2) //Fix Final Screen Width of Stardust Start Word

.org 0x8003B56C
li.u at, (SCREEN_W_FLOAT/2) //Fix End X Position of Big Finish Word

.org 0x8003B8AC
li.u at, (SCREEN_W_FLOAT/2) //Fix End X Position of Big Finish Word

.org 0x8003B99C
li.u at, (SCREEN_W_FLOAT/2) //Fix End X Position of Big Finish Word

.org 0x8003BC34
li.u at, (SCREEN_W_FLOAT/2) //Fix End X Position of Big Finish Word

.org 0x8003B99C
li.u at, (SCREEN_W_FLOAT/2) //Fix End X Position of Big Finish Word

.org 0x8003C1AC
addiu a2, r0, (SCREEN_W/2) //Fix Initial X Position of Duel Finish Word

.org 0x8003C2B4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of 4-Player Finish Word

.org 0x8003C3E4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of 4-Player Finish Word

.org 0x8003C594
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of 4-Player Finish Word

.org 0x8003C6A8
addiu a2, r0, (SCREEN_W/2) //Fix Initial X Position of Finish Word

.org 0x8003C9E8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Finish Word

.org 0x8003CA90
addiu a2, r0, (SCREEN_W/2) //Fix Initial X Position of Finish Word

.org 0x8003CBC0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Finish Word

.org 0x8003CD70
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of 2 vs 2 Finish Word

.org 0x8003CF04
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Duel Finish Word

.org 0x8003D1A4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Dizzy Dinghies Finish Word

.org 0x8003D494
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Dizzy Dinghies Finish Word

.org 0x8003D54C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Finish Word

.org 0x8003D670
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Finish Word

.org 0x8003D848
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Finish Word

.org 0x8003D900
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Stardust Finish Word

.org 0x8003DA30
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Stardust Finish Word

.org 0x8003DBEC
addiu v0, v0, ((SCREEN_W/2)+50) //Fix Screen Width of Stardust Finish Word

.org 0x8003DC00
li.u at, (SCREEN_W_FLOAT/2) //Fix Center of Stardust Finish Word

.org 0x8003DDA4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Goal Text

.org 0x8003DFFC
li.u at, (SCREEN_W_FLOAT/2) //Fix Center X Position for Winner Name

.org 0x8003E120
li.u at, (SCREEN_W_FLOAT/2) //Fix Center X Position for Won Word

.org 0x8003E5E0
li.u at, SCREEN_W_FLOAT //Fix Screen Width for Loser Names

.org 0x8003F738
li.u at, (SCREEN_W_FLOAT/2) //Fix Center X Position of New Record

.org 0x8003F9C0
li.u at, (SCREEN_W_FLOAT/2) //Fix Center X Position of New Record

.org 0x8003FAE0
li.u at, (SCREEN_W_FLOAT/2) //Fix Center X Position of New Record

.org 0x8004032C
li.u at, (SCREEN_W_FLOAT/2) //Fix Center X Position of Game Over

.org 0x8003FDD0
li.u at, (SCREEN_W_FLOAT/2) //Fix Center X Position of Time Up

.org 0x80040ED8
li.u at, ((SCREEN_W_FLOAT/2)-80) //Fix Center X Position of First Winner

.org 0x80040FA8
li.u at, ((SCREEN_W_FLOAT/2)+80) //Fix Center X Position of Second Winner

.org 0x80040FC8
li.u at, ((SCREEN_W_FLOAT/2)+96) //Fix Center X Position of Alternative Second Winner

.org 0x80041140
li.u at, ((SCREEN_W_FLOAT/2)-80) //Fix Center X Position of First Winner

.org 0x8004116C
addiu a2, r0, ((SCREEN_W/2)-80) //Fix Sprite X Position of First Winner

.org 0x80041178
li.u at, ((SCREEN_W_FLOAT/2)+80) //Fix Center X Position of Second Winner

.org 0x80041198
li.u at, ((SCREEN_W_FLOAT/2)+96) //Fix Center X Position of Alternative Second Winner

.org 0x80041238
li.u at, ((SCREEN_W_FLOAT/2)-80) //Fix Center X Position of First Winner

.org 0x80041264
addiu a2, r0, ((SCREEN_W/2)-80) //Fix Sprite X Position of First Winner

.org 0x80041270
li.u at, ((SCREEN_W_FLOAT/2)+80) //Fix Center X Position of Second Winner

.org 0x80041290
li.u at, ((SCREEN_W_FLOAT/2)+96) //Fix Center X Position of Alternative Second Winner

.org 0x80041308
li.u at, ((SCREEN_W_FLOAT/2)+10) //Fix Center X Position of Win Text

.org 0x80041420
li.u at, (SCREEN_W_FLOAT/2) //Fix Alternative Center X Position of Win Text

.org 0x800417E4
li.u at, (SCREEN_W_FLOAT/2) //Fix Center X Position for Draw Word

.org 0x800441DC
li.u at, ((SCREEN_W_FLOAT/2)-11) //Fix Center X Position for Got Item

.org 0x800442C0
li.u at, ((SCREEN_W_FLOAT/2)-11) //Fix Center X Position for Got Item

.org 0x80044410
li.u at, ((SCREEN_W_FLOAT/2)-11) //Fix Center X Position for Got Item

.org 0x800444EC
li.u at, ((SCREEN_W_FLOAT/2)-11) //Fix Center X Position for Got Item

.org 0x800449DC
li.u at, ((SCREEN_W_FLOAT/2)-61) //Fix X Position for X Position of Got in Got Item

.org 0x80044A84
addiu v0, r0, ((SCREEN_W/2)+29) //Fix X Position of Question Mark in Got Item

.org 0x80044BE0
li.u at, ((SCREEN_W_FLOAT/2)-66) //Fix X Position for X Position of Got in Got Item

.org 0x80044CB4
li.u at, ((SCREEN_W_FLOAT/2)+34) //Fix X Position for X Position of Question Mark in Got Item

.org 0x80044D48
addiu v0, r0, ((SCREEN_W/2)+170) //Fix Start X Position of Question Mark in Got Item

.org 0x80044D60
addiu a2, r0, ((SCREEN_W/2)+170) //Fix Start Sprite X Position of Question Mark in Got Item

.org 0x800455AC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Pause Menu Pause Text

.org 0x800455F0
addiu a0, r0, ((SCREEN_W/2)-100) //Fix X Position of Pause Menu Control Windows

.org 0x800456F8
addiu a0, r0, SCREEN_W //Fix X Position of Pause Menu Return Window

.org 0x80045764
addiu a0, r0, SCREEN_W //Fix X Position of Pause Menu Page Instructions

.org 0x8004887C
lui a1, hi(ZBUF_ADDR) //High Part of Z Buffer Address

.org 0x80048884
addiu a1, a1, lo(ZBUF_ADDR) //Low Part of Z Buffer Address

.org 0x80048F50
addiu a0, r0, ((SCREEN_W/2)-35) //Fix X Position of Debug Pause Text Shadow

.org 0x80048F70
addiu a0, r0, ((SCREEN_W/2)-36) //Fix X Position of Debug Pause Text

.org 0x80048FD8
addiu a0, a0, ((SCREEN_W/2)-159) //Fix X Offset of Debug Pause Choice Highlight

.org 0x80049028
addiu a0, a0, ((SCREEN_W/2)-159) //Fix X Offset of Debug Pause Choice Shadow

.org 0x80049064
addu a2, a0, s0 //Free up Instruction
lbu a0, 0x184D(a2) //Load X Position of Pause Choice
addiu a0, a0, ((SCREEN_W/2)-160) //Fix Offset of Debug Pause Choice
addu a1, a2, r0 //Make A1 Expected Value

.org 0x800490CC
addiu a0, a0, ((SCREEN_W/2)-159) //Fix X Offset of Debug Pause Choice Cursor Shadow

.org 0x80049114
addu a2, a0, v0 //Free up Instruction
lbu a0, 0x184D(a2) //Load X Position of Pause Choice
addiu a0, a0, ((SCREEN_W/2)-160) //Fix Offset of Debug Pause Choice Cursor
addu a1, a2, r0 //Make A1 Expected Value

.org 0x8004B89C
li.u at, (SCREEN_W_FLOAT*2) //Fix Minigame Background Scale

.org 0x8004E5C4
li v0, (0xF6000000|((SCREEN_W-24) << 14)|(16 << 2)) //Fix Safety Frame Top Line

.org 0x8004E5E4
li a0, (0xF6000000|((SCREEN_W-24) << 14)|(224 << 2)) //Fix Safety Frame Bottom Line

.org 0x8004E620
li v0, (((SCREEN_W-24) << 14)|(16 << 2)) //Fix Safety Frame Right Line

.org 0x8004E63C
li v0, (((SCREEN_W-1) << 14)|(339 << 2)) //Fix FB End Scissor

.org 0x8004EA0C
sltiu v0, v0, SCREEN_W //Fix Maximum Debug Print X Position

.org 0x800523E8
li.u a1, -(SCREEN_W_FLOAT/2) //Sprite Ortho Left Edge
li.u a2, (SCREEN_W_FLOAT/2) //Sprite Ortho Right Edge

.org 0x80053054
addiu v0, r0, SCREEN_W //Fix Scissor Width for Sprites

.org 0x80054338
li v0, (SCREEN_W << 14)|(SCREEN_H << 2) //Fix Sprite Scissor

.org 0x80054708
li v0, (SCREEN_W << 14)|(SCREEN_H << 2) //Fix Ortho Sprite Scissor

.org 0x80054BD0
li.u a3, (SCREEN_W_FLOAT/SCREEN_H) //Load Aspect Ratio Low Part
li.l a3, (SCREEN_W_FLOAT/SCREEN_H) //Load Aspect Ratio High Part

.org 0x800575E0
li.u at, SCREEN_W_FLOAT //Fix Maximum Left Sprite X Position

.org 0x80057670
li.u at, SCREEN_W_FLOAT //Fix Maximum Right Sprite X Position

.org 0x80057950
li.u at, (SCREEN_W_FLOAT/2) //Sprite Ortho Clipping Offset

.org 0x80058714
li.u at, (SCREEN_W_FLOAT/2) //Sprite Ortho Offset

.org 0x8005AAA0
addiu v0, r0, SCREEN_W //Fix Window Centering

.org 0x8005AAFC
slti v0, v0, (SCREEN_W-23) //Fix Window Max Width

.org 0x8005AB08
addiu v0, r0, (SCREEN_W-24) //Fix Window Max Width

.org 0x800623DC
li v0, (0xF6000000|(SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Color Fades

.org 0x80063788
li v0, ((SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Scissor for Image Fades

.org 0x80063A88
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Image Fades

.org 0x80063F98
lui v1, (0xF600|(SCREEN_W >> 2)) //Fix Right Edge of Image Fades

.org 0x80063FC8
li v0, (0xF6000000|(SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Bottom-Right Edge of Image Fades

.org 0x8006406C
slti v0, a1, SCREEN_W //Fix Right Edge of Image Fades

.org 0x80064074
lui v1, (0xF600|(SCREEN_W >> 2)) //Fix Right Edge of Image Fades

.org 0x8006465C
addiu t7, r0, ((SCREEN_W/2)-16) //Fix X Position of Left Edge Transititon Tles

.org 0x80064760
li v0, (0xE4000000|(((SCREEN_W/2)+16) << 14)|(136 << 2)) //Fix X Position of Center Transititon Tile Right Side

.org 0x8006476C
li v0, ((((SCREEN_W/2)-16) << 14)|(104 << 2)) //Fix X Position of Center Transititon Tile

.org 0x800647A8
addiu v0, a1, ((SCREEN_W/2)+16) //Fix X Position of Edge Transititon Tile

.org 0x800648E8
addiu v0, a0, ((SCREEN_W/2)+16) //Fix X Position of Edge Transititon Tile

.org 0x80064A20
addiu v0, r0, ((SCREEN_W/2)+16) //Fix X Position of Edge Transititon Tile

.org 0x80064B5C
addiu v0, a0, ((SCREEN_W/2)+16) //Fix X Position of Edge Transititon Tile

.org 0x80064BAC
addiu v0, a0, ((SCREEN_W/2)-16) //Fix X Position of Edge Transititon Tile

.org 0x80064C90
slti v0, v0, 7 //Number of Transititon Tiles to Render

.org 0x80064D44
addiu t2, r0, ((SCREEN_W/2)-16) //Fix X Position of Left Edge Fill Transititon Tles

.org 0x80064E38
li v0, (0xF6000000|(((SCREEN_W/2)+16) << 14)|(136 << 2)) //Fix X Position of Center Transititon Tile Fill Right Side

.org 0x80064E44
li v0, ((((SCREEN_W/2)-16) << 14)|(104 << 2)) //Fix X Position of Center Transititon Tile Fill

.org 0x80064E6C
addiu v0, a1, ((SCREEN_W/2)+16) //Fix X Position of Edge Transititon Tile

.org 0x80064EF0
addiu v0, a1, ((SCREEN_W/2)+16) //Fix X Position of Edge Transititon Tile

.org 0x80064F78
addiu v0, r0, ((SCREEN_W/2)+16) //Fix X Position of Edge Transititon Tile

.org 0x80064FFC
addiu v0, a1, ((SCREEN_W/2)+16) //Fix X Position of Edge Transititon Tile

.org 0x80065038
addiu v0, a1, ((SCREEN_W/2)-16) //Fix X Position of Edge Transititon Tile

.org 0x80065080
slti v0, v0, 7 //Number of Transititon Fill Tiles to Render

.org 0x800652F4
addiu t6, r0, (SCREEN_W/2) //Fix X Position of Left Edge of Character in Fade

.org 0x800659D4
addiu v0, v0, (SCREEN_W/2) //Fix X Position of Right Edge of Character in Fade

.org 0x80065480
lui v1, (0xF600|(SCREEN_W/4)) //Fix Width of Character Fade Bar

.org 0x800A0A28
.dw (0xF6000000|((SCREEN_W-1) << 14)|((SCREEN_H-1) << 2)) //Upper Half of Z Clear Command

.org 0x800A0A50
.dw (0xF6000000|((SCREEN_W-1) << 14)|((SCREEN_H-1) << 2)) //Upper Half of Clear Command

.org 0x800A0554
.float SCREEN_W_FLOAT*2 //Fix Viewport Setup 1 Scale

.org 0x800A0560
.float SCREEN_W_FLOAT*2 //Fix Viewport Setup 1 Translation

.org 0x800A056C
.float SCREEN_W_FLOAT //Fix Viewport Setup 2 Scale

.org 0x800A0578
.float SCREEN_W_FLOAT  //Fix Viewport Setup 2 Translation

.org 0x800A0584
.float SCREEN_W_FLOAT //Fix Viewport Setup 3 Scale

.org 0x800A0590
.float SCREEN_W_FLOAT*2 //Fix Viewport Setup 3 Translation

.org 0x800A059C
.float SCREEN_W_FLOAT //Fix Viewport Setup 4 Scale

.org 0x800A05A8
.float SCREEN_W_FLOAT*4 //Fix Viewport Setup 4 Translation

.org 0x800A05B4
.float SCREEN_W_FLOAT //Fix Viewport Setup 5 Scale

.org 0x800A05C0
.float SCREEN_W_FLOAT*4 //Fix Viewport Setup 5 Translation

.org 0x800A05D4
.float SCREEN_W_FLOAT //Fix Viewport 1 Scissor Width

.org 0x800A05E4
.float SCREEN_W_FLOAT/2 //Fix Viewport 2 Scissor Width

.org 0x800A05EC
.float SCREEN_W_FLOAT/2 //Fix Viewport 3 Scissor X Position

.org 0x800A05F4
.float SCREEN_W_FLOAT //Fix Viewport 3 Scissor Width

.org 0x800A0604
.float SCREEN_W_FLOAT/2 //Fix Viewport 4 Scissor Width

.org 0x800A060C
.float SCREEN_W_FLOAT/2 //Fix Viewport 5 Scissor X Position

.org 0x800A0614
.float SCREEN_W_FLOAT //Fix Viewport 5 Scissor Width

.org 0x800A1240
.dw CFB_ADDR //CFB1 Address
.dw (CFB_ADDR+(SCREEN_W*SCREEN_H*2)) //CFB2 Address
.dw (CFB_ADDR+((SCREEN_W*SCREEN_H*2)*2)) //CFB3 Address

.org 0x800A1434
.dw ((SCREEN_W/2)-130) //Fix X Position of P1 Winner Name Start

.org 0x800A143C
.dw ((SCREEN_W/2)+105) //Fix X Position of P2 Winner Name Start

.org 0x800A1444
.dw ((SCREEN_W/2)-130) //Fix X Position of P3 Winner Name Start

.org 0x800A144C
.dw ((SCREEN_W/2)+105) //Fix X Position of P4 Winner Name Start

.org 0x800A1454
.dw ((SCREEN_W/2)+10) //Fix X Position of Win Text

.org 0x800A145C
.dw ((SCREEN_W/2)-55) //Fix X Position of P1 Winner Name

.org 0x800A1464
.dw ((SCREEN_W/2)+75) //Fix X Position of P2 Winner Name

.org 0x800A146C
.dw ((SCREEN_W/2)-55) //Fix X Position of P3 Winner Name

.org 0x800A1474
.dw ((SCREEN_W/2)+75) //Fix X Position of P4 Winner Name

.org 0x800A147C
.dw ((SCREEN_W/2)+10) //Fix X Position of Win Text End

.org 0x800A1484
.dw ((SCREEN_W/2)-70) //Fix X Position of P1 Winner Name

.org 0x800A148C
.dw ((SCREEN_W/2)+90) //Fix X Position of P2 Winner Name

.org 0x800A1494
.dw ((SCREEN_W/2)-70) //Fix X Position of P3 Winner Name

.org 0x800A149C
.dw ((SCREEN_W/2)+90) //Fix X Position of P4 Winner Name

.org 0x800A14A4
.dw ((SCREEN_W/2)+10) //Fix X Position of Win Text End

.org 0x800A18A8
.dh (SCREEN_W/2) //Fix X Position of Bottom Centered Quit Icon

.org 0x800A18AC
.dh (SCREEN_W-56) //Fix X Position of Right-Aligned Quit Icon

.org 0x800A18B0
.dh (SCREEN_W/2) //Fix X Position of Centered Quit Icon

.org 0x800A18B4
.dh (SCREEN_W/2) //Fix X Position of Top Centered Quit Icon

.org 0x800A1E90
.dh SCREEN_W*2 //Viewport Scale for Sprites

.org 0x800A1E98
.dh SCREEN_W*2 //Viewport X Position for Sprites

.org 0x800A2EA8
.dw SCREEN_W //VI Framebuffer Width

.org 0x800A2EC0
.dw ((SCREEN_W*512)/320) //VI Framebuffer Width

.org 0x800A2EC8
.dw (SCREEN_W*2) //VI Field 1 Framebuffer Offset

.org 0x800A2EDC
.dw (SCREEN_W*2) //VI Field 2 Framebuffer Offset

.org 0x800A3768
.dw SCREEN_W //VI MPAL Framebuffer Width

.org 0x800A3780
.dw ((SCREEN_W*512)/320) //VI MPAL Framebuffer Width

.org 0x800A3788
.dw (SCREEN_W*2) //VI MPAL Field 1 Framebuffer Offset

.org 0x800A379C
.dw (SCREEN_W*2) //VI MPAL Field 2 Framebuffer Offset

.org 0x800A7810
.dw ((SCREEN_W/2)-65) //X Position of Left Winner Name 

.org 0x800A7818
.dw ((SCREEN_W/2)+50) //X Position of Right Winner Name 

.org 0x800A7820
.dw ((SCREEN_W/2)-5) //X Position of Left Won Text 

.org 0x800A7828
.dw ((SCREEN_W/2)+10) //X Position of Right Won Text  

.org 0x800A7830
.dw ((SCREEN_W/2)+80) //X Position of Right 3P Winner Name 

.org 0x800A7838
.dw ((SCREEN_W/2)-80) //X Position of Left 3P Winner Name 

.org 0x800A7840
.dw (SCREEN_W/2) //X Position of Center 3P Winner Name 

.org 0x800A7848
.dw (SCREEN_W/2) //X Position of 3P Won Text 

.org 0x800A7BD8
.double (SCREEN_W_FLOAT/SCREEN_H) //Fix World Sprite Position Scale

.org 0x800A7BE8
.double (SCREEN_W_FLOAT/SCREEN_H) //Fix World Sprite Scale

.headersize 0x800D6B70-0xA96F0 //Common Segment

.org 0x800E6140
addiu v0, r0, (SCREEN_W-24) //Fix X Position of P2 Power Meter

.org 0x800E8F2C
addiu v0, r0, (SCREEN_W/2) //Fix X Position of Story Mode Statistics

.org 0x800E91DC
li.u a1, (SCREEN_W_FLOAT/32) //Fix X Scale of Story Mode Statistics Filter

.org 0x800E91F0
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Story Mode Statistics Filter

.org 0x800E9260
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Story Mode Statistics Instructions Box

.org 0x800E928C
addiu a0, r0, ((SCREEN_W/2)-112) //Fix X Position of Story Mode Statistics Instructions Window

.org 0x800E9374
addiu v0, r0, ((SCREEN_W/2)-135) //Fix X Position of Story Mode Statistics Left Arrow

.org 0x800E937C
addiu v0, r0, ((SCREEN_W/2)+135) //Fix X Position of Story Mode Statistics Right Arrow

.org 0x800EB91C
.dw ((SCREEN_W/2)-16) //Fix X Position of Common Timer

.headersize 0x800D6B70-0xBE940 //Duel Mode Segment

.org 0x800D8684
li.u at, (SCREEN_W_FLOAT+50) //Fix Object Culling

.org 0x800DA7BC
li.u at, SCREEN_W_FLOAT //Fix Roll for Offscreen Players

.org 0x800DA834
addiu a2, r0, (SCREEN_W/2) //Center Player Roll

.org 0x800DDB70
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Minigame List Background

.org 0x800DDD20
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Minigame List Background

.org 0x800DE45C
addiu v0, v0, ((SCREEN_W/2)-160) //Fix Offset of Minigame List Cursor
nop //Padding Instruction

.org 0x800DE64C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening List Background

.org 0x800DE7F8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening List Background

.org 0x800DF0E4
addiu v0, v0, ((SCREEN_W/2)-160) //Fix Offset of Happening Cursor
nop //Padding Instruction

.org 0x800DF430
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Minigame List Background

.org 0x800E15CC
addiu a0, r0, (SCREEN_W/2) //Fix Instructions X Position on Board

.org 0x800E3088
li.u at, ((SCREEN_W_FLOAT/2)-80) //Fix X Position of Minigame Type Text

.org 0x800E32AC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Turns Remaining Count

.org 0x800E3358
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Turns Remaining Count

.org 0x800E33D4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Turns Remaining Count Box

.org 0x800E3514
addiu a2, r0, (SCREEN_W/2) //Center Player Start Message

.org 0x800E3FB8
addiu a2, r0, (SCREEN_W/2) //Center Battle Effect

.org 0x800E4A08
addiu a2, r0, (SCREEN_W/2) //Center Power Up Message

.org 0x800E4D74
li.u at, (SCREEN_W_FLOAT*4) //Fix Duel Toad Viewport

.org 0x800E5478
li.u at, (SCREEN_W_FLOAT/2) //Duel Viewport Left Padding

.org 0x800E54C4
li.u at, (SCREEN_W_FLOAT/2) //Duel Viewport Right Padding

.org 0x800E54DC
li.u at, SCREEN_W_FLOAT //Duel Camera Border Scale

.org 0x800E5870
li a1, BG_MSGQ1_ADDR //Fix First Message Queue Address

.org 0x800E587C
addiu a2, r0, BG_TILE_CNT //Fix First Message Queue Length

.org 0x800E5888
li a1, BG_MSGQ1_ADDR //Fix Second Message Queue Address

.org 0x800E5894
addiu a2, r0, BG_TILE_CNT //Fix Second Message Queue Length

.org 0x800E58A0
li a1, BG_MSGQ1_ADDR //Fix Second Message Queue Address

.org 0x800E58AC
addiu a2, r0, BG_TILE_CNT //Fix Second Message Queue Length

.org 0x800E5A74
li s2, BG_TILEINFO_ADDR //Fix Tileinfo Address

.org 0x800E5AA4
slti v0, s0, BG_TILE_CNT //Fix Iterating over Tileinfo

.org 0x800E5ADC
li s0, BG_TILEINFO_ADDR //Fix Tileinfo Address

.org 0x800E5B08
slti v0, s1, BG_TILE_CNT //Fix Iterating over Tileinfo

.org 0x800E5B14
li a0, BG_TILEINFO_LIST_ADDR //Move Tileinfo List

.org 0x800E5B20
li a1, BG_TILE_CNT*4 //Fix Tileinfo List Clear

.org 0x800E5B3C
li v1, BG_TILEINFO_ADDR //Move Tileinfo List

.org 0x800E5B6C
slti v0, a0, BG_TILE_CNT //Fix Iterating over Tileinfo

.org 0x800E5B94
li s0, BG_TILEINFO_ADDR //Move Tileinfo List

.org 0x800E5BC4
slti v0, s1, BG_TILE_CNT //Fix Iterating over Tileinfo

.org 0x800E5D2C
li v1, BG_TILEINFO_ADDR //Move Tileinfo List

.org 0x800E5D68
slti v0, a1, BG_TILE_CNT //Fix Iterating over Tileinfo

.org 0x800E5E6C
li.u at, SCREEN_W_FLOAT //Duel Camera BG Tile Scale

.org 0x800E5E74
li s6, BG_TILEINFO_LIST_ADDR //Move Tileinfo List

.org 0x800E5E90
addiu v0, v0, -(SCREEN_W/2) //Fix Duel BG Tile Load Offset

.org 0x800E5F28
sll v0, v0, 4 //Double Pitch of Tileinfo List

.org 0x800E5F54
sll v1, v1, 4 //Double Pitch of Tileinfo List

.org 0x800E5F68
slti v0, s0, 8 //Fix Width of BG Tile Loading

.org 0x800E78C8
addiu a0, v1, -(SCREEN_W/2) //Fix Duel BG Tile Offset

.org 0x800E78D4
addiu v0, v1, -((SCREEN_W/2)-63) //Fix Duel BG Tile Offset

.org 0x800E7980
addiu v0, a0, -(SCREEN_W/2) //Fix Duel BG Tile Offset

.org 0x800E7990
li.u at, SCREEN_W_FLOAT //Fix Duel BG Load Offset

.org 0x800E79CC
addiu v0, a0, -((SCREEN_W/2)-63) //Fix Duel BG Tile Offset

.org 0x800E7B08
li s6, BG_TILEINFO_LIST_ADDR //Move Tileinfo List

.org 0x800E7B5C
sll v0, v0, 4 //Double Pitch of Tileinfo List

.org 0x800E7BA4
slti v0, v0, 8 //Fix Width of BG Tile Rendering

.org 0x800E8004
li.u at, (SCREEN_W_FLOAT*2) //Fix Duel Viewport X Scale

.org 0x800E8058
li.u at, ((SCREEN_W_FLOAT/2)-0.5) //Fix Viewport X Offset
li.l at, ((SCREEN_W_FLOAT/2)-0.5) //Fix Viewport X Offset

.org 0x800E81D8
li.u s3, (SCREEN_W_FLOAT/2) //Duel Viewport Center Offset

.org 0x800E81E4
li.u at, (SCREEN_W_FLOAT*2) //Duel Viewport Offset

.org 0x800E8500
addiu a0, a0, (SCREEN_W/2) //Fix Duel BG Tile Offset

.org 0x800E85DC
li.u at, SCREEN_W_FLOAT //Duel 3D to 2D Scale

.org 0x800E866C
li.u at, (SCREEN_W_FLOAT/2) //Duel Camera Center Offset

.org 0x800E86C4
li.u at, (SCREEN_W_FLOAT/2) //Duel Camera Center Offset

.org 0x800E8720
li.u at, (SCREEN_W_FLOAT/2) //Duel Camera Center Offset

.org 0x800E878C
li.u at, SCREEN_W_FLOAT //Duel 3D to 2D Scale

.org 0x800E87DC
li.u at, (SCREEN_W_FLOAT/2) //Duel 3D to 2D Scale

.org 0x800E8A6C
li.u at, (SCREEN_W_FLOAT/2) //Duel 3D to 2D Scale

.org 0x800EAC6C
addiu v1, r0, (SCREEN_W/2) //Fix Message X Position on Board

.org 0x800EACA0
addiu v1, r0, (SCREEN_W/2) //Fix Message X Position on Board

.org 0x800F09A4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Pause Play Mode

.org 0x800F0A78
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Pause Turn Number Box

.org 0x800F0B00
addiu a3, r0, ((SCREEN_W/2)+43) //Fix X Position of Pause Turn Max Number

.org 0x800F0B18
addiu a3, r0, ((SCREEN_W/2)+1) //Fix X Position of Pause Turn Number

.org 0x800F0B7C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Pause Board Logo

.org 0x800F0C00
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Pause Board Name

.org 0x800F0F30
addiu a0, s1, (SCREEN_W/2) //Fix X Position of Control Buttons

.org 0x800F144C
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Pause Quit Window

.org 0x800F1720
addiu v0, v0, ((SCREEN_W/2)-90) //Fix X Position of Pause Configuration

.org 0x800F1988
addiu v0, v0, ((SCREEN_W/2)-90) //Fix X Position of Pause Configuration

.org 0x800F1B54
addiu v0, v0, ((SCREEN_W/2)-118) //Fix X Position of Pause Control Cursor

.org 0x800F1D10
addiu v0, v0, ((SCREEN_W/2)-118) //Fix X Position of Pause Control Cursor

.org 0x800F2748
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Pause Controller

.org 0x800F3434
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Pause Filter

.org 0x800F3444
li.u a2, (SCREEN_W_FLOAT/8) //Fix X Scale of Pause Filter

.org 0x800F40B0
li.u at, (SCREEN_W_FLOAT-16) //Fix X Position of Right Edge of Duel Scissor

.org 0x800F4168
li.u at, (SCREEN_W_FLOAT-16) //Fix X Position of Right Edge of Duel Screen Erase

.org 0x800F4184
li.u at, ((SCREEN_W_FLOAT-32)/8) //Fix Speed of Duel Screen Erase

.org 0x800F41B0
slti v0, s0, 8 //Fix Duration of Duel Screen Erase

.org 0x800F4244
li.u at, ((SCREEN_W_FLOAT-32)/8) //Fix Speed of Duel Screen Erase

.org 0x800F4270
slti v0, s0, 8 //Fix Duration of Duel Screen Erase

.org 0x800F42D0
li.u at, (SCREEN_W_FLOAT-16) //Fix X Position of Duel Screen Clear Checks

.org 0x800F6DC4
addiu a2, r0, (SCREEN_W/2) //Fix Initial X Position of VS Text

.org 0x800F6DF8
li.u at, SCREEN_W_FLOAT/2 //Fix X Position of VS Text

.org 0x800FB208
addiu v1, r0, (SCREEN_W/2) //Fix X Position of Character Stat Window

.org 0x800FB310
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Character Stat Icons

.org 0x8010021C
li.u at, (SCREEN_W_FLOAT/2) //Fix Map View Arrows

.org 0x80100F58
.float (SCREEN_W_FLOAT-70) //Fix X Position of P2 Coin Gain

.org 0x80100E8C
.dh ((SCREEN_W/2)-100) //Fix X Position of Text Line 1 in Happening

.org 0x80100E94
.dh ((SCREEN_W/2)-100) //Fix X Position of Text Line 2 in Happening

.org 0x80100E9C
.dh ((SCREEN_W/2)-100) //Fix X Position of Text Line 3 in Happening

.org 0x80100EA4
.dh ((SCREEN_W/2)-100) //Fix X Position of Text Line 4 in Happening

.org 0x80100EAC
.dh ((SCREEN_W/2)-100) //Fix X Position of Text Line 5 in Happening

.org 0x80100EB4
.dh ((SCREEN_W/2)-65) //Fix X Position of Text Line 1 in Happening

.org 0x80100EBC
.dh ((SCREEN_W/2)-65) //Fix X Position of Text Line 2 in Happening

.org 0x80100EC4
.dh ((SCREEN_W/2)-65) //Fix X Position of Text Line 3 in Happening

.org 0x80100FD4
.dh ((SCREEN_W/2)-100) //X Position of First Battle Letter
.dh ((SCREEN_W/2)-67) //X Position of Second Battle Letter
.dh ((SCREEN_W/2)-34) //X Position of Third Battle Letter
.dh ((SCREEN_W/2)-1) //X Position of Fourth Battle Letter
.dh ((SCREEN_W/2)+32) //X Position of Fifth Battle Letter
.dh ((SCREEN_W/2)+65) //X Position of Sixth Battle Letter
.dh ((SCREEN_W/2)+98) //X Position of Seventh Battle Letter

.org 0x80101348
.dh ((SCREEN_W/2)-70) //X Position of P1 Control
.dh ((SCREEN_W/2)+70) //X Position of P2 Control

.org 0x801014EC
.dh (SCREEN_W-120) //Fix X Position of Duel P2 HUD

.org 0x80101B44
.dh (SCREEN_W-34) //Fix X Position of Map View Right Arrow

.org 0x80101B48
.dh (SCREEN_W/2) //Fix X Position of Map View Top Arrow

.org 0x80101B4C
.dh (SCREEN_W/2) //Fix X Position of Map View Bottom Arrow

.org 0x80101B50
.dh ((SCREEN_W/2)-14) //Fix Start X Position of Map View Left Arrow

.org 0x80101B54
.dh ((SCREEN_W/2)+14) //Fix Start X Position of Map View Right Arrow

.org 0x80101B58
.dh (SCREEN_W/2) //Fix Start X Position of Map View Top Arrow

.org 0x80101B5C
.dh (SCREEN_W/2) //Fix Start X Position of Map View Bottom Arrow

.org 0x80101B80
.dh (SCREEN_W-80) //Fix X Position of Duel Map

.org 0x80101B84
.dh (SCREEN_W-80) //Fix X Position of Duel Map Spaces

.org 0x80101B88
.dh (SCREEN_W-80) //Fix X Position of Duel Map Camera View

.org 0x80101B8C
.dh (SCREEN_W-80) //Fix X Position of Duel Map P1 Arrow

.org 0x80101B90
.dh (SCREEN_W-80) //Fix X Position of Duel Map P2 Arrow

.org 0x80102510
.float (SCREEN_W_FLOAT-80) //Fix X Position of Bottom Right Icon

.org 0x80102518
.float (SCREEN_W_FLOAT+200) //Fix X Position of Bottom Right In Icon

.org 0x80102530
.float (SCREEN_W_FLOAT-130) //Fix X Position of Bottom Right Icon

.org 0x80102538
.float (SCREEN_W_FLOAT+200) //Fix X Position of Bottom Right In Icon

.headersize 0x800D6B70-0xEA790 //Board Segment

.org 0x800D9520
li.u at, (SCREEN_W_FLOAT+50) //Fix Maximum X Position of Visible Objects

.org 0x800DB2F0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Dice Roll

.org 0x800DB8C4
blez v0, 0x800DBC18 //HACK: Fix Condition for Hiding Dice Number

.org 0x800DE070
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Hidden Block Items

.org 0x800DEEC4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Minigame List

.org 0x800DF074
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Minigame List

.org 0x800DF788
addiu a2, a2, ((SCREEN_W/2)-110) //Fix X Position of Minigame List Cursor

.org 0x800DFAB8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Hidden Minigame List

.org 0x800E1FCC
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Instructions

.org 0x800E42A8
addiu v1, r0, (SCREEN_W/2) //Fix X Position of Item List

.org 0x800E528C
li.u at, ((SCREEN_W_FLOAT/2)-80) //Fix X Position of Minigame Type

.org 0x800E54B0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Last Turn Icon

.org 0x800E555C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Digit in Turns Remaining

.org 0x800E55D8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Turns Remaining Icon

.org 0x800E5718
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Player Start

.org 0x800E5FD0
li.u at, (SCREEN_W_FLOAT*4) //Fix Width of Lower-Left Toad

.org 0x800E6A68
li.u at, (SCREEN_W_FLOAT/2) //Board Viewport Center Scale

.org 0x800E6AE0
li.u at, (SCREEN_W_FLOAT/2) //Board Viewport Left Padding

.org 0x800E6B2C
li.u at, (SCREEN_W_FLOAT/2) //Board Viewport Right Padding

.org 0x800E6B44
li.u at, SCREEN_W_FLOAT //Board Viewport Padding Scale

.org 0x800E6ED8
la a1, BG_MSGQ1_ADDR //Fix First Message Queue Address

.org 0x800E6EE4
addiu a2, r0, BG_TILE_CNT //Fix Number of Background Tiles

.org 0x800E6EF0
la a1, BG_MSGQ2_ADDR //Fix Second Message Queue Address

.org 0x800E6EFC
addiu a2, r0, BG_TILE_CNT //Fix Number of Background Tiles

.org 0x800E6F08
la a1, BG_MSGQ2_ADDR //Fix Third Message Queue Address

.org 0x800E6F14
addiu a2, r0, BG_TILE_CNT //Fix Number of Background Tiles

.org 0x800E70DC
la s2, BG_TILEINFO_ADDR //Fix Tile Info Address

.org 0x800E710C
slti v0, s0, BG_TILE_CNT //Fix Tile Info Iterator

.org 0x800E7144
la s0, BG_TILEINFO_ADDR //Fix Tile Info Address

.org 0x800E7174
slti v0, s1, BG_TILE_CNT //Fix Tile Info Iterator

.org 0x800E7180
la a0, BG_TILEINFO_LIST_ADDR //Fix Tile Info List Address

.org 0x800E718C
addiu a1, r0, (BG_TILE_CNT*4) //Fix Tile Info List Clear Size

.org 0x800E71A8
la v1, BG_TILEINFO_ADDR //Fix Tile Info Address

.org 0x800E71D8
slti v0, a0, BG_TILE_CNT //Fix Tile Info Iterator

.org 0x800E7200
la s0, BG_TILEINFO_ADDR //Fix Tile Info Address

.org 0x800E7230
slti v0, s1, BG_TILE_CNT //Fix Tile Info Iterator

.org 0x800E739C
la a3, BG_TILEINFO_ADDR //Fix Tile Info Address

.org 0x800E74A0
slti v0, a2, BG_TILE_CNT //Fix Tile Info Iterator

.org 0x800E75A8
li.u at, SCREEN_W_FLOAT //Fix Tile Placement Scale

.org 0x800E75B0
la s6, BG_TILEINFO_LIST_ADDR //Fix Tile Info List Address

.org 0x800E75CC
addiu v0, v0, -(SCREEN_W/2) //Fix Tile Load Offset

.org 0x800E7664
sll v0, v0, 4 //Fix Tile Info List Pitch

.org 0x800E7690
sll v1, v1, 4 //Fix Tile Info List Pitch

.org 0x800E76A4
slti v0, s0, BG_TILE_CNT_X //Fix Tile Info List Pitch

.org 0x800E87BC
addiu a0, v1, -(SCREEN_W/2) //Fix Tile Render Offset

.org 0x800E87C8
addiu v0, v1, -((SCREEN_W/2)-63) //Fix Tile Render Offset

.org 0x800E8878
addiu v0, a0, -(SCREEN_W/2) //Fix Tile Render Offset

.org 0x800E8888
li.u at, SCREEN_W_FLOAT //Fix Tile Placement Scale

.org 0x800E88C4
addiu v0, a0, -((SCREEN_W/2)-63) //Fix Tile Render Offset

.org 0x800E8A58
sll v0, v0, 4 //Fix Tile Info List Pitch
la t0, BG_TILEINFO_LIST_ADDR //Fix Tile Info List Address

.org 0x800E8D68
slti v0, v0, BG_TILE_CNT_X //Fix Maximum Number of Tiles to Render

.org 0x800E91C8
li.u at, (SCREEN_W_FLOAT*2) //Fix Camera Viewport X Scale

.org 0x800E921C
li.u at, ((SCREEN_W_FLOAT/2)-0.5) //Fix Camera Viewport X Position
li.l at, ((SCREEN_W_FLOAT/2)-0.5) //Fix Camera Viewport X Position

.org 0x800E939C
li.u s3, (SCREEN_W_FLOAT/2) //Board Viewport Center Offset

.org 0x800E93A8
li.u at, (SCREEN_W_FLOAT*2) //Board Viewport Offset

.org 0x800E96C4
addiu a0, a0, (SCREEN_W/2) //Fix Board BG Tile Offset

.org 0x800E97C0
li.u at, SCREEN_W_FLOAT //Board Viewport Offset

.org 0x800E9850
li.u at, (SCREEN_W_FLOAT/2) //Board Viewport Center Offset

.org 0x800E9904
li.u at, (SCREEN_W_FLOAT/2) //Board Viewport Center Offset

.org 0x800E9970
li.u at, SCREEN_W_FLOAT //Board Viewport 3D to 2D Scale

.org 0x800E99C0
li.u at, (SCREEN_W_FLOAT/2) //Board Viewport 3D to 2D Center

.org 0x800E9C54
li.u at, (SCREEN_W_FLOAT/2) //Board Viewport Center Offset

.org 0x800EC098
addiu v1, r0, (SCREEN_W/2) //Fix X Position of Board Windows

.org 0x800EC0CC
addiu v1, r0, (SCREEN_W/2) //Fix X Position of Board Windows

.org 0x800EF494
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Play Mode

.org 0x800EF54C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Turn Number Box

.org 0x800EF5C4
addiu a3, r0, ((SCREEN_W/2)+43) //Fix X Position of Max Turn Count

.org 0x800EF5DC
addiu a3, r0, ((SCREEN_W/2)+1) //Fix X Position of Turn Number

.org 0x800EF64C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Board Logo

.org 0x800EF97C
addiu a0, s1, (SCREEN_W/2) //Fix X Position of Pause Menu Instructions Window

.org 0x800EFE98
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Pause Quit Window

.org 0x800F016C
addiu v0, v0, ((SCREEN_W/2)-90) //Fix X Position of Pause Menu Options

.org 0x800F03D4
addiu v0, v0, ((SCREEN_W/2)-90) //Fix X Position of Pause Menu Options

.org 0x800F0580
addiu v0, v0, ((SCREEN_W/2)-118) //Fix X Position of Pause Menu Cursor

.org 0x800F073C
addiu v0, v0, ((SCREEN_W/2)-118) //Fix X Position of Pause Menu Cursor

.org 0x800F113C
addiu a2, r0, ((SCREEN_W/2)+10) //Fix X Position of Controller Icon

.org 0x800F1DFC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Pause Screen Filter

.org 0x800F1E0C
li.u a2, (SCREEN_W_FLOAT/8) //Fix X Scale of Pause Screen Filter

.org 0x800F2800
li.u at, (SCREEN_W_FLOAT-16) //Fix Start Position of Board Force SHow

.org 0x800F28B8
li.u at, (SCREEN_W_FLOAT-16) //Fix Start Position of Board Erase

.org 0x800F28D4
li.u at, ((SCREEN_W_FLOAT-32)/8) //Fix Speed of Board Screen Erase

.org 0x800F2900
slti v0, s0, 8 //Fix Duration of Board Screen Erase

.org 0x800F2994
li.u at, ((SCREEN_W_FLOAT-32)/8) //Fix Speed of Board Screen Erase

.org 0x800F29C0
slti v0, s0, 8 //Fix Duration of Board Screen Erase

.org 0x800F548C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of VS Text

.org 0x800F54B8
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of VS Text

.org 0x800FBA88
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Battle Coin Count

.org 0x800FBD1C
addiu a2, r0, ((SCREEN_W/2)-40) //Fix X Position of Battle Coin Count

.org 0x800FD9B8
addiu v1, r0, (SCREEN_W/2) //Fix X Position of Star Hidden Block Window

.org 0x800FDA8C
addiu v1, r0, (SCREEN_W/2) //Fix X Position of Star Hidden Block Window

.org 0x800FDC44
addiu v1, r0, (SCREEN_W/2) //Fix X Position of Coin Hidden Block Window

.org 0x800FDD2C
addiu v1, r0, (SCREEN_W/2) //Fix X Position of Coin Hidden Block Window

.org 0x800FDF4C
addiu v1, r0, (SCREEN_W/2) //Fix X Position of Item Hidden Block Window

.org 0x800FE040
addiu v1, r0, (SCREEN_W/2) //Fix X Position of Item Hidden Block Window

.org 0x800FE708
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Random Won Item

.org 0x801007F4
.dh ((SCREEN_W/2)-94) //Fix X Position of P1 on Map
.dh ((SCREEN_W/2)+94) //Fix X Position of P2 on Map
.dh ((SCREEN_W/2)-94) //Fix X Position of P3 on Map
.dh ((SCREEN_W/2)+94) //Fix X Position of P4 on Map

.org 0x80100D94
.dh ((SCREEN_W/2)-50) //X Position of Left Dice Roll

.org 0x80100D98
.dh ((SCREEN_W/2)+50) //X Position of Right Dice Roll

.org 0x80100D9C
.dh (SCREEN_W/2) //X Position of Middle Dice Roll

.org 0x80100E44
.dh ((SCREEN_W/2)-100) //Fix X Position of Minigame 1 in List

.org 0x80100E4C
.dh ((SCREEN_W/2)-100) //Fix X Position of Minigame 2 in List

.org 0x80100E54
.dh ((SCREEN_W/2)-100) //Fix X Position of Minigame 3 in List

.org 0x80100E5C
.dh ((SCREEN_W/2)-100) //Fix X Position of Minigame 4 in List

.org 0x80100E64
.dh ((SCREEN_W/2)-100) //Fix X Position of Minigame 5 in List

.org 0x80100E6C
.dh ((SCREEN_W/2)-100) //Fix X Position of Minigame 6 in List

.org 0x80100E74
.dh ((SCREEN_W/2)-100) //Fix X Position of Minigame 7 in List

.org 0x80100E7C
.dh ((SCREEN_W/2)-100) //Fix X Position of Minigame 8 in List

.org 0x80100F08
.float (SCREEN_W_FLOAT-75) //Fix X Position of P2 Coin Loss

.org 0x80100F18
.float (SCREEN_W_FLOAT-75) //Fix X Position of P4 Coin Loss

.org 0x801015FC
.dh ((SCREEN_W/2)-60) //Fix X Position of P1 on Controller Config
.dh ((SCREEN_W/2)+76) //Fix X Position of P2 on Controller Config
.dh ((SCREEN_W/2)-60) //Fix X Position of P3 on Controller Config
.dh ((SCREEN_W/2)+76) //Fix X Position of P4 on Controller Config

.org 0x80101798
.dh (SCREEN_W-129) //Fix X Position of P2 In HUD

.org 0x801017A0
.dh (SCREEN_W-129) //Fix X Position of P4 In HUD

.org 0x801017A8
.dh (SCREEN_W+112) //Fix X Position of P2 Out HUD

.org 0x801017B0
.dh (SCREEN_W+112) //Fix X Position of P4 Out HUD

.org 0x801017B4
.dh ((SCREEN_W/2)-112) //Fix X Position of P1 Middle HUD

.org 0x801017B8
.dh (SCREEN_W/2) //Fix X Position of P2 Middle HUD

.org 0x801017BC
.dh ((SCREEN_W/2)-112) //Fix X Position of P1 Middle HUD

.org 0x801017C0
.dh (SCREEN_W/2) //Fix X Position of P2 Middle HUD

.org 0x801017C4
.dh ((SCREEN_W/2)-56) //Fix X Position of P1 Item HUD

.org 0x801017C8
.dh (SCREEN_W+112) //Fix X Position of P2 Out HUD

.org 0x801017D0
.dh (SCREEN_W+112) //Fix X Position of P4 Out HUD

.org 0x801017D8
.dh ((SCREEN_W/2)-56) //Fix X Position of P2 Item HUD

.org 0x801017E0
.dh (SCREEN_W+112) //Fix X Position of P4 Out HUD

.org 0x801017E8
.dh (SCREEN_W+112) //Fix X Position of P2 Out HUD

.org 0x801017EC
.dh ((SCREEN_W/2)-56) //Fix X Position of P3 Item HUD

.org 0x801017F0
.dh (SCREEN_W+112) //Fix X Position of P4 Out HUD

.org 0x801017F8
.dh (SCREEN_W+112) //Fix X Position of P2 Out HUD

.org 0x80101800
.dh ((SCREEN_W/2)-56) //Fix X Position of P4 Item HUD

.org 0x80101804
.dh (SCREEN_W+224) //Fix X Position of P1 Far Out HUD

.org 0x80101808
.dh (SCREEN_W+224) //Fix X Position of P2 Far Out HUD

.org 0x8010180C
.dh (SCREEN_W+224) //Fix X Position of P3 Far Out HUD

.org 0x80101810
.dh (SCREEN_W+224) //Fix X Position of P4 Far Out HUD

.org 0x80101814
.dh (SCREEN_W-136) //Fix X Position of P1 Right HUD

.org 0x80101818
.dh (SCREEN_W-136) //Fix X Position of P2 Right HUD

.org 0x8010181C
.dh (SCREEN_W-136) //Fix X Position of P3 Right HUD

.org 0x80101820
.dh (SCREEN_W-136) //Fix X Position of P4 Right HUD

.org 0x80101824
.dh ((SCREEN_W/2)-137) //Fix X Position of Duel P1 HUD

.org 0x80101828
.dh ((SCREEN_W/2)+30) //Fix X Position of Duel P2 HUD

.org 0x80101830
.dh (SCREEN_W+112) //Fix X Position of Team 2 Top Right Out HUD

.org 0x80101838
.dh (SCREEN_W+112) //Fix X Position of Team 2 Bottom Right Out HUD

.org 0x8010183C
.dh ((SCREEN_W/2)-120) //Fix X Position of P1 4P Minigame HUD

.org 0x80101840
.dh ((SCREEN_W/2)+8) //Fix X Position of P2 4P Minigame HUD

.org 0x80101844
.dh ((SCREEN_W/2)-120) //Fix X Position of P3 4P Minigame HUD

.org 0x80101848
.dh ((SCREEN_W/2)+8) //Fix X Position of P4 4P Minigame HUD

.org 0x8010184C
.dh ((SCREEN_W/2)-120) //Fix X Position of P1 4P Minigame HUD

.org 0x80101850
.dh ((SCREEN_W/2)+8) //Fix X Position of P2 4P Minigame HUD

.org 0x80101854
.dh ((SCREEN_W/2)-120) //Fix X Position of P3 4P Minigame HUD

.org 0x80101858
.dh ((SCREEN_W/2)+8) //Fix X Position of P4 4P Minigame HUD

.org 0x8010185C
.dh ((SCREEN_W/2)+8) //Fix X Position of P1 1 VS 3 Minigame HUD

.org 0x80101860
.dh ((SCREEN_W/2)+8) //Fix X Position of P2 1 VS 3 Minigame HUD

.org 0x80101864
.dh ((SCREEN_W/2)+8) //Fix X Position of P3 1 VS 3 Minigame HUD

.org 0x80101868
.dh ((SCREEN_W/2)-120) //Fix X Position of P4 1 vs 3 Minigame HUD

.org 0x8010186C
.dh ((SCREEN_W/2)-120) //Fix X Position of P1 2 vs 2 Minigame HUD

.org 0x80101870
.dh ((SCREEN_W/2)-120) //Fix X Position of P2 2 vs 2 Minigame HUD

.org 0x80101874
.dh ((SCREEN_W/2)+8) //Fix X Position of P3 2 vs 2 Minigame HUD

.org 0x80101878
.dh ((SCREEN_W/2)+8) //Fix X Position of P4 2 vs 2 Minigame HUD

.org 0x8010187C
.dh ((SCREEN_W/2)-128) //Fix X Position of P1 Center Minigame HUD

.org 0x80101880
.dh ((SCREEN_W/2)+16) //Fix X Position of P2 Center Minigame HUD

.org 0x80101884
.dh ((SCREEN_W/2)+16) //Fix X Position of P3 Center Minigame HUD

.org 0x80101888
.dh ((SCREEN_W/2)+16) //Fix X Position of P4 Center Minigame HUD

.org 0x80101A7C
.float (SCREEN_W_FLOAT-75) //Fix Destination X Position of P2 Items

.org 0x80101A8C
.float (SCREEN_W_FLOAT-75) //Fix Destination X Position of P4 Items

.org 0x80101EB4
.dh (SCREEN_W-34) //Fix X Position of Right Map Arrow

.org 0x80101EB8
.dh (SCREEN_W/2) //Fix X Position of Top Map Arrow

.org 0x80101EBC
.dh (SCREEN_W/2) //Fix X Position of Bottom Map Arrow

.org 0x80101EC0
.dh ((SCREEN_W/2)-14) //Fix Start X Position of Left Map Arrow

.org 0x80101EC4
.dh ((SCREEN_W/2)+14) //Fix Start X Position of Right Map Arrow

.org 0x80101EC8
.dh (SCREEN_W/2) //Fix X Position of Top Map Arrow

.org 0x80101ECC
.dh (SCREEN_W/2) //Fix X Position of Bottom Map Arrow

.headersize 0x801059A0-0x116320 //Main Debug Menu Segment

.org 0x80105D70
addiu t0, r0, ((SCREEN_W+47)/48) //Number of Tiles in Row
divu s2, t0 //Execute Divide Instruction
nop //Two Instruction
nop //Delay for mflo/mfhi
mflo v1 //Get result
mfhi v0 //Get remainder
nop //Two Instructions
nop //Of Padding

.org 0x80105DBC
slti v0, s2, (5*((SCREEN_W+47)/48)) //Number of Tiles to Render

.org 0x80106AE8
addiu a0, r0, ((SCREEN_W/2)-96) //Fix X Position of Debug Menu List

.org 0x80106B78
addiu a0, r0, ((SCREEN_W/2)-32) //Fix X Position of Debug Menu Page Count

.org 0x80106BB4
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Debug Menu Cursor

.org 0x80106DE8
addiu a0, r0, ((SCREEN_W/2)-48) //Fix X Position of Debug Menu Option Header

.org 0x80106E64
addiu a0, r0, ((SCREEN_W/2)-32) //Fix X Position of Debug Menu Map Selection

.org 0x80106EC8
addiu s2, v0, ((SCREEN_W/2)-120) //Fix X Position of Debug Menu Option List

.org 0x80107818
addiu s2, s2, ((SCREEN_W/2)-120) //Fix X Position of Debug Menu Map Cursor

.org 0x80107874
addiu s2, r0, ((SCREEN_W/2)-32) //Fix X Position of Debug Menu Map Cursor

.org 0x80107944
addiu v1, r0, SCREEN_W //Fix Screen Width for Placing Debug Menu Minigame Names

.org 0x80107D04
addiu v1, r0, SCREEN_W //Fix Screen Width for Placing Debug Menu Minigame Name Shadows

.org 0x80108204
addiu a0, a0, ((SCREEN_W/2)-104) //Fix X Position of Debug Menu COM Name

.org 0x801083F8
addiu a0, s3, ((SCREEN_W/2)-110) //Fix X Position of Debug Menu Character Names

.headersize 0x801059A0-0x11A480 //Hand Line and Sinker Segment

.org 0x80105A40
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Hand Line and Sinker

.org 0x80105A4C
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Hand Line and Sinker

.headersize 0x801059A0-0x120BC0 //Coconut Conk Segment

.org 0x80105F74
lui t4, (((SCREEN_W/2)+160) >> 2) //Fix X Position of Background Layer Right
lui t3, (((SCREEN_W/2)-160) >> 2) //Fix X Position of Background Layer Left

.org 0x80106140
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Coconut Conk Background

.org 0x8010626C
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Coconut Conk Foreground

.org 0x8010B018
.float ((SCREEN_W_FLOAT/2)-160) //Scissor X Position for Camera 1 in Coconut Conk

.org 0x8010B020
.float ((SCREEN_W_FLOAT/2)+160) //Scissor Width for Camera 1 in Coconut Conk

.org 0x8010B028
.float (SCREEN_W_FLOAT*2) //Viewport Width for Camera 1 in Coconut Conk

.org 0x8010B034
.float (SCREEN_W_FLOAT*2) //Viewport X Position for Camera 1 in Coconut Conk

.org 0x8010B044
.float ((SCREEN_W_FLOAT/2)-160) //Scissor X Position for Camera 2 in Coconut Conk

.org 0x8010B04C
.float ((SCREEN_W_FLOAT/2)+160) //Scissor Width for Camera 2 in Coconut Conk

.org 0x8010B054
.float (SCREEN_W_FLOAT*2) //Viewport Width for Camera 2 in Coconut Conk

.org 0x8010B060
.float (SCREEN_W_FLOAT*2) //Viewport X Position for Camera 2 in Coconut Conk

.headersize 0x801059A0-0x1263E0 //Spotlight Swim Segment

.org 0x80109CF0
li.u at, ((SCREEN_W_FLOAT/2)-90) //Fix Initial X Position of P1 Spotlight

.org 0x80109D04
li.u at, (SCREEN_W_FLOAT/2) //Fix Initial X Position of P2 Spotlight

.org 0x80109D18
li.u at, ((SCREEN_W_FLOAT/2)+90) //Fix Initial X Position of P3 Spotlight

.org 0x8010BB80
ori s3, s3, ((SCREEN_W/2)-1) //Fix Pitch for Spotlight Swim Spotlights

.org 0x8010BB8C
lui t3, hi(0xF5180000|(((SCREEN_W+7)/8) << 9)) //Fix Tile Load for Spotlight Swim Spotlights
addiu t3, t3, lo(0xF5180000|(((SCREEN_W+7)/8) << 9)) //Fix Tile Load for Spotlight Swim Spotlights

.org 0x8010BBA0
lui t8, hi(0x07000000|(((SCREEN_W*2)-4) << 12)) //Fix Tile Load for Spotlight Swim Spotlights
addiu t8, t8, lo(0x07000000|(((SCREEN_W*2)-4) << 12)) //Fix Tile Load for Spotlight Swim Spotlights

.org 0x8010BBB0
lui t4, hi((SCREEN_W-1) << 14) //Fix Tile Coordindates for Spotlight Swim Spotlights
addiu t4, t4, lo((SCREEN_W-1) << 14) //Fix Tile Coordindates for Spotlight Swim Spotlights

.org 0x8010BCA0
lui v1, (0xE400|(SCREEN_W/4)) //Fix Tile Coordindates for Spotlight Swim Spotlights

.org 0x8010BD48
sltiu v0, a0, ((SCREEN_W/2)*(172/2)) //Fix Screen Clear for Spotlight Swim

.org 0x8010BD94
sltiu v0, a0, ((SCREEN_W/2)*(SCREEN_H/2)) //Fix Full Screen Clear for Spotlight Swim

.org 0x8010BE7C
addiu a0, r0, (SCREEN_W/2) //Row Width for Spotlight
multu a0, t5 //Calculate Row Offset for Spotlight
mflo a0 //Get Row Offset for Spotlight

.org 0x8010C010
addiu v1, r0, (SCREEN_W/2) //Row Width for Spotlight
multu v1, a3 //Calculate Row Offset for Spotlight
mflo v1 //Get Row Offset for Spotlight

.org 0x8010C2DC
lui a0, hi((SCREEN_W/2)*(SCREEN_H/2)*4) //High Part of Spotlight Allocation Size
addiu a0, a0, lo((SCREEN_W/2)*(SCREEN_H/2)*4) //Low Part of Spotlight Allocation Size

.org 0x8010C320
sltiu v0, s0, ((SCREEN_W/2)*(SCREEN_H/2)) //Fix Full Screen Initial Clear for Spotlight Swim

.org 0x8010C36C
lui a0, hi((SCREEN_W/2)*(SCREEN_H/2)*4) //High Part of Spotlight Allocation Size

.org 0x8010D1C8
.dw ((SCREEN_W/2)-132) //X Position of P1 Small Spotlight
.dw ((SCREEN_W/2)-32) //X Position of P2 Small Spotlight
.dw ((SCREEN_W/2)+68) //X Position of P3 Small Spotlight

.org 0x8010D1DC
.float SCREEN_W_FLOAT //Screen Width of Scissor for Spotlight Swim

.org 0x8010D1E4
.float (SCREEN_W_FLOAT*2) //Width of Viewport for Spotlight Swim

.org 0x8010D1F0
.float (SCREEN_W_FLOAT*2) //X Position of Viewport for Spotlight Swim

.org 0x8010D210
.double (SCREEN_W_FLOAT/SCREEN_H) //Fix World to Screen Aspect Ratio

.headersize 0x801059A0-0x12DD30 //Boulder Ball Segment

.org 0x80105A14
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Boulder Ball

.org 0x80105A20
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Boulder Ball

.headersize 0x801059A0-0x131C10 //Crazy Cogs Segment

.org 0x80106284
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Crazy Cogs Background

.org 0x8010B898
.float ((SCREEN_W_FLOAT/2)-160) //X Position of Scissor for Crazy Cogs

.org 0x8010B8A0
.float ((SCREEN_W_FLOAT/2)+160) //Screen Width of Scissor for Crazy Cogs

.org 0x8010B8A8
.float (SCREEN_W_FLOAT*2) //Width of Viewport for Crazy Cogs

.org 0x8010B8B4
.float (SCREEN_W_FLOAT*2) //X Position of Viewport for Crazy Cogs

.headersize 0x801059A0-0x137C00 //Hide and Sneak Segment

.org 0x8010674C
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Hide and Sneak Background

.org 0x8010C4A4
.dh ((SCREEN_W/2)-90) //Fix X Position of Direction 1 in Hide and Sneak

.org 0x8010C4A8
.dh ((SCREEN_W/2)-55) //Fix X Position of Direction 2 in Hide and Sneak

.org 0x8010C4AC
.dh ((SCREEN_W/2)+13) //Fix X Position of Direction 3 in Hide and Sneak

.org 0x8010C4B0
.dh ((SCREEN_W/2)+66) //Fix X Position of Direction 4 in Hide and Sneak

.org 0x8010C4C0
.float ((SCREEN_W_FLOAT/2)-160) //X Position of Scissor for Hide and Sneak

.org 0x8010C4C8
.float ((SCREEN_W_FLOAT/2)+160) //Screen Width of Scissor for Hide and Sneak

.org 0x8010C4D0
.float (SCREEN_W_FLOAT*2) //Width of Viewport for Hide and Sneak

.org 0x8010C4DC
.float (SCREEN_W_FLOAT*2) //X Position of Viewport for Hide and Sneak

.org 0x8010C4EC
.float ((SCREEN_W_FLOAT/2)-160) //X Position of Scissor for Hide and Sneak

.org 0x8010C4F4
.float ((SCREEN_W_FLOAT/2)+160) //Screen Width of Scissor for Hide and Sneak

.org 0x8010C4FC
.float (SCREEN_W_FLOAT*2) //Width of Viewport for Hide and Sneak

.org 0x8010C508
.float (SCREEN_W_FLOAT*2) //X Position of Viewport for Hide and Sneak

.headersize 0x801059A0-0x13E9C0 //Ridiculous Relay Segment

.org 0x80105A04
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width for Ridiculous Relay P1

.org 0x80105A28
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width for Ridiculous Relay P2

.org 0x80105A34
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width for Ridiculous Relay

.org 0x80107180
sltiu v0, v0, (SCREEN_W+320) //Fix Maximum X Position of Background Eyes

.org 0x80107354
slti v1, s2, (SCREEN_W*4) //Fix Background Eyes in Ridiculous Relay

.org 0x801078A8
sltiu v0, v0, (SCREEN_W+320) //Fix Maximum X Position of Background Tiles

.org 0x80107C50
slti v1, s2, (SCREEN_W*4) //Fix Background in Ridiculous Relay

.org 0x80108A58
slti v0, s2, (SCREEN_W*4) //Fix Cloud Tiles in Ridiculous Relay

.org 0x80108D88
slti v0, fp, (((SCREEN_W+319)/320)+1) //Fix Number of Cloud Tiles in Ridiculous Relay

.org 0x8010927C
slti v0, t2, (SCREEN_W*4) //Fix Water Tiles in Ridiculous Relay

.org 0x8010A474
li.u at, SCREEN_W_FLOAT //Fix Maximum X Position of Ridiculous Relay Progress Bar

.org 0x8010A49C
ori v0, v0, (SCREEN_W-1) //Fix Texture Width for Ridiculous Relay Progress Bar

.org 0x8010A748
slti v0, t3, ((SCREEN_W+58)/59) //Fix Number of Progress Bar Tiles

.org 0x8010AB80
li.u at, ((SCREEN_W_FLOAT/2)-132) //Fix X Position of P1 on Ridiculous Relay Progress Bar

.org 0x8010ABAC
li.u at, ((SCREEN_W_FLOAT/2)-132) //Fix X Position of P2 on Ridiculous Relay Progress Bar

.org 0x8010ABD8
li.u at, ((SCREEN_W_FLOAT/2)-40) //Fix X Position of P3 on Ridiculous Relay Progress Bar

.org 0x8010AC04
li.u at, ((SCREEN_W_FLOAT/2)+40) //Fix X Position of P4 on Ridiculous Relay Progress Bar

.org 0x801095D8
slti v0, t6, (((SCREEN_W+319)/320)+1) //Fix Number of Water Tiles in Ridiculous Relay

.org 0x801098E0
li.u at, SCREEN_W_FLOAT //Fix Maximum X Position of Button Prompts

.org 0x80110D14
.dw ((SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Scissor in Ridiculous Relay Background

.org 0x80110D5C
.dw ((SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Scissor in Ridiculous Relay Foreground

.org 0x80111210
.double (((SCREEN_W_FLOAT*125)/320)+12.5) //Fix Spawn Points of Ridiculous Relay Goombas

.org 0x80111238
.double ((SCREEN_W_FLOAT*125)/320) //Fix Spawn Points of Ridiculous Relay Bullets

.org 0x80111280
.double (((SCREEN_W_FLOAT*125)/320)+12.5) //Fix Spawn Points of Ridiculous Relay Bullets

.headersize 0x801059A0-0x14A810 //Thwomp Pull Segment

.org 0x80105A04
li.u a3, ((SCREEN_W_FLOAT/2)-20) //Fix X Position of Team 1 Scissor Right

.org 0x80105A18
li.u a1, ((SCREEN_W_FLOAT/2)+20) //Fix X Position of Team 2 Scissor Left
li.u a3, SCREEN_W_FLOAT //Fix X Position of Team 2 Scissor Right

.org 0x80105A28
li.u at, SCREEN_W_FLOAT //Fix X Position of Team 1 Viewport

.org 0x80105A5C
li.u a1, (SCREEN_W_FLOAT*2) //Fix Width of Team 1 Viewport

.org 0x80105A74
li.u at, (SCREEN_W_FLOAT*3) //Fix X Position of Team 2 Viewport

.org 0x80105A8C
li.u a1, (SCREEN_W_FLOAT*2) //Fix Width of Team 2 Viewport

.org 0x80106EA8
addiu v0, r0, (SCREEN_W/2) //Fix Background Viewport Center

.org 0x80106EBC
addiu v0, r0, SCREEN_W //Fix Background Viewport Right

.org 0x80106FE8
li.u at, ((SCREEN_W_FLOAT/2)+20) //Fix X Position of Team 1 Scissor Right

.org 0x80106FF8
li.u at, ((SCREEN_W_FLOAT/2)-20) //Fix X Position of Team 2 Scissor Left

.org 0x80107008
li.u at, SCREEN_W_FLOAT //Fix X Position of Team 2 Scissor Right

.org 0x80107024
li.u at, (SCREEN_W_FLOAT*3) //Fix X Position of Ending Viewport

.org 0x80107150
li.u at, (SCREEN_W_FLOAT*2) //Fix X Position of Team 2 Viewport

.org 0x80107200
li.u at, SCREEN_W_FLOAT //Fix X Position of Team 2 Background

.org 0x801072E8
li.u at, (SCREEN_W_FLOAT-2) //Fix X Position of Team 2 Ending Scissor

.org 0x80107308
li.u at, SCREEN_W_FLOAT //Fix Width of Team 2 Ending Scissor

.org 0x80107320
li.u at, (((SCREEN_W_FLOAT/2)+18)*4) //Fix X Position of Team 2 Ending Viewport

.org 0x8010733C
li.u at, ((SCREEN_W_FLOAT/2)+18) //Fix X Position of Team 2 Ending Background

.org 0x801073A0
li.u at, (((SCREEN_W_FLOAT/2)+18)*4) //Fix X Position of Team 2 Ending Viewport

.org 0x801073BC
li.u at, ((SCREEN_W_FLOAT/2)+18) //Fix X Position of Team 2 Ending Background

.org 0x8010742C
li.u at, (SCREEN_W_FLOAT*2) //Fix Width of Ending Viewport

.org 0x801077E8
li.u at, SCREEN_W_FLOAT //Fix X Position of Team 1 Viewport

.org 0x80107834
li.u a1, (SCREEN_W_FLOAT*2) //Fix Width of Team 1 Viewport

.org 0x8010784C
li.u at, (SCREEN_W_FLOAT*3) //Fix X Position of Team 2 Viewport

.org 0x80107870
li.u a1, (SCREEN_W_FLOAT*2) //Fix Width of Team 2 Viewport

.org 0x8010793C
li.u at, (SCREEN_W_FLOAT*2) //Fix Width of Team Viewports Intro

.org 0x8010795C
li.u at, SCREEN_W_FLOAT //Fix X Position of Team 1 Viewport Intro

.org 0x8010799C
li.u at, (SCREEN_W_FLOAT*3) //Fix X Position of Team 2 Viewport Intro

.org 0x80107BF4
li.u at, (SCREEN_W_FLOAT*2) //Fix Width of Team Viewports Game

.org 0x80107C14
li.u at, SCREEN_W_FLOAT //Fix X Position of Team 1 Viewport Game

.org 0x80107C74
li.u at, (SCREEN_W_FLOAT*3) //Fix X Position of Team 2 Viewport Game

.org 0x8010805C
addiu t7, r0, ((SCREEN_W/2)+20) //Fix X Position of Team 2 Background Scissor Left
addiu t6, r0, SCREEN_W //Fix X Position of Team 2 Background Scissor Right
addiu t5, r0, ((SCREEN_W/2)-20) //Fix X Position of Team 1 Background Scissor Right

.org 0x801081DC
li.u at, SCREEN_W_FLOAT //Fix X Position of Ending Background Scissor

.org 0x80108648
slti v1, t2, ((SCREEN_W*4)+1) //Fix Maximum X Position for Background Tiles

.org 0x80108A28
li.u at, ((SCREEN_W_FLOAT/2)+18) //Fix X Position of Ending Progress Bar

.org 0x80108C24
addiu v1, s3, (((SCREEN_W/2)+20)*4) //Fix X Position of Progress Bar Right Edge

.org 0x80108C4C
addiu v1, s3, (((SCREEN_W/2)-20)*4) //Fix X Position of Progress Bar Left Edge

.org 0x80109380
addiu v0, v0, ((SCREEN_W/2)-9) //Fix X Position of Team 1 on Progress Bar

.org 0x80109394
li.u at, ((SCREEN_W_FLOAT/2)-24) //Fix X Position of Team 2 on Progress Bar

.org 0x8010B20C
addiu v1, r0, 1 //Force Clearing During Thwomp Pull

.org 0x8010EDCC
.dw ((SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Scissor in Whomp Pull Progress Bar

.org 0x8010EE14
.dw ((SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Scissor in Whomp Pull Background

.headersize 0x801059A0-0x1542E0 //River Raiders Segment

.org 0x8010D870
.float (SCREEN_W_FLOAT-120) //Fix X Position of P2 Icon

.org 0x8010D878
.float (SCREEN_W_FLOAT-105) //Fix X Position of P3 Icon

.org 0x8010D880
.float (SCREEN_W_FLOAT-90) //Fix X Position of P4 Icon

.org 0x8010D8A8
.float (SCREEN_W_FLOAT-70) //Fix X Position of Team 2 Coin Icon

.org 0x8010D8B0
.float (SCREEN_W_FLOAT-50) //Fix X Position of Team 2 Cross Icon

.org 0x8010D8B8
.float (SCREEN_W_FLOAT-40) //Fix X Position of Team 2 Coin Digit 1

.org 0x8010D8C0
.float (SCREEN_W_FLOAT-30) //Fix X Position of Team 2 Coin Digit 2

.org 0x8010D8D0
.float SCREEN_W_FLOAT //Screen Width of Scissor for River Raiders

.org 0x8010D8D8
.float (SCREEN_W_FLOAT*2) //Width of Viewport for River Raiders

.org 0x8010D8E4
.float (SCREEN_W_FLOAT*2) //X Position of Viewport for River Raiders

.org 0x8010D8F0
.float 29.75 //FOV for River Raiders

.headersize 0x801059A0-0x15C310 //Tidal Toss Segment

.org 0x80105A38
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Tidal Toss

.org 0x80105A44
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Tidal Toss

.org 0x801061CC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Background

.org 0x80106584
li.u a2, ((SCREEN_W_FLOAT*1380)/320) //Fix X Position of Outer Wall
li.l a2, ((SCREEN_W_FLOAT*1380)/320) //Fix X Position of Outer Wall

.org 0x8010AA74
.dh ((SCREEN_W/2)-((SCREEN_W*105)/320)) //Fix X Position of Cloud 1
.dh ((SCREEN_W*30)/320) //Fix Y Position of Cloud 1
.dh ((SCREEN_W/2)+((SCREEN_W*38)/320)) //Fix X Position of Cloud 2
.dh ((SCREEN_W*38)/320) //Fix Y Position of Cloud 2
.dh ((SCREEN_W/2)+((SCREEN_W*134)/320)) //Fix X Position of Cloud 3
.dh ((SCREEN_W*24)/320) //Fix Y Position of Cloud 3

.headersize 0x801059A0-0x161750 //Eatsa Pizza Segment

.org 0x80105A38
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Eatsa Pizza

.org 0x80105A44
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Eatsa Pizza

.org 0x801084BC
addiu a2, r0, (SCREEN_W/2) //Fix Background X Position in Eatsa Pizza

.org 0x8010870C
addiu a2, r0, ((SCREEN_W/2)-80) //Fix Left Slice X Position in Eatsa Pizza

.org 0x80108720
addiu a2, r0, ((SCREEN_W/2)+80) //Fix Right Slice X Position in Eatsa Pizza

.org 0x80109250
.double (SCREEN_W_FLOAT/2) //Fix X Offset of Crumbs in Eatsa Pizza

.headersize 0x801059A0-0x165010 //Baby Bowser Broadside Segment

.org 0x80105A80
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Baby Bowser Broadside

.org 0x80105A8C
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Baby Bowser Broadside

.org 0x801069E0
addiu a1, r0, (SCREEN_W-70) //Fix X Position of P2 Score Box in Baby Bowser Broadside

.org 0x80106A10
addiu s4, r0, (SCREEN_W-140) //Load Spacing Between Left and Right Side Faces in Baby Bowser Broadside
multu s4, s2 //Calculate Offset of Faces in Baby Bowser Broadside
mflo s4 //Get Offset of Faces in Baby Bowser Broadside

.org 0x80106B28
addiu s0, r0, (SCREEN_W-140) //Load Spacing Between Left and Right Side Score in Baby Bowser Broadside
multu s0, s2 //Calculate Offset of Score in Baby Bowser Broadside
mflo s0 //Get Offset of Score in Baby Bowser Broadside

.headersize 0x801059A0-0x16F670 //Pump Pump and Away Segment

.org 0x8010772C
slti v0, t0, ((SCREEN_W+63)/64) //Fix Number of Fade Tiles to Render in Pump Pump and Away

.org 0x8010A5D0
lui v1, 0x8011 //Load Upper Half of Rocket Down Speed

.org 0x8010A5E0
lwc1 f4, 0x1C(s1) //Load Rocket Y Position

.org 0x8010A5E8
lwc1 f6, 0x13A4(v1) //Load Rocket Down Speed

.org 0x8010A5FC
sub.s f4, f4, f6 //Apply Rocket Down Speed

.org 0x8010A604
lwc1 f2, 0x13A0(at) //Replace Double Precision Constant with Single-Precision
add.s f0, f0, f2 //Do Single-Precision Math
swc1 f4, 0x1C(s1) //Store Rocket Y Position

.org 0x8010A8FC
li.u at, 132.0 //Fix Camera Scroll Y Position in Pump Pump and Away

.org 0x8010F94C
li.u at, -3.0 //Fix Camera Y Position in Pump Pump and Away

.org 0x80110FE0
.dh (SCREEN_W-82) //Fix X Position of P2 Score Box in Pump Pump and Away

.org 0x80110FF4
.dh (SCREEN_W-76) //Fix X Position of P2 Score Dummy Digit in Pump Pump and Away

.org 0x80110FF8
.dh (SCREEN_W-76) //Fix X Position of P2 Score Digit 1 in Pump Pump and Away

.org 0x80110FFC
.dh (SCREEN_W-67) //Fix X Position of P2 Score Digit 2 in Pump Pump and Away

.org 0x80111000
.dh (SCREEN_W-58) //Fix X Position of P2 Score Digit 3 in Pump Pump and Away

.org 0x80111124
.float SCREEN_W_FLOAT //Screen Width of Scissor for Pump Pump and Away

.org 0x8011112C
.float (SCREEN_W_FLOAT*2) //Width of Viewport for Pump Pump and Away

.org 0x80111138
.float (SCREEN_W_FLOAT*2) //X Position of Viewport for Pump Pump and Away

.org 0x801113A0
.float 0.2 //Replace Constant
.float (68.0/53.0) //Rocket Down Speed in Pump Pump and Away

.org 0x80111144
.float 15.1604 //FOV in Pump Pump and Away

.headersize 0x801059A0-0x17B3B0 //Hyper Hydrants Segment

.org 0x80106008
li.u a3, (SCREEN_W_FLOAT/2) //Fix P1 Scissor Right in Hyper Hydrants

.org 0x80106014
li.u at, SCREEN_W_FLOAT //Fix P1 Viewport X in Hyper Hydrants

.org 0x80106048
li.u a1, (SCREEN_W_FLOAT*2) //Fix P1 Viewport Size in Hyper Hydrants

.org 0x80106080
li.u a1, (SCREEN_W_FLOAT/2) //Fix P2 Scissor Left in Hyper Hydrants

.org 0x80106094
li.u at, (SCREEN_W_FLOAT*3) //Fix P2 Viewport X in Hyper Hydrants

.org 0x801060AC
li.u a1, (SCREEN_W_FLOAT*2) //Fix P2 Viewport Size in Hyper Hydrants

.org 0x8010AEE4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Separator in Hyper Hydrants

.org 0x8010AF70
addiu a2, r0, (SCREEN_W/4) //Fix X Position of Left Background in Hyper Hydrants

.org 0x8010AF90
addiu a2, r0, ((SCREEN_W*3)/4) //Fix X Position of Right Background in Hyper Hydrants

.org 0x8010B094
addiu a2, r0, (SCREEN_W/4) //Fix X Position of Left Background in Hyper Hydrants

.org 0x8010B0B4
addiu a2, r0, ((SCREEN_W*3)/4) //Fix X Position of Right Background in Hyper Hydrants

.org 0x8010BE1C
.dh (SCREEN_W-44) //Fix X Position of Hyper Hydrants Score Digit 1

.org 0x8010BE20
.dh (SCREEN_W-32) //Fix X Position of Hyper Hydrants Score Digit 2

.org 0x8010BF34
.dh (SCREEN_W-68) //Fix X Position of Hyper Hydrants Score Icon

.headersize 0x801059A0-0x181950 //Panic Picking Segment

.org 0x80105A04
li.u a3, SCREEN_W_FLOAT //Fix P1 Scissor Width in Panic Picking

.org 0x80105A28
li.u a3, SCREEN_W_FLOAT //Fix P2 Scissor Width in Panic Picking

.org 0x80105A34
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Panic Picking

.org 0x801078BC
li.u a3, SCREEN_W_FLOAT //Fix P1 Scissor Width in Panic Picking

.org 0x80107944
li.u a3, SCREEN_W_FLOAT //Fix P2 Scissor Width in Panic Picking

.org 0x80107954
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Panic Picking

.org 0x80107F50
lui v1, (SCREEN_W/4) //Fix Scissor Width for P1 Background in Panic Picking

.org 0x80107F90
lui v0, (SCREEN_W/4) //Fix Scissor Width for P2 Background in Panic Picking

.org 0x80107FF0
addiu a0, a0, (((SCREEN_W/2)-160)*4) //Fix X Offset of Background Tiles in Panic Picking
addu v0, a0, r0 //Padding Instruction

.org 0x801080AC
addiu a0, a0, (((SCREEN_W/2)-160)*4) //Fix X Offset of Background Tiles in Panic Picking
addu v0, a0, r0 //Padding Instruction

.org 0x80108144
addiu v0, v0, (((SCREEN_W/2)-160)*4) //Fix X Offset of Background Tiles in Panic Picking
addu a0, v0, r0  //Padding Instruction

.org 0x801081E4
addiu v1, v1, (((SCREEN_W/2)-160)*4) //Fix X Offset of Background Tiles in Panic Picking
nop //Padding Instruction

.org 0x80108CA4
lui v1, (SCREEN_W/4) //Fix Scissor Width for P1 Monkey in Panic Picking

.org 0x80108CE4
lui v0, (SCREEN_W/4) //Fix Scissor Width for P2 Monkey in Panic Picking

.org 0x80108D48
addiu v1, v1, (((SCREEN_W/2)-160)*4) //Fix X Offset of Monkey in Panic Picking
addu v0, v1, r0 //Padding Instruction

.org 0x80108F0C
addiu a0, a0, (((SCREEN_W/2)-160)*4) //Fix X Offset of Monkey in Panic Picking
addu v0, a0, r0 //Padding Instruction

.org 0x80109008
addiu v0, v0, (((SCREEN_W/2)-160)*4) //Fix X Offset of Monkey in Panic Picking
addu a0, v0, r0  //Padding Instruction

.org 0x8010909C
addiu v0, v0, (((SCREEN_W/2)-160)*4) //Fix X Offset of Monkey in Panic Picking
addu a1, v0, r0 //Padding Instruction

.org 0x80109710
lui v1, (SCREEN_W/4) //Fix Scissor Width for P1 Foreground in Panic Picking

.org 0x80109750
lui v0, (SCREEN_W/4) //Fix Scissor Width for P2 Foreground in Panic Picking

.org 0x801097C0
addiu a0, a0, (((SCREEN_W/2)-160)*4) //Fix X Offset of Background Tiles in Panic Picking
addu v0, a0, r0 //Padding Instruction

.org 0x80109870
addiu a0, a0, (((SCREEN_W/2)-160)*4) //Fix X Offset of Background Tiles in Panic Picking
addu v0, a0, r0 //Padding Instruction

.org 0x80109908
addiu v0, v0, (((SCREEN_W/2)-160)*4) //Fix X Offset of Background Tiles in Panic Picking
addu a0, v0, r0  //Padding Instruction

.org 0x801099A8
addiu v1, v1, (((SCREEN_W/2)-160)*4) //Fix X Offset of Background Tiles in Panic Picking
nop //Padding Instruction

.org 0x8010A0EC
lui v1, (SCREEN_W/4) //Fix Scissor Width for P1 Score Box in Panic Picking

.org 0x8010A128
lui v0, (SCREEN_W/4) //Fix Scissor Width for P2 Score Box in Panic Picking

.org 0x8010A240
li v0, (0xE4000000|(((SCREEN_W/2)+139) << 14)) //Fix X Position of Right Edge of Score Box

.org 0x8010A270
li v0, (((SCREEN_W/2)+79) << 14) //Fix X Position of Left Edge of Score Box

.org 0x8010A694
li fp, (((SCREEN_W/2)+98)*4) << 12 //Load Score Icon Rectangle Right Edge

.org 0x8010A6A0
li t9, (((SCREEN_W/2)+83)*4) << 12 //Load Score Icon Rectangle Left Edge

.org 0x8010A6B8
addiu v1, v0, ((SCREEN_W/2)+100) //Fix X Position of Right Edge of Score Digits

.org 0x8010A6DC
addiu v0, v0, ((SCREEN_W/2)+89) //Fix X Position of Left Edge of Score Digits

.org 0x8010A724
lui v1, (SCREEN_W/4) //Fix Scissor Width for P1 Score in Panic Picking

.org 0x8010A760
lui v0, (SCREEN_W/4) //Fix Scissor Width for P2 Score in Panic Picking

.org 0x8010ADF4
li v0, ((SCREEN_W << 14)|(240 << 2)) //Load Scissor Size for Separator Bar

.org 0x8010AEC4
li v0, (0xFD480000|((SCREEN_W/2)-1)) //Fix Texture Pitch for Separator Bar

.org 0x8010AEE4
li v0, (0xF5480000|(((SCREEN_W+15)/16) << 9)) //Fix Tile Load for Separator Bar

.org 0x8010AF24
li v0, (0x07000000|((SCREEN_W*2) << 12)) //Fix Tile Load for Separator Bar

.org 0x8010AF50
li v0, (0xF5400000|(((SCREEN_W+15)/16) << 9)) //Fix Tile Load for Separator Bar

.org 0x8010AF7C
li v0, ((SCREEN_W << 14)|(6 << 2)) //Load Texture Size for Separator Bar

.org 0x8010AFEC
lui v0, (0xE400|(SCREEN_W/4)) //Fix Rectangle for Separator in Panic Picking

.headersize 0x801059A0-0x18ABD0 //Cosmic Coaster Segment

.org 0x80105AE8
li.u a3, ((SCREEN_W_FLOAT/2)-16) //Fix Scissor Width for Cosmic Coaster P1

.org 0x80105AF4
li.u at, SCREEN_W_FLOAT //Fix Viewport X Position for Cosmic Coaster P1

.org 0x80105B28
li.u a1, (SCREEN_W_FLOAT*2) //Fix Viewport Width for Cosmic Coaster P1

.org 0x80105B48
li.u a1, ((SCREEN_W_FLOAT/2)+16) //Fix Scissor X Position for Cosmic Coaster P2

.org 0x80105B5C
li.u at, (SCREEN_W_FLOAT*3) //Fix Viewport X Position for Cosmic Coaster P2

.org 0x80105B74
li.u a1, (SCREEN_W_FLOAT*2) //Fix Viewport Width for Cosmic Coaster P2

.org 0x80106120
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Cosmic Coaster Goal

.org 0x80106170
addiu a1, r0, (SCREEN_W/2) //X Spacing of Cosmic Coaster Background
multu a1, s2 //Calculate X Offset of Cosmic Coaster Background
mflo a1 //Get X Offset of Cosmic Coaster Background
addiu a1, a1, (SCREEN_W/4) //Fix X Position of Cosmic Coaster Background

.org 0x801061D0
addiu a1, a1, ((SCREEN_W/2)-7) //Fix X Position of Cosmic Coaster Left Track

.org 0x8010621C
addiu a1, a1, ((SCREEN_W/2)-9) //Fix X Position of Cosmic Coaster Left Coaster

.org 0x80106294
addiu s0, s0, ((SCREEN_W/2)-9) //Fix X Position of Cosmic Coaster Left Coaster Player

.org 0x8010646C
addiu s0, s0, ((SCREEN_W/2)-9) //Fix X Position of Cosmic Coaster Left Coaster

.headersize 0x801059A0-0x191240 //Puddle Paddle Segment

.org 0x80105A80
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Puddle Paddle

.org 0x80105A8C
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Puddle Paddle

.org 0x8010660C
addiu a1, r0, (SCREEN_W-84) //Fix X Position of Puddle Paddle Coin Icon

.org 0x80106664
addiu a1, r0, (SCREEN_W-84) //Fix X Position of Puddle Paddle Coin Icon

.org 0x801066BC
addiu a1, r0, (SCREEN_W-68) //Fix X Position of Puddle Paddle Cross Icon

.org 0x801066F0
addiu s2, r0, (SCREEN_W-160) //Spacing of Puddle Paddle Faces
multu v0, s2 //Calculate Offset of Puddle Paddle Faces
mflo s2 //Get Offset of Puddle Paddle Faces

.org 0x80106804
addiu s1, r0, (SCREEN_W-160) //Spacing of Puddle Paddle Coins
multu v1, s1 //Calculate Offset of Puddle Paddle Coins
mflo s1 //Get Offset of Puddle Paddle Coins

.org 0x801075CC
li.u at, 102.0 //Fix Puddle Paddle Camera Y Position

.org 0x80107610
li.u at, 2404.0 //Fix Puddle Paddle Zoom High Part
li.l at, 2404.0 //Fix Puddle Paddle Zoom Low Part

.org 0x801076F4
addiu a1, r0, (SCREEN_W-160) //Spacing of Puddle Paddle Coins
multu a2, a1 //Calculate Offset of Puddle Paddle Coins
mflo a1 //Get Offset of Puddle Paddle Coins

.headersize 0x801059A0-0x19CEF0 //Etch n Catch Segment

.org 0x80105D9C
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Etch n Catch

.org 0x80105DA8
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Etch n Catch

.org 0x80107208
addiu v0, v0, -((SCREEN_W/2)-160) //Fix Offset of Canvas in Etch n Catch

.org 0x80109F74
addiu v0, v0,  -((SCREEN_W/4)-80) //Fix Offset of Canvas in Etch n Catch
sh v0, 0xC850(at)  //Run Replaced Opcode
nop //Pad Opcodes

.org 0x8010BF10
addiu a2, r0, (SCREEN_W/2) //Fix Background X Position in Etch n Catch

.org 0x8010BF90
addiu a2, r0, (SCREEN_W/2) //Fix Canvas X Position in Etch n Catch

.org 0x8010C6A4
.dh ((SCREEN_W/2)-96) //Fix X Position of P1 Toad Count in Etch n Catch

.org 0x8010C6A8
.dh ((SCREEN_W/2)+121) //Fix X Position of P2 Toad Count in Etch n Catch

.org 0x8010C820
.dh ((SCREEN_W/2)-125) //Fix X Position of P1 Toad Counter in Etch n Catch

.org 0x8010C824
.dh ((SCREEN_W/2)+92) //Fix X Position of P2 Toad Counter in Etch n Catch

.headersize 0x801059A0-0x1A3D80 //Log Jam Segment

.org 0x80105A64
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Log Jam

.org 0x80105A70
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Log Jam

.org 0x80105ABC
li.u a1, 22.875 //Fix FOV in Log Jam

.org 0x80109CC0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of BG 1 in Log Jam

.org 0x8010A1C4
li.u at, (SCREEN_W_FLOAT+96) //Fix X Offset of Cloud from Right

.org 0x8010A1D8
li.u at, (SCREEN_W_FLOAT+64) //Fix Max X Position of Cloud from Left

.org 0x8010A1F4
li.u at, SCREEN_W_FLOAT //Fix X Offset of Cloud from Left

.org 0x8010E054
.float ((SCREEN_W_FLOAT*120)/320) //Fix X Position of Cloud 1

.org 0x8010E05C
.float ((SCREEN_W_FLOAT*360)/320) //Fix X Position of Cloud 2

.org 0x8010E06C
.float ((SCREEN_W_FLOAT*240)/320) //Fix X Position of Cloud 4

.org 0x8010E074
.float ((SCREEN_W_FLOAT*480)/320) //Fix X Position of Cloud 5

.org 0x8010E092
.dh (SCREEN_W-38) //Fix X Position of P2 Log Score in Log Jam


.headersize 0x801059A0-0x1AC970 //Slot Synch Segment

.org 0x80105A60
li.u a1, ((SCREEN_W_FLOAT/2)-160) //Fix Scissor X Position in Slot Synch
li.u a3, ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Width in Slot Synch

.org 0x80105A6C
addu a2, r0, r0 //Fix Scissor Y Position in Slot Synch

.org 0x80105A70
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Slot Synch

.org 0x80107878
addiu a2, r0, ((SCREEN_W/2)-160) //Fix X Position of Sky in Slot Synch

.org 0x80107904
addiu a2, r0, ((SCREEN_W/2)-160) //Fix X Position of Stadium in Slot Synch

.org 0x80107988
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Score Gains in Slot Synch

.org 0x80107A10
addiu a2, r0, ((SCREEN_W/2)-160) //Fix X Position of Ground in Slot Synch

.org 0x8010D838
.dh ((SCREEN_W/2)-90) //Fix X Position of Team 1 Score in Slot Synch

.org 0x8010D83C
.dh ((SCREEN_W/2)+90) //Fix X Position of Team 2 Score in Slot Synch

.org 0x8010D938
.dh ((SCREEN_W/2)-144) //Fix X Position of Left Crowd Member 1

.org 0x8010D93E
.dh ((SCREEN_W/2)-120) //Fix X Position of Left Crowd Member 2

.org 0x8010D944
.dh ((SCREEN_W/2)-96) //Fix X Position of Left Crowd Member 3

.org 0x8010D94A
.dh ((SCREEN_W/2)-72) //Fix X Position of Left Crowd Member 4

.org 0x8010D950
.dh ((SCREEN_W/2)-130) //Fix X Position of Left Crowd Member 5

.org 0x8010D956
.dh ((SCREEN_W/2)-106) //Fix X Position of Left Crowd Member 6

.org 0x8010D95C
.dh ((SCREEN_W/2)-82) //Fix X Position of Left Crowd Member 7

.org 0x8010D962
.dh ((SCREEN_W/2)-58) //Fix X Position of Left Crowd Member 8

.org 0x8010D968
.dh ((SCREEN_W/2)-144) //Fix X Position of Left Crowd Member 9

.org 0x8010D96E
.dh ((SCREEN_W/2)-120) //Fix X Position of Left Crowd Member 10

.org 0x8010D974
.dh ((SCREEN_W/2)-96) //Fix X Position of Left Crowd Member 11

.org 0x8010D97A
.dh ((SCREEN_W/2)-72) //Fix X Position of Left Crowd Member 12

.org 0x8010D980
.dh ((SCREEN_W/2)+144) //Fix X Position of Right Crowd Member 1

.org 0x8010D986
.dh ((SCREEN_W/2)+120) //Fix X Position of Right Crowd Member 2

.org 0x8010D98C
.dh ((SCREEN_W/2)+96) //Fix X Position of Right Crowd Member 3

.org 0x8010D992
.dh ((SCREEN_W/2)+72) //Fix X Position of Right Crowd Member 4

.org 0x8010D998
.dh ((SCREEN_W/2)+130) //Fix X Position of Right Crowd Member 5

.org 0x8010D99E
.dh ((SCREEN_W/2)+106) //Fix X Position of Right Crowd Member 6

.org 0x8010D9A4
.dh ((SCREEN_W/2)+82) //Fix X Position of Right Crowd Member 7

.org 0x8010D9AA
.dh ((SCREEN_W/2)+58) //Fix X Position of Right Crowd Member 8

.org 0x8010D9B0
.dh ((SCREEN_W/2)+144) //Fix X Position of Right Crowd Member 9

.org 0x8010D9B6
.dh ((SCREEN_W/2)+120) //Fix X Position of Right Crowd Member 10

.org 0x8010D9BC
.dh ((SCREEN_W/2)+96) //Fix X Position of Right Crowd Member 11

.org 0x8010D9C2
.dh ((SCREEN_W/2)+72) //Fix X Position of Right Crowd Member 12

.headersize 0x801059A0-0x1B4F10 //Treadmill Grill Segment

.org 0x80105A0C
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Treadmill Grill

.org 0x80105A18
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Treadmill Grill

.org 0x80105A64
li.u a1, 18.875 //Fix FOV in Treadmill Grill

.headersize 0x801059A0-0x1BA850 //Toadstool Titan Segment

.org 0x80105A2C
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Toadstool Titan

.org 0x80105A40
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Toadstool Titan

.org 0x80107474
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Toadstool Titan

.org 0x80107810
li.u v1, ((SCREEN_W_FLOAT/2)-160) //Fix X Offset of Toadstool Titan Background

.org 0x80107824
mtc1 v1, f8 //Fix X Offset of Toadstool Titan Background

.org 0x8010783C
add.s f14, f14, f8 //Insert Add Instruction for Left X Offset

.org 0x80107870
//Fix Load of 320.0f Constant
lui v1, 0x43A0
mtc1 v1, f2

.org 0x80107898
add.s f2, f2, f8 //Insert Add Instruction for Right X Offset

.org 0x801078D0
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Toadstool Titan

.org 0x80107ABC
addiu v0, v0, ((SCREEN_W/2)-160) //Fix X Offset of Background
nop //Padding Instruction

.org 0x80107C58
li.u a1, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Toadstool Titan

.org 0x8010B110
slti v1, t2, ((SCREEN_W*4)+1) //Fix Background Tiles in Toadstool Titan

.org 0x8010EDA4
.float ((SCREEN_W_FLOAT/2)-160) //Fix X Position of Left Edge of Toadstool Titan Background

.org 0x8010EDAC
.float ((SCREEN_W_FLOAT/2)+160) //Fix X Position of Right Edge of Toadstool Titan Background

.org 0x8010EE2C
.dw ((SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Scissor in Toadstool Titan Background

.headersize 0x801059A0-0x1C4280 //Aces High Segment

.org 0x80106128
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Horizontal Split

.org 0x80106170
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Vertical Split

.org 0x8010CA44
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Map

.org 0x8010CBC0
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Map Sprites

.org 0x8010D4B4
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Split Center

.org 0x8010D538
li.u at, SCREEN_W_FLOAT //Fix X Position of Split Right

.org 0x8010D548
li.u at, ((SCREEN_W_FLOAT/2)-2) //Fix X Position of Split Center

.org 0x8010D62C
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Horizontal SPlit

.org 0x8010D838
li.u at, ((SCREEN_W_FLOAT/2)-15.4) //Load Upper Half of Max Left X Position for Warnings
li.l at, ((SCREEN_W_FLOAT/2)-15.4) //Load Lower Half of Max Left X Position for Warnings

.org 0x8010D860
li.u at, ((SCREEN_W_FLOAT/2)+15.4) //Load Upper Half of Min Right X Position for Warnings
li.l at, ((SCREEN_W_FLOAT/2)+15.4) //Load Lower Half of Min Right X Position for Warnings

.org 0x8010D86C
li.u at, (SCREEN_W_FLOAT-15.4) //Load Upper Half of Max Right X Position for Warnings
li.l at, (SCREEN_W_FLOAT-15.4) //Load Lower Half of Max Right X Position for Warnings

.org 0x8010DB78
.float ((SCREEN_W_FLOAT/2)-1) //Fix X Offset of P1 Scissor Right

.org 0x8010DB80
.float ((SCREEN_W_FLOAT/2)+1) //Fix X Offset of P2 Scissor Left

.org 0x8010DB88
.float (SCREEN_W_FLOAT-1) //Fix X Offset of P2 Scissor Right

.org 0x8010DB98
.float ((SCREEN_W_FLOAT/2)-1) //Fix X Offset of P3 Scissor Right

.org 0x8010DBA0
.float ((SCREEN_W_FLOAT/2)+1) //Fix X Offset of P4 Scissor Left

.org 0x8010DBA8
.float (SCREEN_W_FLOAT-1) //Fix X Offset of P4 Scissor Right

.org 0x8010DBB0
.float (SCREEN_W_FLOAT*2) //Fix Size of P1 Viewport

.org 0x8010DBB8
.float SCREEN_W_FLOAT //Fix X Position of P1 Viewport

.org 0x8010DBC0
.float (SCREEN_W_FLOAT*2) //Fix Size of P2 Viewport

.org 0x8010DBC8
.float (SCREEN_W_FLOAT*3) //Fix X Position of P2 Viewport

.org 0x8010DBD0
.float (SCREEN_W_FLOAT*2) //Fix Size of P1 Viewport

.org 0x8010DBD8
.float SCREEN_W_FLOAT //Fix X Position of P1 Viewport

.org 0x8010DBE0
.float (SCREEN_W_FLOAT*2) //Fix Size of P2 Viewport

.org 0x8010DBE8
.float (SCREEN_W_FLOAT*3) //Fix X Position of P2 Viewport

.org 0x8010DC58
.dh (SCREEN_W-28) //Fix X Position of P2 Heart 1

.org 0x8010DC5C
.dh (SCREEN_W-28) //Fix X Position of P2 Heart 2

.org 0x8010DC68
.dh (SCREEN_W-28) //Fix X Position of P4 Heart 1

.org 0x8010DC6C
.dh (SCREEN_W-28) //Fix X Position of P4 Heart 2

.org 0x8010DC74
.dh (SCREEN_W-32) //Fix X Position of P2 Bullet Icon

.org 0x8010DC7C
.dh (SCREEN_W-32) //Fix X Position of P4 Bullet Icon

.org 0x8010DCB4
.float (SCREEN_W_FLOAT/2) //Fix X Position of Ending Split Center

.org 0x8010DCBC
.float (SCREEN_W_FLOAT-1) //Fix X Position of Ending Split Right

.org 0x8010DCCC
.float (SCREEN_W_FLOAT-1) //Fix X Position of Ending Split Right

.headersize 0x801059A0-0x1CC730 //Bounce and Trounce Segment

.org 0x80105A58
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Bounce and Trounce

.org 0x80105A64
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Bounce and Trounce

.org 0x8010A6D0
li.u at, 284.0 //Fix Maximum Zoom

.org 0x8010A700
li.u at, 2384.0 //Fix Maximum Zoom

.headersize 0x801059A0-0x1D1C40 //Ice Rink Risk Segment

.org 0x80105A20
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Ice Rink Risk

.org 0x80105A2C
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Ice Rink Risk

.org 0x80105D8C
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Background

.headersize 0x801059A0-0x1DE610 //Parasol Plummet Segment

.org 0x80106BE4
slti v0, v1, ((SCREEN_W/2)+96) //Fix Maximum Player X Position in Parasol Plummet

.org 0x80106C70
slti v0, v1, ((SCREEN_W/2)-95) //Fix Minimum Player X Position in Parasol Plummet

.org 0x80108338
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Parasol Plummet Background

.org 0x80108790
addiu v0, v0, ((SCREEN_W/2)-120) //Fix X Position of Parasol Plummet Clouds

.org 0x80108A2C
addiu v0, r0, ((SCREEN_W/2)-136) //Fix X Position of Parasol Plummet Left Vine

.org 0x80108A34
addiu v0, r0, ((SCREEN_W/2)+136) //Fix X Position of Parasol Plummet Right Vine

.org 0x801090FC
li.u at, ((SCREEN_W_FLOAT/2)-130) //Fix Left Side Coin Throw Position in Parasol Plummet

.org 0x80109120
li.u at, ((SCREEN_W_FLOAT/2)+130) //Fix Right Side Coin Throw Position in Parasol Plummet

.org 0x80109170
li.u at, ((SCREEN_W_FLOAT/2)+121) //Fix Right Side Coin Throw Position in Parasol Plummet
li.l at, ((SCREEN_W_FLOAT/2)+121) //Fix Right Side Coin Throw Position in Parasol Plummet

.org 0x8010A7D0
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Parasol Plummet

.org 0x8010A7E0
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Parasol Plummet

.org 0x8010AB46
.dh (SCREEN_W-84) //Fix X Position of P2 HUD

.org 0x8010AB4A
.dh (SCREEN_W-84) //Fix X Position of P4 HUD

.headersize 0x801059A0-0x1D4970 //Locked Out Segment

.org 0x80105A38
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Locked Out

.org 0x80105A44
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Locked Out

.org 0x80105A90
li.u a1, 43.25 //Fix FOV in Locked Out

.headersize 0x801059A0-0x1D9550 //Chip Shot Challenge Segment

.org 0x80105A1C
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Chip Shot Challenge

.org 0x80105A28
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Chip Shot Challenge

.org 0x80105CCC
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Chip Shot Challenge Background

.org 0x8010771C
addiu a2, r0, ((SCREEN_W/2)-32) //Fix X Position of First Digit

.org 0x80107864
addiu a2, r0, ((SCREEN_W/2)-1) //Fix X Position of Second Digit

.headersize 0x801059A0-0x1E37C0 //Messy Memory Segment

.org 0x80105D70
lui t4, (((SCREEN_W/2)+160)/4) //Fix Lower-Right X of Messy Memory Horizontal Split Texrect
lui t3, (((SCREEN_W/2)-160)/4) //Fix Upper-Left X of Messy Memory Horizontal Split Texrect

.org 0x80105F90
lui t4, (((SCREEN_W/2)+12)/4) //Fix Lower-Right X of Messy Memory Vertical Split Texrect
lui t3, (((SCREEN_W/2)-12)/4) //Fix Upper-Left X of Messy Memory Vertical Split Texrect

.org 0x80106430
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Messy Memory Initial Background

.org 0x801064D4
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Messy Memory Background

.org 0x8010D234
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Messy Memory Correct Result

.org 0x80110FE0
.dh ((SCREEN_W/2)-160) //Fix X Position of P1 In Messy Memory

.org 0x80110FE4
.dh ((SCREEN_W/2)-16) //Fix X Position of P2 In Messy Memory

.org 0x80110FE8
.dh ((SCREEN_W/2)-160) //Fix X Position of P3 In Messy Memory

.org 0x80110FEC
.dh ((SCREEN_W/2)-16) //Fix X Position of P4 In Messy Memory

.org 0x80110FF4
.dh ((SCREEN_W/2)-114) //Fix X Position of Initial Sprite 1 In Messy Memory

.org 0x80110FF8
.dh ((SCREEN_W/2)-48) //Fix X Position of Initial Sprite 2 In Messy Memory

.org 0x80110FFC
.dh ((SCREEN_W/2)-0) //Fix X Position of Initial Sprite 3 In Messy Memory

.org 0x80111000
.dh ((SCREEN_W/2)+48) //Fix X Position of Initial Sprite 4 In Messy Memory

.org 0x80111004
.dh ((SCREEN_W/2)+114) //Fix X Position of Initial Sprite 5 In Messy Memory

.org 0x80111008
.dh ((SCREEN_W/2)-114) //Fix X Position of Initial Sprite 6 In Messy Memory

.org 0x8011100C
.dh ((SCREEN_W/2)-48) //Fix X Position of Initial Sprite 7 In Messy Memory

.org 0x80111010
.dh ((SCREEN_W/2)-0) //Fix X Position of Initial Sprite 8 In Messy Memory

.org 0x80111014
.dh ((SCREEN_W/2)+48) //Fix X Position of Initial Sprite 9 In Messy Memory

.org 0x80111018
.dh ((SCREEN_W/2)+114) //Fix X Position of Initial Sprite 10 In Messy Memory

.org 0x8011101C
.dh ((SCREEN_W/2)-88) //Fix X Position of Initial Sprite 11 In Messy Memory

.org 0x80111020
.dh ((SCREEN_W/2)-38) //Fix X Position of Initial Sprite 12 In Messy Memory

.org 0x80111024
.dh ((SCREEN_W/2)+16) //Fix X Position of Initial Sprite 13 In Messy Memory

.org 0x80111028
.dh ((SCREEN_W/2)+62) //Fix X Position of Initial Sprite 14 In Messy Memory

.org 0x8011102C
.dh ((SCREEN_W/2)+104) //Fix X Position of Initial Sprite 15 In Messy Memory

.org 0x80111030
.dh ((SCREEN_W/2)-108) //Fix X Position of Initial Sprite 16 In Messy Memory

.org 0x80111034
.dh ((SCREEN_W/2)-58) //Fix X Position of Initial Sprite 17 In Messy Memory

.org 0x80111038
.dh ((SCREEN_W/2)-14) //Fix X Position of Initial Sprite 18 In Messy Memory

.org 0x8011103C
.dh ((SCREEN_W/2)+44) //Fix X Position of Initial Sprite 19 In Messy Memory

.org 0x80111040
.dh ((SCREEN_W/2)+88) //Fix X Position of Initial Sprite 17 In Messy Memory

.org 0x801112B8
.float ((SCREEN_W_FLOAT/2)-95) //Fix X Position of P1 Score Digit 1

.org 0x801112C0
.float ((SCREEN_W_FLOAT/2)-75) //Fix X Position of P1 Score Digit 2

.org 0x801112C8
.float ((SCREEN_W_FLOAT/2)-45) //Fix X Position of P1 Score Points Text

.org 0x801112D0
.float ((SCREEN_W_FLOAT/2)+50) //Fix X Position of P2 Score Digit 1

.org 0x801112D8
.float ((SCREEN_W_FLOAT/2)+70) //Fix X Position of P2 Score Digit 2

.org 0x801112E0
.float ((SCREEN_W_FLOAT/2)+100) //Fix X Position of P2 Score Points Text

.org 0x801112E8
.float ((SCREEN_W_FLOAT/2)-95) //Fix X Position of P3 Score Digit 1

.org 0x801112F0
.float ((SCREEN_W_FLOAT/2)-75) //Fix X Position of P3 Score Digit 2

.org 0x801112F8
.float ((SCREEN_W_FLOAT/2)-45) //Fix X Position of P3 Score Points Text

.org 0x80111300
.float ((SCREEN_W_FLOAT/2)+50) //Fix X Position of P4 Score Digit 1

.org 0x80111308
.float ((SCREEN_W_FLOAT/2)+70) //Fix X Position of P4 Score Digit 2

.org 0x80111310
.float ((SCREEN_W_FLOAT/2)+100) //Fix X Position of P4 Score Points Text

.org 0x80111340
.float ((SCREEN_W_FLOAT/2)-160) //Fix Scissor X Position of Viewport 1

.org 0x80111348
.float ((SCREEN_W_FLOAT/2)+160) //Fix Scissor X Position of Viewport 1

.org 0x80111350
.float (SCREEN_W_FLOAT*2) //Fix X Size of Viewport 1

.org 0x8011135C
.float (SCREEN_W_FLOAT*2) //Fix X Position of Viewport 1

.org 0x8011136C
.float ((SCREEN_W_FLOAT/2)-160) //Fix Scissor X Position of Viewport 2

.org 0x80111374
.float ((SCREEN_W_FLOAT/2)+160) //Fix Scissor X Position of Viewport 2

.org 0x8011137C
.float (SCREEN_W_FLOAT*2) //Fix X Size of Viewport 2

.org 0x80111388
.float (SCREEN_W_FLOAT*2) //Fix X Position of Viewport 2

.headersize 0x801059A0-0x1EF420 //Picture Imperfect Segment

.org 0x80105F34
li.u at, -262.0 //Fix X Position of Camera in Picture Imperfect

.org 0x80105FF8
li.u a3, (SCREEN_W_FLOAT/2) //Fix X Position of P1 Scissor Right

.org 0x80106004
li.u at, SCREEN_W_FLOAT //Fix X Position of P1 Viewport

.org 0x80106038
li.u a1, (SCREEN_W_FLOAT*2) //Fix X Size of P1 Viewport

.org 0x80106058
li.u a1, (SCREEN_W_FLOAT/2) //Fix X Position of P2 Scissor Left

.org 0x8010606C
li.u at, (SCREEN_W_FLOAT*3) //Fix X Position of P2 Viewport

.org 0x80106084
li.u a1, (SCREEN_W_FLOAT*2) //Fix X Size of P2 Viewport

.org 0x801060A8
li.u a3, (SCREEN_W_FLOAT/2) //Fix X Position of P3 Scissor Right

.org 0x801060CC
li.u a1, (SCREEN_W_FLOAT*2) //Fix X Size of P3 Viewport

.org 0x801060E8
li.u a1, (SCREEN_W_FLOAT/2) //Fix X Position of P4 Scissor Left

.org 0x8010610C
li.u a1, (SCREEN_W_FLOAT*2) //Fix X Size of P4 Viewport

.org 0x80108E9C
addiu a1, a1, ((SCREEN_W/4)-105) //Fix X Offset of Plus in Add Score

.org 0x80108F58
addiu a1, a1, ((SCREEN_W/4)-94) //Fix X Offset of Second Digit in Add Score

.org 0x8010903C
addiu a1, a1, ((SCREEN_W/4)-78) //Fix X Offset of First Digit in Add Score

.org 0x801090AC
addiu a1, a1, ((SCREEN_W/4)-50) //Fix X Offset of Points in Add Score

.org 0x80109768
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Main Split Background

.org 0x801097C0
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Main Background

.org 0x80109CBC
li.u at, (SCREEN_W_FLOAT/2) //Fix Centering of Initial Image

.org 0x80109F60
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Proper Image

.org 0x80109FA8
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Proper Image Background

.org 0x80109FE8
.dh (SCREEN_W/4) //Fix X Position of P1 Background

.org 0x80109FEC
.dh ((SCREEN_W*3)/4) //Fix X Position of P2 Background

.org 0x80109FF0
.dh (SCREEN_W/4) //Fix X Position of P3 Background

.org 0x80109FF4
.dh ((SCREEN_W*3)/4) //Fix X Position of P4 Background

.org 0x8010A01C
.dh ((SCREEN_W/2)+59) //Fix X Position of P2 Figure

.org 0x8010A024
.dh ((SCREEN_W/2)+59) //Fix X Position of P4 Figure

.headersize 0x801059A0-0x1F3B90 //Marios Puzzle Party Segment

.org 0x80105A50
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Marios Puzzle Party

.org 0x80105A5C
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Marios Puzzle Party

.org 0x801060F0
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Background

.org 0x80106604
addiu v1, r0, ((SCREEN_W/4)-10) //Fix X Position of Whomp 2

.org 0x80106624
addiu v1, r0, ((SCREEN_W/2)-60) //Fix X Position of Whomp 3

.org 0x80106644
addiu v1, r0, ((SCREEN_W/2)+60) //Fix X Position of Whomp 4

.org 0x80106664
addiu v1, r0, (((SCREEN_W*3)/4)+30) //Fix X Position of Whomp 5

.org 0x80106684
addiu v1, r0, (SCREEN_W-20) //Fix X Position of Whomp 6

.org 0x8010E418
addiu a2, r0, ((SCREEN_W/2)-81) //Fix X Position of Marios Puzzle Party High Score

.org 0x8010EB38
addiu a2, r0, ((SCREEN_W/2)+55) //Fix X Position of Marios Puzzle Party Timer

.org 0x80110080
.dw ((SCREEN_W/2)-144) //Fix X Position of P1 in Marios Puzzle Party

.org 0x80110088
.dw ((SCREEN_W/2)-76) //Fix X Position of P2 in Marios Puzzle Party

.org 0x80110090
.dw ((SCREEN_W/2)-8) //Fix X Position of P3 in Marios Puzzle Party

.org 0x80110098
.dw ((SCREEN_W/2)+60) //Fix X Position of P4 in Marios Puzzle Party

.org 0x801100A0
.dw ((SCREEN_W/2)-42) //Fix X Position of P1 in Marios Puzzle Party

.org 0x80110170
.float (SCREEN_W_FLOAT/2) //Fix X Position of Cloud 1

.org 0x80110188
.float (SCREEN_W_FLOAT+10) //Fix X Position of Cloud 2

.org 0x801101A0
.float (SCREEN_W_FLOAT+10) //Fix X Position of Cloud 3

.org 0x801101B8
.float (SCREEN_W_FLOAT+10) //Fix X Position of Cloud 4

.org 0x801101D0
.float (SCREEN_W_FLOAT/2) //Fix X Position of Cloud 5

.headersize 0x801059A0-0x1FE4D0 //The Beat Goes On Segment

.org 0x80105D84
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in The Beat Goes On

.org 0x80105D90
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in The Beat Goes On

.org 0x80105F48
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Background in The Beat Goes On

.org 0x80106098
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Background in The Beat Goes On

.org 0x801061EC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Background in The Beat Goes On

.org 0x80106340
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Background in The Beat Goes On

.org 0x80108A2C
addiu v0, r0, ((SCREEN_W/2)-140) //Fix X Position of Note Cursor

.org 0x80108A70
addiu v1, v1, ((SCREEN_W/2)-105) //Fix X Position of Drum End

.org 0x8010B27C
addiu v0, r0, ((SCREEN_W/2)-140) //Fix X Position of Note Cursor

.org 0x8010B28C
addiu v0, r0, ((SCREEN_W/2)+105) //Fix X Position of Note Mask

.org 0x8010B2F8
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Beat Bar in The Beat Goes On

.org 0x8010B4A4
addiu a1, a1, ((SCREEN_W/2)-105) //Fix X Position of Drums

.org 0x8010B4D4
addiu a1, a1, ((SCREEN_W/2)-105) //Fix X Position of Drums

.org 0x8010B5B4
addiu s1, s1, ((SCREEN_W/2)-105) //Fix X Position of Drums

.org 0x8010B8C4
li.u at, ((SCREEN_W_FLOAT/2)-140) //Fix Initial X Position of Note Cursor

.org 0x8010BD1C
slti v0, v0, ((SCREEN_W/2)+120) //Fix Max X Position of Cursor Sprite

.org 0x8010BD30
addiu v0, r0, ((SCREEN_W/2)+120) //Fix Max X Position of Cursor Sprite

.org 0x8010BD48
addiu v0, r0, ((SCREEN_W/2)-120) //Fix Min X Position of Cursor Sprite
addiu v0, r0, ((SCREEN_W/2)+120) //Fix Max X Position of Cursor Sprite

.org 0x8010BD54
li.u at, ((SCREEN_W_FLOAT/2)+120) //Fix Max X Position of Cursor Sprite

.org 0x8010BD6C
li.u at, ((SCREEN_W_FLOAT/2)-120) //Fix Max X Position of Cursor Sprite

.org 0x8010C110
addiu v0, v0, ((SCREEN_W/2)-105) //Fix X Position of Top Beat Collision

.org 0x8010C138
addiu v1, v1, ((SCREEN_W/2)-105) //Fix X Position of Bottom Beat Collision

.headersize 0x801059A0-0x204F90 //MPIQ Segment

.org 0x80106C50
addiu a1, r0, (SCREEN_W/2) //Fix X Position of MPIQ Background

.org 0x80106CC0
addiu a1, r0, ((SCREEN_W/2)-2) //Fix X Position of MPIQ Correct Answer

.org 0x80106D2C
addiu a1, r0, ((SCREEN_W/2)-2) //Fix X Position of MPIQ Incorrect Answer

.org 0x80106DA4
addiu a1, r0, (SCREEN_W/2) //Fix X Position of MPIQ Sign Cloud

.org 0x80106E24
addiu a1, r0, (SCREEN_W/2) //Fix X Position of MPIQ Sign Background

.org 0x80106ED4
li.u at, ((SCREEN_W_FLOAT/2)+100) //Fix X Position of Lakitu in MPIQ

.org 0x80106F5C
addiu a1, r0, (SCREEN_W/2) //Fix X Position of MPIQ Sign Cloud

.org 0x80106F78
addiu a1, r0, ((SCREEN_W/2)-2) //Fix X Position of MPIQ Sign Background

.org 0x80106FA0
addiu a1, r0, (SCREEN_W/2) //Fix X Position of MPIQ Sign Cloud

.org 0x80106FB4
addiu a1, r0, ((SCREEN_W/2)-2) //Fix X Position of MPIQ Sign Background

.org 0x80106FD0
addiu a1, r0, (SCREEN_W/2) //Fix X Position of MPIQ Sign Cloud

.org 0x80106FE4
addiu a1, r0, ((SCREEN_W/2)-2) //Fix X Position of MPIQ Sign Background

.org 0x80107000
addiu a1, r0, (SCREEN_W/2) //Fix X Position of MPIQ Sign Cloud

.org 0x80107014
addiu a1, r0, ((SCREEN_W/2)-2) //Fix X Position of MPIQ Sign Background

.org 0x80107030
addiu a1, r0, (SCREEN_W/2) //Fix X Position of MPIQ Sign Cloud

.org 0x80107044
addiu a1, r0, ((SCREEN_W/2)-2) //Fix X Position of MPIQ Sign Background

.org 0x80107060
addiu a1, r0, (SCREEN_W/2) //Fix X Position of MPIQ Sign Cloud

.org 0x80107074
addiu a1, r0, ((SCREEN_W/2)-2) //Fix X Position of MPIQ Sign Background

.org 0x80107090
addiu a1, r0, (SCREEN_W/2) //Fix X Position of MPIQ Sign Cloud

.org 0x801070A4
addiu a1, r0, ((SCREEN_W/2)-2) //Fix X Position of MPIQ Sign Background

.org 0x801070C0
addiu a1, r0, (SCREEN_W/2) //Fix X Position of MPIQ Sign Cloud

.org 0x801070D4
addiu a1, r0, ((SCREEN_W/2)-2) //Fix X Position of MPIQ Sign Background

.org 0x80108704
li.u at, ((SCREEN_W_FLOAT/2)+100) //Fix Initial X Position of Lakitu in MPIQ

.org 0x80108AB0
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in MPIQ

.org 0x80108AC0
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in MPIQ

.org 0x8010BC20
addiu a0, r0, ((SCREEN_W/2)-81) //Fix X Position of MPIQ Question Window

.org 0x8010C0E8
addiu a0, r0, ((SCREEN_W/2)-81) //Fix X Position of MPIQ Question Answer Window

.org 0x8010C370
li.u a1, ((SCREEN_W_FLOAT/2)-6) //Fix X Position of MPIQ Timer

.org 0x8010C6A8
.float ((SCREEN_W_FLOAT/2)-96) //Fix X Position of P1 in MPIQ

.org 0x8010C6AC
.float ((SCREEN_W_FLOAT/2)-32) //Fix X Position of P2 in MPIQ

.org 0x8010C6B0
.float ((SCREEN_W_FLOAT/2)+32) //Fix X Position of P3 in MPIQ

.org 0x8010C6B4
.float ((SCREEN_W_FLOAT/2)+96) //Fix X Position of P4 in MPIQ

.headersize 0x801059A0-0x20BFA0 //Curtain Call Segment

.org 0x80106300
addiu a0, r0, ((SCREEN_W/2)+15) //Fix X Position of Curtain Call Window

.org 0x80106510
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Curtain Call Background

.org 0x8010B280
.float ((SCREEN_W_FLOAT/2)-160) //Fix X Position of Curtain Call Scissor Left

.org 0x8010B288
.float ((SCREEN_W_FLOAT/2)+160) //Fix X Position of Curtain Call Scissor Right

.org 0x8010B290
.float (SCREEN_W_FLOAT*2) //Fix X Size of Curtain Call Viewport

.org 0x8010B29C
.float (SCREEN_W_FLOAT*2) //Fix X Position of Curtain Call Viewport

.headersize 0x801059A0-0x225740 //Cheep Cheep Chase Segment

.org 0x80105A80
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Cheep Cheep Chase

.org 0x80105A8C
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Cheep Cheep Chase

.org 0x80105AD8
li.u a1, 22.75 //Fix FOV in Cheep Cheep Chase

.org 0x80107CB0
li.u at, -455.0 //Fix Upper Half of Cheep Cheep Chase Camera Y Offset
li.l at, -455.0 //Fix Lower Half of Cheep Cheep Chase Camera Y Offset

.org 0x80107DB4
li.u at, -128.0 //Fix Cheep Cheep Chase Camera Y Offset

.org 0x80107F88
li.u at, 213.0 //Fix End Camera Y Offset

.org 0x80107F98
li.u at, -120.0 //Fix End Camera Base Y Offset

.headersize 0x801059A0-0x211AB0 //Water Whirled Segment

.org 0x80105A14
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Water Whirled

.org 0x80105A20
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Water Whirled

.org 0x80108EE8
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Water Whirled Background

.org 0x80108F04
li.u a1, (SCREEN_W_FLOAT/160.0) //Fix Scale of Water Whirled Background

.org 0x8010A528
.dw (SCREEN_W-55) //Fix X Position of P2 Window in Water Whirled

.org 0x8010A538
.dw (SCREEN_W-55) //Fix X Position of P4 Window in Water Whirled

.org 0x8010A548
.dw (SCREEN_W-67) //Fix X Position of P2 Score in Water Whirled

.org 0x8010A558
.dw (SCREEN_W-67) //Fix X Position of P4 Score in Water Whirled

.headersize 0x801059A0-0x216670 //Frigid Bridges Segment

.org 0x80105B5C
li.u a3, ((SCREEN_W_FLOAT/2)-1) //Fix X Position of P1 Scissor Right

.org 0x80105B68
li.u at, SCREEN_W_FLOAT //Fix X Position of P1/P3 Viewports

.org 0x80105B9C
li.u a1, (SCREEN_W_FLOAT*2) //Fix Width of P1 Viewport

.org 0x80105BB8
li.u a1, ((SCREEN_W_FLOAT/2)+1) //Fix X Position of P2 Scissor Right

.org 0x80105BC0
li.u a3, (SCREEN_W_FLOAT-1) //Fix X Position of P2 Scissor Right
li.l a3, (SCREEN_W_FLOAT-1) //Fix X Position of P2 Scissor Right

.org 0x80105BD0
li.u at, (SCREEN_W_FLOAT*3) //Fix X Position of P2/P4 Viewports

.org 0x80105BE8
li.u a1, (SCREEN_W_FLOAT*2) //Fix Width of P2 Viewport

.org 0x80105C18
li.u a3, ((SCREEN_W_FLOAT/2)-1) //Fix X Position of P3 Scissor Right

.org 0x80105C3C
li.u a1, (SCREEN_W_FLOAT*2) //Fix Width of P3 Viewport

.org 0x80105C58
li.u a1, ((SCREEN_W_FLOAT/2)+1) //Fix X Position of P4 Scissor Right

.org 0x80105C60
li.u a3, (SCREEN_W_FLOAT-1) //Fix X Position of P4 Scissor Right
li.l a3, (SCREEN_W_FLOAT-1) //Fix X Position of P4 Scissor Right

.org 0x80105C7C
li.u a1, (SCREEN_W_FLOAT*2) //Fix Width of P4 Viewport

.headersize 0x801059A0-0x21E010 //Awful Tower Segment

.org 0x80105ACC
addiu v0, r0, (SCREEN_W-48) //X Spacing of Viewport
multu v0, s2 //Fix X Spacing of Viewport
mflo v0 //Get X Offset of Viewport
addiu v0, v0, ((SCREEN_W/2)+76) //Fix Base X Position of Viewport

.org 0x80105AF4
li.u a1, (SCREEN_W_FLOAT*2) //Fix Width of Awful Tower Viewport

.org 0x80107BA0
li.u at, (SCREEN_W_FLOAT/2) //Fix End Viewport X Position in Awful Tower

.org 0x80107BB0
li.u at, SCREEN_W_FLOAT //Fix End Viewport Width in Awful Tower

.org 0x8010859C
li.u at, SCREEN_W_FLOAT //Fix End Background X Scale in Awful Tower

.org 0x8010CBDC
.dw ((SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Scissor in Awful Tower Background

.org 0x8010CCC4
.dw ((SCREEN_W/4)+13) //Fix X Position of P2 Scissor Left
.dw ((SCREEN_W/2)+1) //Fix X Position of P3 Scissor Left
.dw (((SCREEN_W*3)/4)-11) //Fix X Position of P3 Scissor Left

.org 0x8010CCD0
.dw ((SCREEN_W/4)+12) //Fix X Position of P1 Scissor Right
.dw (SCREEN_W/2) //Fix X Position of P2 Scissor Right
.dw (((SCREEN_W*3)/4)-12) //Fix X Position of P3 Scissor Right
.dw SCREEN_W //Fix X Position of P4 Scissor Right

.org 0x8010CE50
.dw -5 //Fix X Offset of P1 Background
.dw 19 //Fix X Offset of P2 Background
.dw 19 //Fix X Offset of P3 Background
.dw 0 //Fix X Offset of P4 Background

.org 0x8010CE70
.dw SCREEN_W //Max Width of P1 Background
.dw SCREEN_W //Max Width of P2 Background
.dw SCREEN_W //Max Width of P3 Background
.dw SCREEN_W //Max Width of P4 Background

.headersize 0x801059A0-0x22E100 //Pipe Cleaners Segment

.org 0x80105C6C
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Pipe Cleaners Foreground

.org 0x8010A010
.dw ((SCREEN_W/2)-79) //Fix X Position of P1 Score in Pipe Cleaners

.org 0x8010A018
.dw ((SCREEN_W/2)+81) //Fix X Position of P2 Score in Pipe Cleaners

.org 0x8010A020
.dw ((SCREEN_W/2)-79) //Fix X Position of P3 Score in Pipe Cleaners

.org 0x8010A028
.dw ((SCREEN_W/2)+81) //Fix X Position of P4 Score in Pipe Cleaners

.org 0x8010A040
.float ((SCREEN_W_FLOAT/2)-160) //Fix Scissor Left for P1

.org 0x8010A048
.float (SCREEN_W_FLOAT/2) //Fix Scissor Right for P1

.org 0x8010A050
.float SCREEN_W_FLOAT //Fix Viewport Width for P1

.org 0x8010A05C
.float ((SCREEN_W_FLOAT*2)-290) //Fix Viewport X Position for P1

.org 0x8010A06C
.float (SCREEN_W_FLOAT/2) //Fix Scissor Left for P2

.org 0x8010A074
.float ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Right for P2

.org 0x8010A07C
.float SCREEN_W_FLOAT //Fix Viewport Width for P2

.org 0x8010A088
.float ((SCREEN_W_FLOAT*2)+290) //Fix Viewport X Position for P2

.org 0x8010A098
.float ((SCREEN_W_FLOAT/2)-160) //Fix Scissor Left for P3

.org 0x8010A0A0
.float (SCREEN_W_FLOAT/2) //Fix Scissor Right for P3

.org 0x8010A0A8
.float SCREEN_W_FLOAT //Fix Viewport Width for P3

.org 0x8010A0B4
.float ((SCREEN_W_FLOAT*2)-290) //Fix Viewport X Position for P3

.org 0x8010A0C4
.float (SCREEN_W_FLOAT/2) //Fix Scissor Left for P4

.org 0x8010A0CC
.float ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Right for P4

.org 0x8010A0D4
.float SCREEN_W_FLOAT //Fix Viewport Width for P4

.org 0x8010A0E0
.float ((SCREEN_W_FLOAT*2)+290) //Fix Viewport X Position for P4

.headersize 0x801059A0-0x232A10 //Snowball Summit Segment

.org 0x801061EC
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Main Background

.org 0x80106410
lui t7, 0xE422 //Fix Right Edge of Left Water in Snowball Summit

.org 0x8010641C
lui t4, 0x030F //Fix DSDX of Left Water in Snowball Summit

.org 0x8010660C
lui t7, (0xE400|(SCREEN_W/4)) //Fix Right Edge of Right Water in Snowball Summit
lui t6, ((SCREEN_W/4)-34) //Fix Left Edge of Right Water in Snowball Summit

.org 0x80106710
lui v0, 0x030F //Fix DSDX of Right Water in Snowball Summit

.org 0x8010F5D4
.float SCREEN_W_FLOAT //Screen Width of Scissor for Snowball Summit

.org 0x8010F5DC
.float (SCREEN_W_FLOAT*2) //Width of Viewport for Snowball Summit

.org 0x8010F5E8
.float (SCREEN_W_FLOAT*2) //X Position of Viewport for Snowball Summit

.org 0x8010F600
.float SCREEN_W_FLOAT //Screen Width of Scissor for Snowball Summit

.org 0x8010F608
.float (SCREEN_W_FLOAT*2) //Width of Viewport for Snowball Summit

.org 0x8010F614
.float (SCREEN_W_FLOAT*2) //X Position of Viewport for Snowball Summit

.headersize 0x801059A0-0x23C8F0 //All Fired Up Segment

.org 0x80105D8C
li.u a1, ((SCREEN_W_FLOAT/2)-160) //Fix Scissor Left in All Fired Up

.org 0x80105D94
li.u a3, ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Right in All Fired Up

.org 0x80105DA0
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in All Fired Up

.org 0x80109830
addiu a2, r0, (SCREEN_W/2) //Fix X Position of All Fired Up Bottom Background

.org 0x801098A0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of All Fired Up Top Background

.headersize 0x801059A0-0x240A10 //Stacked Deck Segment

.org 0x80106710
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Stacked Deck Background

.org 0x8010F360
.float ((SCREEN_W_FLOAT/2)-160) //Fix Scissor Left for Stacked Deck

.org 0x8010F368
.float ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Right for Stacked Deck

.org 0x8010F370
.float (SCREEN_W_FLOAT*2) //Fix Viewport Width for Stacked Deck

.org 0x8010F37C
.float (SCREEN_W_FLOAT*2) //Fix Viewport X Position for Stacked Deck

.headersize 0x801059A0-0x24A760 //Three Door Monty Segment

.org 0x80106A40
lui t4, (((SCREEN_W/2)+160)/4) //Fix Three Door Monty Top Rect Left Edge
lui t3, (((SCREEN_W/2)-160)/4) //Fix Three Door Monty Top Rect Right Edge

.org 0x80106D7C
lui t5, (((SCREEN_W/2)+160)/4) //Fix Three Door Monty Bottom Rect Left Edge
lui t4, (((SCREEN_W/2)-160)/4) //Fix Three Door Monty Bottom Rect Right Edge

.org 0x8010CD64
.dw ((SCREEN_W/2)-116) //Fix X Position of P1 Time Digit 1 in Three Door Monty
.dw ((SCREEN_W/2)-106) //Fix X Position of P1 Time Quote in Three Door Monty
.dw ((SCREEN_W/2)-96) //Fix X Position of P1 Time Digit 2 in Three Door Monty
.dw ((SCREEN_W/2)-86) //Fix X Position of P1 Time Digit 3 in Three Door Monty
.dw ((SCREEN_W/2)-52) //Fix X Position of P2 Time Digit 1 in Three Door Monty
.dw ((SCREEN_W/2)-42) //Fix X Position of P2 Time Quote in Three Door Monty
.dw ((SCREEN_W/2)-32) //Fix X Position of P2 Time Digit 2 in Three Door Monty
.dw ((SCREEN_W/2)-22) //Fix X Position of P2 Time Digit 3 in Three Door Monty
.dw ((SCREEN_W/2)+12) //Fix X Position of P3 Time Digit 1 in Three Door Monty
.dw ((SCREEN_W/2)+22) //Fix X Position of P3 Time Quote in Three Door Monty
.dw ((SCREEN_W/2)+32) //Fix X Position of P3 Time Digit 2 in Three Door Monty
.dw ((SCREEN_W/2)+42) //Fix X Position of P3 Time Digit 3 in Three Door Monty
.dw ((SCREEN_W/2)+76) //Fix X Position of P3 Time Digit 1 in Three Door Monty
.dw ((SCREEN_W/2)+86) //Fix X Position of P3 Time Quote in Three Door Monty
.dw ((SCREEN_W/2)+96) //Fix X Position of P3 Time Digit 2 in Three Door Monty
.dw ((SCREEN_W/2)+106) //Fix X Position of P3 Time Digit 3 in Three Door Monty

.org 0x8010CDC4
.dh ((SCREEN_W/2)-61) //Fix X Position of Left Mask in Three Door Monty

.org 0x8010CDC8
.dh ((SCREEN_W/2)+52) //Fix X Position of Right Mask in Three Door Monty

.org 0x8010CDD0
.float ((SCREEN_W_FLOAT/2)-160) //Fix Scissor Left for Three Door Monty

.org 0x8010CDD8
.float ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Right for Three Door Monty

.org 0x8010CDE0
.float (SCREEN_W_FLOAT*2) //Fix Viewport Width for Three Door Monty

.org 0x8010CDEC
.float (SCREEN_W_FLOAT*2) //Fix Viewport X Position for Three Door Monty

.org 0x8010CDFC
.float ((SCREEN_W_FLOAT/2)-160) //Fix Scissor Left for Three Door Monty

.org 0x8010CE04
.float ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Right for Three Door Monty

.org 0x8010CE0C
.float (SCREEN_W_FLOAT*2) //Fix Viewport Width for Three Door Monty

.org 0x8010CE18
.float (SCREEN_W_FLOAT*2) //Fix Viewport X Position for Three Door Monty

.org 0x8010CE28
.float ((SCREEN_W_FLOAT/2)-160) //Fix Scissor Left for Three Door Monty

.org 0x8010CE30
.float ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Right for Three Door Monty

.org 0x8010CE38
.float (SCREEN_W_FLOAT*2) //Fix Viewport Width for Three Door Monty

.org 0x8010CE44
.float (SCREEN_W_FLOAT*2) //Fix Viewport X Position for Three Door Monty

.headersize 0x801059A0-0x251FF0 //Rockin Raceway Segment

.org 0x80105A94
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Rockin Raceway

.org 0x80105AA0
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Rockin Raceway

.org 0x80109CAC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Rockin Raceway Background

.org 0x8010A57C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Rockin Raceway Center UI

.org 0x80111334
.dh (SCREEN_W-50) //X Position of P2 HUD in Rockin Raceway

.org 0x8011133C
.dh (SCREEN_W-50) //X Position of P4 HUD in Rockin Raceway

.org 0x80111340
.dh ((SCREEN_W/2)-42) //Fix X Position of Timer Digit 1 in Rockin Raceway
.dh ((SCREEN_W/2)-30) //Fix X Position of Timer Digit 2 in Rockin Raceway
.dh ((SCREEN_W/2)-22) //Fix X Position of Timer Digit 3 in Rockin Raceway
.dh ((SCREEN_W/2)-10) //Fix X Position of Timer Digit 4 in Rockin Raceway
.dh ((SCREEN_W/2)+2) //Fix X Position of Timer Digit 5 in Rockin Raceway
.dh ((SCREEN_W/2)+12) //Fix X Position of Timer Digit 6 in Rockin Raceway
.dh ((SCREEN_W/2)+24) //Fix X Position of Timer Digit 7 in Rockin Raceway
.dh ((SCREEN_W/2)+36) //Fix X Position of Timer Digit 8 in Rockin Raceway

.headersize 0x801059A0-0x25E110 //Merry Go Chomp Segment

.org 0x80106230
lui t4, (((SCREEN_W/2)+160)/4) //Fix Merry Go Chomp Mask Rect Left Edge
lui t3, (((SCREEN_W/2)-160)/4) //Fix Merry Go Chomp Mask Rect Right Edge

.org 0x80106394
li.u at, (SCREEN_W_FLOAT/2) //Fix Merry Go Chomp Background X Position

.org 0x8010C258
.float ((SCREEN_W_FLOAT/2)-160) //Fix Scissor Left for Merry Go Chomp

.org 0x8010C260
.float ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Right for Merry Go Chomp

.org 0x8010C268
.float (SCREEN_W_FLOAT*2) //Fix Viewport Width for Merry Go Chomp

.org 0x8010C274
.float (SCREEN_W_FLOAT*2) //Fix Viewport X Position for Merry Go Chomp

.org 0x8010C284
.float ((SCREEN_W_FLOAT/2)-160) //Fix Scissor Left for Merry Go Chomp

.org 0x8010C28C
.float ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Right for Merry Go Chomp

.org 0x8010C294
.float (SCREEN_W_FLOAT*2) //Fix Viewport Width for Merry Go Chomp

.org 0x8010C2A0
.float (SCREEN_W_FLOAT*2) //Fix Viewport X Position for Merry Go Chomp

.headersize 0x801059A0-0x264B80 //Slap Down Segment

.org 0x8010667C
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Slap Down Background

.org 0x8010A838
.float ((SCREEN_W_FLOAT/2)-110) //Fix X Position of P1 Rank Window

.org 0x8010A840
.float ((SCREEN_W_FLOAT/2)+111) //Fix X Position of P2 Rank Window

.org 0x8010A848
.float ((SCREEN_W_FLOAT/2)+79) //Fix X Position of P3 Rank Window

.org 0x8010A850
.float ((SCREEN_W_FLOAT/2)-79) //Fix X Position of P4 Rank Window

.org 0x8010A858
.float ((SCREEN_W_FLOAT/2)-111) //Fix X Position of P1 Rank

.org 0x8010A860
.float ((SCREEN_W_FLOAT/2)+112) //Fix X Position of P2 Rank

.org 0x8010A868
.float ((SCREEN_W_FLOAT/2)+78) //Fix X Position of P3 Rank

.org 0x8010A870
.float ((SCREEN_W_FLOAT/2)-78) //Fix X Position of P4 Rank

.org 0x8010A88C
.float ((SCREEN_W_FLOAT/2)-160) //Fix Scissor Left for Slap Down

.org 0x8010A894
.float ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Right for Slap Down

.org 0x8010A89C
.float (SCREEN_W_FLOAT*2) //Fix Viewport Width for Slap Down

.org 0x8010A8A8
.float (SCREEN_W_FLOAT*2) //Fix Viewport X Position for Slap Down

.headersize 0x801059A0-0x269BF0 //Storm Chasers Segment

.org 0x8010622C
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Storm Chasers Background

.org 0x801064E0
lui t7, (0xE400|(((SCREEN_W/2)+160)/4)) //Fix Right Edge of Storm Chasers Bottom Rect

.org 0x801065B0
lui a0, (((SCREEN_W/2)-160)/4) //Upper Half of Storm Chasers Bottom Rect Left

.org 0x801065C4
or v0, v0, a0 //Add in Upper-Half of Storm Chasers Bottom X Left

.org 0x8010CAB8
.float ((SCREEN_W_FLOAT/2)-160) //Fix Scissor Left for Storm Chasers

.org 0x8010CAC0
.float ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Right for Storm Chasers

.org 0x8010CAC8
.float (SCREEN_W_FLOAT*2) //Fix Viewport Width for Storm Chasers

.org 0x8010CAD4
.float (SCREEN_W_FLOAT*2) //Fix Viewport X Position for Storm Chasers

.org 0x8010CAE4
.float ((SCREEN_W_FLOAT/2)-160) //Fix Scissor Left for Storm Chasers

.org 0x8010CAEC
.float ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Right for Storm Chasers

.org 0x8010CAF4
.float (SCREEN_W_FLOAT*2) //Fix Viewport Width for Storm Chasers

.org 0x8010CB00
.float (SCREEN_W_FLOAT*2) //Fix Viewport X Position for Storm Chasers

.headersize 0x801059A0-0x270EF0 //Eye Sore Segment

.org 0x801060B4
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Eye Sore Background

.org 0x8010AD00
.float (SCREEN_W_FLOAT/2) //Fix X Position of P1 Scissor Right in Eye Sore

.org 0x8010AD08
.float SCREEN_W_FLOAT //Fix Width of P1 Viewport in Eye Sore

.org 0x8010AD14
.float ((SCREEN_W_FLOAT*350)/320) //Fix X Position of P1 Viewport in Eye Sore

.org 0x8010AD24
.float (SCREEN_W_FLOAT/2) //Fix X Position of P2 Scissor Left in Eye Sore

.org 0x8010AD2C
.float SCREEN_W_FLOAT //Fix X Position of P2 Scissor Right in Eye Sore

.org 0x8010AD34
.float SCREEN_W_FLOAT //Fix Width of P2 Viewport in Eye Sore

.org 0x8010AD40
.float ((SCREEN_W_FLOAT*930)/320) //Fix X Position of P2 Viewport in Eye Sore

.org 0x8010AD58
.float (SCREEN_W_FLOAT/2) //Fix X Position of P3 Scissor Right in Eye Sore

.org 0x8010AD60
.float SCREEN_W_FLOAT //Fix Width of P3 Viewport in Eye Sore

.org 0x8010AD6C
.float ((SCREEN_W_FLOAT*350)/320) //Fix X Position of P3 Viewport in Eye Sore

.org 0x8010AD7C
.float (SCREEN_W_FLOAT/2) //Fix X Position of P4 Scissor Left in Eye Sore

.org 0x8010AD84
.float SCREEN_W_FLOAT //Fix X Position of P4 Scissor Right in Eye Sore

.org 0x8010AD8C
.float SCREEN_W_FLOAT //Fix Width of P4 Viewport in Eye Sore

.org 0x8010AD98
.float ((SCREEN_W_FLOAT*930)/320) //Fix X Position of P4 Viewport in Eye Sore

.headersize 0x801059A0-0x276470 //Vine With Me Segment

.org 0x80105A04
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width for P1 in Vine With Me

.org 0x80105A28
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width for P2 in Vine With Me

.org 0x80105A34
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width for Vine With Me

.org 0x8010702C
li.u at, SCREEN_W_FLOAT //Fix Viewport Width of Vine With Me Ending

.org 0x8010722C
li.u at, SCREEN_W_FLOAT //Fix Scissor Width of Vine With Me Ending

.org 0x80107244
li.u at, (SCREEN_W_FLOAT*4) //Fix Viewport Position of Vine With Me Ending

.org 0x801074B0
li.u at, SCREEN_W_FLOAT //Fix Scissor Width of P2 Vine With Me Ending

.org 0x801074C8
li.u at, (SCREEN_W_FLOAT*4) //Fix Viewport Position of P2 Vine With Me Ending

.org 0x8010B938
ori v0, v0, ((SCREEN_W/2)-1) //Fix Pitch of Vine with Me Progress Bar

.org 0x8010BA44
slti v0, a0, (SCREEN_W+1) //Fix Maximum X Position of Progress Bar Tiles

.org 0x8010BA4C
addiu v1, r0, SCREEN_W //Clamp Maximum X Position of Progress Bar Tiles

.org 0x8010BE48
slti v0, v0, ((SCREEN_W+58)/59) //Fix Number of Progress Bar Tiles

.org 0x8010D684
li.u at, 1220.0 //Load Lower Half of View Offset
li.l at, 1220.0 //Load Upper Half of View Offset

.org 0x80111BD4
.dw ((SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Scissor in Vine With Me Background

.org 0x80111C1C
.dw ((SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Scissor in Vine With Me Foreground

.org 0x80111E78
.double SCREEN_W_FLOAT //Fix Screen Width for Vine with Me Background

.org 0x80112080
.double ((SCREEN_W_FLOAT/16)-6) //Fix Progress Bar Heads in Vine With Me

.headersize 0x801059A0-0x283060 //Popgun Pick Off Segment

.org 0x80105A38
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Popgun Pick Off

.org 0x80105A44
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Popgun Pick Off

.org 0x80105ACC
addiu a0, r0, 0 //Fix Red Color of Background
addiu a1, r0, 0 //Fix Green Color of Background

.org 0x80105AD8
addiu a2, r0, 0 //Fix Blue Color of Background

.org 0x80105EDC
li.u at, (SCREEN_W_FLOAT/2) //Fix Cursor X Scale in Popgun Pick Off

.org 0x801061E0
addiu a2, r0, (SCREEN_W/2) //X Position of Popgun Pick Off Background

.org 0x801066A8
addiu a2, r0, ((SCREEN_W/2)-100) //X Position of Popgun Pick Off P1 HUD Background

.org 0x801066BC
addiu a2, r0, ((SCREEN_W/2)+100) //X Position of Popgun Pick Off P2 HUD Background

.org 0x80106778
addiu a2, r0, ((SCREEN_W/2)-124) //X Position of Popgun Pick Off P1 HUD Head

.org 0x8010678C
addiu a2, r0, ((SCREEN_W/2)+76) //X Position of Popgun Pick Off P2 HUD Head

.org 0x8010682C
addiu a2, r0, ((SCREEN_W/2)-80) //X Position of Popgun Pick Off P1 HUD Digit 1

.org 0x80106840
addiu a2, r0, ((SCREEN_W/2)-93) //X Position of Popgun Pick Off P1 HUD Digit 2

.org 0x80106854
addiu a2, r0, ((SCREEN_W/2)-107) //X Position of Popgun Pick Off P1 HUD Digit 3

.org 0x80106868
addiu a2, r0, ((SCREEN_W/2)+120) //X Position of Popgun Pick Off P2 HUD Digit 1

.org 0x8010687C
addiu a2, r0, ((SCREEN_W/2)+107) //X Position of Popgun Pick Off P2 HUD Digit 2

.org 0x80106890
addiu a2, r0, ((SCREEN_W/2)+93) //X Position of Popgun Pick Off P2 HUD Digit 3

.org 0x80106C50
addiu a2, r0, (SCREEN_W/2) //X Position of Popgun Pick Off Ending Background

.org 0x8010C8A8
.double (SCREEN_W_FLOAT/240) //Fix Aspect Ratio of Popgun Pick Off 3D to 2D

.org 0x8010C8B0
.double (SCREEN_W_FLOAT/2) //Fix X Offset of Popgun Pick Off 3D to 2D

.org 0x8010C8C0
.double (SCREEN_W_FLOAT/2) //Fix X Offset of Popgun Pick Off 2D to 3D

.org 0x8010C8D0
.double (SCREEN_W_FLOAT/240) //Fix Aspect Ratio of Popgun Pick Off 3D to 2D

.headersize 0x801059A0-0x28A290 //End of the Line Segment

.org 0x80106864
addiu s0, r0, (SCREEN_W/2) //Fix Spacing Between Player Sprites
multu s0, s3 //Calculate Offset of Player Sprites
mflo s0 //Get Offset of Player Sprites
addiu s0, s0, (SCREEN_W/4) //Fix Offset of P1 Sprites

.org 0x80106950
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Separator Bar Sprite

.org 0x80109824
addiu v0, r0, (SCREEN_W/2) //Fix Spacing Between Right Arrow Sprites
multu v0, v1 //Calculate Offset of Right Arrow Sprites
mflo v0 //Get Offset of Right Arrow Sprites

.org 0x801098AC
addiu v0, r0, (SCREEN_W/2) //Fix Spacing Between Left Arrow Sprites
multu v0, a0 //Calculate Offset of Left Arrow Sprites
mflo v0 //Get Offset of Left Arrow Sprites

.org 0x8010B6E4
li.u at, SCREEN_W_FLOAT //Fix Ending P1 Viewport Slide

.org 0x8010B720
li.u at, (SCREEN_W_FLOAT/2) //Fix Ending P1 2D Viewport Slide

.org 0x8010B990
li.u at, SCREEN_W_FLOAT //Fix Ending P2 Viewport Slide

.org 0x8010B9A4
li.u at, ((SCREEN_W_FLOAT/2)-1) //Fix Ending P2 Viewport Slide

.org 0x8010BA20
li.u at, (SCREEN_W_FLOAT/2) //Fix Ending P2 2D Viewport Slide

.org 0x8010BC94
li.u at, SCREEN_W_FLOAT //Fix Ending P1 Viewport Slide

.org 0x8010BCA4
li.u at, ((SCREEN_W_FLOAT/2)-1) //Fix Ending P1 Viewport Slide

.org 0x8010C5CC
.float (SCREEN_W_FLOAT/2) //Fix Screen Center Offset
.float -(SCREEN_W_FLOAT/4) //Fix Screen Left Center Offset
.float (SCREEN_W_FLOAT/4) //Fix Screen Right Center Offset

.org 0x8010C604
.dh ((SCREEN_W/2)-1) //Fix Width of P1 Scissor in End of the Line

.org 0x8010C608
.dh ((SCREEN_W/2)+1) //Fix X Position of P2 Scissor in End of the Line

.org 0x8010C60C
.dh SCREEN_W //Fix Width of P2 Scissor in End of the Line

.org 0x8010C610
.dh (SCREEN_W*2) //Fix Width of P1 Viewport in End of the Line

.org 0x8010C614
.dh SCREEN_W //Fix X Position of P1 Viewport in End of the Line

.org 0x8010C618
.dh (SCREEN_W*2) //Fix Width of P2 Viewport in End of the Line

.org 0x8010C61C
.dh (SCREEN_W*3) //Fix X Position of P2 Viewport in End of the Line

.org 0x8010C664
.dh ((SCREEN_W/4)+30) //Fix X Offset Of Right Arrow
.dh ((SCREEN_W/4)-30) //Fix X Offset Of Left Arrow

.headersize 0x801059A0-0x291020 //Bowser Toss Segment

.org 0x80105A74
li.u a3, SCREEN_W_FLOAT //Fix P1 Scissor Width in Bowser Toss

.org 0x80105A98
li.u a3, SCREEN_W_FLOAT //Fix P2 Scissor Width in Bowser Toss

.org 0x80105AA4
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Bowser Toss

.org 0x80105B1C
li.u a1, 34.75 //Fix FOV in Bowser Toss

.org 0x80108CD8
b 0x80108D00 //Fix P1 Camera Following

.org 0x8010A890
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Bowser Toss Separator Bar

.org 0x8010B220
li.u at, 640.0 //Fix Background Repeat Spacing

.org 0x8010B37C
li.u at, 640.0 //Fix Background Repeat Spacing

.org 0x8010C08C
li.u a2, ((SCREEN_W_FLOAT/2)-79) //Fix Distance of Bowser Toss Score

.org 0x8010F340
.dh SCREEN_W //Fix P1 BG Width in Bowser Toss

.org 0x8010F348
.dh SCREEN_W //Fix P2 BG Width in Bowser Toss

.org 0x8010F378
.dh ((SCREEN_W/2)-24) //X Position of Digit 1 in Bowser Toss P1 Score

.org 0x8010F37C
.dh ((SCREEN_W/2)-12) //X Position of Digit 2 in Bowser Toss P1 Score

.org 0x8010F380
.dh ((SCREEN_W/2)+8) //X Position of Digit 3 in Bowser Toss P1 Score

.org 0x8010F384
.dh ((SCREEN_W/2)+20) //X Position of Digit 4 in Bowser Toss P1 Score

.org 0x8010F388
.dh (SCREEN_W/2) //X Position of Comma in Bowser Toss P1 Score

.org 0x8010F38C
.dh ((SCREEN_W/2)+36) //X Position of Unit in Bowser Toss P1 Score

.org 0x8010F390
.dh (SCREEN_W/2) //X Position of Miss in Bowser Toss P1 Score

.org 0x8010F394
.dh ((SCREEN_W/2)+36) //X Position of Digit 5 in Bowser Toss P1 Score

.org 0x8010F398
.dh ((SCREEN_W/2)-24) //X Position of Digit 1 in Bowser Toss P2 Score

.org 0x8010F39C
.dh ((SCREEN_W/2)-12) //X Position of Digit 2 in Bowser Toss P2 Score

.org 0x8010F3A0
.dh ((SCREEN_W/2)+8) //X Position of Digit 3 in Bowser Toss P2 Score

.org 0x8010F3A4
.dh ((SCREEN_W/2)+20) //X Position of Digit 4 in Bowser Toss P2 Score

.org 0x8010F3A8
.dh (SCREEN_W/2) //X Position of Comma in Bowser Toss P2 Score

.org 0x8010F3AC
.dh ((SCREEN_W/2)+36) //X Position of Unit in Bowser Toss P2 Score

.org 0x8010F3B0
.dh (SCREEN_W/2) //X Position of Miss in Bowser Toss P2 Score

.org 0x8010F3B4
.dh ((SCREEN_W/2)+36) //X Position of Digit 5 in Bowser Toss P2 Score

.org 0x8010F838
.double 640.0 //Fix Background Wrapping

.org 0x8010F848
.double 640.0 //Fix Background Wrapping

.headersize 0x801059A0-0x29B1D0 //Baby Bowser Broadside Segment

.org 0x80105A64
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Baby Bowser Broadside

.org 0x80105A70
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Baby Bowser Broadside

.org 0x80105ABC
li.u a1, 23.0 //Fix FOV in Baby Bowser Broadside

.org 0x80109C78
addiu s5, r0, (SCREEN_W-54) //Fix X Position of Baby Bowser Broadside P2 Score

.headersize 0x801059A0-0x2A1430 //Motor Rooter Segment

.org 0x80105A90
li.u a3, ((SCREEN_W_FLOAT/2)-8) //Fix Scissor Width for P1 in Motor Rooter

.org 0x80105A9C
li.u at, SCREEN_W_FLOAT //Fix Viewport X Position for P1 in Motor Rooter

.org 0x80105AD0
li.u a1, (SCREEN_W_FLOAT*2) //Fix Viewport Width for P1 in Motor Rooter

.org 0x80105B04
li.u a1, ((SCREEN_W_FLOAT/2)+8) //Fix Scissor X Position for P2 in Motor Rooter

.org 0x80105B18
li.u at, (SCREEN_W_FLOAT*3) //Fix Viewport X Position for P2 in Motor Rooter

.org 0x80105B30
li.u a1, (SCREEN_W_FLOAT*2) //Fix Viewport Width for P2 in Motor Rooter

.org 0x801072BC
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Empty Track in Motor Rooter

.org 0x801072CC
addiu s3, r0, (SCREEN_W-35) //X Position of P2 Speed Meter in Motor Rooter

.org 0x801073F4
addiu a1, r0, (SCREEN_W-35) //X Position of P2 Speed Meter Dots in Motor Rooter

.org 0x80107540
addiu a1, a1, ((SCREEN_W/2)-8) //Fix Initial X Position of Players in Motor Rooter

.org 0x80107620
addiu a1, a1, ((SCREEN_W/2)-8) //Fix X Position of Track in Motor Rooter

.org 0x80107994
addiu a1, a1, ((SCREEN_W/2)-8) //Fix X Position of Players in Motor Rooter

.headersize 0x801059A0-0x2AF250 //Silly Screws Segment

.org 0x80105A90
li.u a3, ((SCREEN_W_FLOAT/2)-1) //Fix Scissor Width for P1 in Silly Screws

.org 0x80105A9C
li.u at, SCREEN_W_FLOAT //Fix Viewport X Position for P1 in Silly Screws

.org 0x80105AD0
li.u a1, (SCREEN_W_FLOAT*2) //Fix Viewport Width for P1 in Silly Screws

.org 0x80105B04
li.u a1, ((SCREEN_W_FLOAT/2)+8) //Fix Scissor X Position for P2 in Silly Screws

.org 0x80105B18
li.u at, (SCREEN_W_FLOAT*3) //Fix Viewport X Position for P2 in Silly Screws

.org 0x80105B30
li.u a1, (SCREEN_W_FLOAT*2) //Fix Viewport Width for P2 in Silly Screws

.org 0x801060F4
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Silly Screws Separator

.org 0x80106484
li.u at, ((SCREEN_W_FLOAT*1050)/320) //Load Low Part of Minimum Camera Offset for Silly Screws Stage
li.l at, ((SCREEN_W_FLOAT*1050)/320) //Load Low Part of Minimum Camera Offset for Silly Screws Stage

.org 0x80106490
li.u at, ((SCREEN_W_FLOAT*1600)/320) //Load Low Part of Maximum Camera Offset for Silly Screws Stage

.org 0x801065B0
li.u at, ((SCREEN_W_FLOAT*1500)/320) //Load Low Part of Minimum Camera Offset for Silly Screws Pipes
li.l at, ((SCREEN_W_FLOAT*1500)/320) //Load Low Part of Minimum Camera Offset for Silly Screws Pipes

.org 0x80106614
li.u at, ((SCREEN_W_FLOAT*1700)/320) //Load Low Part of Maximum Camera Offset for Silly Screws Pipes
li.l at, ((SCREEN_W_FLOAT*1700)/320) //Load Low Part of Maximum Camera Offset for Silly Screws Pipes

.org 0x80106868
li.u at, ((SCREEN_W_FLOAT*1050)/320) //Load Low Part of Minimum Camera Offset for Silly Screws Screws
li.l at, ((SCREEN_W_FLOAT*1050)/320) //Load Low Part of Minimum Camera Offset for Silly Screws Screws

.org 0x80106874
li.u at, ((SCREEN_W_FLOAT*1600)/320) //Load Low Part of Maximum Camera Offset for Silly Screws Screws

.org 0x80106B60
li.u at, ((SCREEN_W_FLOAT*800)/320) //Load Low Part of Maximum Camera Offset for Silly Screws Screw Heads

.org 0x80109204
li.u at, ((SCREEN_W_FLOAT*800)/320) //Load Low Part of Minimum Camera Offset for Silly Screws Screw Heads

.org 0x80109254
li.u at, ((SCREEN_W_FLOAT*900)/320) //Load Low Part of Maximum Camera Offset for Silly Screws Screw Heads

.headersize 0x801059A0-0x2B5830 //Crowd Cover Segment

.org 0x80105A38
li.u a3, SCREEN_W_FLOAT //Fix P2 Scissor Width in Crowd Cover

.org 0x80105A44
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Crowd Cover

.org 0x8010629C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Background in Crowd Cover

.org 0x801062E8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Button Chart in Crowd Cover

.org 0x80106458
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Correct Icon in Crowd Cover

.org 0x8010651C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Wrong Icon in Crowd Cover

.org 0x8010C6C4
.dh ((SCREEN_W/2)-44) //Fix X Position of Left Icon in Crowd Cover

.org 0x8010C6C8
.dh (SCREEN_W/2) //Fix X Position of Middle Icon in Crowd Cover

.org 0x8010C6CC
.dh ((SCREEN_W/2)+42) //Fix X Position of Right Icon in Crowd Cover

.headersize 0x801059A0-0x2BCE10 //Tick Tock Hop Segment

.org 0x80105A80
li.u a3, SCREEN_W_FLOAT //Fix P2 Scissor Width in Tick Tock Hop

.org 0x80105A8C
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Tick Tock Hop

.org 0x80106194
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Background in Tick Tock Hop

.org 0x80106338
addiu a1, r0, ((SCREEN_W/2)+120) //Fix X Position of Score Ones in Tick Tock Hop

.org 0x80106A10
addiu a1, r0, ((SCREEN_W/2)+104) //Fix X Position of Score Tens in Tick Tock Hop

.headersize 0x801059A0-0x2C5B50 //Fowl Play Segment

.org 0x80105A84
li.u a3, (SCREEN_W_FLOAT/2) //Fix P1 Scissor Width in Fowl Play

.org 0x80105A90
li.u at, SCREEN_W_FLOAT //Fix P1 Viewport X Position in Fowl Play

.org 0x80105AC4
li.u a1, (SCREEN_W_FLOAT*2) //Fix P1 Viewport Width in Fowl Play

.org 0x80105AF8
li.u a1, (SCREEN_W_FLOAT/2) //Fix P2 Scissor X Position in Fowl Play

.org 0x80105B0C
li.u at, (SCREEN_W_FLOAT*3) //Fix P2 Viewport X Position in Fowl Play

.org 0x80105B24
li.u a1, (SCREEN_W_FLOAT*2) //Fix P2 Viewport Width in Fowl Play

.org 0x80106AA4
addiu v0, r0, ((SCREEN_W/2)-1) //Fix Scissor Right Edge for P1 Background in Fowl Play

.org 0x80106ACC
addiu a2, r0, (SCREEN_W/2) //Fix X Position for P2 Background in Fowl Play

.org 0x80106B18
addiu v0, r0, SCREEN_W //Fix Scissor Right Edge for P2 Background in Fowl Play

.org 0x80106B28
addiu a2, r0, ((SCREEN_W/2)+1) //Fix Scissor Left Edge for P2 Background in Fowl Play

.org 0x80106B64
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Separator in Fowl Play

.org 0x80107054
addiu v0, r0, (SCREEN_W/2) //Screen Spacing for Background
multu v0, s2 //Calculate Background Screen Offset
mflo v0 //Get Background Screen Offset

.headersize 0x801059A0-0x2CF3B0 //Winners Wheel Segment

.org 0x801093AC
addiu a2, r0, (SCREEN_W/2) //Fix Initial X Position of Timer in Winners Wheel

.org 0x801093BC
li.u a1, (SCREEN_W_FLOAT/2) //Fix X Position of Timer in Winners Wheel

.headersize 0x801059A0-0x2D3E70 //Hey Batter Batter Segment

.org 0x80105B24
li.u a3, SCREEN_W_FLOAT //Fix P2 Scissor Width in Hey Batter Batter

.org 0x80105B30
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Hey Batter Batter

.org 0x801067EC
addiu a2, r0, ((SCREEN_W/2)-10) //Fix Initial X Position of Timer in Hey Batter Batter

.org 0x80106804
li.u a1, ((SCREEN_W_FLOAT/2)-10) //Fix Countdown X Position in Hey Batter Batter

.org 0x80106D20
addiu a3, r0, (SCREEN_W/2) //Fix X Position of Hey Batter Batter Background

.headersize 0x801059A0-0x2D8370 //Bobbing Bow Loons Segment

.org 0x80105A1C
nop //Disable Cloud Objects

.org 0x80107FB8
addiu a2, r0, (SCREEN_W/2) //Fix Initial X Position of Timer in Bobbing Bow Loons

.org 0x80107FC8
li.u a1, (SCREEN_W_FLOAT/2) //Fix Countdown X Position in Bobbing Bow Loons

.headersize 0x801059A0-0x2DC4D0 //Dorrie Dip Segment

.org 0x80105BB8
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Dorrie Dip

.org 0x80105BC8
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Dorrie Dip

.org 0x80105C44
li.u a1, 36.75 //Fix FOV in Dorrie Dip

.org 0x80108750
addiu a2, r0, (SCREEN_W/2) //Fix Initial X Position of Timer in Dorrie Dip

.org 0x80108760
li.u a1, (SCREEN_W_FLOAT/2) //Fix Countdown X Position in Dorrie Dip

.headersize 0x801059A0-0x2E0D20 //Swinging with Sharks Segment

.org 0x801059FC
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Swinging with Sharks

.org 0x80105A08
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Swinging with Sharks

.org 0x80105AA0
li.u at, -477.0 //Fix Camera X Position in Swinging with Sharks
li.l at, -477.0 //Fix Camera X Position in Swinging with Sharks

.org 0x80105ADC
li.u at, 18.375 //Fix FOV in Swinging with Sharks

.headersize 0x801059A0-0x2E6BE0 //Swing n Swipe Segment

.org 0x80105A70
li.u a1, ((SCREEN_W_FLOAT/2)-160) //Fix Scissor X in Swing n Swipe
li.u a3, ((SCREEN_W_FLOAT/2)+160) //Fix Scissor Width in Swing n Swipe

.org 0x80105A7C
addu a2, r0, r0 //Fix Scissor Y in Swing n Swipe

.org 0x80105A80
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Swing n Swipe

.org 0x80105C34
addiu a3, r0, (SCREEN_W/2) //Fix X Position of Swing n Swipe Background

.headersize 0x801059A0-0x2ED2D0 //Stardust Battle Segment

.org 0x80105A64
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Stardust Battle

.org 0x80105A70
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Stardust Battle

.org 0x80113CE0
.dh ((SCREEN_W/2)-42) //Fix X Position of Timer Digit 1 in Stardust Battle
.dh ((SCREEN_W/2)-30) //Fix X Position of Timer Digit 2 in Stardust Battle
.dh ((SCREEN_W/2)-22) //Fix X Position of Timer Digit 3 in Stardust Battle
.dh ((SCREEN_W/2)-10) //Fix X Position of Timer Digit 4 in Stardust Battle
.dh ((SCREEN_W/2)+2) //Fix X Position of Timer Digit 5 in Stardust Battle
.dh ((SCREEN_W/2)+12) //Fix X Position of Timer Digit 6 in Stardust Battle
.dh ((SCREEN_W/2)+24) //Fix X Position of Timer Digit 7 in Stardust Battle
.dh ((SCREEN_W/2)+36) //Fix X Position of Timer Digit 8 in Stardust Battle

.headersize 0x801059A0-0x2FC270 //Game Guy Roulette Segment

.org 0x80105AE4
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Game Guy Roulette

.org 0x80105AF0
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Game Guy Roulette

.org 0x80105BE8
addiu a0, r0, ((SCREEN_W/2)-30) //Fix X Position of Game Guy Window

.org 0x80106510
addiu s0, r0, SCREEN_W //Fix Width of Background in Game Guy Roulette

.org 0x8010663C
addiu a2, r0, ((SCREEN_W/2)+82) //Fix X Position of Roulette Choices

.org 0x801066C4
addiu a2, r0, ((SCREEN_W/2)+86) //Fix X Position of Roulette Choice Icons

.org 0x80106740
addiu a2, r0, ((SCREEN_W/2)+46) //Fix X Position of Roulette Choice Cursor

.org 0x80106794
addiu a2, r0, ((SCREEN_W/2)-136) //Fix X Position of Game Guy Roulette Coin Icon

.org 0x801067E4
addiu a2, r0, ((SCREEN_W/2)-124) //Fix X Position of Game Guy Roulette Coin Number

.org 0x80106830
addiu a1, r0, ((SCREEN_W/2)-106) //Fix X Position of Game Guy Roulette Coin Digit 1

.org 0x8010686C
addiu a1, r0, ((SCREEN_W/2)-94) //Fix X Position of Game Guy Roulette Coin Digit 2

.org 0x80106890
addiu a1, r0, ((SCREEN_W/2)-82) //Fix X Position of Game Guy Roulette Coin Digit 3

.org 0x8010852C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Game Guy Roulette Lost Text

.org 0x80108734
addiu a1, s2, ((SCREEN_W/2)-106) //Fix X Position of Game Guy Roulette Coin Digit 1

.org 0x801087F0
addiu a1, s2, ((SCREEN_W/2)-106) //Fix X Position of Game Guy Roulette Coin Digit 2

.org 0x80108880
addiu a1, s2, ((SCREEN_W/2)-106) //Fix X Position of Game Guy Roulette Coin Digit 3

.org 0x80109E2C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Game Guy Roulette Window Mask

.headersize 0x801059A0-0x3010E0 //Game Guy Lucky 7 Surprise Segment

.org 0x80105B34
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Game Guy Lucky 7

.org 0x80105B40
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Game Guy Lucky 7

.org 0x801061CC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Game Guy Lucky 7 Lost Text

.org 0x8010866C
addiu a1, r0, ((SCREEN_W/2)-106) //Fix X Position of Game Guy Lucky 7 Coin Digit 1

.org 0x80108714
addiu a1, s1, ((SCREEN_W/2)-106) //Fix X Position of Game Guy Lucky 7 Coin Digit 2

.org 0x8010877C
addiu a1, s1, ((SCREEN_W/2)-106) //Fix X Position of Game Guy Lucky 7 Coin Digit 3

.org 0x8010C93C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Game Guy Lucky 7 Filter

.org 0x8010D150
.dh ((SCREEN_W/2)+30) //Fix X Position of Text Window 1 in Game Guy Lucky 7

.org 0x8010D156
.dh ((SCREEN_W/2)+60) //Fix X Position of Text Window 2 in Game Guy Lucky 7

.org 0x8010D15C
.dh ((SCREEN_W/2)+35) //Fix X Position of Text Window 3 in Game Guy Lucky 7

.org 0x8010D162
.dh ((SCREEN_W/2)+10) //Fix X Position of Text Window 4 in Game Guy Lucky 7

.org 0x8010D168
.dh ((SCREEN_W/2)+30) //Fix X Position of Text Window 5 in Game Guy Lucky 7

.org 0x8010D16E
.dh ((SCREEN_W/2)-5) //Fix X Position of Text Window 6 in Game Guy Lucky 7

.org 0x8010D174
.dh ((SCREEN_W/2)-30) //Fix X Position of Text Window 7 in Game Guy Lucky 7

.org 0x8010D17A
.dh ((SCREEN_W/2)-60) //Fix X Position of Text Window 7 in Game Guy Lucky 7

.org 0x8010D180
.dh ((SCREEN_W/2)-110) //Fix X Position of Text Window 8 in Game Guy Lucky 7

.org 0x8010D40E
.dh (SCREEN_W/2) //Fix X Position of Game Guy Lucky 7 Layer 1

.org 0x8010D41E
.dh (SCREEN_W/2) //Fix X Position of Game Guy Lucky 7 Layer 2

.org 0x8010D42E
.dh (SCREEN_W/2) //Fix X Position of Game Guy Lucky 7 Layer 3

.org 0x8010D43A
.dh ((SCREEN_W/2)+65) //Fix X Position of 1 in Game Guy Lucky 7

.org 0x8010D446
.dh ((SCREEN_W/2)+39) //Fix X Position of 2 in Game Guy Lucky 7

.org 0x8010D452
.dh ((SCREEN_W/2)+13) //Fix X Position of 3 in Game Guy Lucky 7

.org 0x8010D45E
.dh ((SCREEN_W/2)-13) //Fix X Position of 4 in Game Guy Lucky 7

.org 0x8010D46A
.dh ((SCREEN_W/2)-39) //Fix X Position of 5 in Game Guy Lucky 7

.org 0x8010D476
.dh ((SCREEN_W/2)-65) //Fix X Position of 6 in Game Guy Lucky 7

.org 0x8010D482
.dh ((SCREEN_W/2)-92) //Fix X Position of 7 in Game Guy Lucky 7

.org 0x8010D48E
.dh ((SCREEN_W/2)-130) //Fix X Position of Coin Icon in Game Guy Lucky 7

.org 0x8010D49A
.dh ((SCREEN_W/2)-118) //Fix X Position of Coin Cross in Game Guy Lucky 7

.org 0x8010D4A6
.dh ((SCREEN_W/2)-106) //Fix X Position of Coin Digit 1 in Game Guy Lucky 7

.org 0x8010D4B2
.dh ((SCREEN_W/2)-94) //Fix X Position of Coin Digit 2 in Game Guy Lucky 7

.org 0x8010D4BE
.dh ((SCREEN_W/2)-82) //Fix X Position of Coin Digit 3 in Game Guy Lucky 7

.headersize 0x801059A0-0x308D10 //Game Guy Magic Boxes Surprise Segment

.org 0x8010606C
addiu s1, r0, SCREEN_W //Fix Screen Width of Background Sprites

.org 0x80106224
addiu a3, r0, ((SCREEN_W/2)+82) //Fix X Position of Score Multipliers

.org 0x80106284
addiu s1, s1, ((SCREEN_W/2)-136) //Fix X Position of Toad Icons

.org 0x80106394
addiu a3, r0, ((SCREEN_W/2)-136) //Fix X Position of Coin Icon

.org 0x801063F0
addiu a3, r0, ((SCREEN_W/2)-124) //Fix X Position of Coin Cross Icon

.org 0x80106474
addiu a3, a3, ((SCREEN_W/2)-112) //Fix X Position of Coin Digits

.org 0x80106500
addiu a3, r0, ((SCREEN_W/2)-105) //Fix X Position of Default Cursor Sprite

.org 0x80108D0C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Game Guy Magic Boxes Lose Text

.org 0x8010704C
addiu a0, r0, ((SCREEN_W/2)-30) //Fix X Position of Game Guy Rules Question

.org 0x80107A50
addiu a0, r0, ((SCREEN_W/2)-30) //Fix X Position of Game Guy Choose Chest

.org 0x80108958
addiu a0, r0, ((SCREEN_W/2)-30) //Fix X Position of Game Guy Choose Chest

.org 0x80108F50
addiu v0, s1, ((SCREEN_W/2)-112) //Fix X Position of Coin First Digit

.org 0x80109018
addiu v0, s1, ((SCREEN_W/2)-112) //Fix X Position of Coin First Digit

.org 0x80109084
addiu v0, s1, ((SCREEN_W/2)-112) //Fix X Position of Coin First Digit

.org 0x80107BB0
addiu v1, r0, ((SCREEN_W/2)-105) //Fix X Position of Default Cursor Sprite

.org 0x80107F74
addiu v0, r0, ((SCREEN_W/2)-20) //Fix X Position of Right Cursor Sprite

.org 0x80107F90
addiu v0, r0, ((SCREEN_W/2)-105) //Fix X Position of Left Cursor Sprite

.org 0x80108510
addiu v0, r0, ((SCREEN_W/2)-43) //Fix X Position of Light Mask 1 in Game Guy Magic Boxes
addiu v0, r0, ((SCREEN_W/2)+43) //Fix X Position of Light Mask 2 in Game Guy Magic Boxes

.org 0x80109A70
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Game Guy Magic Boxes

.org 0x80109A7C
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Game Guy Magic Boxes

.org 0x8010A084
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Game Guy Magic Boxes Light Mask

.org 0x8010A0F0
ori a0, r0, ((SCREEN_W/2)*SCREEN_H) //Fix Size of Game Guy Magic Boxes Light Mask Image 2

.org 0x8010A100
ori a0, r0, ((SCREEN_W/2)*SCREEN_H) //Fix Size of Game Guy Magic Boxes Light Mask Image 3

.org 0x8010A15C
ori a2, r0, (((SCREEN_W/2)*SCREEN_H)-1) //Fix Size of Game Guy Magic Boxes Image Clear

.org 0x8010A274
addiu v0, r0, (SCREEN_W/2) //Screen Pitch for Game Guy Magic Boxes
multu v0, v1 //Calculate Row Offset for Game Guy Magic Boxes
mflo v0 //Get Row Offset for Game Guy Magic Boxes

.org 0x8010A2C8
sltiu v0, v0, SCREEN_W //Fix Maximum X Position for Game Guy Magic Boxes

.org 0x8010A42C
addiu v0, r0, (SCREEN_W/2) //Screen Pitch for Game Guy Magic Boxes
multu v0, v1 //Calculate Row Offset for Game Guy Magic Boxes
mflo v0 //Get Row Offset for Game Guy Magic Boxes

.org 0x8010A474
sltiu v0, v0, SCREEN_W //Fix Maximum X Position for Game Guy Magic Boxes

.org 0x8010A910
addiu v0, r0, (SCREEN_W/2) //Fix X Position of Game Guy Magic Boxes Light Circle

.org 0x8010B9CC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Game Guy Magic Boxes Lights

.org 0x8010BA78
ori a0, r0, ((SCREEN_W/2)*SCREEN_H) //Fix Size of Game Guy Magic Boxes Image 2

.org 0x8010BA88
ori a0, r0, ((SCREEN_W/2)*SCREEN_H) //Fix Size of Game Guy Magic Boxes Image 3

.org 0x8010BB30
ori a0, r0, ((SCREEN_W/2)*SCREEN_H) //Fix Size of Game Guy Magic Boxes Image 2

.org 0x8010BB40
ori a0, r0, ((SCREEN_W/2)*SCREEN_H) //Fix Size of Game Guy Magic Boxes Image 3

.org 0x8010BB7C
ori a2, r0, (((SCREEN_W/2)*SCREEN_H)-1) //Fix Size of Game Guy Magic Boxes Image Row Clear

.org 0x8010BBC0
ori a2, r0, (((SCREEN_W/2)*SCREEN_H)-1) //Fix Size of Game Guy Magic Boxes Image Row Clear

.org 0x8010BC70
addiu a0, r0, (SCREEN_W/2) //Screen Pitch for Game Guy Magic Boxes
multu a0, v0 //Calculate Row Offset for Game Guy Magic Boxes
mflo a0 //Get Row Offset for Game Guy Magic Boxes

.org 0x8010BCD0
addiu v0, t0, ((SCREEN_W/2)-1) //Fix Pitch in Game Guy Magic Boxes

.org 0x8010BCD8
addiu v0, a2, ((SCREEN_W/2)-1) //Fix Pitch in Game Guy Magic Boxes

.org 0x8010BD10
sltiu v0, a0, SCREEN_W //Fix Maximum X Position for Game Guy Magic Boxes

.org 0x8010BD50
addiu v0, t0, ((SCREEN_W/2)-1) //Fix Pitch in Game Guy Magic Boxes

.org 0x8010BE74
addiu v1, r0, (SCREEN_W/2) //Screen Pitch for Game Guy Magic Boxes
multu v1, t2 //Calculate Row Offset for Game Guy Magic Boxes
mflo v1 //Get Row Offset for Game Guy Magic Boxes

.org 0x8010BED4
sltiu v0, v1, SCREEN_W //Fix Maximum X Position for Game Guy Magic Boxes

.org 0x8010C050
sltiu v1, v1, SCREEN_W //Fix Maximum X Position for Game Guy Magic Boxes

.org 0x8010C0A0
addiu v0, r0, (SCREEN_W/2) //Screen Pitch for Game Guy Magic Boxes
multu v0, a2 //Calculate Row Offset for Game Guy Magic Boxes
mflo v0 //Get Row Offset for Game Guy Magic Boxes

.org 0x8010C138
sltiu v1, v1, SCREEN_W //Fix Maximum X Position for Game Guy Magic Boxes

.org 0x8010C188
addiu v0, r0, (SCREEN_W/2) //Screen Pitch for Game Guy Magic Boxes
multu v0, a2 //Calculate Row Offset for Game Guy Magic Boxes
mflo v0 //Get Row Offset for Game Guy Magic Boxes

.headersize 0x801059A0-0x30F940 //Game Guy Sweet Surprise Segment

.org 0x80105B24
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Game Guy Sweet Surprise

.org 0x80105B30
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Game Guy Sweet Surprise

.org 0x80106378
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Game Guy Sweet Surprise Lose Text

.org 0x801065C0
addiu a0, r0, ((SCREEN_W/2)-30) //Fix X Position of Game Guy Window

.org 0x8010675C
addiu a0, r0, ((SCREEN_W/2)-123) //Fix X Position of Game Guy Left Chomp Window

.org 0x801067C4
addiu a0, r0, ((SCREEN_W/2)+17) //Fix X Position of Game Guy Right Chomp Window

.org 0x80106C18
addiu a0, r0, ((SCREEN_W/2)-30) //Fix X Position of Game Guy Window

.org 0x801074A0
addiu a3, r0, (SCREEN_W/2) //Fix X Position of Game Guy Sweet Surprise Layer 1

.org 0x801074C8
addiu a3, r0, (SCREEN_W/2) //Fix X Position of Game Guy Sweet Surprise Layer 2

.org 0x801074E8
addiu a3, r0, (SCREEN_W/2) //Fix X Position of Game Guy Sweet Surprise Layer 3

.org 0x80107538
addiu a3, r0, ((SCREEN_W/2)+109) //Fix X Position of Game Guy Sweet Surprise Choice Box

.org 0x80107578
lui s3, ((SCREEN_W/2)+120) //Fix X Position of Game Guy Sweet Surprise Choices

.org 0x80107778
addiu a3, r0, ((SCREEN_W/2)+97) //Fix X Position of Game Guy Sweet Surprise Choice Icon 1

.org 0x801077A4
addiu a3, r0, ((SCREEN_W/2)+97) //Fix X Position of Game Guy Sweet Surprise Choice Icon 2

.org 0x80107AB8
addiu a3, r0, ((SCREEN_W/2)-130) //Fix X Position of Game Guy Sweet Surprise Coin Icon

.org 0x80107AE0
addiu a3, r0, ((SCREEN_W/2)-118) //Fix X Position of Game Guy Sweet Surprise Coin Cross

.org 0x80107AFC
addiu a3, r0, ((SCREEN_W/2)-106) //Fix X Position of Game Guy Sweet Surprise Coin Digit 1

.org 0x80107B18
addiu a3, r0, ((SCREEN_W/2)-106) //Fix X Position of Game Guy Sweet Surprise Coin Digit 2

.org 0x80107B34
addiu a3, r0, ((SCREEN_W/2)-106) //Fix X Position of Game Guy Sweet Surprise Coin Digit 3

.org 0x80108554
addiu s1, r0, ((SCREEN_W/2)-106) //Fix X Position of Game Guy Sweet Surprise Coin Digits

.org 0x8010C35C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Game Guy Sweet Surprise Window Mask

.org 0x8010CBCE
.dh ((SCREEN_W/2)+70) //Fix X Position of Choice 1 in Game Guy Sweet Surprise

.org 0x8010CBD6
.dh ((SCREEN_W/2)+70) //Fix X Position of Choice 2 in Game Guy Sweet Surprise

.headersize 0x801059A0-0x316DF0 //Dizzy Dinghies Segment

.org 0x80105A14
li.u a3, SCREEN_W_FLOAT //Fix P2 Scissor Width in Dizzy Dinghies

.org 0x80105A20
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Dizzy Dinghies


.headersize 0x801059A0-0x31B510 //Chilly Waters Segment

.org 0x8010C088
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Shop Item Icon

.org 0x8010C438
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Bag Shop Item

.org 0x8010C4A0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Sliding Up Shop Item

.org 0x80113BA0
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 1 Sliding Up Barter Item

.org 0x80113F74
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 1 Sliding Up Barter Item

.org 0x80113F8C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 1 Barter Item

.org 0x80114018
li.u at, ((SCREEN_W_FLOAT/2)-30) //Fix X Position of Slot 2 Sliding Up Barter Item

.org 0x8011402C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 2 Barter Item

.org 0x80114058
li.u at, ((SCREEN_W_FLOAT/2)+30) //Fix X Position of Slot 2 Sliding Up Barter Item

.org 0x80114070
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 2 Barter Item

.org 0x80114150
li.u at, ((SCREEN_W_FLOAT/2)-50) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x80114168
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x80114194
li.u at, ((SCREEN_W_FLOAT/2)+50) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x801141AC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x801141D0
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x801141E8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x80115618
addiu a2, r0, ((SCREEN_W/2)+17) //Fix X Position of Wacky Watch Number Part 1

.org 0x8011563C
addiu a2, r0, ((SCREEN_W/2)-38) //Fix X Position of Wacky Watch Number Part 2

.org 0x8011565C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Wacky Watch Number Part 3

.org 0x80115E00
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Wacky Watch Slide

.org 0x80115E94
li.u at, ((SCREEN_W_FLOAT/2)+43) //Fix X Position of Wacky Watch Movement

.org 0x80116228
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Full Wacky Watch Number

.org 0x80119F28
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Action Time Icon

.org 0x8011A2D0
addiu a2, r0, ((SCREEN_W-110)/3) //Spacing Between Player Action Time Icons
multu a2, s3 //Calculate Player Action Time Icon Offset
mflo a2 //Get Player Action Time Icon Offset
nop //Two NOPs
nop //For Padding

.org 0x8011E204
.float (SCREEN_W_FLOAT-76) //Fix X Position of P2 Boo

.org 0x8011E214
.float (SCREEN_W_FLOAT-76) //Fix X Position of P4 Boo

.org 0x8011E354
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Cursor

.org 0x8011E35C
.float ((SCREEN_W_FLOAT/2)-20) //Fix Destination X Position of P2 Cursor

.org 0x8011E364
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Cursor

.org 0x8011E36C
.float ((SCREEN_W_FLOAT/2)-20) //Fix Destination X Position of P4 Cursor

.org 0x8011E374
.float ((SCREEN_W_FLOAT/2)-28) //Fix Destination X Position of P1 Warp Cursor

.org 0x8011E37C
.float ((SCREEN_W_FLOAT/2)+60) //Fix Destination X Position of P2 Warp Cursor

.org 0x8011E384
.float ((SCREEN_W_FLOAT/2)-28) //Fix Destination X Position of P3 Warp Cursor

.org 0x8011E38C
.float ((SCREEN_W_FLOAT/2)+60) //Fix Destination X Position of P4 Warp Cursor

.org 0x8011E394
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Chest Cursor

.org 0x8011E39C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P2 Chest Cursor

.org 0x8011E3A4
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Chest Cursor

.org 0x8011E3AC
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P4 Chest Cursor

.org 0x8011E3B4
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Low Chest Cursor

.org 0x8011E3BC
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P2 Low Chest Cursor

.org 0x8011E3C4
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Low Chest Cursor

.org 0x8011E3CC
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P4 Low Chest Cursor

.headersize 0x801059A0-0x3355E0 //Deep Bloober Sea Segment

.org 0x8010BBF0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Shop Item Icon

.org 0x8010BFA0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Bag Shop Item

.org 0x8010C008
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Sliding Up Shop Item

.org 0x80113708
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 1 Sliding Up Barter Item

.org 0x80113ADC
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 1 Sliding Up Barter Item

.org 0x80113AF4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 1 Barter Item

.org 0x80113B80
li.u at, ((SCREEN_W_FLOAT/2)-30) //Fix X Position of Slot 2 Sliding Up Barter Item

.org 0x80113B94
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 2 Barter Item

.org 0x80113BC0
li.u at, ((SCREEN_W_FLOAT/2)+30) //Fix X Position of Slot 2 Sliding Up Barter Item

.org 0x80113BD8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 2 Barter Item

.org 0x80113CB8
li.u at, ((SCREEN_W_FLOAT/2)-50) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x80113CD0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x80113CFC
li.u at, ((SCREEN_W_FLOAT/2)+50) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x80113D14
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x80113D38
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x80113D50
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x80115180
addiu a2, r0, ((SCREEN_W/2)+17) //Fix X Position of Wacky Watch Number Part 1

.org 0x801151A4
addiu a2, r0, ((SCREEN_W/2)-38) //Fix X Position of Wacky Watch Number Part 2

.org 0x801151C4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Wacky Watch Number Part 3

.org 0x80115968
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Wacky Watch Slide

.org 0x801159FC
li.u at, ((SCREEN_W_FLOAT/2)+43) //Fix X Position of Wacky Watch Movement

.org 0x80115D90
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Full Wacky Watch Number

.org 0x80119AB0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Action Time Icon

.org 0x8011A3CC
addiu a0, r0, ((SCREEN_W/2)-58) //Fix X Position of Action Time Window

.org 0x8011D5B0
.float (SCREEN_W_FLOAT-76) //Fix X Position of P2 Boo

.org 0x8011D5C0
.float (SCREEN_W_FLOAT-76) //Fix X Position of P4 Boo

.org 0x8011D710
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Cursor

.org 0x8011D718
.float ((SCREEN_W_FLOAT/2)-20) //Fix Destination X Position of P2 Cursor

.org 0x8011D720
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Cursor

.org 0x8011D728
.float ((SCREEN_W_FLOAT/2)-20) //Fix Destination X Position of P4 Cursor

.org 0x8011D730
.float ((SCREEN_W_FLOAT/2)-28) //Fix Destination X Position of P1 Warp Cursor

.org 0x8011D738
.float ((SCREEN_W_FLOAT/2)+60) //Fix Destination X Position of P2 Warp Cursor

.org 0x8011D740
.float ((SCREEN_W_FLOAT/2)-28) //Fix Destination X Position of P3 Warp Cursor

.org 0x8011D748
.float ((SCREEN_W_FLOAT/2)+60) //Fix Destination X Position of P4 Warp Cursor

.org 0x8011D750
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Chest Cursor

.org 0x8011D758
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P2 Chest Cursor

.org 0x8011D760
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Chest Cursor

.org 0x8011D768
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P4 Chest Cursor

.org 0x8011D770
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Low Chest Cursor

.org 0x8011D778
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P2 Low Chest Cursor

.org 0x8011D780
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Low Chest Cursor

.org 0x8011D788
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P4 Low Chest Cursor

.org 0x8011EB34
.float (SCREEN_W_FLOAT/2) //X Position of Deep Bloober Sea Switch

.headersize 0x801059A0-0x34E810 //Spiny Desert Segment

.org 0x8010C160
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Shop Item Icon

.org 0x8010C510
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Bag Shop Item

.org 0x8010C578
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Sliding Up Shop Item

.org 0x80113C78
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 1 Sliding Up Barter Item

.org 0x8011404C
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 1 Sliding Up Barter Item

.org 0x80114064
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 1 Barter Item

.org 0x801140F0
li.u at, ((SCREEN_W_FLOAT/2)-30) //Fix X Position of Slot 2 Sliding Up Barter Item

.org 0x80114104
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 2 Barter Item

.org 0x80114130
li.u at, ((SCREEN_W_FLOAT/2)+30) //Fix X Position of Slot 2 Sliding Up Barter Item

.org 0x80114148
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 2 Barter Item

.org 0x80114228
li.u at, ((SCREEN_W_FLOAT/2)-50) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x80114240
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x8011426C
li.u at, ((SCREEN_W_FLOAT/2)+50) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x80114284
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x801142A8
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x801142C0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x801156F0
addiu a2, r0, ((SCREEN_W/2)+17) //Fix X Position of Wacky Watch Number Part 1

.org 0x80115714
addiu a2, r0, ((SCREEN_W/2)-38) //Fix X Position of Wacky Watch Number Part 2

.org 0x80115734
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Wacky Watch Number Part 3

.org 0x80115ED8
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Wacky Watch Slide

.org 0x80115F6C
li.u at, ((SCREEN_W_FLOAT/2)+43) //Fix X Position of Wacky Watch Movement

.org 0x80116300
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Full Wacky Watch Number

.org 0x80118600
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Action Time Icon

.org 0x801189A8
addiu a2, r0, ((SCREEN_W-110)/3) //Spacing Between Player Action Time Icons
multu a2, s3 //Calculate Player Action Time Icon Offset
mflo a2 //Get Player Action Time Icon Offset
nop //Two NOPs
nop //For Padding

.org 0x8011D0EC
.float (SCREEN_W_FLOAT-76) //Fix X Position of P2 Boo

.org 0x8011D0FC
.float (SCREEN_W_FLOAT-76) //Fix X Position of P4 Boo

.org 0x8011D24C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Cursor

.org 0x8011D254
.float ((SCREEN_W_FLOAT/2)-20) //Fix Destination X Position of P2 Cursor

.org 0x8011D25C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Cursor

.org 0x8011D264
.float ((SCREEN_W_FLOAT/2)-20) //Fix Destination X Position of P4 Cursor

.org 0x8011D26C
.float ((SCREEN_W_FLOAT/2)-28) //Fix Destination X Position of P1 Warp Cursor

.org 0x8011D274
.float ((SCREEN_W_FLOAT/2)+60) //Fix Destination X Position of P2 Warp Cursor

.org 0x8011D27C
.float ((SCREEN_W_FLOAT/2)-28) //Fix Destination X Position of P3 Warp Cursor

.org 0x8011D284
.float ((SCREEN_W_FLOAT/2)+60) //Fix Destination X Position of P4 Warp Cursor

.org 0x8011D28C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Chest Cursor

.org 0x8011D294
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P2 Chest Cursor

.org 0x8011D29C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Chest Cursor

.org 0x8011D2A4
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P4 Chest Cursor

.org 0x8011D2AC
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Low Chest Cursor

.org 0x8011D2B4
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P2 Low Chest Cursor

.org 0x8011D2BC
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Low Chest Cursor

.org 0x8011D2C4
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P4 Low Chest Cursor

.headersize 0x801059A0-0x367930 //Woody Woods Segment

.org 0x8010BC28
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Shop Item Icon

.org 0x8010BFD8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Bag Shop Item

.org 0x8010C040
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Sliding Up Shop Item

.org 0x80113740
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 1 Sliding Up Barter Item

.org 0x80113B14
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 1 Sliding Up Barter Item

.org 0x80113B2C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 1 Barter Item

.org 0x80113BB8
li.u at, ((SCREEN_W_FLOAT/2)-30) //Fix X Position of Slot 2 Sliding Up Barter Item

.org 0x80113BCC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 2 Barter Item

.org 0x80113BF8
li.u at, ((SCREEN_W_FLOAT/2)+30) //Fix X Position of Slot 2 Sliding Up Barter Item

.org 0x80113C10
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 2 Barter Item

.org 0x80113CF0
li.u at, ((SCREEN_W_FLOAT/2)-50) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x80113D08
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x80113D34
li.u at, ((SCREEN_W_FLOAT/2)+50) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x80113D4C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x80113D70
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x80113D88
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x801151B8
addiu a2, r0, ((SCREEN_W/2)+17) //Fix X Position of Wacky Watch Number Part 1

.org 0x801151DC
addiu a2, r0, ((SCREEN_W/2)-38) //Fix X Position of Wacky Watch Number Part 2

.org 0x801151FC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Wacky Watch Number Part 3

.org 0x801159A0
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Wacky Watch Slide

.org 0x80115A34
li.u at, ((SCREEN_W_FLOAT/2)+43) //Fix X Position of Wacky Watch Movement

.org 0x80115DC8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Full Wacky Watch Number

.org 0x80117F6C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Action Time Icon

.org 0x80118804
addiu a0, r0, ((SCREEN_W/2)-70) //Fix X Position of Action Time Window

.org 0x8011C6A4
.float (SCREEN_W_FLOAT-76) //Fix X Position of P2 Boo

.org 0x8011C6B4
.float (SCREEN_W_FLOAT-76) //Fix X Position of P4 Boo

.org 0x8011C804
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Cursor

.org 0x8011C80C
.float ((SCREEN_W_FLOAT/2)-20) //Fix Destination X Position of P2 Cursor

.org 0x8011C814
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Cursor

.org 0x8011C81C
.float ((SCREEN_W_FLOAT/2)-20) //Fix Destination X Position of P4 Cursor

.org 0x8011C824
.float ((SCREEN_W_FLOAT/2)-28) //Fix Destination X Position of P1 Warp Cursor

.org 0x8011C82C
.float ((SCREEN_W_FLOAT/2)+60) //Fix Destination X Position of P2 Warp Cursor

.org 0x8011C834
.float ((SCREEN_W_FLOAT/2)-28) //Fix Destination X Position of P3 Warp Cursor

.org 0x8011C83C
.float ((SCREEN_W_FLOAT/2)+60) //Fix Destination X Position of P4 Warp Cursor

.org 0x8011C844
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Chest Cursor

.org 0x8011C84C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P2 Chest Cursor

.org 0x8011C854
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Chest Cursor

.org 0x8011C85C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P4 Chest Cursor

.org 0x8011C864
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Low Chest Cursor

.org 0x8011C86C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P2 Low Chest Cursor

.org 0x8011C874
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Low Chest Cursor

.org 0x8011C87C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P4 Low Chest Cursor

.headersize 0x801059A0-0x37FF80 //Creepy Cavern Segment

.org 0x8010B634
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Shop Item Icon

.org 0x8010B9E4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Bag Shop Item

.org 0x8010BA4C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Sliding Up Shop Item

.org 0x8011314C
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 1 Sliding Up Barter Item

.org 0x80113520
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 1 Sliding Up Barter Item

.org 0x80113538
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 1 Barter Item

.org 0x801135C4
li.u at, ((SCREEN_W_FLOAT/2)-30) //Fix X Position of Slot 2 Sliding Up Barter Item

.org 0x801135D8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 2 Barter Item

.org 0x80113604
li.u at, ((SCREEN_W_FLOAT/2)+30) //Fix X Position of Slot 2 Sliding Up Barter Item

.org 0x8011361C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 2 Barter Item

.org 0x801136FC
li.u at, ((SCREEN_W_FLOAT/2)-50) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x80113714
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x80113740
li.u at, ((SCREEN_W_FLOAT/2)+50) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x80113758
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x8011377C
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x80113794
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x80114BC4
addiu a2, r0, ((SCREEN_W/2)+17) //Fix X Position of Wacky Watch Number Part 1

.org 0x80114BE8
addiu a2, r0, ((SCREEN_W/2)-38) //Fix X Position of Wacky Watch Number Part 2

.org 0x80114C08
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Wacky Watch Number Part 3

.org 0x801153AC
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Wacky Watch Slide

.org 0x80115440
li.u at, ((SCREEN_W_FLOAT/2)+43) //Fix X Position of Wacky Watch Movement

.org 0x801157D4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Full Wacky Watch Number

.org 0x80117B28
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Action Time Icon

.org 0x80117ED0
addiu a2, r0, ((SCREEN_W-110)/3) //Spacing Between Player Action Time Icons
multu a2, s3 //Calculate Player Action Time Icon Offset
mflo a2 //Get Player Action Time Icon Offset
nop //Two NOPs
nop //For Padding

.org 0x80118804
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Action Time Icon

.org 0x8011EB54
.float (SCREEN_W_FLOAT-76) //Fix X Position of P2 Boo

.org 0x8011EB64
.float (SCREEN_W_FLOAT-76) //Fix X Position of P4 Boo

.org 0x8011ECB4
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Cursor

.org 0x8011ECBC
.float ((SCREEN_W_FLOAT/2)-20) //Fix Destination X Position of P2 Cursor

.org 0x8011ECC4
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Cursor

.org 0x8011ECCC
.float ((SCREEN_W_FLOAT/2)-20) //Fix Destination X Position of P4 Cursor

.org 0x8011ECD4
.float ((SCREEN_W_FLOAT/2)-28) //Fix Destination X Position of P1 Warp Cursor

.org 0x8011ECDC
.float ((SCREEN_W_FLOAT/2)+60) //Fix Destination X Position of P2 Warp Cursor

.org 0x8011ECE4
.float ((SCREEN_W_FLOAT/2)-28) //Fix Destination X Position of P3 Warp Cursor

.org 0x8011ECEC
.float ((SCREEN_W_FLOAT/2)+60) //Fix Destination X Position of P4 Warp Cursor

.org 0x8011ECF4
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Chest Cursor

.org 0x8011ECFC
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P2 Chest Cursor

.org 0x8011ED04
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Chest Cursor

.org 0x8011ED0C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P4 Chest Cursor

.org 0x8011ED14
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Low Chest Cursor

.org 0x8011ED1C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P2 Low Chest Cursor

.org 0x8011ED24
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Low Chest Cursor

.org 0x8011ED2C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P4 Low Chest Cursor

.headersize 0x801059A0-0x39AD20 //Waluigi Island Segment

.org 0x8010D418
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Shop Item Icon

.org 0x8010D7C8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Bag Shop Item

.org 0x8010D830
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Sliding Up Shop Item

.org 0x80114F30
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 1 Sliding Up Barter Item

.org 0x80115304
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 1 Sliding Up Barter Item

.org 0x8011531C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 1 Barter Item

.org 0x801153A8
li.u at, ((SCREEN_W_FLOAT/2)-30) //Fix X Position of Slot 2 Sliding Up Barter Item

.org 0x801153BC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 2 Barter Item

.org 0x801153E8
li.u at, ((SCREEN_W_FLOAT/2)+30) //Fix X Position of Slot 2 Sliding Up Barter Item

.org 0x80115400
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 2 Barter Item

.org 0x801154E0
li.u at, ((SCREEN_W_FLOAT/2)-50) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x801154F8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x80115524
li.u at, ((SCREEN_W_FLOAT/2)+50) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x8011553C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x80115560
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Slot 3 Sliding Up Barter Item

.org 0x80115578
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Slot 3 Barter Item

.org 0x801169A8
addiu a2, r0, ((SCREEN_W/2)+17) //Fix X Position of Wacky Watch Number Part 1

.org 0x801169CC
addiu a2, r0, ((SCREEN_W/2)-38) //Fix X Position of Wacky Watch Number Part 2

.org 0x801169EC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Wacky Watch Number Part 3

.org 0x80117190
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Wacky Watch Slide

.org 0x80117224
li.u at, ((SCREEN_W_FLOAT/2)+43) //Fix X Position of Wacky Watch Movement

.org 0x801175B8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Full Wacky Watch Number

.org 0x8011C8E4
.float (SCREEN_W_FLOAT-76) //Fix X Position of P2 Boo

.org 0x8011C8F4
.float (SCREEN_W_FLOAT-76) //Fix X Position of P4 Boo

.org 0x8011CA44
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Cursor

.org 0x8011CA4C
.float ((SCREEN_W_FLOAT/2)-20) //Fix Destination X Position of P2 Cursor

.org 0x8011CA54
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Cursor

.org 0x8011CA5C
.float ((SCREEN_W_FLOAT/2)-20) //Fix Destination X Position of P4 Cursor

.org 0x8011CA64
.float ((SCREEN_W_FLOAT/2)-28) //Fix Destination X Position of P1 Warp Cursor

.org 0x8011CA6C
.float ((SCREEN_W_FLOAT/2)+60) //Fix Destination X Position of P2 Warp Cursor

.org 0x8011CA74
.float ((SCREEN_W_FLOAT/2)-28) //Fix Destination X Position of P3 Warp Cursor

.org 0x8011CA7C
.float ((SCREEN_W_FLOAT/2)+60) //Fix Destination X Position of P4 Warp Cursor

.org 0x8011CA84
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Chest Cursor

.org 0x8011CA8C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P2 Chest Cursor

.org 0x8011CA94
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Chest Cursor

.org 0x8011CA9C
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P4 Chest Cursor

.org 0x8011CAA4
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P1 Low Chest Cursor

.org 0x8011CAAC
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P2 Low Chest Cursor

.org 0x8011CAB4
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P3 Low Chest Cursor

.org 0x8011CABC
.float ((SCREEN_W_FLOAT/2)+4) //Fix Destination X Position of P4 Low Chest Cursor

.headersize 0x801059A0-0x3B35F0 //Rules Board Segment

.org 0x8010960C
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Rules Space Icon 1

.org 0x80109688
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Rules Space Icon 2

.org 0x8010970C
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Rules Space Icon 3

.org 0x80109788
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Rules Space Icon 4

.org 0x80109824
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Rules Space Icon 5

.org 0x801098A0
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Rules Space Icon 6

.org 0x801099F4
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Rules Space Icon 7

.org 0x80109AD4
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Rules Space Icon 8

.org 0x8010B1C8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Rules Pause Filter

.org 0x8010B1D8
li.u a2, (SCREEN_W_FLOAT/8) //Fix Width of Rules Pause Filter

.org 0x8010B288
addiu a2, r0, ((SCREEN_W/2)-2) //Fix X Position of Rules Pause Window

.headersize 0x801059A0-0x3B9670 //Results Segment

.org 0x80106084
slti v0, s2, (SCREEN_W/2) //Fix Curtain Slide Distance

.org 0x8010B984
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Results Winner Icon

.org 0x8010E4C8
.float ((SCREEN_W_FLOAT*500)/320) //Fix Cannon Target Position

.org 0x8010E970
.float ((SCREEN_W_FLOAT*5)/8) //Fix X Position of Curtain Right Side

.org 0x8010E978
.float (SCREEN_W_FLOAT/4) //Fix X Position of Curtain Top-Right Side

.org 0x8010E988
.float (SCREEN_W_FLOAT/4) //Fix X Position of Curtain Bottom-Right

.org 0x8010E990
.float ((SCREEN_W_FLOAT*3)/8) //Fix X Position of Curtain Left Side

.org 0x8010E998
.float (-SCREEN_W_FLOAT/4) //Fix X Position of Curtain Top-Left Side

.org 0x8010E9A8
.float (-SCREEN_W_FLOAT/4) //Fix X Position of Curtain Bottom-Left

.headersize 0x801059A0-0x3C27C0 //Bowser Event Segment

.org 0x80106904
addiu a2, a2, ((SCREEN_W/2)-110) //Fix X Position of Bowser Event Cursor

.org 0x80107C18
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Bowser Suit

.org 0x80107C44
li.u at, ((SCREEN_W_FLOAT/2)-70) //Fix X Offset of Bowser Suit

.org 0x80107C64
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Bowser Suit

.org 0x80107F58
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Bowser Phone

.org 0x80107F84
li.u at, ((SCREEN_W_FLOAT/2)-70) //Fix X Offset of Bowser Phone

.org 0x80107FA4
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Bowser Suit

.org 0x8010937C
.dh ((SCREEN_W/2)-96) //Fix X Position of Bowser Event 1
 
.org 0x80109384
.dh ((SCREEN_W/2)-96) //Fix X Position of Bowser Event 2

.org 0x8010938C
.dh ((SCREEN_W/2)-96) //Fix X Position of Bowser Event 3

.org 0x80109394
.dh ((SCREEN_W/2)-96) //Fix X Position of Bowser Event 4

.org 0x8010939C
.dh ((SCREEN_W/2)-96) //Fix X Position of Bowser Event 5

.headersize 0x801059A0-0x3C6310 //Last 5 Turns Segment

.org 0x80105E9C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Last 5 Turns Graphic

.org 0x80105F38
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Last 5 Turns Digit

.org 0x80106038
addiu a1, r0, ((SCREEN_W/2)-130) //Fix X Position of Last 5 Turns HUD

.org 0x80106074
addiu a1, r0, ((SCREEN_W/2)-130) //Fix X Position of Last 5 Turns HUD End

.org 0x80106230
addiu s4, r0, ((SCREEN_W/2)-20) //Fix X Position of Player Placements

.org 0x8010642C
addiu v0, r0, (SCREEN_W/2) //Fix X Position of Bowser Winner

.org 0x80106470
addiu s2, r0, ((SCREEN_W/2)-130) //Fix Start X Position of Last 5 Turns HUD

.org 0x80106510
addiu a1, r0, ((SCREEN_W/2)-130) //Fix X Position of Last 5 Turns HUD

.org 0x80106558
addiu a1, r0, ((SCREEN_W/2)-130) //Fix X Position of Last 5 Turns HUD

.org 0x80106590
addiu v0, r0, ((SCREEN_W/2)-80) //Fix X Position of Loser Loss

.org 0x80106608
addiu s2, r0, ((SCREEN_W/2)-130) //Fix Start X Position of Last 5 Turns HUD

.org 0x8010694C
addiu s4, r0, ((SCREEN_W/2)-20) //Fix X Position of Player Placements

.org 0x80106B40
addiu v0, r0, (SCREEN_W/2) //Fix X Position of Whomp Winner

.org 0x80106D2C
addiu v0, r0, (SCREEN_W/2) //Fix X Position of Star Speaker

.org 0x80106D94
addiu s1, r0, ((SCREEN_W/2)-130) //Fix Start X Position of Last 5 Turns HUD

.org 0x80106E34
addiu a1, r0, ((SCREEN_W/2)-130) //Fix X Position of Last 5 Turns HUD

.org 0x80106E7C
addiu a1, r0, ((SCREEN_W/2)-130) //Fix X Position of Last 5 Turns HUD

.org 0x80106F60
addiu s1, r0, ((SCREEN_W/2)-130) //Fix Start X Position of Last 5 Turns HUD

.org 0x80106FBC
addiu s1, r0, ((SCREEN_W/2)-130) //Fix Start X Position of Last 5 Turns HUD

.org 0x80106EB4
addiu v0, r0, ((SCREEN_W/2)-80) //Fix X Position of Winner Gain

.org 0x80107480
.float ((SCREEN_W_FLOAT*750)/320) //Fix X Position of Bowser

.headersize 0x801059A0-0x3C7EC0 //Genie Lamp Segment

.org 0x80106F34
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Genie Lamp Filter

.org 0x80106F4C
li.u a2, (SCREEN_W_FLOAT/8) //Fix X Scale of Genie Lamp Filter

.headersize 0x801059A0-0x3CFC80 //Results Segment

.org 0x80105F28
addiu a2, r0, ((SCREEN_W/2)-105) //Fix X Position of Results Placements

.org 0x801075B4
addiu v0, v0, RESULT_MAX_COLS

.org 0x801075E8
slti v0, s3, 16*RESULT_MAX_COLS

.org 0x801078E4
addiu v0, v0, RESULT_MAX_COLS

.org 0x80107C40
addiu a2, r0, ((SCREEN_W/2)+50) //Fix X Position of Play Mode Bar

.org 0x80107D08
addiu a2, r0, ((SCREEN_W/2)+50) //Fix X Position of Play Mode Icon

.org 0x80107DB8
addiu a2, r0, ((SCREEN_W/2)+58) //Fix X Position of Results Icon Bar

.org 0x80107E68
addiu a2, r0, ((SCREEN_W/2)+12) //Fix X Position of Results Icon Bar

.org 0x801080EC
addiu a2, r0, (SCREEN_W-166)
multu a2, s3
mflo a2
nop
nop

.org 0x80108208
addiu a0, r0, 16*RESULT_MAX_COLS

.org 0x801082DC
slti v0, s3, 16*RESULT_MAX_COLS

.org 0x80108740
slti v0, s0, 16*RESULT_MAX_COLS

.org 0x801093F4
slti v0, v0, RESULT_MAX_COLS //Fix Maximum Visual Cursor X Position

.org 0x801093FC
addiu v0, r0, (RESULT_MAX_COLS-1) //Clamp Maximum Visual Cursor X Position

.org 0x8010941C
slti v0, v0, (13-RESULT_MAX_COLS) //Fix Maximum Cursor X Position

.org 0x80109424
addiu v0, r0, ((13-RESULT_MAX_COLS)-1) //Clamp Maximum Cursor X Position

.org 0x80109550
addiu v0, r0, ((13-RESULT_MAX_COLS)-1) //Hide Cursor X Position

.org 0x80109558
addiu v0, r0, (RESULT_MAX_COLS-1) //Hide Cursor X Position

.org 0x80108B04
addiu a2, r0, ((SCREEN_W/2)-49) //Fix X Position of Bouncing Results Player Sprites

.org 0x80108BB4
addiu a2, r0, ((SCREEN_W/2)-49) //Fix X Position of Bouncing Results Player Sprites

.org 0x80108C2C
addiu a2, r0, ((SCREEN_W/2)-49) //Fix End X Position of Bouncing Results Player Sprites

.org 0x80108CF0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Results Sprites

.org 0x80108D90
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Results Sprites

.org 0x80108DE0
addiu a2, r0, (SCREEN_W/2) //Fix End X Position of Results Sprites

.org 0x80108E68
addiu a0, r0, (((SCREEN_W+127)/128)*2) //Number of Sprites in Results Background Group

.org 0x80108F44
slti v0, s1, (((SCREEN_W+127)/128)*2) //Number of Sprites in Results Background Group

.org 0x801090D0
addiu a2, r0, ((SCREEN_W/2)-105) //Fix X Position of Results Crown

.org 0x80109170
addiu a2, r0, ((SCREEN_W/2)-105) //Fix X Position of Results Crown

.org 0x801091C0
addiu a2, r0, ((SCREEN_W/2)-105) //Fix End X Position of Results Crown

.org 0x80109284
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Left Results Instruction

.org 0x801092A4
addiu a1, r0, ((SCREEN_W/2)+40) //Fix X Position of Right Results Instruction

.org 0x801097C0
.dw ((SCREEN_W/2)-105) //Fix X Position of Rope 1
.dw ((SCREEN_W/2)-49) //Fix X Position of Rope 2
.dw ((SCREEN_W/2)+11) //Fix X Position of Rope 3
.dw ((SCREEN_W/2)+92) //Fix X Position of Rope 4

.headersize 0x801059A0-0x3CA800 //Board Intro Segment

.org 0x801064DC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Board Intro Logo

.org 0x80106688
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Board Intro Name Logo

.headersize 0x801059A0-0x3CDEC0 //Board Rules Intro Segment

.org 0x80106938
addiu a0, r0, ((SCREEN_W/2)-85) //Fix X Position of Board Rules Host Window High

.org 0x8010701C
addiu a0, r0, ((SCREEN_W/2)-85) //Fix X Position of Board Rules Host Window

.headersize 0x801059A0-0x3D7150 //Boot Segment

.org 0x80105CC0
addiu a1, r0, (SCREEN_W/2) //Fix X Position of N64 Logo

.org 0x80105D8C
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Nintendo Logo

.org 0x80105E50
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Hudson Logo

.headersize 0x801059A0-0x3D76C0 //Save Debug Segment

.org 0x80105C28
addiu a0, r0, ((SCREEN_W/2)-90) //Fix X Position of First Debug Save Menu Choice

.org 0x80105C3C
addiu a0, r0, ((SCREEN_W/2)-90) //Fix X Position of Second Debug Save Menu Choice

.org 0x80105C64
addiu a0, r0, ((SCREEN_W/2)-90) //Fix X Position of Third Debug Save Menu Choice

.org 0x80105C84
addiu a0, r0, ((SCREEN_W/2)-90) //Fix X Position of Fourth Debug Save Menu Choice

.org 0x80105CA4
addiu a0, r0, ((SCREEN_W/2)-90) //Fix X Position of Fifth Debug Save Menu Choice

.org 0x80105CB4
addiu a0, r0, ((SCREEN_W/2)-90) //Fix X Position of Sixth Debug Save Menu Choice

.org 0x80105CC8
addiu a0, r0, ((SCREEN_W/2)-90) //Fix X Position of Last Debug Save Menu Choice

.org 0x801060FC
addiu a0, r0, ((SCREEN_W/2)-100) //Fix X Position of Debug Save Menu Cursor

.headersize 0x801059A0-0x3D8A90 //Gate Guy Segment

.org 0x8010F230
addiu a0, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F474
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F554
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F634
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x801139BC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113ADC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113B44
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113BAC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113BD0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113C00
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80118F60
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Icon

.org 0x80118F64
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Text

.org 0x80118F68
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Mask

.headersize 0x801059A0-0x3EC560 //Arrowhead Segment

.org 0x8010F270
addiu a0, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F4B4
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F594
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F674
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x801139FC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113B1C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113B84
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113BEC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113C10
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113C40
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80117170
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Icon

.org 0x80117174
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Text

.org 0x80117178
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Mask

.headersize 0x801059A0-0x3FE1C0 //Pipesqueak Segment

.org 0x8010F064
addiu a0, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F2A8
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F388
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F468
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x801137F0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113910
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113978
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x801139E0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113A04
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113A34
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80117C30
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Icon

.org 0x80117C34
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Text

.org 0x80117C38
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Mask

.headersize 0x801059A0-0x4108E0 //Blowhard Segment

.org 0x8010F2EC
addiu a0, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F530
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F610
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F6F0
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x80113A84
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113BA4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113C0C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113C74
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113C98
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113CC8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x8011AFDC
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Icon

.org 0x8011AFE0
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Text

.org 0x8011AFE4
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Mask

.headersize 0x801059A0-0x426420 //Mr. Mover Segment

.org 0x8010F200
addiu a0, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F444
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F524
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F604
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8011398C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113AAC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113B14
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113B7C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113BA0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113BD0
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80115ED0
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Icon

.org 0x80115ED4
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Text

.org 0x80115ED8
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Mask

.headersize 0x801059A0-0x436E20 //Backtrack Segment

.org 0x8010F3F8
addiu a0, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F63C
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F71C
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x8010F7FC
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x80113B84
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113CA4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113D0C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113D74
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113D98
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80113DC8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x801148A0
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Icon

.org 0x801148A4
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Text

.org 0x801148A8
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Mask

.headersize 0x801059A0-0x4461B0 //Duel Rules Segment

.org 0x8010DE40
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Rules Pause Filter

.org 0x8010DE50
li.u a2, (SCREEN_W_FLOAT/8) //Fix Width of Rules Pause Filter

.org 0x8010DF00
addiu a2, r0, ((SCREEN_W/2)-2) //Fix X Position of Rules Pause Window

.org 0x80110080
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Space Icon 1

.org 0x801100DC
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Space Icon 2

.org 0x8011015C
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Space Icon 3

.org 0x801101B0
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Space Icon 4

.org 0x80110328
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Space Icon 5

.org 0x80110494
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Space Icon 6

.org 0x801104F8
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Space Icon 7

.org 0x8011054C
addiu a1, r0, ((SCREEN_W/2)-60) //Fix X Position of Space Icon 8

.org 0x801120E0
addiu a0, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x80112320
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x801123FC
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x801124D8
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Partner Change Confirm Window

.org 0x801145EC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80114754
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x801147C4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80114834
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80114860
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80114898
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Happening Text

.org 0x80114BF0
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Icon

.org 0x80114BF4
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Text

.org 0x80114BF8
.dh (SCREEN_W/2) //Fix X Position of Partner Change Window Mask

.headersize 0x801059A0-0x4554C0 //Duel Results Sequence Segment

.org 0x8010607C
slti v0, s2, (SCREEN_W/2) //Fix Curtain Slide Distance

.org 0x801092DC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Draw Text

.org 0x8010A824
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Win Text

.org 0x8010D36C
.float ((SCREEN_W_FLOAT*500)/320) //Fix X Position of Cannon End Point

.org 0x8010D6E0
.float ((SCREEN_W_FLOAT*5)/8) //Fix X Position of Curtain Right Side

.org 0x8010D6E8
.float (SCREEN_W_FLOAT/4) //Fix X Position of Curtain Top-Right Side

.org 0x8010D6F8
.float (SCREEN_W_FLOAT/4) //Fix X Position of Curtain Bottom-Right

.org 0x8010D700
.float ((SCREEN_W_FLOAT*3)/8) //Fix X Position of Curtain Left Side

.org 0x8010D708
.float (-SCREEN_W_FLOAT/4) //Fix X Position of Curtain Top-Left Side

.org 0x8010D718
.float (-SCREEN_W_FLOAT/4) //Fix X Position of Curtain Bottom-Left


.headersize 0x801059A0-0x45D380 //Duel Results Segment

.org 0x80106650
addiu a2, r0, ((SCREEN_W/2)-49) //Fix X Position of Duel Results Score

.org 0x80106710
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Duel Results Text

.org 0x801067DC
addiu a2, r0, ((SCREEN_W/2)-105) //Fix X Position of Duel P1 Crown

.org 0x801067FC
addiu a2, r0, ((SCREEN_W/2)-105) //Fix X Position of Duel P2 Crown

.org 0x8010707C
addiu v0, v0, RESULT_MAX_COLS

.org 0x801070B0
slti v0, s3, 16*RESULT_MAX_COLS

.org 0x801073D4
addiu v0, v0, RESULT_MAX_COLS

.org 0x801076D8
addiu a2, r0, ((SCREEN_W/2)+50) //Fix X Position of Play Mode Bar

.org 0x801077AC
addiu a2, r0, ((SCREEN_W/2)+50) //Fix X Position of Play Mode Icon

.org 0x8010785C
addiu a2, r0, ((SCREEN_W/2)+58) //Fix X Position of Results Icon Bar

.org 0x8010790C
addiu a2, r0, ((SCREEN_W/2)+12) //Fix X Position of Results Icon Bar

.org 0x80107B6C
addiu a2, r0, (SCREEN_W-166)
multu a2, s3
mflo a2
nop
nop

.org 0x80107CAC
addiu a0, r0, 16*RESULT_MAX_COLS

.org 0x80107D80
slti v0, s3, 16*RESULT_MAX_COLS

.org 0x801081E4
slti v0, s0, 16*RESULT_MAX_COLS

.org 0x80108528
addiu a0, r0, (((SCREEN_W+127)/128)*2) //Number of Sprites in Results Background Group

.org 0x80108604
slti v0, s1, (((SCREEN_W+127)/128)*2) //Number of Sprites in Results Background Group

.org 0x80108718
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Detailed Results Window

.org 0x80108738
addiu a1, r0, ((SCREEN_W/2)+40) //Fix X Position of Continue Window

.org 0x80108888
slti v0, v0, RESULT_MAX_COLS //Fix Maximum Visual Cursor X Position

.org 0x80108890
addiu v0, r0, (RESULT_MAX_COLS-1) //Clamp Maximum Visual Cursor X Position

.org 0x801088B0
slti v0, v0, (11-RESULT_MAX_COLS) //Fix Maximum Cursor X Position

.org 0x801088B8
addiu v0, r0, ((11-RESULT_MAX_COLS)-1) //Clamp Maximum Cursor X Position

.org 0x801089E4
addiu v0, r0, ((13-RESULT_MAX_COLS)-1) //Hide Cursor X Position

.org 0x801089EC
addiu v0, r0, (RESULT_MAX_COLS-1) //Hide Cursor X Position

.headersize 0x801059A0-0x460790 //Duel Intro Segment

.org 0x801064A4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Board Logo

.org 0x80106650
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Board Logo Name

.org 0x801092EC
.float -((SCREEN_W_FLOAT*750)/320) //Fix X Position of Left Follower on Duel Rules Intro

.org 0x801092F8
.float ((SCREEN_W_FLOAT*750)/320) //Fix X Position of Right Follower on Duel Rules Intro

.org 0x801094F0
.dh ((SCREEN_W/2)-130) //Fix X Position of P1 HUD in Duel Rules Intro

.org 0x801094F4
.dh ((SCREEN_W/2)+34) //Fix X Position of P2 HUD in Duel Rules Intro

.headersize 0x801059A0-0x464360 //Duel Rules Intro Segment

.org 0x80106CE8
addiu a0, r0, ((SCREEN_W/2)-85) //Fix X Position of Duel Rules Window

.org 0x80108A04
.float -((SCREEN_W_FLOAT*750)/320) //Fix X Position of Left Follower on Duel Rules Intro

.org 0x80108A10
.float ((SCREEN_W_FLOAT*750)/320) //Fix X Position of Right Follower on Duel Rules Intro

.org 0x80108BBC
.dh ((SCREEN_W/2)-130) //Fix X Position of P1 HUD in Duel Rules Intro

.org 0x80108BC0
.dh ((SCREEN_W/2)+34) //Fix X Position of P2 HUD in Duel Rules Intro

.headersize 0x801059A0-0x4684F0 //Save Error Segment

.org 0x80105A70
addiu a1, r0, (SCREEN_W/2) //X Position of Save Erase Message

.org 0x80105B04
addiu a1, r0, (SCREEN_W/2) //X Position of Some Saved Data Erase Message

.org 0x80105BA4
addiu a1, r0, (SCREEN_W/2) //X Position of File 1 Erase Message

.org 0x80105C44
addiu a1, r0, (SCREEN_W/2) //X Position of File 2 Erase Message

.org 0x80105CE4
addiu a1, r0, (SCREEN_W/2) //X Position of File 3 Erase Message

.headersize 0x801059A0-0x468A90 //Minigame Replay Segment

.org 0x80105DFC
addiu a1, r0, SCREEN_W //Screen Width for Dizzy Dinghies Course Name Box

.org 0x80105E8C
addiu a0, r0, ((SCREEN_W/2)-100) //Fix X Position of Dizzy Dinghies Left Arrow

.org 0x80105EA4
addiu a2, r0, ((SCREEN_W/2)+100) //Fix X Position of Dizzy Dinghies Right Arrow

.org 0x80106004
addiu a0, r0, ((SCREEN_W/2)-80) //Fix X Position of Dizzy Dinghies Boat Left Arrow

.org 0x8010600C
addiu a2, r0, ((SCREEN_W/2)+80) //Fix X Position of Dizzy Dinghies Boat Right Arrow

.org 0x8010634C
li.u at, ((SCREEN_W_FLOAT/2)+80) //Fix Speed of Minigame Picture

.org 0x801063DC
addiu a1, r0, SCREEN_W //Screen Width for Play Again Box

.org 0x80106628
li.u at, (SCREEN_W_FLOAT/2) //Fix Speed of Minigame Name

.org 0x80106900
li.u at, (SCREEN_W_FLOAT/2) //Fix Center Position of Course Names

.org 0x801069D8
li.u at, ((SCREEN_W_FLOAT/2)+80) //Fix Speed of Dizzy Dinghies Course Names

.org 0x80106ACC
li.u at, ((SCREEN_W_FLOAT/2)+80) //Fix Speed of Dizzy Dinghies Course Names

.org 0x80106F04
addiu a2, r0, (SCREEN_W/2) //X Position of Boat Names in Dizzy Dinghies

.org 0x80107A78
li.u at, ((SCREEN_W_FLOAT/2)+80) //Fix Speed of Mario Puzzle Party Picture

.org 0x80107B08
addiu a1, r0, SCREEN_W //Screen Width for Mario Puzzle Party Score Box 1

.org 0x80107BA0
addiu a1, r0, SCREEN_W //Screen Width for Mario Puzzle Party Score Box 2

.org 0x80107FA0
li.u at, ((SCREEN_W_FLOAT/2)+80) //Fix Speed of Dizzy Dinghies Course Pictures

.org 0x801080F0
addiu a1, r0, (SCREEN_W/2) //X Position of Course Picture When Choosing Boat

.org 0x80108228
addiu a1, r0, (SCREEN_W/2) //X Position of Course Picture When Choosing Boat

.org 0x80108320
li.u at, (SCREEN_W_FLOAT/2) //Fix Center Position of Course Pictures

.org 0x80108474
li.u at, (SCREEN_W_FLOAT/2) //Fix Center Position of Course Pictures

.headersize 0x801059A0-0x46CC10 //Minigame Play Segment

.org 0x80105A18
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Minigame Play

.org 0x80105A24
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Minigame Play

.org 0x80105A7C
li.u a3, SCREEN_W_FLOAT //Fix Player Scissor Width in Minigame Play

.org 0x801060B0
addiu s0, r0, SCREEN_W //Screen Width for Textbox Placement

.org 0x801073CC
addiu a1, r0, SCREEN_W //Screen Width for Toad Messages

.org 0x80109220
addiu a1, r0, ((SCREEN_W/2)-136) //X Position of Minigame Description Window

.org 0x80109274
addiu a1, r0, ((SCREEN_W/2)-84) //X Position of Minigame Description Picture

.org 0x801092D4
addiu a1, r0, ((SCREEN_W/2)-84) //X Position of Minigame Description Easy Set

.org 0x8010A200
addiu a1, r0, ((SCREEN_W/2)-110) //X Position of Minigame Team Setup Window

.org 0x8010A314
addiu a0, r0, (SCREEN_W/2) //X Position of Minigame Team Setup Players

.org 0x8010A320
addiu a0, r0, (SCREEN_W/2) //X Position of Minigame Team Setup Overlay

.org 0x8010A490
addiu a0, r0, (SCREEN_W/2) //X Position of Minigame Team Setup Overlay

.org 0x8010AF9C
lui a0, hi(ZBUF_ADDR) //Fix Z Buffer Address High Part
addiu a0, a0, hi(ZBUF_ADDR) //Fix Z Buffer Address Low Part

.org 0x8010AFB8
ori v0, v0, (SCREEN_W-1) //Fix Z Buffer Clear Pitch

.org 0x8010BF1C
addiu a1, r0, SCREEN_W //Screen Width for Battle Room Textbox Placement

.org 0x8010CC60
addiu a2, r0, ((SCREEN_W/2)+20) //X Position of Random Battle Background

.org 0x8010D4D4
addiu a2, r0, ((SCREEN_W/2)+20) //X Position of 3-Win Match Icon

.org 0x8010D4EC
addiu a2, r0, ((SCREEN_W/2)+20) //X Position of 5-Win Match Icon

.org 0x8010D504
addiu a2, r0, ((SCREEN_W/2)+20) //X Position of 7-Win Match Icon

.org 0x8010D830
addiu a2, r0, ((SCREEN_W/2)+20) //X Position of Sliding Win Mode Icon

.org 0x8010DC4C
addiu a2, r0, ((SCREEN_W/2)+20) //X Position of Minigame Type Icons

.org 0x8010E058
addiu a2, r0, ((SCREEN_W/2)+20) //X Position of Sliding Minigame Type Icons

.org 0x8010F3A4
addiu a1, r0, ((SCREEN_W/2)+20) //X Position of Battle Mode Minigame Pictures

.org 0x8010F6E4
addiu a2, r0, ((SCREEN_W/2)+20) //X Position of Random Battle Background

.org 0x8010F77C
addiu a2, r0, ((SCREEN_W/2)+20) //X Position of Win Count After Minigame

.org 0x8010F814
addiu a2, r0, ((SCREEN_W/2)+20) //X Position of Minigame Type After Minigame

.org 0x8010F898
addiu a1, r0, ((SCREEN_W/2)+20) //X Position of Minigame Picture After Minigame

.org 0x80110608
addiu v0, r0, ((SCREEN_W/2)+20) //X Position of Minigame List

.org 0x80110674
addiu a2, r0, ((SCREEN_W/2)+20) //X Position of Minigame List

.org 0x801107BC
addiu a2, a2, ((SCREEN_W/2)+20) //X Position of Minigame List

.org 0x80110848
addiu a2, a2, ((SCREEN_W/2)+20) //X Position of Minigame List

.org 0x80110A54
addiu a2, a2, ((SCREEN_W/2)+20) //X Position of Minigame List

.org 0x80110AE0
addiu v0, r0, ((SCREEN_W/2)+20) //X Position of Minigame List

.org 0x80110CE0
addiu a2, r0, ((SCREEN_W/2)+20) //X Position of Minigame List Borders

.org 0x80110D6C
addiu a2, r0, ((SCREEN_W/2)+20) //X Position of Minigame List Borders

.org 0x80110EF0
addiu a1, a1, ((SCREEN_W/2)+20) //X Position of Minigame List Borders

.org 0x80110F78
addiu t4, r0, ((SCREEN_W/2)-11) //X Position of Minigame List Player Icon

.org 0x8011149C
addiu a1, a1, ((SCREEN_W/2)+20) //X Position of Minigame Win Stars

.org 0x801115CC
addiu a1, a1, ((SCREEN_W/2)+20) //X Position of Minigame Win Stars

.org 0x80111734
addiu a1, a1, ((SCREEN_W/2)+20) //X Position of Minigame Win Stars

.org 0x80111838
addiu a1, a1, ((SCREEN_W/2)+20) //X Position of Minigame Win Stars

.org 0x80112234
addiu a1, r0, SCREEN_W //Screen Width for Game Guy Room Textbox Placement

.org 0x80113784
addiu a1, r0, ((SCREEN_W/2)+24) //X Position of Game Guy Minigame Results Picture

.org 0x801137C4
addiu a1, r0, ((SCREEN_W/2)+24) //X Position of Game Guy Minigame Results Name

.org 0x801140F4
addiu a1, r0, SCREEN_W //Screen Width for Game Guy Room Early Exit Textbox Placement

.org 0x80114450
addiu a2, r0, ((SCREEN_W/2)+24) //X Position of Game Guy Winnings Header

.org 0x80114478
addiu a2, r0, ((SCREEN_W/2)+24) //X Position of Game Guy Coin Count Header

.org 0x80114484
addiu a0, r0, ((SCREEN_W/2)+24) //X Position of Game Guy Coin Count

.org 0x80114864
addiu a2, a2, ((SCREEN_W/2)-56) //X Position of Game Guy Winnings Base

.org 0x801148D0
addiu a2, a2, ((SCREEN_W/2)+8) //X Position of Game Guy Winnings Multiplier

.org 0x8011493C
addiu a2, a2, ((SCREEN_W/2)+56) //X Position of Game Guy Winnings Total

.org 0x80114994
addiu a2, r0, ((SCREEN_W/2)-8) //X Position of Game Guy Winnings Cross

.org 0x801149D0
addiu a2, r0, ((SCREEN_W/2)+40) //X Position of Game Guy Winnings Equals

.org 0x80114A64
addiu a1, r0, ((SCREEN_W/2)+24) //X Position of Game Guy Minigame Icon

.org 0x80114B2C
addiu a1, r0, ((SCREEN_W/2)+24) //X Position of Game Guy Minigame Name

.org 0x80114BB8
addiu a1, r0, ((SCREEN_W/2)+24) //X Position of Game Guy Minigame Name

.org 0x80114C38
addiu a1, r0, ((SCREEN_W/2)+24) //X Position of Final Game Guy Minigame Name

.org 0x80114C9C
addiu a0, r0, ((SCREEN_W/2)+24) //X Position of Game Guy Coin Plus

.org 0x80119158
.dh (SCREEN_W/2) //Fix X Position of Toad Cursor in Minigame Play

.org 0x8011915C
.dh ((SCREEN_W/2)+74) //Fix X Position of Toad Cursor in Minigame Play
 
.org 0x80119160
.dh ((SCREEN_W/2)-3) //Fix X Position of Battle Room Cursor in Minigame Play
 
.org 0x80119164
.dh ((SCREEN_W/2)-3) //Fix X Position of Mini Game Room Cursor in Minigame Play
 
.org 0x80119168
.dh ((SCREEN_W/2)-3) //Fix X Position of Game Guy Room Cursor in Minigame Play

.org 0x80119170
.dh ((SCREEN_W/2)-115) //Fix X Position of Duel Cursor in Minigame Play

.org 0x80119174
.dh ((SCREEN_W/2)-2) //Fix X Position of 4-Player Cursor in Minigame Play

.org 0x80119178
.dh ((SCREEN_W/2)+111) //Fix X Position of Item Cursor in Minigame Play

.org 0x8011917C
.dh ((SCREEN_W/2)-115) //Fix X Position of 1 vs 3 Cursor in Minigame Play

.org 0x80119180
.dh ((SCREEN_W/2)-37) //Fix X Position of 2 vs 2 Cursor in Minigame Play

.org 0x80119184
.dh ((SCREEN_W/2)+34) //Fix X Position of Battle Cursor in Minigame Play

.org 0x80119188
.dh ((SCREEN_W/2)+111) //Fix X Position of Rare Cursor in Minigame Play

.org 0x801192B0
.dw (0xF6000000|((SCREEN_W-1) << 14)|((SCREEN_H-1) << 2)) //Upper Half of Z Clear Command

.org 0x801192C8
.dw (0xFF100000|(SCREEN_W-1)) //Fix Framebuffer Re-Pitch

.org 0x80119424
.dh (SCREEN_W/2) //Fix X Position of Battle T Cursor in Minigame Play

.org 0x80119428
.dh (SCREEN_W/2) //Fix X Position of Battle Room Exit in Minigame Play

.org 0x8011943C
.dh ((SCREEN_W/2)+20) //Fix X Position of 3-Win Match Cursor

.org 0x80119440
.dh ((SCREEN_W/2)+20) //Fix X Position of 5-Win Match Cursor

.org 0x80119444
.dh ((SCREEN_W/2)+20) //Fix X Position of 7-Win Match Cursor

.org 0x80119454
.dh ((SCREEN_W/2)+20) //Fix X Position of 4-Player Game Cursor

.org 0x80119458
.dh ((SCREEN_W/2)+20) //Fix X Position of 2 vs 2 Game Cursor

.org 0x8011945C
.dh ((SCREEN_W/2)+20) //Fix X Position of 1 vs 3 Game Cursor

.org 0x80119460
.dh ((SCREEN_W/2)+20) //Fix X Position of Battle Game Cursor

.org 0x80119464
.dh ((SCREEN_W/2)+20) //Fix X Position of Duel Game Cursor

.org 0x801195B0
.dh ((SCREEN_W/2)-63) //Fix X Position of Game Guy Cursor in Minigame Play

.org 0x801195B4
.dh (SCREEN_W/2) //Fix X Position of Game Guy Exit Cursor in Minigame Play

.org 0x80119F2E
.dh ((SCREEN_W/2)+20) //Fix X Position of Game Winner List

.org 0x8011A2CA
.dh ((SCREEN_W/2)+24) //Fix X Position of Game Guy Minigame Box

.headersize 0x801059A0-0x481970 //Chance Time Segment

.org 0x80105B88
li.u a1, ((SCREEN_W_FLOAT/2)-56) //Fix Scissor Left of Wheel in Chance Time

.org 0x80105B90
li.u a3, ((SCREEN_W_FLOAT/2)+56) //Fix Scissor Right of Wheel in Chance Time

.org 0x80105BB4
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Chance Time

.org 0x80105BCC
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Chance Time

.org 0x80105BD8
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Chance Time

.org 0x80106274
addiu a1, r0, (SCREEN_W/2) //Fix Change Time Bottom Layer X Position

.org 0x801062B4
addiu a1, r0, (SCREEN_W/2) //Fix Change Time Top Layer X Position

.org 0x8010BD9C
addiu a1, r0, (SCREEN_W/2) //Fix Chance Time Logo X Position

.org 0x8010C784
addiu v0, r0, ((SCREEN_W/2)-86) //Fix Chance Time Platform X Position

.org 0x8010C7D0
addiu a1, r0, ((SCREEN_W/2)+1) //Fix Chance Time Arrow X Position

.org 0x8010C888
addiu v0, r0, ((SCREEN_W/2)-86) //Fix Chance Time Platform Resting X Position

.org 0x8010C8A0
addiu a1, r0, ((SCREEN_W/2)+1) //Fix Chance Time Resting Arrow X Position

.org 0x8010DE90
addiu a0, r0, ((SCREEN_W/2)-60) //Fix Chance Time Toad Window X Position

.org 0x8010ECAC
li.u at, ((SCREEN_W_FLOAT-150)/20) //Fix Speed of Chance Time Coins

.headersize 0x801059A0-0x48BE30 //Board Story Board Stamp Segment

.org 0x80105AA0
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Board Stamp

.org 0x80105AAC
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Board Stamp

.org 0x80105E38
addiu a1, r0, (SCREEN_W/2) //Fix Board Stamp Background X Position

.org 0x80106050
addiu a1, r0, (SCREEN_W/2) //Fix Board Stamp Page X Position

.org 0x801060B4
addiu a1, a1, ((SCREEN_W/2)-112) //Fix Board Stamp Stamp Offset

.org 0x8010616C
addiu v0, v0, ((SCREEN_W/2)-112) //Fix Board Stamp Stamp Offset

.org 0x80106298
addiu a1, r0, (SCREEN_W/2) //Fix Board Stamp Filter X Position

.org 0x801062AC
li.u a1, (SCREEN_W_FLOAT/8) //Fix Board Stamp Filter X Size

.org 0x8010698C
addiu a0, r0, (SCREEN_W/2) //Fix Board Stamp Window X Position

.headersize 0x801059A0-0x49BD40 //Board Story Victory Segment

.org 0x80105A90
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Board Story Victory

.org 0x80105A9C
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Board Story Victory

.org 0x8010601C
addiu a0, r0, (SCREEN_W/2) //Fix Board Story Victory Window X Position

.org 0x801063E8
addiu a1, r0, (SCREEN_W/2) //Fix Board Story Victory Background X Position

.org 0x80106508
addiu a1, r0, (SCREEN_W/2) //Fix Board Story Victory Stamp Background X Position

.org 0x8010656C
addiu a1, a1, ((SCREEN_W/2)-112) //Fix Board Story Victory Stamp Offset

.org 0x80106624
addiu v0, v0, ((SCREEN_W/2)-112) //Fix Board Story Victory Stamp Offset

.org 0x80106750
addiu a0, r0, (SCREEN_W/2) //Fix Board Story Victory Stamp Filter X Position

.org 0x80106764
li.u a1, (SCREEN_W_FLOAT/8) //Fix Board Story Victory Stamp Filter X Size

.headersize 0x801059A0-0x4B29E0 //Board Story Lose Segment

.org 0x80105A90
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Board Story Lose

.org 0x80105A9C
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Board Story Lose

.org 0x80105FB4
addiu a0, r0, (SCREEN_W/2) //Fix Board Story Lose Window X Position

.org 0x80106378
addiu a1, r0, (SCREEN_W/2) //Fix Board Story Lose Background X Position

.org 0x80106498
addiu a1, r0, (SCREEN_W/2) //Fix Board Story Lose Stamp Background X Position

.org 0x801064FC
addiu a1, a1, ((SCREEN_W/2)-112) //Fix Board Story Lose Stamp Offset

.org 0x801065B4
addiu v0, v0, ((SCREEN_W/2)-112) //Fix Board Story Lose Stamp Offset

.org 0x801066E0
addiu a1, r0, (SCREEN_W/2) //Fix Board Story Lose Stamp Filter X Position

.org 0x801066F4
li.u a1, (SCREEN_W_FLOAT/8) //Fix Board Story Lose Stamp Filter X Size

.headersize 0x801059A0-0x4C2BD0 //Board Story Ending Segment

.org 0x80105AA0
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Board Story Lose

.org 0x80105AAC
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Board Story Lose

.org 0x80105F78
addiu a1, r0, (SCREEN_W/2) //Fix Board Story Ending Background X Position

.org 0x80106198
addiu a1, r0, (SCREEN_W/2) //Fix Board Story Ending Stamp Background X Position

.org 0x801061FC
addiu a1, a1, ((SCREEN_W/2)-112) //Fix Board Story Ending Stamp Offset

.org 0x801062B4
addiu v0, v0, ((SCREEN_W/2)-112) //Fix Board Story Ending Stamp Offset

.org 0x801063F0
addiu a1, r0, (SCREEN_W/2) //Fix Board Story Ending Stamp Filter X Position

.org 0x80106404
li.u a1, (SCREEN_W_FLOAT/8) //Fix Board Story Ending Stamp Filter X Size

.org 0x80106C18
addiu a0, r0, (SCREEN_W/2) //Fix Board Story Ending Window X Position

.org 0x8010ECC4
addiu a1, a1, ((SCREEN_W/2)-80) //Fix Board Story Ending Glow Background X Position

.org 0x8010EEB0
addiu a1, r0, (SCREEN_W/2) //Fix Board Story Ending Background X Position

.org 0x80111BA4
.dh ((SCREEN_W/2)-13) //Fix X Position of Ending Sprite 1

.org 0x80111BA8
.dh ((SCREEN_W/2)-25) //Fix X Position of Ending Sprite 2

.org 0x80111BAC
.dh ((SCREEN_W/2)-34) //Fix X Position of Ending Sprite 3

.org 0x80111BB0
.dh ((SCREEN_W/2)+26) //Fix X Position of Ending Sprite 4

.org 0x80111BB4
.dh ((SCREEN_W/2)+15) //Fix X Position of Ending Sprite 5

.org 0x80111BB8
.dh ((SCREEN_W/2)+14) //Fix X Position of Ending Sprite 6

.org 0x80111BBC
.dh ((SCREEN_W/2)+1) //Fix X Position of Ending Sprite 7

.org 0x80111BC0
.dh ((SCREEN_W/2)-6) //Fix X Position of Ending Sprite 8

.org 0x80111BC4
.dh ((SCREEN_W/2)-21) //Fix X Position of Ending Sprite 9

.org 0x80111BC8
.dh ((SCREEN_W/2)+33) //Fix X Position of Ending Sprite 10

.org 0x80111BCC
.dh ((SCREEN_W/2)+29) //Fix X Position of Ending Sprite 11

.org 0x80111BD0
.dh ((SCREEN_W/2)+13) //Fix X Position of Ending Sprite 12

.org 0x80111BD4
.dh ((SCREEN_W/2)+7) //Fix X Position of Ending Sprite 13

.org 0x80111BD8
.dh ((SCREEN_W/2)+55) //Fix X Position of Ending Sprite 14

.org 0x80111BDC
.dh ((SCREEN_W/2)+46) //Fix X Position of Ending Sprite 15

.org 0x80111BE0
.dh ((SCREEN_W/2)+28) //Fix X Position of Ending Sprite 16

.org 0x80111BE4
.dh ((SCREEN_W/2)+69) //Fix X Position of Ending Sprite 17

.org 0x80111BE8
.dh ((SCREEN_W/2)+61) //Fix X Position of Ending Sprite 18

.org 0x80111BEC
.dh ((SCREEN_W/2)+42) //Fix X Position of Ending Sprite 19

.org 0x80111BF0
.dh ((SCREEN_W/2)+86) //Fix X Position of Ending Sprite 20

.org 0x80111BF4
.dh ((SCREEN_W/2)+76) //Fix X Position of Ending Sprite 21

.org 0x80111BF8
.dh ((SCREEN_W/2)+65) //Fix X Position of Ending Sprite 22

.org 0x801120F4
.dh ((SCREEN_W/2)-135) //Fix X Position of Mario Text for Winner
.dh ((SCREEN_W/2)-62) //Fix X Position of Winner Text for Mario
.dh ((SCREEN_W/2)-135) //Fix X Position of Luigi Text for Winner
.dh ((SCREEN_W/2)-66) //Fix X Position of Winner Text for Luigi
.dh ((SCREEN_W/2)-135) //Fix X Position of Peach Text for Winner
.dh ((SCREEN_W/2)-60) //Fix X Position of Winner Text for Peach
.dh ((SCREEN_W/2)-135) //Fix X Position of Yoshi Text for Winner
.dh ((SCREEN_W/2)-63) //Fix X Position of Winner Text for Yoshi
.dh ((SCREEN_W/2)-135) //Fix X Position of Wario Text for Winner
.dh ((SCREEN_W/2)-62) //Fix X Position of Winner Text for Wario
.dh ((SCREEN_W/2)-135) //Fix X Position of DK Text for Winner
.dh ((SCREEN_W/2)-79) //Fix X Position of Winner Text for DK
.dh ((SCREEN_W/2)-135) //Fix X Position of Waluigi Text for Winner
.dh ((SCREEN_W/2)-62) //Fix X Position of Winner Text for Waluigi
.dh ((SCREEN_W/2)-135) //Fix X Position of Daisy Text for Winner
.dh ((SCREEN_W/2)-62) //Fix X Position of Winner Text for Daisy

.headersize 0x801059A0-0x4CF350 //Board Story Duel Stamp Segment

.org 0x801059EC
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width in Board Story Lose

.org 0x801059F8
li.u at, (SCREEN_W_FLOAT*2) //Fix Viewport Width in Board Story Lose

.org 0x80105E6C
addiu a1, r0, (SCREEN_W/2) //Fix Board Story Ending Background X Position

.org 0x80106084
addiu a1, r0, (SCREEN_W/2) //Fix Board Story Ending Stamp Background X Position

.org 0x801060E8
addiu a1, a1, ((SCREEN_W/2)-112) //Fix Board Story Ending Stamp Offset

.org 0x801061A0
addiu v0, v0, ((SCREEN_W/2)-112) //Fix Board Story Ending Stamp Offset

.org 0x801062CC
addiu a1, r0, (SCREEN_W/2) //Fix Board Story Ending Stamp Filter X Position

.org 0x801062E0
li.u a1, (SCREEN_W_FLOAT/8) //Fix Board Story Ending Stamp Filter X Size

.org 0x801069C0
addiu a0, r0, (SCREEN_W/2) //Fix Board Story Ending Window X Position

.headersize 0x801059A0-0x4DEB60 //Minigame Instructions Segment

.org 0x80105B78
li.u a3, SCREEN_W_FLOAT //Fix Width of Scissor for Minigame Instructions

.org 0x80105B84
li.u at, (SCREEN_W_FLOAT*2) //Fix Width of Viewport for Minigame Instructions

.org 0x801063CC
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Minigame Instructions Background

.org 0x8010BA90
addiu a0, r0, ((SCREEN_W/2)-88) //Fix X Position of Tumble Window

.org 0x8010BC10
addiu a0, r0, ((SCREEN_W/2)-88) //Fix X Position of Battle Tumble Window

.org 0x8010BE98
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Minigame Name Bar

.org 0x8010BEB8
addiu a1, r0, (SCREEN_W/2) //Fix Initial X Position of Minigame Name Bar

.org 0x8010BEC4
addiu a0, r0, (SCREEN_W/2) //Fix Initial X Position of Minigame Name Bar

.org 0x8010BED8
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Minigame Coin Battle Bar

.org 0x8010BFD4
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Minigame Coin Battle Bar

.org 0x8010BFE0
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Minigame Name

.org 0x8010BFFC
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Minigame Coin Battle Bar

.org 0x8010C06C
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Minigame Name

.org 0x8010C088
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Minigame Coin Battle Bar

.org 0x8010CF50
li.u at, ((SCREEN_W_FLOAT/2)+56) //Fix X Position of PRACTICE Text

.org 0x8010CF80
addiu a2, r0, ((SCREEN_W/2)+56) //Fix X Position of PRACTICE Text Sprite

.org 0x8010CFA8
li.u at, ((SCREEN_W_FLOAT/2)+56) //Fix X Position of PRACTICE Text

.org 0x8010CFDC
addiu a2, r0, ((SCREEN_W/2)+56) //Fix X Position of PRACTICE Text Sprite

.org 0x8010DAFA
.dh ((SCREEN_W/2)-65) //Fix X Position of Minigame Coin Digit 1

.org 0x8010DAFE
.dh ((SCREEN_W/2)-55) //Fix X Position of Minigame Coin Digit 2

.org 0x8010DB02
.dh ((SCREEN_W/2)-45) //Fix X Position of Minigame Coin Digit 3

.headersize 0x801059A0-0x4E6DC0 //Board Minigame Results Segment

.org 0x801059E8
li.u at, (SCREEN_W_FLOAT*2) //Fix Width of Viewport for Board Minigame Results

.org 0x80105A14
li.u a3, SCREEN_W_FLOAT //Fix Width of Scissor for Board Minigame Results

.org 0x80107170
li v1, (0xF6000000|((SCREEN_W-1) << 14)|((SCREEN_H-1) << 2)) //Fix Background Rectangle in Board Minigame Results

.org 0x801071BC
addiu a1, r0, (SCREEN_W/2) //Fix Board Minigame Results Logo Shadow

.org 0x80107218
addiu a1, r0, (SCREEN_W/2) //Fix Board Minigame Results Logo

.headersize 0x801059A0-0x4EC1B0 //Game Guy Minigame Results Segment

.org 0x80105AA0
li.u at, (SCREEN_W_FLOAT*2) //Fix Width of Viewport for Game Guy Minigame Results

.org 0x80105ACC
li.u a3, SCREEN_W_FLOAT //Fix Width of Scissor for Game Guy Minigame Results

.org 0x801062E4
addiu a1, r0, (SCREEN_W/2) //Fix Game Guy Minigame Results Background Position

.org 0x801083D4
ori s5, s5, ((SCREEN_W/2)-1) //Fix Tile Pitch for Game Guy Filter
lui s4, hi(0xF5880000|(((SCREEN_W+15)/16) << 9)) //Fix Tile Load for Game Guy Filter
addiu s4, s4, lo(0xF5880000|(((SCREEN_W+15)/16) << 9)) //Fix Tile Load for Game Guy Filter

.org 0x801083EC
lui s0, hi(0x07000000|(((SCREEN_W*2)-2) << 12)) //Fix Tile Load for Game Guy Filter
addiu s0, s0, lo(0x07000000|(((SCREEN_W*2)-2) << 12)) //Fix Tile Load for Game Guy Filter

.org 0x801083F8
lui t8, hi(0xF5800000|(((SCREEN_W+15)/16) << 9)) //Fix Tile Load for Game Guy Filter
addiu t8, t8, lo(0xF5800000|(((SCREEN_W+15)/16) << 9)) //Fix Tile Load for Game Guy Filter

.org 0x80108404
lui t6, hi((SCREEN_W-1) << 14) //Fix Tile Coordindates for Game Guy Filter
addiu t6, t6, lo((SCREEN_W-1) << 14) //Fix Tile Coordindates for Game Guy Filter
lui t5, hi(((SCREEN_W-1) << 14)|0x28) //Fix Tile Read Coordindates for Game Guy Filter
addiu t5, t5, lo(((SCREEN_W-1) << 14)|0x28) //Fix Tile Read Coordindates for Game Guy Filter

.org 0x80108414
lui t4, (0xE400|(SCREEN_W/4)) //Fix Tile Coordindates for Game Guy Filter

.org 0x80108768
addiu a1, r0, ((SCREEN_W/2)+9) //Fix Game Guy Minigame Results Box Shadow X Position

.org 0x8010877C
addiu s3, r0, ((SCREEN_W/2)-68) //Fix Game Guy Minigame Results Coin Score X Position

.org 0x801087A8
addiu a1, r0, ((SCREEN_W/2)+9) //Fix Game Guy Minigame Results Box X Position

.org 0x801087E8
addiu a1, r0, ((SCREEN_W/2)-84) //Fix Game Guy Minigame Results Coin X Position

.headersize 0x801059A0-0x4F01F0 //Duel Minigame Results Segment

.org 0x801069E0
li.u a1, -((SCREEN_W_FLOAT*450)/320) //Fix X Position of P1 in Duel Minigame Results

.org 0x80106A10
li.u a1, -((SCREEN_W_FLOAT*450)/320) //Fix X Position of P1 in Duel Minigame Results

.org 0x80106DE8
li.u at, -((SCREEN_W_FLOAT*450)/320) //Fix X Position of P1 in Duel Minigame Results

.org 0x80106FE8
li.u a1, -((SCREEN_W_FLOAT*450)/320) //Fix X Position of P2 in Duel Minigame Results

.org 0x8010701C
li.u a1, -((SCREEN_W_FLOAT*450)/320) //Fix X Position of P2 in Duel Minigame Results

.org 0x80107314
li.u at, ((SCREEN_W_FLOAT*450)/320) //Fix X Position of P2 in Duel Minigame Results

.org 0x80108798
li.u at, ((SCREEN_W_FLOAT*700)/320) //Fix X Position of Tumble in Duel Minigame Results

.org 0x801087B0
li.u at, ((SCREEN_W_FLOAT*700)/320) //Fix X Position of Tumble in Duel Minigame Results

.org 0x80108860
li.u at, ((SCREEN_W_FLOAT*700)/320) //Fix X Position of Tumble in Duel Minigame Results

.org 0x80108EA0
.dh ((SCREEN_W/2)-130) //Fix X Position of P1 HUD in Duel Results

.org 0x80108EA4
.dh ((SCREEN_W/2)+34) //Fix X Position of P2 HUD in Duel Results

.headersize 0x801059A0-0x4F3780 //Battle Minigame Results Segment

.org 0x80105A88
li.u a1, ((SCREEN_W_FLOAT/2)-160) //Fix Left of Scissor for Battle Minigame Results
li.u a3, ((SCREEN_W_FLOAT/2)+160) //Fix Right of Scissor for Battle Minigame Results

.org 0x80105A94
addu a2, r0, r0 //Fix Top of Scissor for Battle Minigame Results
li.u at, (SCREEN_W_FLOAT*2) //Fix Width of Viewport for Battle Minigame Results

.org 0x8010608C
li v1, (0xF6000000|((SCREEN_W-1) << 14)|((SCREEN_H-1) << 2)) //Fix Background Rectangle in Board Minigame Results

.headersize 0x801059A0-0x4F69F0 //Message Test Segment

.org 0x80105C14
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Message Test Bank Window

.org 0x80105E28
addiu a1, r0, ((SCREEN_W/2)-110) //Fix X Position of Message Test Message

.org 0x80105E5C
addiu a1, r0, ((SCREEN_W/2)-110) //Fix X Position of Message Test Message

.headersize 0x801059A0-0x4F7E90 //Mode Select Segment

.org 0x80105A8C
li.u a3, SCREEN_W_FLOAT //Fix Width of Scissor for Mode Select

.org 0x80105A98
li.u at, (SCREEN_W_FLOAT*2) //Fix Width of Viewport for Mode Select

.org 0x80108070
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Textboxes

.org 0x80108224
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Textboxes

.org 0x80108270
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Textboxes

.org 0x801082CC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Textboxes

.org 0x801083D8
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Textboxes

.org 0x801084CC
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Textboxes

.org 0x8010BC74
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Textboxes

.org 0x8010C0B8
addiu s4, r0, ((SCREEN_W/2)-80) //X Position of Battle Royal Map Data

.org 0x8010C0D4
addiu a1, r0, ((SCREEN_W/2)-80) //X Position of Battle Royal Map Box

.org 0x8010C46C
addiu s4, r0, ((SCREEN_W/2)+80) //X Position of Duel Characters

.org 0x8010C484
addiu a1, r0, ((SCREEN_W/2)+80) //X Position of Duel Map Box

.org 0x8010C580
addiu s4, r0, ((SCREEN_W/2)+80) //X Position of Duel Max Turns

.org 0x8010C5A4
addiu a1, r0, ((SCREEN_W/2)+80) //X Position of Duel Map Sprite

.org 0x8010C5E8
addiu a1, r0, ((SCREEN_W/2)+80) //X Position of Duel Map Name Sprite

.org 0x8010C638
addiu a1, r0, ((SCREEN_W/2)+56) //X Position of Duel Map Turn Sprite

.org 0x8010C668
addiu a1, r0, ((SCREEN_W/2)+88) //X Position of Duel Map Turn Digit 1

.org 0x8010C6E0
addiu a1, r0, ((SCREEN_W/2)+80) //X Position of Duel Map Turn Digit 2

.org 0x8010D62C
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Textboxes

.org 0x8010E0A8
addiu v0, r0, ((SCREEN_W/2)-48) //Fix X Position of Save Mode Select Left Cursor
addiu v0, r0, ((SCREEN_W/2)+112) //Fix X Position of Save Mode Select Right Cursor

.headersize 0x801059A0-0x501C00 //Star Lift Segment

.org 0x8010B5EC
addiu a0, r0, ((SCREEN_W/2)+90) //Fix X Position of Star Lift Speaker

.org 0x8010B698
addiu a0, r0, ((SCREEN_W/2)+90) //Fix X Position of Star Lift Speaker

.org 0x8010EDC4
addiu a1, r0, ((SCREEN_W/2)+103) //Fix X Position of Board Setup Logo

.org 0x8010FBE8
addiu a0, r0, ((SCREEN_W/2)-96) //Fix X Position of Left Player Count Arrow
addiu a1, r0, ((SCREEN_W/2)+96) //Fix X Position of Right Player Count Arrow

.org 0x801139CC
addiu a0, r0, ((SCREEN_W/2)-64) //Fix X Position of Left Handicap Arrow
addiu a1, r0, ((SCREEN_W/2)+64) //Fix X Position of Right Handicap Arrow

.org 0x80114004
addiu a0, r0, ((SCREEN_W/2)-96) //Fix X Position of Left Board Select Arrow
addiu a1, r0, ((SCREEN_W/2)+96) //Fix X Position of Right Board Select Arrow

.org 0x801142D0
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Duel Setup Logo

.org 0x80114848
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Board Setup Logo

.org 0x80114B7C
addiu a0, r0, ((SCREEN_W/2)-64) //Fix X Position of Left Handicap Star Arrow
addiu a1, r0, ((SCREEN_W/2)+64) //Fix X Position of Right Handicap Star Arrow

.org 0x801160FC
addiu a0, r0, ((SCREEN_W/2)-64) //Fix X Position of Left Turn Number Arrow
addiu a1, r0, ((SCREEN_W/2)+64) //Fix X Position of Right Turn Number Arrow

.org 0x80116A00
addiu a0, r0, ((SCREEN_W/2)-96) //Fix X Position of Left Duel Player Count Arrow
addiu a1, r0, ((SCREEN_W/2)+96) //Fix X Position of Right Duel Player Count Arrow

.org 0x8011713C
addiu a0, r0, ((SCREEN_W/2)-64) //Fix X Position of Left Skill Level Arrow
addiu a1, r0, ((SCREEN_W/2)+64) //Fix X Position of Right Skill Level Arrow

.org 0x80118E9C
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Story Mode Setup Background

.org 0x80118EA8
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Story Mode Setup Text Window

.org 0x80119B60
.dh ((SCREEN_W/2)-24) //Fix X Position of Partner Window

.org 0x80119B64
.dh ((SCREEN_W/2)-79) //Fix X Position of Power Partner Icon

.org 0x80119B68
.dh ((SCREEN_W/2)-79) //Fix X Position of Health Partner Icon

.org 0x80119B6C
.dh ((SCREEN_W/2)-79) //Fix X Position of Cost Partner Icon

.org 0x80119B70
.dh ((SCREEN_W/2)-69) //Fix X Position of Power Partner Number

.org 0x80119B74
.dh ((SCREEN_W/2)-69) //Fix X Position of Health Partner Number

.org 0x80119B78
.dh ((SCREEN_W/2)-69) //Fix X Position of Cost Partner Number

.org 0x80119B7C
.dh ((SCREEN_W/2)-107) //Fix X Position of Partner Icon

.org 0x80119B80
.dh ((SCREEN_W/2)-24) //Fix X Position of Partner Window 2

.org 0x80119B84
.dh ((SCREEN_W/2)-24) //Fix X Position of Partner Window 3

.org 0x80119B88
.dh ((SCREEN_W/2)-24) //Fix X Position of Partner Window 4

.org 0x80119B8C
.dh ((SCREEN_W/2)-24) //Fix X Position of Partner Window 5

.org 0x80119B90
.dh ((SCREEN_W/2)-66) //Fix X Position of Partner Name Window

.org 0x80119B98
.dh ((SCREEN_W/2)-52) //Fix X Position of Partner Name Window

.org 0x80119DE8
.dh ((SCREEN_W/2)-62) //Fix X Position of All Equal Cursor

.org 0x80119DEC
.dh ((SCREEN_W/2)-62) //Fix X Position of Individual Cursor

.org 0x80119DF0
.dh ((SCREEN_W/2)-52) //Fix X Position of Easy Cursor

.org 0x80119DF4
.dh ((SCREEN_W/2)+5) //Fix X Position of Normal Cursor

.org 0x80119DF8
.dh ((SCREEN_W/2)+62) //Fix X Position of Hard Cursor

.org 0x80119DFC
.dh ((SCREEN_W/2)-62) //Fix X Position of Easy Cursor

.org 0x80119E00
.dh ((SCREEN_W/2)-17) //Fix X Position of Normal Cursor

.org 0x80119E04
.dh ((SCREEN_W/2)+28) //Fix X Position of Hard Cursor

.org 0x80119E08
.dh ((SCREEN_W/2)+73) //Fix X Position of Super Hard Cursor

.org 0x8011A0DC
.float -((SCREEN_W_FLOAT*1000)/320) //Fix Start X Position for Story Mode Player Select

.org 0x8011A10C
.float ((SCREEN_W_FLOAT*1100)/320) //Fix Start X Position for Story Mode Difficulty Select

.org 0x8011A514
.dh ((SCREEN_W/2)-70) //Fix X Position of Mario Cursor

.org 0x8011A518
.dh ((SCREEN_W/2)-30) //Fix X Position of Luigi Cursor

.org 0x8011A51C
.dh ((SCREEN_W/2)+10) //Fix X Position of Peach Cursor

.org 0x8011A520
.dh ((SCREEN_W/2)-70) //Fix X Position of Yoshi Cursor

.org 0x8011A524
.dh ((SCREEN_W/2)-30) //Fix X Position of Peach Cursor

.org 0x8011A528
.dh ((SCREEN_W/2)+10) //Fix X Position of DK Cursor

.org 0x8011A52C
.dh ((SCREEN_W/2)-14) //Fix X Position of Easy Difficulty Cursor

.org 0x8011A530
.dh ((SCREEN_W/2)-14) //Fix X Position of Normal Difficulty Cursor

.org 0x8011A534
.dh ((SCREEN_W/2)-14) //Fix X Position of Hard Difficulty Cursor

.org 0x8011A538
.dh ((SCREEN_W/2)-14) //Fix X Position of Super Hard Difficulty Cursor

.org 0x8011A53C
.dh ((SCREEN_W/2)-36) //Fix X Position of All Minigames Cursor

.org 0x8011A540
.dh ((SCREEN_W/2)+34) //Fix X Position of Easy Minigames Cursor

.org 0x8011A838
.double (SCREEN_W_FLOAT/SCREEN_H) //Fix X Scale of Story Mode Setup Sprites

.headersize 0x801059A0-0x516AE0 //File Select Segment

.org 0x80105A8C
li.u a3, SCREEN_W_FLOAT //Fix Scissor Width of File Select 3D

.org 0x80105A98
li.u at, SCREEN_W_FLOAT*2 //Fix Viewport Width of File Select 3D

.org 0x80105DBC
addiu a1, r0, (SCREEN_W/2) //Fix Default X Position of File Select 2D

.org 0x80106A94
addiu a1, r0, (SCREEN_W/2) //Fix X Position of File Select Background

.org 0x801086F0
li.u a1, (SCREEN_W_FLOAT/2) //Fix File Select Save Window Position

.org 0x8010898C
li.u a1, (SCREEN_W_FLOAT+32) //Fix Start X Position of File Options

.org 0x801089A4
li.u a1, (SCREEN_W_FLOAT-96) //Fix End X Position of File Options

.org 0x80108B18
li.u a1, (SCREEN_W_FLOAT+32) //Fix Start X Position of File Options

.org 0x80108B30
li.u a1, (SCREEN_W_FLOAT-96) //Fix End X Position of File Options

.org 0x80108C78
li.u at, (SCREEN_W_FLOAT/2) //Fix File Select Window Slide In

.org 0x80108DB4
li.u at, (SCREEN_W_FLOAT/2) //Fix File Select Window Slide Out

.org 0x801091C0
li.u a1, (SCREEN_W_FLOAT/2) //Fix File Select Save Window Position

.org 0x8010A99C
addiu a1, a1, ((SCREEN_W/2)-56) //Fix X Position of File Select Cursor

.org 0x8010ACD0
addiu a1, r0, (SCREEN_W/2) //Fix X Position of File Select Alphabet 1

.org 0x8010AD04
addiu a1, r0, (SCREEN_W/2) //Fix X Position of File Select Alphabet 2

.org 0x8010AD38
addiu a1, r0, (SCREEN_W/2) //Fix X Position of File Select Alphabet 3

.org 0x8010AEC8
li.u s2, ((SCREEN_W_FLOAT/2)+8) //Fix X Position of Back Button Sprite

.org 0x8010AF2C
li.u s3, ((SCREEN_W_FLOAT/2)+42) //Fix X Position of Done Button Sprite

.org 0x8010B274
addiu a2, r0, ((SCREEN_W/2)-56) //Fix X Position of File Select Name Window

.org 0x8010B2F0
addiu a1, r0, ((SCREEN_W/2)-25) //Fix X Position of File Select Name Box

.org 0x8010B5D8
addiu v1, r0, ((SCREEN_W/2)-113) //Fix X Position of Letter Cursors

.org 0x8010D180
addiu s3, r0, ((SCREEN_W/2)-80) //Fix X Position of Story Mode Data

.org 0x8010D19C
addiu a1, r0, ((SCREEN_W/2)-80) //Fix X Position of Story Mode Window

.org 0x8010D1DC
addiu a1, r0, ((SCREEN_W/2)-80) //Fix X Position of Story Mode Window

.org 0x8010D2A8
addiu a1, r0, ((SCREEN_W/2)-80) //Fix X Position of Story Mode Window

.org 0x8010D248
addiu a1, r0, ((SCREEN_W/2)-80) //Fix X Position of Story Mode Window

.org 0x8010D684
addiu s3, r0, ((SCREEN_W/2)+80) //Fix X Position of Party Mode Data

.org 0x8010D6A0
addiu a1, r0, ((SCREEN_W/2)+80) //Fix X Position of Party Mode Window

.org 0x8010D6D4
addiu a1, r0, ((SCREEN_W/2)+80) //Fix X Position of Party Mode Window

.org 0x8010D730
addiu a1, r0, ((SCREEN_W/2)+80) //Fix X Position of Party Mode Window

.org 0x8010D790
addiu a1, r0, ((SCREEN_W/2)+80) //Fix X Position of Party Mode Window

.org 0x8010D7E8
addiu a1, r0, ((SCREEN_W/2)+80) //Fix X Position of Party Mode Window

.org 0x8010D840
addiu a1, r0, ((SCREEN_W/2)+80) //Fix X Position of Party Mode Window

.org 0x8010F210
addiu a2, r0, (SCREEN_W/2) //Fix X Position of File Select Options

.org 0x801127D4
.dw (SCREEN_W-110) //Fix X Position of Copy Cursor

.org 0x801127DC
.dw (SCREEN_W-62) //Fix X Position of Erase Cursor

.org 0x80112DF8
.float ((SCREEN_W_FLOAT/2)-80) //Fix X Position of Story Cursor

.org 0x80112E00
.float ((SCREEN_W_FLOAT/2)+80) //Fix X Position of Party Cursor

.headersize 0x801059A0-0x523FD0 //Opening Segment

.org 0x80105A30
li.u a3, SCREEN_W_FLOAT //Scissor Width of Title Screen Camera 1

.org 0x80105A3C
li.u at, (SCREEN_W_FLOAT*2) //Viewport Width of Title Screen Cameras

.org 0x80105B00
li.u a3, SCREEN_W_FLOAT //Scissor Width of Title Screen Camera 2

.org 0x801063BC
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Title Screen Elements

.org 0x80108130
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Opening Windows

.org 0x8010FA1C
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Stamp Card

.org 0x8010FAE4
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Stamp Card

.org 0x801122E0
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Title Logo Fade

.org 0x8011231C
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Title Logo Background

.org 0x80112358
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Title Logo

.org 0x801123A4
addiu a1, r0, (SCREEN_W/2) //Fix X Position of No Controller Warning

.org 0x80112408
addiu a1, r0, ((SCREEN_W/2)-2) //Fix X Position of Press Start

.org 0x80112454
addiu a1, r0, ((SCREEN_W/2)-2) //Fix X Position of Press Start Shadow

.org 0x80114A74
addiu a1, r0, (SCREEN_W/2) //Fix X Position of No Controller Warning

.org 0x8011444C
li v0, (0xF6000000|(SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Color Fades

.org 0x80114BB8
.float SCREEN_W_FLOAT*2 //Viewport Width in Opening

.org 0x80114BC4
.float SCREEN_W_FLOAT*2 //Viewport X Position in Opening

.org 0x80114BD8
.float (SCREEN_W_FLOAT-8) //Scissor Width in Opening

.org 0x80114CE4
.dw ((SCREEN_W/2)-140) //Fix X Position of Star 1 in Opening

.org 0x80114CF4
.dw ((SCREEN_W/2)-110) //Fix X Position of Star 2 in Opening

.org 0x80114D04
.dw ((SCREEN_W/2)-130) //Fix X Position of Star 3 in Opening

.org 0x80114D14
.dw ((SCREEN_W/2)-85) //Fix X Position of Star 4 in Opening

.org 0x80114D24
.dw ((SCREEN_W/2)-70) //Fix X Position of Star 5 in Opening

.org 0x80114D34
.dw ((SCREEN_W/2)-40) //Fix X Position of Star 6 in Opening

.org 0x80114D44
.dw (SCREEN_W/2) //Fix X Position of Star 7 in Opening

.org 0x80114D54
.dw ((SCREEN_W/2)+40) //Fix X Position of Star 8 in Opening

.org 0x80114D64
.dw ((SCREEN_W/2)+60) //Fix X Position of Star 9 in Opening

.org 0x80114D74
.dw ((SCREEN_W/2)+80) //Fix X Position of Star 10 in Opening

.headersize 0x801059A0-0x5334D0 //Option Segment

.org 0x80105A30
li.u a3, SCREEN_W_FLOAT //Scissor Width of Option Camera 1

.org 0x80105A3C
li.u at, (SCREEN_W_FLOAT*2) //Viewport Width of Option Cameras

.org 0x80105B00
li.u a3, SCREEN_W_FLOAT //Scissor Width of Option Camera 2

.org 0x80109868
li.u at, (SCREEN_W_FLOAT/SCREEN_H) //Load Aspect Ratio Low Part
li.l at, (SCREEN_W_FLOAT/SCREEN_H) //Load Aspect Ratio High Part

.org 0x8010989C
li.u at, (SCREEN_W_FLOAT/2) //Fix 3D to 2D Scale in Options

.org 0x8010A8DC
addiu a3, r0, (SCREEN_W/2) //Fix X Position of Sound Menu Cursor

.org 0x8010A914
addiu a3, r0, ((SCREEN_W/2)+24) //Fix X Position of Sound Menu Center Mushroom Cursor
addiu a3, r0, ((SCREEN_W/2)+64) //Fix X Position of Sound Menu Right Mushroom Cursor

.org 0x8010A92C
addiu a3, r0, (SCREEN_W/2) //Fix X Position of Default Sound Menu Cursor

.org 0x8010BBCC
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Battle Royal Map Records

.org 0x8010BC40
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Duel Map Records

.org 0x8010BDF8
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Minigame Records

.org 0x8010F1D4
addiu a1, r0, (SCREEN_W-90) //Fix X Position of Music Window

.org 0x8010F1EC
addiu a1, r0, (SCREEN_W-150) //Fix X Position of Music Window Left Arrow

.org 0x8010F210
addiu a1, r0, (SCREEN_W-156) //Fix X Position of Music Window Track Name

.org 0x8010F3AC
addiu a1, r0, (SCREEN_W-140) //Fix X Position of Music Window Song List

.org 0x8010F494
addiu a1, r0, (SCREEN_W-130) //Fix X Position of Music Window Instructions

.org 0x8010F7E4
addiu a0, r0, (SCREEN_W-150) //Fix X Position of Cursor 1 in Music Window

.org 0x8010F7EC
addiu a2, r0, (SCREEN_W-150) //Fix X Position of Cursor 2 in Music Window

.org 0x8010F81C
addiu a0, r0, (SCREEN_W-150) //Fix X Position of Cursor 3 in Music Window

.org 0x801133D4
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Options Window

.headersize 0x801059A0-0x542220 //Credits Segment

.org 0x80106F58
addiu a2, r0, (SCREEN_W/2) //Fix X Position of Mario Party 3 Staff Text

.org 0x80107948
addiu a2, r0, SCREEN_W
divu s1, a2
mfhi a2
j 0x8010796C
nop

.org 0x80107C4C
addiu s4, r0, (SCREEN_W/2)
divu a1, s4
mfhi v0
srl a1, a1, 5
nop
divu a1, s4
mfhi v1
addu v1, v1, v0
j 0x80107C8C
nop

.org 0x80107CA8
addiu s4, r0, SCREEN_W
divu a1, s4
mfhi v0
j 0x80107CC8
nop

.org 0x80107FF4
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Credits Background

.org 0x801082A0
addiu a0, r0, (SCREEN_W/2) //Fix Range of Comets

.org 0x801082AC
addiu a0, r0, (SCREEN_W/2) //Fix Range of Comets

.org 0x8010C1C4
addiu v0, r0, (SCREEN_W/2) //Fix X Position of Credits Text

.org 0x8010DA18
addiu a1, r0, (SCREEN_W/2) //Fix X Position of End Board Background

.org 0x8010DC28
addiu s3, r0, (SCREEN_W-52) //Fix X Position of End Text

.org 0x801105C8
.dh (SCREEN_W/2) //Fix X Position of Credits Hills

.org 0x801105D0
.dh (SCREEN_W-32) //Fix X Position of Right Bush in Credits

.org 0x80110630
.float -(((SCREEN_W_FLOAT*549.75)/320)-147.75) //Fix Destination Star X Position

.org 0x80110648
.float -(((SCREEN_W_FLOAT*549.75)/320)-147.75) //Fix Star X Speed


.headersize 0x801059A0-0x54DD10 //Board Star Level Segment

.org 0x8010725C
addiu s4, r0, (SCREEN_W/2) //Fix X Position of Star Level Window

.org 0x8010731C
addiu a1, r0, (SCREEN_W/2) //Fix X Position of Star Level Castle Background

.org 0x80107364
li.u a1, (SCREEN_W_FLOAT/32) //Fix X Position of Star Level Castle Background

.org 0x8010A50C
addiu v0, r0, (SCREEN_W/2) //Fix X Position of Star Level Castle Background

.headersize 0x801059A0-0x552F50 //New Debug Menu Segment

.org 0x80105D90
addiu t0, r0, ((SCREEN_W+47)/48) //Number of Tiles in Row
divu s2, t0 //Execute Divide Instruction
nop //Two Instruction
nop //Delay for mflo/mfhi
mflo v1 //Get result
mfhi v0 //Get remainder
nop //Two Instructions
nop //Of Padding

.org 0x80105DDC
slti v0, s2, (5*((SCREEN_W+47)/48)) //Number of Tiles to Render

.org 0x80106AA4
addiu a0, r0, ((SCREEN_W/2)-96) //Fix X Position of Debug Menu List

.org 0x80106B34
addiu a0, r0, ((SCREEN_W/2)-32) //Fix X Position of Debug Menu Page Number

.org 0x80106B84
addiu a0, r0, ((SCREEN_W/2)-32) //Fix X Position of Debug Menu Game Mode

.org 0x80106BC0
addiu a1, r0, ((SCREEN_W/2)-100) //Fix X Position of Debug Menu Cursor

.org 0x80106E40
addiu a0, r0, ((SCREEN_W/2)-48) //Fix X Position of Debug Menu Option Text

.org 0x80106EBC
addiu a0, r0, ((SCREEN_W/2)-32) //Fix X Position of Debug Menu Map Number

.org 0x80106F20
addiu s2, v0, ((SCREEN_W/2)-120) //Fix X Position of Debug Menu Player Options

.org 0x80107870
addiu s2, s2, ((SCREEN_W/2)-120) //Fix X Position of Debug Menu Player Cursor

.org 0x801078CC
addiu s2, r0, ((SCREEN_W/2)-32) //Fix X Position of Debug Menu Map Cursor

.org 0x8010799C
addiu v1, r0, SCREEN_W //Fix X Position of Debug Menu Choice Name Shadow

.org 0x80107D5C
addiu v1, r0, SCREEN_W //Fix X Position of Debug Menu Choice Name

.org 0x801082B4
addiu a0, a0, ((SCREEN_W/2)-104) //Fix X Position of Debug Menu Blank Player Names

.org 0x801084A8
addiu a0, s3, ((SCREEN_W/2)-110) //Fix X Position of Debug Menu Player Names

.close