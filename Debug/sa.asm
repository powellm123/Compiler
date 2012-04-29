# FRAME					#main this 
START	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	LDR	R3	l107			# Main Storing 0 as This PTR
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# CALL					#main  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	main	
# QUIT					#  
	JMP	exit	
ERROR	STR	PC	OUTPUT
	TRP	1	
exit	TRP	0	
Debug	LDB	R0	nl
	STB	R0	OUTPUT
	TRP	3	
	SUB	R0	R0
	ADI	R0	25
	STR	R0	OUTPUT
	TRP	1	
	TRP	0	
nl	.BYT	10	
# FUNC					#F104  
Message()	ADI	SP	-276			# Allocates space on top of stack
# Math					#l115 l105 t195
	LDR	R3	l115
	LDR	R4	l105
	MUL	R4	R3			# DO Math Operation on l115 andl105
	MOV	R5	FP
	ADI	R5	-12
	STR	R4	R5
# NEW					#t195 t196 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
	MOV	R5	FP
	ADI	R5	-12
	LDB	R5	R5
	ADD	R3	R5
	STR	R3	FREE
# MOVE					#t196 V101 
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	0
	STR	R3	R4
# Math					#l107 l109 t197
	LDR	R3	l107
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l107 andl109
	MOV	R5	FP
	ADI	R5	-20
	STR	R4	R5
# Math					#V101 t197 R198
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-20
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt197
	MOV	R5	FP
	ADI	R5	-24
	STR	R4	R5
# MOVE					#l108 R198 
	LDB	R3	l108
	MOV	R4	FP
	ADI	R4	-24
	LDR	R4	R4
	STB	R3	R4
# Math					#l109 l109 t199
	LDR	R3	l109
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l109 andl109
	MOV	R5	FP
	ADI	R5	-28
	STR	R4	R5
# Math					#V101 t199 R200
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-28
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt199
	MOV	R5	FP
	ADI	R5	-32
	STR	R4	R5
# MOVE					#l110 R200 
	LDB	R3	l110
	MOV	R4	FP
	ADI	R4	-32
	LDR	R4	R4
	STB	R3	R4
# Math					#l111 l109 t201
	LDR	R3	l111
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l111 andl109
	MOV	R5	FP
	ADI	R5	-36
	STR	R4	R5
# Math					#V101 t201 R202
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-36
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt201
	MOV	R5	FP
	ADI	R5	-40
	STR	R4	R5
# MOVE					#l110 R202 
	LDB	R3	l110
	MOV	R4	FP
	ADI	R4	-40
	LDR	R4	R4
	STB	R3	R4
# Math					#l113 l109 t203
	LDR	R3	l113
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l113 andl109
	MOV	R5	FP
	ADI	R5	-44
	STR	R4	R5
# Math					#V101 t203 R204
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-44
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt203
	MOV	R5	FP
	ADI	R5	-48
	STR	R4	R5
# MOVE					#l114 R204 
	LDB	R3	l114
	MOV	R4	FP
	ADI	R4	-48
	LDR	R4	R4
	STB	R3	R4
# Math					#l115 l109 t205
	LDR	R3	l115
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l115 andl109
	MOV	R5	FP
	ADI	R5	-52
	STR	R4	R5
# Math					#V101 t205 R206
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-52
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt205
	MOV	R5	FP
	ADI	R5	-56
	STR	R4	R5
# MOVE					#l110 R206 
	LDB	R3	l110
	MOV	R4	FP
	ADI	R4	-56
	LDR	R4	R4
	STB	R3	R4
# Math					#l117 l109 t207
	LDR	R3	l117
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l117 andl109
	MOV	R5	FP
	ADI	R5	-60
	STR	R4	R5
# Math					#V101 t207 R208
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-60
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt207
	MOV	R5	FP
	ADI	R5	-64
	STR	R4	R5
# MOVE					#l118 R208 
	LDB	R3	l118
	MOV	R4	FP
	ADI	R4	-64
	LDR	R4	R4
	STB	R3	R4
# Math					#l119 l109 t209
	LDR	R3	l119
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l119 andl109
	MOV	R5	FP
	ADI	R5	-68
	STR	R4	R5
# Math					#V101 t209 R210
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-68
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt209
	MOV	R5	FP
	ADI	R5	-72
	STR	R4	R5
# MOVE					#l120 R210 
	LDB	R3	l120
	MOV	R4	FP
	ADI	R4	-72
	LDR	R4	R4
	STB	R3	R4
# Math					#l121 l109 t211
	LDR	R3	l121
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l121 andl109
	MOV	R5	FP
	ADI	R5	-76
	STR	R4	R5
