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
	LDR	R3	l147			# Main Storing 0 as This PTR
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
add(int)	ADI	SP	-16			# Allocates space on top of stack
# Boolean					#l104 V101 t248
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
# Branch					#t248 IFSKIP0 
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	BRZ	R3	IFSKIP0
# NEWI					#3 V101 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	0
	STR	R3	R4
	ADI	R3	12
	STR	R3	FREE
# FRAME					#F138 V101 
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
# PEEK					#t249  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# MOVE					#t249 V101 
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
# FRAME					#F112 this 
IFSKIP0	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-72
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
# PUSH					#P105  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# PUSH					#V101  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#insert(int,iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	insert(int,iNode)	
# PEEK					#t250  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-24
	STR	R3	R4
# RETURN					#t250  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	R3	FP
	ADI	R3	-24
	LDR	R3	R3
	STR	R3	FP			# Storing Value into Top of Stack
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# RTN					#  
ELSESKIP0	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F112  
insert(int,iNode)	ADI	SP	-72			# Allocates space on top of stack
# REF					#V134 P111 R251
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	0
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# Boolean					#R251 V134 t252
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	0
	LDR	R4	R4
	MOV	R5	FP
	ADI	R5	-24
	CMP	R4	R3
	CMP	R3	R3			# Making Registor 3 zero
	BLT	R4	BRN1
	STR	R3	R5
	JMP	BRNEND1	
BRN1	ADI	R3	1
	STR	R3	R5
BRNEND1	CMP	R13	R13			# NO OP Command
# Branch					#t252 IFSKIP1 
	MOV	R3	FP
	ADI	R3	-24
	LDR	R3	R3
	BRZ	R3	IFSKIP1
# REF					#V135 P111 R253
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	4
	MOV	R4	FP
	ADI	R4	-28
	STR	R3	R4
# Boolean					#l104 R253 t254
	LDR	R3	l104
	MOV	R4	FP
	ADI	R4	-28
	LDR	R4	R4
	LDR	R4	R4
	MOV	R5	FP
	ADI	R5	-32
	CMP	R4	R3
	CMP	R3	R3			# Making Registor 3 zero
	BRZ	R4	BRN2
	STR	R3	R5
	JMP	BRNEND2	
BRN2	ADI	R3	1
	STR	R3	R5
BRNEND2	CMP	R13	R13			# NO OP Command
# Branch					#t254 IFSKIP2 
	MOV	R3	FP
	ADI	R3	-32
	LDR	R3	R3
	BRZ	R3	IFSKIP2
# REF					#V135 P111 R255
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	4
	MOV	R4	FP
	ADI	R4	-36
	STR	R3	R4
# NEWI					#3 R255 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-36
	LDR	R4	R4
	STR	R3	R4
	ADI	R3	12
	STR	R3	FREE
# FRAME					#F138 R255 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing R255 as This PTR
	MOV	R3	FP
	ADI	R3	-36
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#P110  
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
# PEEK					#t256  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-40
	STR	R3	R4
# MOVE					#t256 R255 
	MOV	R3	FP
	ADI	R3	-40
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-36
	LDR	R4	R4
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
# JMP					#IFSKIP1  
	JMP	IFSKIP1	
# REF					#V135 P111 R257
IFSKIP2	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	4
	MOV	R4	FP
	ADI	R4	-44
	STR	R3	R4
# FRAME					#F112 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-72
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
# PUSH					#P110  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# PUSH					#R257  
	MOV	R3	FP
	ADI	R3	-44
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#insert(int,iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	insert(int,iNode)	
# PEEK					#t258  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-48
	STR	R3	R4
# RETURN					#t258  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	R3	FP
	ADI	R3	-48
	LDR	R3	R3
	STR	R3	FP			# Storing Value into Top of Stack
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# JMP					#ELSESKIP2  
	JMP	ELSESKIP2	
# REF					#V134 P111 R259
IFSKIP1	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	0
	MOV	R4	FP
	ADI	R4	-52
	STR	R3	R4
# Boolean					#R259 V134 t260
	MOV	R3	FP
	ADI	R3	-52
	LDR	R3	R3
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	0
	LDR	R4	R4
	MOV	R5	FP
	ADI	R5	-56
	CMP	R4	R3
	CMP	R3	R3			# Making Registor 3 zero
	BGT	R4	BRN3
	STR	R3	R5
	JMP	BRNEND3	
BRN3	ADI	R3	1
	STR	R3	R5
BRNEND3	CMP	R13	R13			# NO OP Command
# Branch					#t260 IFSKIP3 
	MOV	R3	FP
	ADI	R3	-56
	LDR	R3	R3
	BRZ	R3	IFSKIP3
