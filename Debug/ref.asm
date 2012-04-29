# FRAME					#main this 
START	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	0
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	LDR	R3	l154			# Main Storing 0 as This PTR
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
# FUNC					#F103  
iTree()	ADI	SP	0			# Allocates space on top of stack
# MOVE					#l104 V101 
	LDR	R3	l104
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	0
	STR	R3	R4
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
# FUNC					#F106  
add(int)	ADI	SP	-20			# Allocates space on top of stack
# Boolean					#l104 V101 t134
	LDR	R3	l104
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	0
	LDR	R4	R4
	MOV	R5	FP
	ADI	R5	-16
	CMP	R4	R3
	CMP	R3	R3			# Making Registor 3 zero
	BRZ	R4	BRN0
	STR	R3	R5
	JMP	BRNEND0	
BRN0	ADI	R3	1
	STR	R3	R5
BRNEND0	CMP	R13	R13			# NO OP Command
# Branch					#t134 IFSKIP0 
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	BRZ	R3	IFSKIP0
# NEWI					#2 V101 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	0
	STR	R3	R4
	ADI	R3	8
	STR	R3	FREE
# FRAME					#F119 V101 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing V101 as This PTR
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#P105  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#iNode(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	iNode(int)	
# PEEK					#t135  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# MOVE					#t135 V101 
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	0
	STR	R3	R4
# RETURN					#l108  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	LDR	R3	l108
	STR	R3	FP			# Storing Value into Top of Stack
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# JMP					#ELSESKIP0  
	JMP	ELSESKIP0	
# REF					#V117 V101 R136
IFSKIP0	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	ADI	R3	4
	MOV	R4	FP
	ADI	R4	-24
	STR	R3	R4
# NEWI					#2 R136 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-24
	LDR	R4	R4
	STR	R3	R4
	ADI	R3	8
	STR	R3	FREE
# FRAME					#F119 R136 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing R136 as This PTR
	MOV	R3	FP
	ADI	R3	-24
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#P105  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#iNode(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	iNode(int)	
# PEEK					#t137  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-28
	STR	R3	R4
# MOVE					#t137 R136 
	MOV	R3	FP
	ADI	R3	-28
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-24
	LDR	R4	R4
	STR	R3	R4
# RTN					#  
ELSESKIP0	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F110  
print()	ADI	SP	-20			# Allocates space on top of stack
# REF					#V116 V101 R138
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	ADI	R3	0
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4
# WRTI					#R138  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	OUTPUT
	TRP	1	
# WRTC					#l111  
	LDB	R3	l111
	STB	R3	OUTPUT
	TRP	3	
# REF					#V117 V101 R139
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	ADI	R3	4
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# Boolean					#l104 R139 t140
	LDR	R3	l104
	MOV	R4	FP
	ADI	R4	-16
	LDR	R4	R4
	LDR	R4	R4
	MOV	R5	FP
	ADI	R5	-20
	CMP	R4	R3
	CMP	R3	R3			# Making Registor 3 zero
	BNZ	R4	BRN1
	STR	R3	R5
	JMP	BRNEND1	
BRN1	ADI	R3	1
	STR	R3	R5
BRNEND1	CMP	R13	R13			# NO OP Command
# Branch					#t140 IFSKIP1 
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	BRZ	R3	IFSKIP1
# REF					#V117 V101 R141
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	ADI	R3	4
	MOV	R4	FP
	ADI	R4	-24
	STR	R3	R4
# REF					#V116 R141 R142
	MOV	R3	FP
	ADI	R3	-24
	LDR	R3	R3
	LDR	R3	R3
	ADI	R3	0
	MOV	R4	FP
	ADI	R4	-28
	STR	R3	R4
# WRTI					#R142  
	MOV	R3	FP
	ADI	R3	-28
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	OUTPUT
	TRP	1	
# WRTC					#l113  
IFSKIP1	LDB	R3	l113
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
# FUNC					#F119  
iNode(int)	ADI	SP	-4			# Allocates space on top of stack
# MOVE					#P118 V116 
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	0
	STR	R3	R4