# Math					#V101 t211 R212
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-76
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt211
	MOV	R5	FP
	ADI	R5	-80
	STR	R4	R5
# MOVE					#l122 R212 
	LDB	R3	l122
	MOV	R4	FP
	ADI	R4	-80
	LDR	R4	R4
	STB	R3	R4
# Math					#l123 l109 t213
	LDR	R3	l123
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l123 andl109
	MOV	R5	FP
	ADI	R5	-84
	STR	R4	R5
# Math					#V101 t213 R214
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-84
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt213
	MOV	R5	FP
	ADI	R5	-88
	STR	R4	R5
# MOVE					#l114 R214 
	LDB	R3	l114
	MOV	R4	FP
	ADI	R4	-88
	LDR	R4	R4
	STB	R3	R4
# Math					#l125 l109 t215
	LDR	R3	l125
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l125 andl109
	MOV	R5	FP
	ADI	R5	-92
	STR	R4	R5
# Math					#V101 t215 R216
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-92
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt215
	MOV	R5	FP
	ADI	R5	-96
	STR	R4	R5
# MOVE					#l126 R216 
	LDB	R3	l126
	MOV	R4	FP
	ADI	R4	-96
	LDR	R4	R4
	STB	R3	R4
# Math					#l127 l109 t217
	LDR	R3	l127
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l127 andl109
	MOV	R5	FP
	ADI	R5	-100
	STR	R4	R5
# Math					#V101 t217 R218
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-100
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt217
	MOV	R5	FP
	ADI	R5	-104
	STR	R4	R5
# MOVE					#l114 R218 
	LDB	R3	l114
	MOV	R4	FP
	ADI	R4	-104
	LDR	R4	R4
	STB	R3	R4
# Math					#l129 l109 t219
	LDR	R3	l129
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l129 andl109
	MOV	R5	FP
	ADI	R5	-108
	STR	R4	R5
# Math					#V101 t219 R220
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-108
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt219
	MOV	R5	FP
	ADI	R5	-112
	STR	R4	R5
# MOVE					#l130 R220 
	LDB	R3	l130
	MOV	R4	FP
	ADI	R4	-112
	LDR	R4	R4
	STB	R3	R4
# Math					#l131 l109 t221
	LDR	R3	l131
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l131 andl109
	MOV	R5	FP
	ADI	R5	-116
	STR	R4	R5
# Math					#V101 t221 R222
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-116
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt221
	MOV	R5	FP
	ADI	R5	-120
	STR	R4	R5
# MOVE					#l132 R222 
	LDB	R3	l132
	MOV	R4	FP
	ADI	R4	-120
	LDR	R4	R4
	STB	R3	R4
# Math					#l133 l109 t223
	LDR	R3	l133
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l133 andl109
	MOV	R5	FP
	ADI	R5	-124
	STR	R4	R5
# Math					#V101 t223 R224
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-124
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt223
	MOV	R5	FP
	ADI	R5	-128
	STR	R4	R5
# MOVE					#l134 R224 
	LDB	R3	l134
	MOV	R4	FP
	ADI	R4	-128
	LDR	R4	R4
	STB	R3	R4
# MOVE					#l135 V102 
	LDR	R3	l135
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4
# Math					#V102 l109 t225
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on V102 andl109
	MOV	R5	FP
	ADI	R5	-132
	STR	R4	R5
# Math					#V101 t225 R226
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-132
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt225
	MOV	R5	FP
	ADI	R5	-136
	STR	R4	R5
# MOVE					#l136 R226 
	LDB	R3	l136
	MOV	R4	FP
	ADI	R4	-136
	LDR	R4	R4
	STB	R3	R4
# Math					#l109 V102 t227
	LDR	R3	l109
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l109 andV102
	MOV	R5	FP
	ADI	R5	-140
	STR	R4	R5
# Math					#t227 l109 t228
	MOV	R3	FP
	ADI	R3	-140
	LDR	R3	R3
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on t227 andl109
	MOV	R5	FP
	ADI	R5	-144
	STR	R4	R5
# Math					#V101 t228 R229
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-144
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt228
	MOV	R5	FP
	ADI	R5	-148
	STR	R4	R5
# MOVE					#l138 R229 
	LDB	R3	l138
	MOV	R4	FP
	ADI	R4	-148
	LDR	R4	R4
	STB	R3	R4
# Math					#l111 V102 t230
	LDR	R3	l111
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l111 andV102
	MOV	R5	FP
	ADI	R5	-152
	STR	R4	R5