# REF					#V136 P111 R261
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	8
	MOV	R4	FP
	ADI	R4	-60
	STR	R3	R4
# Boolean					#l104 R261 t262
	LDR	R3	l104
	MOV	R4	FP
	ADI	R4	-60
	LDR	R4	R4
	LDR	R4	R4
	MOV	R5	FP
	ADI	R5	-64
	CMP	R4	R3
	CMP	R3	R3			# Making Registor 3 zero
	BRZ	R4	BRN4
	STR	R3	R5
	JMP	BRNEND4	
BRN4	ADI	R3	1
	STR	R3	R5
BRNEND4	CMP	R13	R13			# NO OP Command
# Branch					#t262 IFSKIP4 
	MOV	R3	FP
	ADI	R3	-64
	LDR	R3	R3
	BRZ	R3	IFSKIP4
# REF					#V136 P111 R263
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	8
	MOV	R4	FP
	ADI	R4	-68
	STR	R3	R4
# NEWI					#3 R263 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-68
	LDR	R4	R4
	STR	R3	R4
	ADI	R3	12
	STR	R3	FREE
# FRAME					#F138 R263 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing R263 as This PTR
	MOV	R3	FP
	ADI	R3	-68
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#P110  
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
# PEEK					#t264  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-72
	STR	R3	R4
# MOVE					#t264 R263 
	MOV	R3	FP
	ADI	R3	-72
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-68
	LDR	R4	R4
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
# JMP					#IFSKIP3  
	JMP	IFSKIP3	
# REF					#V136 P111 R265
IFSKIP4	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	8
	MOV	R4	FP
	ADI	R4	-76
	STR	R3	R4
# FRAME					#F112 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-72
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
# PUSH					#P110  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# PUSH					#R265  
	MOV	R3	FP
	ADI	R3	-76
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#insert(int,iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	insert(int,iNode)	
# PEEK					#t266  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-80
	STR	R3	R4
# RETURN					#t266  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	R3	FP
	ADI	R3	-80
	LDR	R3	R3
	STR	R3	FP			# Storing Value into Top of Stack
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# JMP					#ELSESKIP2  
	JMP	ELSESKIP2	
# RETURN					#l117  
IFSKIP3	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	LDR	R3	l117
	STR	R3	FP			# Storing Value into Top of Stack
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# RTN					#  
ELSESKIP2	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F119  
print()	ADI	SP	-4			# Allocates space on top of stack
# MOVE					#l108 V102 
	LDR	R3	l108
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4
# FRAME					#F124 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-28
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
# PUSH					#V101  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#inorder(iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	inorder(iNode)	
# PEEK					#t267  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4
# WRTC					#l121  
	LDB	R3	l121
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
# FUNC					#F124  
inorder(iNode)	ADI	SP	-28			# Allocates space on top of stack
# Boolean					#l104 P123 t268
	LDR	R3	l104
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	MOV	R5	FP
	ADI	R5	-16
	CMP	R4	R3
	CMP	R3	R3			# Making Registor 3 zero
	BRZ	R4	BRN5
	STR	R3	R5
	JMP	BRNEND5	
BRN5	ADI	R3	1
	STR	R3	R5
BRNEND5	CMP	R13	R13			# NO OP Command
# Branch					#t268 IFSKIP5 
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	BRZ	R3	IFSKIP5
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# REF					#V135 P123 R269
IFSKIP5	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	ADI	R3	4
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# FRAME					#F124 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-28
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
# PUSH					#R269  
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#inorder(iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	inorder(iNode)	
# PEEK					#t270  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-24
	STR	R3	R4
# FRAME					#F128 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-8
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
# PUSH					#P123  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#visit(iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	visit(iNode)	
# PEEK					#t271  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-28
	STR	R3	R4
# REF					#V136 P123 R272
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	ADI	R3	8
	MOV	R4	FP
	ADI	R4	-32
	STR	R3	R4
# FRAME					#F124 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-28
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
# PUSH					#R272  
	MOV	R3	FP
	ADI	R3	-32
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#inorder(iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	inorder(iNode)	
# PEEK					#t273  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-36
	STR	R3	R4
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F128  
visit(iNode)	ADI	SP	-8			# Allocates space on top of stack
# Branch					#V102 IFSKIP6 
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	BRZ	R3	IFSKIP6
# MOVE					#l117 V102 
	LDR	R3	l117
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4
# WRTC					#l130  
	LDB	R3	l130
	STB	R3	OUTPUT
	TRP	3	
# JMP					#ELSESKIP5  
	JMP	ELSESKIP5	
