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
	STR	R3	R4			# Stores null into root
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
# Boolean					#l104 V101 t245
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
BRNEND0	CMP	R13	R13
# Branch					#t245 IFSKIP0 
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	BRZ	R3	IFSKIP0
# NEWI					#3 V101 
	LDR	R3	FREE			# Allocates space in heap for object
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
	STR	R3	SP			# Stores key into top of stack
	ADI	SP	-4
# CALL					#iNode(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	iNode(int)	
# PEEK					#t246  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# MOVE					#t246 V101 
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	0
	STR	R3	R4			# Stores t1 into root
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
	STR	R3	SP			# Stores key into top of stack
	ADI	SP	-4
# PUSH					#V101  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	STR	R3	SP			# Stores root into top of stack
	ADI	SP	-4
# CALL					#insert(int,iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	insert(int,iNode)	
# PEEK					#t247  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-24
	STR	R3	R4
# RETURN					#t247  
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
# REF					#V134 P111 R248
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	0			# Adds the offset of Stores root to node
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# Boolean					#R248 V134 t249
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
BRNEND1	CMP	R13	R13
# Branch					#t249 IFSKIP1 
	MOV	R3	FP
	ADI	R3	-24
	LDR	R3	R3
	BRZ	R3	IFSKIP1
# REF					#V135 P111 R250
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	4			# Adds the offset of Stores left to node
	MOV	R4	FP
	ADI	R4	-28
	STR	R3	R4
# Boolean					#l104 R250 t251
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
BRNEND2	CMP	R13	R13
# Branch					#t251 IFSKIP2 
	MOV	R3	FP
	ADI	R3	-32
	LDR	R3	R3
	BRZ	R3	IFSKIP2
# REF					#V135 P111 R252
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	4			# Adds the offset of Stores left to node
	MOV	R4	FP
	ADI	R4	-36
	STR	R3	R4
# NEWI					#3 R252 
	LDR	R3	FREE			# Allocates space in heap for object
	MOV	R4	FP
	ADI	R4	-36
	LDR	R4	R4
	STR	R3	R4
	ADI	R3	12
	STR	R3	FREE
# FRAME					#F138 R252 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing R252 as This PTR
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
	STR	R3	SP			# Stores key into top of stack
	ADI	SP	-4
# CALL					#iNode(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	iNode(int)	
# PEEK					#t253  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-40
	STR	R3	R4
# MOVE					#t253 R252 
	MOV	R3	FP
	ADI	R3	-40
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-36
	LDR	R4	R4
	STR	R3	R4			# Stores t8 into R7
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
# REF					#V135 P111 R254
IFSKIP2	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	4			# Adds the offset of Stores left to node
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
	STR	R3	SP			# Stores key into top of stack
	ADI	SP	-4
# PUSH					#R254  
	MOV	R3	FP
	ADI	R3	-44
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	SP			# Stores R9 into top of stack
	ADI	SP	-4
# CALL					#insert(int,iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	insert(int,iNode)	
# PEEK					#t255  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-48
	STR	R3	R4
# RETURN					#t255  
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
# REF					#V134 P111 R256
IFSKIP1	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	0			# Adds the offset of Stores root to node
	MOV	R4	FP
	ADI	R4	-52
	STR	R3	R4
# Boolean					#R256 V134 t257
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
BRNEND3	CMP	R13	R13
# Branch					#t257 IFSKIP3 
	MOV	R3	FP
	ADI	R3	-56
	LDR	R3	R3
	BRZ	R3	IFSKIP3
# REF					#V136 P111 R258
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	8			# Adds the offset of Stores right to node
	MOV	R4	FP
	ADI	R4	-60
	STR	R3	R4
# Boolean					#l104 R258 t259
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
BRNEND4	CMP	R13	R13
# Branch					#t259 IFSKIP4 
	MOV	R3	FP
	ADI	R3	-64
	LDR	R3	R3
	BRZ	R3	IFSKIP4
# REF					#V136 P111 R260
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	8			# Adds the offset of Stores right to node
	MOV	R4	FP
	ADI	R4	-68
	STR	R3	R4
# NEWI					#3 R260 
	LDR	R3	FREE			# Allocates space in heap for object
	MOV	R4	FP
	ADI	R4	-68
	LDR	R4	R4
	STR	R3	R4
	ADI	R3	12
	STR	R3	FREE