# MOVE					#l104 V117 
	LDR	R3	l104
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4
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
# FUNC					#F121  
main	ADI	SP	-52			# Allocates space on top of stack
# NEWI					#3 K123 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
	ADI	R3	12
	STR	R3	FREE
# FRAME					#F103 K123 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	0
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K123 as This PTR
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# CALL					#iTree()  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	iTree()	
# PEEK					#t143  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# MOVE					#t143 K123 
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# RDI					#K122  
	TRP	2	
	LDR	R4	INPUT
	MOV	R3	FP
	ADI	R3	-12
	STR	R4	R3
# WRTC					#l113  
	LDB	R3	l113
	STB	R3	OUTPUT
	TRP	3	
# Math					#l126 K122 t144
	LDR	R3	l126
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	MUL	R4	R3			# DO Math Operation on l126 andK122
	MOV	R5	FP
	ADI	R5	-24
	STR	R4	R5
# Math					#t144 l125 t145
	MOV	R3	FP
	ADI	R3	-24
	LDR	R3	R3
	LDR	R4	l125
	ADD	R4	R3			# DO Math Operation on t144 andl125
	MOV	R5	FP
	ADI	R5	-28
	STR	R4	R5
# Math					#l127 t145 t146
	LDR	R3	l127
	MOV	R4	FP
	ADI	R4	-28
	LDR	R4	R4
	SUB	R4	R3			# DO Math Operation on l127 andt145
	MOV	R5	FP
	ADI	R5	-32
	STR	R4	R5
# FRAME					#F106 K123 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-20
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K123 as This PTR
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#t146  
	MOV	R3	FP
	ADI	R3	-32
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#add(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	add(int)	
# PEEK					#t147  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-36
	STR	R3	R4
# WRTC					#l113  
	LDB	R3	l113
	STB	R3	OUTPUT
	TRP	3	
# FRAME					#F110 K123 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-20
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K123 as This PTR
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# CALL					#print()  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print()	
# PEEK					#t148  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-40
	STR	R3	R4
# RDI					#K122  
	TRP	2	
	LDR	R4	INPUT
	MOV	R3	FP
	ADI	R3	-12
	STR	R4	R3
# WRTC					#l113  
	LDB	R3	l113
	STB	R3	OUTPUT
	TRP	3	
# Math					#l126 K122 t149
	LDR	R3	l126
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	MUL	R4	R3			# DO Math Operation on l126 andK122
	MOV	R5	FP
	ADI	R5	-44
	STR	R4	R5
# Math					#t149 l125 t150
	MOV	R3	FP
	ADI	R3	-44
	LDR	R3	R3
	LDR	R4	l125
	ADD	R4	R3			# DO Math Operation on t149 andl125
	MOV	R5	FP
	ADI	R5	-48
	STR	R4	R5
# Math					#l127 t150 t151
	LDR	R3	l127
	MOV	R4	FP
	ADI	R4	-48
	LDR	R4	R4
	SUB	R4	R3			# DO Math Operation on l127 andt150
	MOV	R5	FP
	ADI	R5	-52
	STR	R4	R5
# FRAME					#F106 K123 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-20
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K123 as This PTR
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#t151  
	MOV	R3	FP
	ADI	R3	-52
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#add(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	add(int)	
# PEEK					#t152  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-56
	STR	R3	R4
# WRTC					#l113  
	LDB	R3	l113
	STB	R3	OUTPUT
	TRP	3	
# FRAME					#F110 K123 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-20
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K123 as This PTR
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# CALL					#print()  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print()	
# PEEK					#t153  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-60
	STR	R3	R4
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
l154	.INT	0	
l127	.INT	3	
l126	.INT	1000	
l125	.INT	6	
l113	.BYT	10	
l111	.BYT	' '	
l108	.INT	1	
l104	.INT	0	
FREE	.INT	stFREE	
stFREE	.INT	0	