# WRTC					#l131  
IFSKIP6	LDB	R3	l131
	STB	R3	OUTPUT
	TRP	3	
# REF					#V134 P127 R274
ELSESKIP5	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	ADI	R3	0
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# WRTI					#R274  
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	OUTPUT
	TRP	1	
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F138  
iNode(int)	ADI	SP	-4			# Allocates space on top of stack
# MOVE					#P137 V134 
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	0
	STR	R3	R4
# MOVE					#l104 V135 
	LDR	R3	l104
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4
# MOVE					#l104 V136 
	LDR	R3	l104
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	8
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
# FUNC					#F145  
Message()	ADI	SP	-280			# Allocates space on top of stack
# MOVE					#l147 K146 
	LDR	R3	l147
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4
# Math					#l158 l148 t276
	LDR	R3	l158
	LDR	R4	l148
	MUL	R4	R3			# DO Math Operation on l158 andl148
	MOV	R5	FP
	ADI	R5	-16
	STR	R4	R5
# NEW					#t276 t277 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
	MOV	R5	FP
	ADI	R5	-16
	LDB	R5	R5
	ADD	R3	R5
	STR	R3	FREE
# MOVE					#t277 V142 
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	0
	STR	R3	R4
# Math					#l147 l152 t278
	LDR	R3	l147
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l147 andl152
	MOV	R5	FP
	ADI	R5	-24
	STR	R4	R5
# Math					#V142 t278 R279
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-24
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt278
	MOV	R5	FP
	ADI	R5	-28
	STR	R4	R5
# MOVE					#l151 R279 
	LDB	R3	l151
	MOV	R4	FP
	ADI	R4	-28
	LDR	R4	R4
	STB	R3	R4
# Math					#l152 l152 t280
	LDR	R3	l152
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l152 andl152
	MOV	R5	FP
	ADI	R5	-32
	STR	R4	R5
# Math					#V142 t280 R281
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-32
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt280
	MOV	R5	FP
	ADI	R5	-36
	STR	R4	R5
# MOVE					#l153 R281 
	LDB	R3	l153
	MOV	R4	FP
	ADI	R4	-36
	LDR	R4	R4
	STB	R3	R4
# Math					#l154 l152 t282
	LDR	R3	l154
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l154 andl152
	MOV	R5	FP
	ADI	R5	-40
	STR	R4	R5
# Math					#V142 t282 R283
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-40
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt282
	MOV	R5	FP
	ADI	R5	-44
	STR	R4	R5
# MOVE					#l153 R283 
	LDB	R3	l153
	MOV	R4	FP
	ADI	R4	-44
	LDR	R4	R4
	STB	R3	R4
# Math					#l156 l152 t284
	LDR	R3	l156
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l156 andl152
	MOV	R5	FP
	ADI	R5	-48
	STR	R4	R5
# Math					#V142 t284 R285
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-48
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt284
	MOV	R5	FP
	ADI	R5	-52
	STR	R4	R5
# MOVE					#l157 R285 
	LDB	R3	l157
	MOV	R4	FP
	ADI	R4	-52
	LDR	R4	R4
	STB	R3	R4
# Math					#l158 l152 t286
	LDR	R3	l158
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l158 andl152
	MOV	R5	FP
	ADI	R5	-56
	STR	R4	R5
# Math					#V142 t286 R287
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-56
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt286
	MOV	R5	FP
	ADI	R5	-60
	STR	R4	R5
# MOVE					#l153 R287 
	LDB	R3	l153
	MOV	R4	FP
	ADI	R4	-60
	LDR	R4	R4
	STB	R3	R4
# Math					#l160 l152 t288
	LDR	R3	l160
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l160 andl152
	MOV	R5	FP
	ADI	R5	-64
	STR	R4	R5
# Math					#V142 t288 R289
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-64
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt288
	MOV	R5	FP
	ADI	R5	-68
	STR	R4	R5
# MOVE					#l130 R289 
	LDB	R3	l130
	MOV	R4	FP
	ADI	R4	-68
	LDR	R4	R4
	STB	R3	R4
# Math					#l162 l152 t290
	LDR	R3	l162
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l162 andl152
	MOV	R5	FP
	ADI	R5	-72
	STR	R4	R5
# Math					#V142 t290 R291
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-72
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt290
	MOV	R5	FP
	ADI	R5	-76
	STR	R4	R5
# MOVE					#l163 R291 
	LDB	R3	l163
	MOV	R4	FP
	ADI	R4	-76
	LDR	R4	R4
	STB	R3	R4