# FRAME					#F138 R260 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing R260 as This PTR
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
	STR	R3	SP			# Stores key into top of stack
	ADI	SP	-4
# CALL					#iNode(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	iNode(int)	
# PEEK					#t261  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-72
	STR	R3	R4
# MOVE					#t261 R260 
	MOV	R3	FP
	ADI	R3	-72
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-68
	LDR	R4	R4
	STR	R3	R4			# Stores t16 into R15
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
# REF					#V136 P111 R262
IFSKIP4	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	8			# Adds the offset of Stores right to node
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
	STR	R3	SP			# Stores key into top of stack
	ADI	SP	-4
# PUSH					#R262  
	MOV	R3	FP
	ADI	R3	-76
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	SP			# Stores R17 into top of stack
	ADI	SP	-4
# CALL					#insert(int,iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	insert(int,iNode)	
# PEEK					#t263  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-80
	STR	R3	R4
# RETURN					#t263  
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
	STR	R3	R4			# Stores true into first
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
	STR	R3	SP			# Stores root into top of stack
	ADI	SP	-4
# CALL					#inorder(iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	inorder(iNode)	
# PEEK					#t264  
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
# Boolean					#l104 P123 t265
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
BRNEND5	CMP	R13	R13
# Branch					#t265 IFSKIP5 
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
# REF					#V135 P123 R266
IFSKIP5	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	ADI	R3	4			# Adds the offset of Stores left to node
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
# PUSH					#R266  
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	SP			# Stores R21 into top of stack
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
	STR	R3	SP			# Stores node into top of stack
	ADI	SP	-4
# CALL					#visit(iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	visit(iNode)	
# PEEK					#t268  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-28
	STR	R3	R4
# REF					#V136 P123 R269
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	ADI	R3	8			# Adds the offset of Stores right to node
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
# PUSH					#R269  
	MOV	R3	FP
	ADI	R3	-32
	LDR	R3	R3
	LDR	R3	R3
	STR	R3	SP			# Stores R24 into top of stack
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
	STR	R3	R4			# Stores false into first
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
# REF					#V134 P127 R271
ELSESKIP5	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	ADI	R3	0			# Adds the offset of Stores root to node
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# WRTI					#R271  
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
	STR	R3	R4			# Stores key into root
# MOVE					#l104 V135 
	LDR	R3	l104
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4			# Stores null into left
# MOVE					#l104 V136 
	LDR	R3	l104
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	8
	STR	R3	R4			# Stores null into right
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
	STR	R3	R4			# Stores 0 into j
# Math					#l158 l148 t273
	LDR	R3	l158
	LDR	R4	l148
	MUL	R4	R3			# DO Math Operation on 4 and 100
	MOV	R5	FP
	ADI	R5	-16
	STR	R4	R5
# NEW					#t273 t274 
	LDR	R3	FREE			# Allocates space in heap for Array
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
	MOV	R5	FP
	ADI	R5	-16
	LDB	R5	R5
	ADD	R3	R5
	STR	R3	FREE
# MOVE					#t274 V142 
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	0
	STR	R3	R4			# Stores t28 into msg
# Math					#l147 l152 t275
	LDR	R3	l147
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 0 and 1
	MOV	R5	FP
	ADI	R5	-24
	STR	R4	R5
# Math					#V142 t275 R276
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-24
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t29
	MOV	R5	FP
	ADI	R5	-28
	STR	R4	R5
# MOVE					#l151 R276 
	LDB	R3	l151
	MOV	R4	FP
	ADI	R4	-28
	LDR	R4	R4
	STB	R3	R4			# Stores 'A' into R30
# Math					#l152 l152 t277
	LDR	R3	l152
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 1 and 1
	MOV	R5	FP
	ADI	R5	-32
	STR	R4	R5
# Math					#V142 t277 R278
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-32
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t31
	MOV	R5	FP
	ADI	R5	-36
	STR	R4	R5
# MOVE					#l153 R278 
	LDB	R3	l153
	MOV	R4	FP
	ADI	R4	-36
	LDR	R4	R4
	STB	R3	R4			# Stores 'd' into R32
# Math					#l154 l152 t279
	LDR	R3	l154
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 2 and 1
	MOV	R5	FP
	ADI	R5	-40
	STR	R4	R5