# Math					#t230 l109 t231
	MOV	R3	FP
	ADI	R3	-152
	LDR	R3	R3
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on t230 andl109
	MOV	R5	FP
	ADI	R5	-156
	STR	R4	R5
# Math					#V101 t231 R232
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-156
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt231
	MOV	R5	FP
	ADI	R5	-160
	STR	R4	R5
# MOVE					#l140 R232 
	LDB	R3	l140
	MOV	R4	FP
	ADI	R4	-160
	LDR	R4	R4
	STB	R3	R4
# Math					#l113 V102 t233
	LDR	R3	l113
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l113 andV102
	MOV	R5	FP
	ADI	R5	-164
	STR	R4	R5
# Math					#t233 l109 t234
	MOV	R3	FP
	ADI	R3	-164
	LDR	R3	R3
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on t233 andl109
	MOV	R5	FP
	ADI	R5	-168
	STR	R4	R5
# Math					#V101 t234 R235
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-168
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt234
	MOV	R5	FP
	ADI	R5	-172
	STR	R4	R5
# MOVE					#l122 R235 
	LDB	R3	l122
	MOV	R4	FP
	ADI	R4	-172
	LDR	R4	R4
	STB	R3	R4
# Math					#l115 V102 t236
	LDR	R3	l115
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l115 andV102
	MOV	R5	FP
	ADI	R5	-176
	STR	R4	R5
# Math					#t236 l109 t237
	MOV	R3	FP
	ADI	R3	-176
	LDR	R3	R3
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on t236 andl109
	MOV	R5	FP
	ADI	R5	-180
	STR	R4	R5
# Math					#V101 t237 R238
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-180
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt237
	MOV	R5	FP
	ADI	R5	-184
	STR	R4	R5
# MOVE					#l144 R238 
	LDB	R3	l144
	MOV	R4	FP
	ADI	R4	-184
	LDR	R4	R4
	STB	R3	R4
# Math					#l117 V102 t239
	LDR	R3	l117
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l117 andV102
	MOV	R5	FP
	ADI	R5	-188
	STR	R4	R5
# Math					#t239 l109 t240
	MOV	R3	FP
	ADI	R3	-188
	LDR	R3	R3
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on t239 andl109
	MOV	R5	FP
	ADI	R5	-192
	STR	R4	R5
# Math					#V101 t240 R241
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-192
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt240
	MOV	R5	FP
	ADI	R5	-196
	STR	R4	R5
# MOVE					#l146 R241 
	LDB	R3	l146
	MOV	R4	FP
	ADI	R4	-196
	LDR	R4	R4
	STB	R3	R4
# Math					#l119 V102 t242
	LDR	R3	l119
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l119 andV102
	MOV	R5	FP
	ADI	R5	-200
	STR	R4	R5
# Math					#t242 l109 t243
	MOV	R3	FP
	ADI	R3	-200
	LDR	R3	R3
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on t242 andl109
	MOV	R5	FP
	ADI	R5	-204
	STR	R4	R5
# Math					#V101 t243 R244
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-204
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt243
	MOV	R5	FP
	ADI	R5	-208
	STR	R4	R5
# MOVE					#l148 R244 
	LDB	R3	l148
	MOV	R4	FP
	ADI	R4	-208
	LDR	R4	R4
	STB	R3	R4
# Math					#l121 V102 t245
	LDR	R3	l121
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l121 andV102
	MOV	R5	FP
	ADI	R5	-212
	STR	R4	R5
# Math					#t245 l109 t246
	MOV	R3	FP
	ADI	R3	-212
	LDR	R3	R3
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on t245 andl109
	MOV	R5	FP
	ADI	R5	-216
	STR	R4	R5
# Math					#V101 t246 R247
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-216
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt246
	MOV	R5	FP
	ADI	R5	-220
	STR	R4	R5
# MOVE					#l132 R247 
	LDB	R3	l132
	MOV	R4	FP
	ADI	R4	-220
	LDR	R4	R4
	STB	R3	R4
# Math					#l123 V102 t248
	LDR	R3	l123
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l123 andV102
	MOV	R5	FP
	ADI	R5	-224
	STR	R4	R5
# Math					#t248 l109 t249
	MOV	R3	FP
	ADI	R3	-224
	LDR	R3	R3
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on t248 andl109
	MOV	R5	FP
	ADI	R5	-228
	STR	R4	R5
# Math					#V101 t249 R250
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-228
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt249
	MOV	R5	FP
	ADI	R5	-232
	STR	R4	R5
# MOVE					#l114 R250 
	LDB	R3	l114
	MOV	R4	FP
	ADI	R4	-232
	LDR	R4	R4
	STB	R3	R4