# Math					#l164 l152 t292
	LDR	R3	l164
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l164 andl152
	MOV	R5	FP
	ADI	R5	-80
	STR	R4	R5
# Math					#V142 t292 R293
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-80
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt292
	MOV	R5	FP
	ADI	R5	-84
	STR	R4	R5
# MOVE					#l165 R293 
	LDB	R3	l165
	MOV	R4	FP
	ADI	R4	-84
	LDR	R4	R4
	STB	R3	R4
# Math					#l166 l152 t294
	LDR	R3	l166
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l166 andl152
	MOV	R5	FP
	ADI	R5	-88
	STR	R4	R5
# Math					#V142 t294 R295
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-88
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt294
	MOV	R5	FP
	ADI	R5	-92
	STR	R4	R5
# MOVE					#l157 R295 
	LDB	R3	l157
	MOV	R4	FP
	ADI	R4	-92
	LDR	R4	R4
	STB	R3	R4
# Math					#l168 l152 t296
	LDR	R3	l168
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l168 andl152
	MOV	R5	FP
	ADI	R5	-96
	STR	R4	R5
# Math					#V142 t296 R297
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-96
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt296
	MOV	R5	FP
	ADI	R5	-100
	STR	R4	R5
# MOVE					#l169 R297 
	LDB	R3	l169
	MOV	R4	FP
	ADI	R4	-100
	LDR	R4	R4
	STB	R3	R4
# Math					#l170 l152 t298
	LDR	R3	l170
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l170 andl152
	MOV	R5	FP
	ADI	R5	-104
	STR	R4	R5
# Math					#V142 t298 R299
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-104
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt298
	MOV	R5	FP
	ADI	R5	-108
	STR	R4	R5
# MOVE					#l157 R299 
	LDB	R3	l157
	MOV	R4	FP
	ADI	R4	-108
	LDR	R4	R4
	STB	R3	R4
# Math					#l172 l152 t300
	LDR	R3	l172
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l172 andl152
	MOV	R5	FP
	ADI	R5	-112
	STR	R4	R5
# Math					#V142 t300 R301
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-112
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt300
	MOV	R5	FP
	ADI	R5	-116
	STR	R4	R5
# MOVE					#l173 R301 
	LDB	R3	l173
	MOV	R4	FP
	ADI	R4	-116
	LDR	R4	R4
	STB	R3	R4
# Math					#l174 l152 t302
	LDR	R3	l174
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l174 andl152
	MOV	R5	FP
	ADI	R5	-120
	STR	R4	R5
# Math					#V142 t302 R303
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-120
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt302
	MOV	R5	FP
	ADI	R5	-124
	STR	R4	R5
# MOVE					#l175 R303 
	LDB	R3	l175
	MOV	R4	FP
	ADI	R4	-124
	LDR	R4	R4
	STB	R3	R4
# Math					#l176 l152 t304
	LDR	R3	l176
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l176 andl152
	MOV	R5	FP
	ADI	R5	-128
	STR	R4	R5
# Math					#V142 t304 R305
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-128
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt304
	MOV	R5	FP
	ADI	R5	-132
	STR	R4	R5
# MOVE					#l177 R305 
	LDB	R3	l177
	MOV	R4	FP
	ADI	R4	-132
	LDR	R4	R4
	STB	R3	R4
# MOVE					#l178 V143 
	LDR	R3	l178
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4
# Math					#V143 l152 t306
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on V143 andl152
	MOV	R5	FP
	ADI	R5	-136
	STR	R4	R5
# Math					#V142 t306 R307
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-136
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt306
	MOV	R5	FP
	ADI	R5	-140
	STR	R4	R5
# MOVE					#l179 R307 
	LDB	R3	l179
	MOV	R4	FP
	ADI	R4	-140
	LDR	R4	R4
	STB	R3	R4
# Math					#l152 V143 t308
	LDR	R3	l152
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l152 andV143
	MOV	R5	FP
	ADI	R5	-144
	STR	R4	R5
# Math					#t308 l152 t309
	MOV	R3	FP
	ADI	R3	-144
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t308 andl152
	MOV	R5	FP
	ADI	R5	-148
	STR	R4	R5
# Math					#V142 t309 R310
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-148
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt309
	MOV	R5	FP
	ADI	R5	-152
	STR	R4	R5
# MOVE					#l181 R310 
	LDB	R3	l181
	MOV	R4	FP
	ADI	R4	-152
	LDR	R4	R4
	STB	R3	R4
# Math					#l154 V143 t311
	LDR	R3	l154
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l154 andV143
	MOV	R5	FP
	ADI	R5	-156
	STR	R4	R5