# Math					#V142 t279 R280
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-40
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t33
	MOV	R5	FP
	ADI	R5	-44
	STR	R4	R5
# MOVE					#l153 R280 
	LDB	R3	l153
	MOV	R4	FP
	ADI	R4	-44
	LDR	R4	R4
	STB	R3	R4			# Stores 'd' into R34
# Math					#l156 l152 t281
	LDR	R3	l156
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 3 and 1
	MOV	R5	FP
	ADI	R5	-48
	STR	R4	R5
# Math					#V142 t281 R282
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-48
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t35
	MOV	R5	FP
	ADI	R5	-52
	STR	R4	R5
# MOVE					#l157 R282 
	LDB	R3	l157
	MOV	R4	FP
	ADI	R4	-52
	LDR	R4	R4
	STB	R3	R4			# Stores 'e' into R36
# Math					#l158 l152 t283
	LDR	R3	l158
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 4 and 1
	MOV	R5	FP
	ADI	R5	-56
	STR	R4	R5
# Math					#V142 t283 R284
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-56
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t37
	MOV	R5	FP
	ADI	R5	-60
	STR	R4	R5
# MOVE					#l153 R284 
	LDB	R3	l153
	MOV	R4	FP
	ADI	R4	-60
	LDR	R4	R4
	STB	R3	R4			# Stores 'd' into R38
# Math					#l160 l152 t285
	LDR	R3	l160
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 5 and 1
	MOV	R5	FP
	ADI	R5	-64
	STR	R4	R5
# Math					#V142 t285 R286
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-64
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t39
	MOV	R5	FP
	ADI	R5	-68
	STR	R4	R5
# MOVE					#l130 R286 
	LDB	R3	l130
	MOV	R4	FP
	ADI	R4	-68
	LDR	R4	R4
	STB	R3	R4			# Stores ' ' into R40
# Math					#l162 l152 t287
	LDR	R3	l162
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 6 and 1
	MOV	R5	FP
	ADI	R5	-72
	STR	R4	R5
# Math					#V142 t287 R288
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-72
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t41
	MOV	R5	FP
	ADI	R5	-76
	STR	R4	R5
# MOVE					#l163 R288 
	LDB	R3	l163
	MOV	R4	FP
	ADI	R4	-76
	LDR	R4	R4
	STB	R3	R4			# Stores 'E' into R42
# Math					#l164 l152 t289
	LDR	R3	l164
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 7 and 1
	MOV	R5	FP
	ADI	R5	-80
	STR	R4	R5
# Math					#V142 t289 R290
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-80
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t43
	MOV	R5	FP
	ADI	R5	-84
	STR	R4	R5
# MOVE					#l165 R290 
	LDB	R3	l165
	MOV	R4	FP
	ADI	R4	-84
	LDR	R4	R4
	STB	R3	R4			# Stores 'l' into R44
# Math					#l166 l152 t291
	LDR	R3	l166
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 8 and 1
	MOV	R5	FP
	ADI	R5	-88
	STR	R4	R5
# Math					#V142 t291 R292
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-88
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t45
	MOV	R5	FP
	ADI	R5	-92
	STR	R4	R5
# MOVE					#l157 R292 
	LDB	R3	l157
	MOV	R4	FP
	ADI	R4	-92
	LDR	R4	R4
	STB	R3	R4			# Stores 'e' into R46
# Math					#l168 l152 t293
	LDR	R3	l168
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 9 and 1
	MOV	R5	FP
	ADI	R5	-96
	STR	R4	R5
# Math					#V142 t293 R294
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-96
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t47
	MOV	R5	FP
	ADI	R5	-100
	STR	R4	R5
# MOVE					#l169 R294 
	LDB	R3	l169
	MOV	R4	FP
	ADI	R4	-100
	LDR	R4	R4
	STB	R3	R4			# Stores 'm' into R48
# Math					#l170 l152 t295
	LDR	R3	l170
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 10 and 1
	MOV	R5	FP
	ADI	R5	-104
	STR	R4	R5
# Math					#V142 t295 R296
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-104
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t49
	MOV	R5	FP
	ADI	R5	-108
	STR	R4	R5
# MOVE					#l157 R296 
	LDB	R3	l157
	MOV	R4	FP
	ADI	R4	-108
	LDR	R4	R4
	STB	R3	R4			# Stores 'e' into R50