# Math					#l125 V102 t251
	LDR	R3	l125
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l125 andV102
	MOV	R5	FP
	ADI	R5	-236
	STR	R4	R5
# Math					#t251 l109 t252
	MOV	R3	FP
	ADI	R3	-236
	LDR	R3	R3
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on t251 andl109
	MOV	R5	FP
	ADI	R5	-240
	STR	R4	R5
# Math					#V101 t252 R253
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-240
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt252
	MOV	R5	FP
	ADI	R5	-244
	STR	R4	R5
# MOVE					#l126 R253 
	LDB	R3	l126
	MOV	R4	FP
	ADI	R4	-244
	LDR	R4	R4
	STB	R3	R4
# Math					#l155 l109 t254
	LDR	R3	l155
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l155 andl109
	MOV	R5	FP
	ADI	R5	-248
	STR	R4	R5
# Math					#V101 t254 R255
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-248
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt254
	MOV	R5	FP
	ADI	R5	-252
	STR	R4	R5
# MOVE					#l120 R255 
	LDB	R3	l120
	MOV	R4	FP
	ADI	R4	-252
	LDR	R4	R4
	STB	R3	R4
# Math					#l157 l109 t256
	LDR	R3	l157
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l157 andl109
	MOV	R5	FP
	ADI	R5	-256
	STR	R4	R5
# Math					#V101 t256 R257
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-256
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt256
	MOV	R5	FP
	ADI	R5	-260
	STR	R4	R5
# MOVE					#l130 R257 
	LDB	R3	l130
	MOV	R4	FP
	ADI	R4	-260
	LDR	R4	R4
	STB	R3	R4
# Math					#l159 l109 t258
	LDR	R3	l159
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l159 andl109
	MOV	R5	FP
	ADI	R5	-264
	STR	R4	R5
# Math					#V101 t258 R259
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-264
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt258
	MOV	R5	FP
	ADI	R5	-268
	STR	R4	R5
# MOVE					#l132 R259 
	LDB	R3	l132
	MOV	R4	FP
	ADI	R4	-268
	LDR	R4	R4
	STB	R3	R4
# Math					#l161 l109 t260
	LDR	R3	l161
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l161 andl109
	MOV	R5	FP
	ADI	R5	-272
	STR	R4	R5
# Math					#V101 t260 R261
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-272
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt260
	MOV	R5	FP
	ADI	R5	-276
	STR	R4	R5
# MOVE					#l114 R261 
	LDB	R3	l114
	MOV	R4	FP
	ADI	R4	-276
	LDR	R4	R4
	STB	R3	R4
# Math					#l163 l109 t262
	LDR	R3	l163
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l163 andl109
	MOV	R5	FP
	ADI	R5	-280
	STR	R4	R5
# Math					#V101 t262 R263
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-280
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt262
	MOV	R5	FP
	ADI	R5	-284
	STR	R4	R5
# MOVE					#l164 R263 
	LDB	R3	l164
	MOV	R4	FP
	ADI	R4	-284
	LDR	R4	R4
	STB	R3	R4
# RETURN					#this  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	STR	R3	FP			# Storing Value into Top of Stack
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F167  
print(int,int)	ADI	SP	-24			# Allocates space on top of stack
# Boolean					#P166 P165 t264
WHILEBEGIN0	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	MOV	R5	FP
	ADI	R5	-20
	CMP	R4	R3
	CMP	R3	R3			# Making Registor 3 zero
	BLT	R4	BRN0
	BRZ	R4	BRN0
	STR	R3	R5
	JMP	BRNEND0	
BRN0	ADI	R3	1
	STR	R3	R5
BRNEND0	CMP	R13	R13			# NO OP Command
# Branch					#t264 WHILEEND0 
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	BRZ	R3	WHILEEND0
# Math					#P165 l109 t265
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on P165 andl109
	MOV	R5	FP
	ADI	R5	-24
	STR	R4	R5
# Math					#V101 t265 R266
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-24
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt265
	MOV	R5	FP
	ADI	R5	-28
	STR	R4	R5
# WRTC					#R266  
	MOV	R3	FP
	ADI	R3	-28
	LDR	R3	R3
	LDB	R3	R3
	STB	R3	OUTPUT
	TRP	3	
# Math					#l109 P165 t267
	LDR	R3	l109
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l109 andP165
	MOV	R5	FP
	ADI	R5	-32
	STR	R4	R5
# MOVE					#t267 P165 
	MOV	R3	FP
	ADI	R3	-32
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4
# JMP					#WHILEBEGIN0  
	JMP	WHILEBEGIN0	