# Math					#t311 l152 t312
	MOV	R3	FP
	ADI	R3	-156
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t311 andl152
	MOV	R5	FP
	ADI	R5	-160
	STR	R4	R5
# Math					#V142 t312 R313
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-160
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt312
	MOV	R5	FP
	ADI	R5	-164
	STR	R4	R5
# MOVE					#l183 R313 
	LDB	R3	l183
	MOV	R4	FP
	ADI	R4	-164
	LDR	R4	R4
	STB	R3	R4
# Math					#l156 V143 t314
	LDR	R3	l156
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l156 andV143
	MOV	R5	FP
	ADI	R5	-168
	STR	R4	R5
# Math					#t314 l152 t315
	MOV	R3	FP
	ADI	R3	-168
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t314 andl152
	MOV	R5	FP
	ADI	R5	-172
	STR	R4	R5
# Math					#V142 t315 R316
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-172
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt315
	MOV	R5	FP
	ADI	R5	-176
	STR	R4	R5
# MOVE					#l165 R316 
	LDB	R3	l165
	MOV	R4	FP
	ADI	R4	-176
	LDR	R4	R4
	STB	R3	R4
# Math					#l158 V143 t317
	LDR	R3	l158
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l158 andV143
	MOV	R5	FP
	ADI	R5	-180
	STR	R4	R5
# Math					#t317 l152 t318
	MOV	R3	FP
	ADI	R3	-180
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t317 andl152
	MOV	R5	FP
	ADI	R5	-184
	STR	R4	R5
# Math					#V142 t318 R319
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-184
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt318
	MOV	R5	FP
	ADI	R5	-188
	STR	R4	R5
# MOVE					#l187 R319 
	LDB	R3	l187
	MOV	R4	FP
	ADI	R4	-188
	LDR	R4	R4
	STB	R3	R4
# Math					#l160 V143 t320
	LDR	R3	l160
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l160 andV143
	MOV	R5	FP
	ADI	R5	-192
	STR	R4	R5
# Math					#t320 l152 t321
	MOV	R3	FP
	ADI	R3	-192
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t320 andl152
	MOV	R5	FP
	ADI	R5	-196
	STR	R4	R5
# Math					#V142 t321 R322
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-196
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt321
	MOV	R5	FP
	ADI	R5	-200
	STR	R4	R5
# MOVE					#l189 R322 
	LDB	R3	l189
	MOV	R4	FP
	ADI	R4	-200
	LDR	R4	R4
	STB	R3	R4
# Math					#l162 V143 t323
	LDR	R3	l162
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l162 andV143
	MOV	R5	FP
	ADI	R5	-204
	STR	R4	R5
# Math					#t323 l152 t324
	MOV	R3	FP
	ADI	R3	-204
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t323 andl152
	MOV	R5	FP
	ADI	R5	-208
	STR	R4	R5
# Math					#V142 t324 R325
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-208
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt324
	MOV	R5	FP
	ADI	R5	-212
	STR	R4	R5
# MOVE					#l191 R325 
	LDB	R3	l191
	MOV	R4	FP
	ADI	R4	-212
	LDR	R4	R4
	STB	R3	R4
# Math					#l164 V143 t326
	LDR	R3	l164
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l164 andV143
	MOV	R5	FP
	ADI	R5	-216
	STR	R4	R5
# Math					#t326 l152 t327
	MOV	R3	FP
	ADI	R3	-216
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t326 andl152
	MOV	R5	FP
	ADI	R5	-220
	STR	R4	R5
# Math					#V142 t327 R328
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-220
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt327
	MOV	R5	FP
	ADI	R5	-224
	STR	R4	R5
# MOVE					#l175 R328 
	LDB	R3	l175
	MOV	R4	FP
	ADI	R4	-224
	LDR	R4	R4
	STB	R3	R4
# Math					#l166 V143 t329
	LDR	R3	l166
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l166 andV143
	MOV	R5	FP
	ADI	R5	-228
	STR	R4	R5
# Math					#t329 l152 t330
	MOV	R3	FP
	ADI	R3	-228
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t329 andl152
	MOV	R5	FP
	ADI	R5	-232
	STR	R4	R5
# Math					#V142 t330 R331
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-232
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt330
	MOV	R5	FP
	ADI	R5	-236
	STR	R4	R5
# MOVE					#l157 R331 
	LDB	R3	l157
	MOV	R4	FP
	ADI	R4	-236
	LDR	R4	R4
	STB	R3	R4
# Math					#l168 V143 t332
	LDR	R3	l168
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l168 andV143
	MOV	R5	FP
	ADI	R5	-240
	STR	R4	R5