# Math					#l172 l152 t297
	LDR	R3	l172
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 11 and 1
	MOV	R5	FP
	ADI	R5	-112
	STR	R4	R5
# Math					#V142 t297 R298
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-112
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t51
	MOV	R5	FP
	ADI	R5	-116
	STR	R4	R5
# MOVE					#l173 R298 
	LDB	R3	l173
	MOV	R4	FP
	ADI	R4	-116
	LDR	R4	R4
	STB	R3	R4			# Stores 'n' into R52
# Math					#l174 l152 t299
	LDR	R3	l174
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 12 and 1
	MOV	R5	FP
	ADI	R5	-120
	STR	R4	R5
# Math					#V142 t299 R300
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-120
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t53
	MOV	R5	FP
	ADI	R5	-124
	STR	R4	R5
# MOVE					#l175 R300 
	LDB	R3	l175
	MOV	R4	FP
	ADI	R4	-124
	LDR	R4	R4
	STB	R3	R4			# Stores 't' into R54
# Math					#l176 l152 t301
	LDR	R3	l176
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 13 and 1
	MOV	R5	FP
	ADI	R5	-128
	STR	R4	R5
# Math					#V142 t301 R302
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-128
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t55
	MOV	R5	FP
	ADI	R5	-132
	STR	R4	R5
# MOVE					#l177 R302 
	LDB	R3	l177
	MOV	R4	FP
	ADI	R4	-132
	LDR	R4	R4
	STB	R3	R4			# Stores ':' into R56
# MOVE					#l178 V143 
	LDR	R3	l178
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4			# Stores 14 into i
# Math					#V143 l152 t303
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on i and 1
	MOV	R5	FP
	ADI	R5	-136
	STR	R4	R5
# Math					#V142 t303 R304
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-136
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t57
	MOV	R5	FP
	ADI	R5	-140
	STR	R4	R5
# MOVE					#l179 R304 
	LDB	R3	l179
	MOV	R4	FP
	ADI	R4	-140
	LDR	R4	R4
	STB	R3	R4			# Stores 'D' into R58
# Math					#l152 V143 t305
	LDR	R3	l152
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on 1 and i
	MOV	R5	FP
	ADI	R5	-144
	STR	R4	R5
# Math					#t305 l152 t306
	MOV	R3	FP
	ADI	R3	-144
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t59 and 1
	MOV	R5	FP
	ADI	R5	-148
	STR	R4	R5
# Math					#V142 t306 R307
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-148
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t60
	MOV	R5	FP
	ADI	R5	-152
	STR	R4	R5
# MOVE					#l181 R307 
	LDB	R3	l181
	MOV	R4	FP
	ADI	R4	-152
	LDR	R4	R4
	STB	R3	R4			# Stores 'u' into R61
# Math					#l154 V143 t308
	LDR	R3	l154
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on 2 and i
	MOV	R5	FP
	ADI	R5	-156
	STR	R4	R5
# Math					#t308 l152 t309
	MOV	R3	FP
	ADI	R3	-156
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t62 and 1
	MOV	R5	FP
	ADI	R5	-160
	STR	R4	R5
# Math					#V142 t309 R310
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-160
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t63
	MOV	R5	FP
	ADI	R5	-164
	STR	R4	R5
# MOVE					#l183 R310 
	LDB	R3	l183
	MOV	R4	FP
	ADI	R4	-164
	LDR	R4	R4
	STB	R3	R4			# Stores 'p' into R64
# Math					#l156 V143 t311
	LDR	R3	l156
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on 3 and i
	MOV	R5	FP
	ADI	R5	-168
	STR	R4	R5
# Math					#t311 l152 t312
	MOV	R3	FP
	ADI	R3	-168
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t65 and 1
	MOV	R5	FP
	ADI	R5	-172
	STR	R4	R5
# Math					#V142 t312 R313
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-172
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t66
	MOV	R5	FP
	ADI	R5	-176
	STR	R4	R5
# MOVE					#l165 R313 
	LDB	R3	l165
	MOV	R4	FP
	ADI	R4	-176
	LDR	R4	R4
	STB	R3	R4			# Stores 'l' into R67
# Math					#l158 V143 t314
	LDR	R3	l158
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on 4 and i
	MOV	R5	FP
	ADI	R5	-180
	STR	R4	R5