# RTN					#  
WHILEEND0	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F171  
msg1(int)	ADI	SP	-8			# Allocates space on top of stack
# FRAME					#P191 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-24
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing this as This PTR
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#l107  
	LDR	R3	l107
	STR	R3	SP
	ADI	SP	-4
# PUSH					#l133  
	LDR	R3	l133
	STR	R3	SP
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t268  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# WRTI					#P170  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	OUTPUT
	TRP	1	
# WRTC					#l174  
	LDB	R3	l174
	STB	R3	OUTPUT
	TRP	3	
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F177  
msg2(int)	ADI	SP	-24			# Allocates space on top of stack
# MOVE					#l135 V102 
	LDR	R3	l135
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4
# Math					#l125 V102 t269
	LDR	R3	l125
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l125 andV102
	MOV	R5	FP
	ADI	R5	-16
	STR	R4	R5
# MOVE					#t269 V103 
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	8
	STR	R3	R4
# FRAME					#P191 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-24
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing this as This PTR
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#V102  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# PUSH					#V103  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	8
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t270  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# Math					#l117 l109 t271
	LDR	R3	l117
	LDR	R4	l109
	MUL	R4	R3			# DO Math Operation on l117 andl109
	MOV	R5	FP
	ADI	R5	-24
	STR	R4	R5
# Math					#V101 t271 R272
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-24
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V101 andt271
	MOV	R5	FP
	ADI	R5	-28
	STR	R4	R5
# WRTC					#R272  
	MOV	R3	FP
	ADI	R3	-28
	LDR	R3	R3
	LDB	R3	R3
	STB	R3	OUTPUT
	TRP	3	
# FRAME					#P191 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-24
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing this as This PTR
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#l119  
	LDR	R3	l119
	STR	R3	SP
	ADI	SP	-4
# PUSH					#l133  
	LDR	R3	l133
	STR	R3	SP
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t273  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-32
	STR	R3	R4
# WRTI					#P176  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	OUTPUT
	TRP	1	
# WRTC					#l174  
	LDB	R3	l174
	STB	R3	OUTPUT
	TRP	3	
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F185  
msg3()	ADI	SP	-12			# Allocates space on top of stack
# FRAME					#P191 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-24
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing this as This PTR
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#l155  
	LDR	R3	l155
	STR	R3	SP
	ADI	SP	-4
# PUSH					#l163  
	LDR	R3	l163
	STR	R3	SP
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t274  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4
# MOVE					#l117 V102 
	LDR	R3	l117
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4
# FRAME					#P191 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-24
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing this as This PTR
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#V102  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# PUSH					#V102  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t275  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# FRAME					#P191 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-24
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing this as This PTR
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#l119  
	LDR	R3	l119
	STR	R3	SP
	ADI	SP	-4
# PUSH					#l133  
	LDR	R3	l133
	STR	R3	SP
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t276  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F192  
main	ADI	SP	-12			# Allocates space on top of stack
# NEWI					#5 K193 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4
	ADI	R3	20
	STR	R3	FREE
# FRAME					#F104 K193 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-276
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K193 as This PTR
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# CALL					#Message()  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	Message()	
# PEEK					#t277  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# MOVE					#t277 K193 
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4
# FRAME					#F185 K193 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-12
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K193 as This PTR
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# CALL					#msg3()  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	msg3()	
# PEEK					#t278  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
l174	.BYT	10	
l164	.BYT	'r'	
l163	.INT	28	
l161	.INT	27	
l159	.INT	26	
l157	.INT	25	
l155	.INT	24	
l148	.BYT	'a'	
l146	.BYT	'c'	
l144	.BYT	'i'	
l140	.BYT	'p'	
l138	.BYT	'u'	
l136	.BYT	'D'	
l135	.INT	14	
l134	.BYT	':'	
l133	.INT	13	
l132	.BYT	't'	
l131	.INT	12	
l130	.BYT	'n'	
l129	.INT	11	
l127	.INT	10	
l126	.BYT	'm'	
l125	.INT	9	
l123	.INT	8	
l122	.BYT	'l'	
l121	.INT	7	
l120	.BYT	'E'	
l119	.INT	6	
l118	.BYT	' '	
l117	.INT	5	
l115	.INT	4	
l114	.BYT	'e'	
l113	.INT	3	
l111	.INT	2	
l110	.BYT	'd'	
l109	.INT	1	
l108	.BYT	'A'	
l107	.INT	0	
l105	.INT	100	
FREE	.INT	stFREE	
stFREE	.INT	0	