# Math					#t332 l152 t333
	MOV	R3	FP
	ADI	R3	-240
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t332 andl152
	MOV	R5	FP
	ADI	R5	-244
	STR	R4	R5
# Math					#V142 t333 R334
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-244
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt333
	MOV	R5	FP
	ADI	R5	-248
	STR	R4	R5
# MOVE					#l169 R334 
	LDB	R3	l169
	MOV	R4	FP
	ADI	R4	-248
	LDR	R4	R4
	STB	R3	R4
# Math					#l198 l152 t335
	LDR	R3	l198
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l198 andl152
	MOV	R5	FP
	ADI	R5	-252
	STR	R4	R5
# Math					#V142 t335 R336
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-252
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt335
	MOV	R5	FP
	ADI	R5	-256
	STR	R4	R5
# MOVE					#l163 R336 
	LDB	R3	l163
	MOV	R4	FP
	ADI	R4	-256
	LDR	R4	R4
	STB	R3	R4
# Math					#l200 l152 t337
	LDR	R3	l200
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l200 andl152
	MOV	R5	FP
	ADI	R5	-260
	STR	R4	R5
# Math					#V142 t337 R338
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-260
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt337
	MOV	R5	FP
	ADI	R5	-264
	STR	R4	R5
# MOVE					#l173 R338 
	LDB	R3	l173
	MOV	R4	FP
	ADI	R4	-264
	LDR	R4	R4
	STB	R3	R4
# Math					#l202 l152 t339
	LDR	R3	l202
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l202 andl152
	MOV	R5	FP
	ADI	R5	-268
	STR	R4	R5
# Math					#V142 t339 R340
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-268
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt339
	MOV	R5	FP
	ADI	R5	-272
	STR	R4	R5
# MOVE					#l175 R340 
	LDB	R3	l175
	MOV	R4	FP
	ADI	R4	-272
	LDR	R4	R4
	STB	R3	R4
# Math					#l204 l152 t341
	LDR	R3	l204
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l204 andl152
	MOV	R5	FP
	ADI	R5	-276
	STR	R4	R5
# Math					#V142 t341 R342
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-276
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt341
	MOV	R5	FP
	ADI	R5	-280
	STR	R4	R5
# MOVE					#l157 R342 
	LDB	R3	l157
	MOV	R4	FP
	ADI	R4	-280
	LDR	R4	R4
	STB	R3	R4
# Math					#l206 l152 t343
	LDR	R3	l206
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l206 andl152
	MOV	R5	FP
	ADI	R5	-284
	STR	R4	R5
# Math					#V142 t343 R344
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-284
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt343
	MOV	R5	FP
	ADI	R5	-288
	STR	R4	R5
# MOVE					#l207 R344 
	LDB	R3	l207
	MOV	R4	FP
	ADI	R4	-288
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
# FUNC					#F210  
print(int,int)	ADI	SP	-40			# Allocates space on top of stack
# Boolean					#P209 P208 t345
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
	BLT	R4	BRN6
	BRZ	R4	BRN6
	STR	R3	R5
	JMP	BRNEND6	
BRN6	ADI	R3	1
	STR	R3	R5
BRNEND6	CMP	R13	R13			# NO OP Command
# Branch					#t345 WHILEEND0 
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	BRZ	R3	WHILEEND0
# Math					#P208 l152 t346
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on P208 andl152
	MOV	R5	FP
	ADI	R5	-24
	STR	R4	R5
# Math					#V142 t346 R347
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-24
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt346
	MOV	R5	FP
	ADI	R5	-28
	STR	R4	R5
# WRTC					#R347  
	MOV	R3	FP
	ADI	R3	-28
	LDR	R3	R3
	LDB	R3	R3
	STB	R3	OUTPUT
	TRP	3	
# Math					#l152 P208 t348
	LDR	R3	l152
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l152 andP208
	MOV	R5	FP
	ADI	R5	-32
	STR	R4	R5
# MOVE					#t348 P208 
	MOV	R3	FP
	ADI	R3	-32
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4
# JMP					#WHILEBEGIN0  
	JMP	WHILEBEGIN0	
# MOVE					#l147 P208 
WHILEEND0	LDR	R3	l147
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4
# Boolean					#l213 P208 t349
WHILEBEGIN1	LDR	R3	l213
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	MOV	R5	FP
	ADI	R5	-36
	CMP	R4	R3
	CMP	R3	R3			# Making Registor 3 zero
	BLT	R4	BRN7
	STR	R3	R5
	JMP	BRNEND7	
BRN7	ADI	R3	1
	STR	R3	R5