# Math					#t314 l152 t315
	MOV	R3	FP
	ADI	R3	-180
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t68 and 1
	MOV	R5	FP
	ADI	R5	-184
	STR	R4	R5
# Math					#V142 t315 R316
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-184
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t69
	MOV	R5	FP
	ADI	R5	-188
	STR	R4	R5
# MOVE					#l187 R316 
	LDB	R3	l187
	MOV	R4	FP
	ADI	R4	-188
	LDR	R4	R4
	STB	R3	R4			# Stores 'i' into R70
# Math					#l160 V143 t317
	LDR	R3	l160
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on 5 and i
	MOV	R5	FP
	ADI	R5	-192
	STR	R4	R5
# Math					#t317 l152 t318
	MOV	R3	FP
	ADI	R3	-192
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t71 and 1
	MOV	R5	FP
	ADI	R5	-196
	STR	R4	R5
# Math					#V142 t318 R319
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-196
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t72
	MOV	R5	FP
	ADI	R5	-200
	STR	R4	R5
# MOVE					#l189 R319 
	LDB	R3	l189
	MOV	R4	FP
	ADI	R4	-200
	LDR	R4	R4
	STB	R3	R4			# Stores 'c' into R73
# Math					#l162 V143 t320
	LDR	R3	l162
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on 6 and i
	MOV	R5	FP
	ADI	R5	-204
	STR	R4	R5
# Math					#t320 l152 t321
	MOV	R3	FP
	ADI	R3	-204
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t74 and 1
	MOV	R5	FP
	ADI	R5	-208
	STR	R4	R5
# Math					#V142 t321 R322
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-208
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t75
	MOV	R5	FP
	ADI	R5	-212
	STR	R4	R5
# MOVE					#l191 R322 
	LDB	R3	l191
	MOV	R4	FP
	ADI	R4	-212
	LDR	R4	R4
	STB	R3	R4			# Stores 'a' into R76
# Math					#l164 V143 t323
	LDR	R3	l164
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on 7 and i
	MOV	R5	FP
	ADI	R5	-216
	STR	R4	R5
# Math					#t323 l152 t324
	MOV	R3	FP
	ADI	R3	-216
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t77 and 1
	MOV	R5	FP
	ADI	R5	-220
	STR	R4	R5
# Math					#V142 t324 R325
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-220
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t78
	MOV	R5	FP
	ADI	R5	-224
	STR	R4	R5
# MOVE					#l175 R325 
	LDB	R3	l175
	MOV	R4	FP
	ADI	R4	-224
	LDR	R4	R4
	STB	R3	R4			# Stores 't' into R79
# Math					#l166 V143 t326
	LDR	R3	l166
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on 8 and i
	MOV	R5	FP
	ADI	R5	-228
	STR	R4	R5
# Math					#t326 l152 t327
	MOV	R3	FP
	ADI	R3	-228
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t80 and 1
	MOV	R5	FP
	ADI	R5	-232
	STR	R4	R5
# Math					#V142 t327 R328
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-232
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t81
	MOV	R5	FP
	ADI	R5	-236
	STR	R4	R5
# MOVE					#l157 R328 
	LDB	R3	l157
	MOV	R4	FP
	ADI	R4	-236
	LDR	R4	R4
	STB	R3	R4			# Stores 'e' into R82
# Math					#l168 V143 t329
	LDR	R3	l168
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on 9 and i
	MOV	R5	FP
	ADI	R5	-240
	STR	R4	R5
# Math					#t329 l152 t330
	MOV	R3	FP
	ADI	R3	-240
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on t83 and 1
	MOV	R5	FP
	ADI	R5	-244
	STR	R4	R5
# Math					#V142 t330 R331
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-244
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t84
	MOV	R5	FP
	ADI	R5	-248
	STR	R4	R5
# MOVE					#l169 R331 
	LDB	R3	l169
	MOV	R4	FP
	ADI	R4	-248
	LDR	R4	R4
	STB	R3	R4			# Stores 'm' into R85
# Math					#l198 l152 t332
	LDR	R3	l198
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 24 and 1
	MOV	R5	FP
	ADI	R5	-252
	STR	R4	R5
# Math					#V142 t332 R333
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-252
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t86
	MOV	R5	FP
	ADI	R5	-256
	STR	R4	R5
# MOVE					#l163 R333 
	LDB	R3	l163
	MOV	R4	FP
	ADI	R4	-256
	LDR	R4	R4
	STB	R3	R4			# Stores 'E' into R87