BRNEND7	CMP	R13	R13			# NO OP Command
# Branch					#t349 WHILEEND1 
	MOV	R3	FP
	ADI	R3	-36
	LDR	R3	R3
	BRZ	R3	WHILEEND1
# Math					#P208 l152 t350
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on P208 andl152
	MOV	R5	FP
	ADI	R5	-40
	STR	R4	R5
# Math					#V142 t350 R351
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-40
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt350
	MOV	R5	FP
	ADI	R5	-44
	STR	R4	R5
# WRTC					#R351  
	MOV	R3	FP
	ADI	R3	-44
	LDR	R3	R3
	LDB	R3	R3
	STB	R3	OUTPUT
	TRP	3	
# Math					#l152 P208 t352
	LDR	R3	l152
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l152 andP208
	MOV	R5	FP
	ADI	R5	-48
	STR	R4	R5
# MOVE					#t352 P208 
	MOV	R3	FP
	ADI	R3	-48
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4
# JMP					#WHILEBEGIN1  
	JMP	WHILEBEGIN1	
# RTN					#  
WHILEEND1	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F217  
msg1(int)	ADI	SP	-8			# Allocates space on top of stack
# FRAME					#P237 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-40
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
# PUSH					#l147  
	LDR	R3	l147
	STR	R3	SP
	ADI	SP	-4
# PUSH					#l176  
	LDR	R3	l176
	STR	R3	SP
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t353  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# WRTI					#P216  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	OUTPUT
	TRP	1	
# WRTC					#l121  
	LDB	R3	l121
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
# FUNC					#F223  
msg2(int)	ADI	SP	-24			# Allocates space on top of stack
# MOVE					#l178 V143 
	LDR	R3	l178
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4
# Math					#l168 V143 t354
	LDR	R3	l168
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l168 andV143
	MOV	R5	FP
	ADI	R5	-16
	STR	R4	R5
# MOVE					#t354 V144 
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	8
	STR	R3	R4
# FRAME					#P237 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-40
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
# PUSH					#V143  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# PUSH					#V144  
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
# PEEK					#t355  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# Math					#l160 l152 t356
	LDR	R3	l160
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on l160 andl152
	MOV	R5	FP
	ADI	R5	-24
	STR	R4	R5
# Math					#V142 t356 R357
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-24
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt356
	MOV	R5	FP
	ADI	R5	-28
	STR	R4	R5
# WRTC					#R357  
	MOV	R3	FP
	ADI	R3	-28
	LDR	R3	R3
	LDB	R3	R3
	STB	R3	OUTPUT
	TRP	3	
# FRAME					#P237 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-40
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
# PUSH					#l162  
	LDR	R3	l162
	STR	R3	SP
	ADI	SP	-4
# PUSH					#l176  
	LDR	R3	l176
	STR	R3	SP
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t358  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-32
	STR	R3	R4
# WRTI					#P222  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	OUTPUT
	TRP	1	
# WRTC					#l121  
	LDB	R3	l121
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
# FUNC					#F231  
msg3()	ADI	SP	-12			# Allocates space on top of stack
# FRAME					#P237 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-40
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
# PUSH					#l198  
	LDR	R3	l198
	STR	R3	SP
	ADI	SP	-4
# PUSH					#l206  
	LDR	R3	l206
	STR	R3	SP
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t359  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4
# MOVE					#l160 V143 
	LDR	R3	l160
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4
# FRAME					#P237 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-40
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
# PUSH					#V143  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# PUSH					#V143  
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
# PEEK					#t360  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# FRAME					#P237 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-40
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
# PUSH					#l162  
	LDR	R3	l162
	STR	R3	SP
	ADI	SP	-4
# PUSH					#l176  
	LDR	R3	l176
	STR	R3	SP
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t361  
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
# FUNC					#F238  
main	ADI	SP	-60			# Allocates space on top of stack
# NEWI					#5 K241 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
	ADI	R3	20
	STR	R3	FREE
# FRAME					#F145 K241 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-280
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K241 as This PTR
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# CALL					#Message()  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	Message()	
# PEEK					#t362  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-24
	STR	R3	R4
# MOVE					#t362 K241 
	MOV	R3	FP
	ADI	R3	-24
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# NEWI					#3 K240 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
	ADI	R3	12
	STR	R3	FREE
# FRAME					#F103 K240 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	0
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K240 as This PTR
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
# PEEK					#t363  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-28
	STR	R3	R4
# MOVE					#t363 K240 
	MOV	R3	FP
	ADI	R3	-28
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# FRAME					#F231 K241 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-12
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K241 as This PTR
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# CALL					#msg3()  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	msg3()	
# PEEK					#t364  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-32
	STR	R3	R4