# Math					#l200 l152 t334
	LDR	R3	l200
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 25 and 1
	MOV	R5	FP
	ADI	R5	-260
	STR	R4	R5
# Math					#V142 t334 R335
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-260
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t88
	MOV	R5	FP
	ADI	R5	-264
	STR	R4	R5
# MOVE					#l173 R335 
	LDB	R3	l173
	MOV	R4	FP
	ADI	R4	-264
	LDR	R4	R4
	STB	R3	R4			# Stores 'n' into R89
# Math					#l202 l152 t336
	LDR	R3	l202
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 26 and 1
	MOV	R5	FP
	ADI	R5	-268
	STR	R4	R5
# Math					#V142 t336 R337
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-268
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t90
	MOV	R5	FP
	ADI	R5	-272
	STR	R4	R5
# MOVE					#l175 R337 
	LDB	R3	l175
	MOV	R4	FP
	ADI	R4	-272
	LDR	R4	R4
	STB	R3	R4			# Stores 't' into R91
# Math					#l204 l152 t338
	LDR	R3	l204
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 27 and 1
	MOV	R5	FP
	ADI	R5	-276
	STR	R4	R5
# Math					#V142 t338 R339
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-276
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t92
	MOV	R5	FP
	ADI	R5	-280
	STR	R4	R5
# MOVE					#l157 R339 
	LDB	R3	l157
	MOV	R4	FP
	ADI	R4	-280
	LDR	R4	R4
	STB	R3	R4			# Stores 'e' into R93
# Math					#l206 l152 t340
	LDR	R3	l206
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 28 and 1
	MOV	R5	FP
	ADI	R5	-284
	STR	R4	R5
# Math					#V142 t340 R341
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-284
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t94
	MOV	R5	FP
	ADI	R5	-288
	STR	R4	R5
# MOVE					#l207 R341 
	LDB	R3	l207
	MOV	R4	FP
	ADI	R4	-288
	LDR	R4	R4
	STB	R3	R4			# Stores 'r' into R95
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
print(int,int)	ADI	SP	-24			# Allocates space on top of stack
# Boolean					#P209 P208 t342
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
BRNEND6	CMP	R13	R13
# Branch					#t342 WHILEEND0 
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	BRZ	R3	WHILEEND0
# Math					#P208 l152 t343
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on i and 1
	MOV	R5	FP
	ADI	R5	-24
	STR	R4	R5
# Math					#V142 t343 R344
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-24
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t97
	MOV	R5	FP
	ADI	R5	-28
	STR	R4	R5
# WRTC					#R344  
	MOV	R3	FP
	ADI	R3	-28
	LDR	R3	R3
	LDB	R3	R3
	STB	R3	OUTPUT
	TRP	3	
# Math					#l152 P208 t345
	LDR	R3	l152
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on 1 and i
	MOV	R5	FP
	ADI	R5	-32
	STR	R4	R5
# MOVE					#t345 P208 
	MOV	R3	FP
	ADI	R3	-32
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4			# Stores t99 into i
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
# FUNC					#F214  
msg1(int)	ADI	SP	-8			# Allocates space on top of stack
# FRAME					#P234 this 
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
# PUSH					#l147  
	LDR	R3	l147
	STR	R3	SP			# Stores 0 into top of stack
	ADI	SP	-4
# PUSH					#l176  
	LDR	R3	l176
	STR	R3	SP			# Stores 13 into top of stack
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t346  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# WRTI					#P213  
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
# FUNC					#F220  
msg2(int)	ADI	SP	-24			# Allocates space on top of stack
# MOVE					#l178 V143 
	LDR	R3	l178
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4			# Stores 14 into i
# Math					#l168 V143 t347
	LDR	R3	l168
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on 9 and i
	MOV	R5	FP
	ADI	R5	-16
	STR	R4	R5
# MOVE					#t347 V144 
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	8
	STR	R3	R4			# Stores t101 into end
# FRAME					#P234 this 
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
# PUSH					#V143  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	STR	R3	SP			# Stores i into top of stack
	ADI	SP	-4
# PUSH					#V144  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	8
	LDR	R3	R3
	STR	R3	SP			# Stores end into top of stack
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t348  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# Math					#l160 l152 t349
	LDR	R3	l160
	LDR	R4	l152
	MUL	R4	R3			# DO Math Operation on 5 and 1
	MOV	R5	FP
	ADI	R5	-24
	STR	R4	R5