# RDI					#K239  
	TRP	2	
	LDR	R4	INPUT
	MOV	R3	FP
	ADI	R3	-12
	STR	R4	R3
# WRTC					#l121  
	LDB	R3	l121
	STB	R3	OUTPUT
	TRP	3	
# Boolean					#l147 K239 t365
WHILEBEGIN2	LDR	R3	l147
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	MOV	R5	FP
	ADI	R5	-36
	CMP	R4	R3
	CMP	R3	R3			# Making Registor 3 zero
	BNZ	R4	BRN8
	STR	R3	R5
	JMP	BRNEND8	
BRN8	ADI	R3	1
	STR	R3	R5
BRNEND8	CMP	R13	R13			# NO OP Command
# Branch					#t365 WHILEEND2 
	MOV	R3	FP
	ADI	R3	-36
	LDR	R3	R3
	BRZ	R3	WHILEEND2
# Math					#l245 K239 t366
	LDR	R3	l245
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	MUL	R4	R3			# DO Math Operation on l245 andK239
	MOV	R5	FP
	ADI	R5	-40
	STR	R4	R5
# Math					#t366 l162 t367
	MOV	R3	FP
	ADI	R3	-40
	LDR	R3	R3
	LDR	R4	l162
	ADD	R4	R3			# DO Math Operation on t366 andl162
	MOV	R5	FP
	ADI	R5	-44
	STR	R4	R5
# Math					#l156 t367 t368
	LDR	R3	l156
	MOV	R4	FP
	ADI	R4	-44
	LDR	R4	R4
	SUB	R4	R3			# DO Math Operation on l156 andt367
	MOV	R5	FP
	ADI	R5	-48
	STR	R4	R5
# FRAME					#F106 K240 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-16
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K240 as This PTR
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#t368  
	MOV	R3	FP
	ADI	R3	-48
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#add(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	add(int)	
# PEEK					#t369  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-52
	STR	R3	R4
# Branch					#t369 IFSKIP7 
	MOV	R3	FP
	ADI	R3	-52
	LDR	R3	R3
	BRZ	R3	IFSKIP7
# FRAME					#F217 K241 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-8
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K241 as This PTR
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#K239  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#msg1(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	msg1(int)	
# PEEK					#t370  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-56
	STR	R3	R4
# FRAME					#F119 K240 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K240 as This PTR
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
# PEEK					#t371  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-60
	STR	R3	R4
# JMP					#ELSESKIP6  
	JMP	ELSESKIP6	
# FRAME					#F223 K241 
IFSKIP7	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-24
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K241 as This PTR
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#K239  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#msg2(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	msg2(int)	
# PEEK					#t372  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-64
	STR	R3	R4
# FRAME					#F231 K241 
ELSESKIP6	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-12
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K241 as This PTR
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# CALL					#msg3()  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	msg3()	
# PEEK					#t373  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-68
	STR	R3	R4
# RDI					#K239  
	TRP	2	
	LDR	R4	INPUT
	MOV	R3	FP
	ADI	R3	-12
	STR	R4	R3
# WRTC					#l121  
	LDB	R3	l121
	STB	R3	OUTPUT
	TRP	3	
# JMP					#WHILEBEGIN2  
	JMP	WHILEBEGIN2	
# RTN					#  
WHILEEND2	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
l245	.INT	1000	
l213	.INT	29	
l207	.BYT	'r'	
l206	.INT	28	
l204	.INT	27	
l202	.INT	26	
l200	.INT	25	
l198	.INT	24	
l191	.BYT	'a'	
l189	.BYT	'c'	
l187	.BYT	'i'	
l183	.BYT	'p'	
l181	.BYT	'u'	
l179	.BYT	'D'	
l178	.INT	14	
l177	.BYT	':'	
l176	.INT	13	
l175	.BYT	't'	
l174	.INT	12	
l173	.BYT	'n'	
l172	.INT	11	
l170	.INT	10	
l169	.BYT	'm'	
l168	.INT	9	
l166	.INT	8	
l165	.BYT	'l'	
l164	.INT	7	
l163	.BYT	'E'	
l162	.INT	6	
l160	.INT	5	
l158	.INT	4	
l157	.BYT	'e'	
l156	.INT	3	
l154	.INT	2	
l153	.BYT	'd'	
l152	.INT	1	
l151	.BYT	'A'	
l148	.INT	100	
l147	.INT	0	
l131	.BYT	','	
l130	.BYT	' '	
l121	.BYT	10	
l117	.INT	0	
l108	.INT	1	
l104	.INT	0	
FREE	.INT	stFREE	
stFREE	.INT	0	