# Math					#V142 t349 R350
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-24
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on msg and t103
	MOV	R5	FP
	ADI	R5	-28
	STR	R4	R5
# WRTC					#R350  
	MOV	R3	FP
	ADI	R3	-28
	LDR	R3	R3
	LDB	R3	R3
	STB	R3	OUTPUT
	TRP	3	
# FRAME					#P234 this 
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
# PUSH					#l162  
	LDR	R3	l162
	STR	R3	SP			# Stores 6 into top of stack
	ADI	SP	-4
# PUSH					#l176  
	LDR	R3	l176
	STR	R3	SP			# Stores 13 into top of stack
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t351  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-32
	STR	R3	R4
# WRTI					#P219  
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
# FUNC					#F228  
msg3()	ADI	SP	-12			# Allocates space on top of stack
# FRAME					#P234 this 
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
# PUSH					#l198  
	LDR	R3	l198
	STR	R3	SP			# Stores 24 into top of stack
	ADI	SP	-4
# PUSH					#l206  
	LDR	R3	l206
	STR	R3	SP			# Stores 28 into top of stack
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t352  
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
	STR	R3	R4			# Stores 5 into i
# FRAME					#P234 this 
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
# PUSH					#V143  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	STR	R3	SP			# Stores i into top of stack
	ADI	SP	-4
# PUSH					#V143  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	STR	R3	SP			# Stores i into top of stack
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
# FRAME					#P234 this 
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
# PUSH					#l162  
	LDR	R3	l162
	STR	R3	SP			# Stores 6 into top of stack
	ADI	SP	-4
# PUSH					#l176  
	LDR	R3	l176
	STR	R3	SP			# Stores 13 into top of stack
	ADI	SP	-4
# CALL					#print(int,int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	print(int,int)	
# PEEK					#t354  
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
# FUNC					#F235  
main	ADI	SP	-36			# Allocates space on top of stack
# NEWI					#5 K238 
	LDR	R3	FREE			# Allocates space in heap for object
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
	ADI	R3	20
	STR	R3	FREE
# FRAME					#F145 K238 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-280
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K238 as This PTR
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
# PEEK					#t355  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-24
	STR	R3	R4
# MOVE					#t355 K238 
	MOV	R3	FP
	ADI	R3	-24
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4			# Stores t109 into msg
# NEWI					#3 K237 
	LDR	R3	FREE			# Allocates space in heap for object
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
	ADI	R3	12
	STR	R3	FREE
# FRAME					#F103 K237 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	0
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K237 as This PTR
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
# PEEK					#t356  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-28
	STR	R3	R4
# MOVE					#t356 K237 
	MOV	R3	FP
	ADI	R3	-28
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4			# Stores t110 into tree
# FRAME					#F228 K238 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-12
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K238 as This PTR
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
# PEEK					#t357  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-32
	STR	R3	R4
# RDI					#K236  
	TRP	2	
	LDR	R4	INPUT
	MOV	R3	FP
	ADI	R3	-12
	STR	R4	R3
# WRTC					#l121  
	LDB	R3	l121
	STB	R3	OUTPUT
	TRP	3	
# FRAME					#F210 K238 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-24
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K238 as This PTR
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#l147  
	LDR	R3	l147
	STR	R3	SP			# Stores 0 into top of stack
	ADI	SP	-4
# PUSH					#l206  
	LDR	R3	l206
	STR	R3	SP			# Stores 28 into top of stack
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
	ADI	R4	-36
	STR	R3	R4
# FRAME					#F106 K237 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-16
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K237 as This PTR
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#l152  
	LDR	R3	l152
	STR	R3	SP			# Stores 1 into top of stack
	ADI	SP	-4
# CALL					#add(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	add(int)	
# PEEK					#t359  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-40
	STR	R3	R4
# FRAME					#F210 K238 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-24
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K238 as This PTR
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#l147  
	LDR	R3	l147
	STR	R3	SP			# Stores 0 into top of stack
	ADI	SP	-4
# PUSH					#l206  
	LDR	R3	l206
	STR	R3	SP			# Stores 28 into top of stack
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
	ADI	R4	-44
	STR	R3	R4
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
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
