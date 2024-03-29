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
	LDR	R3	l217			# Main Storing 0 as This PTR
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
# Boolean					#l104 V101 t222
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
# Branch					#t222 IFSKIP0 
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
# PEEK					#t223  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# MOVE					#t223 V101 
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
# PEEK					#t224  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-24
	STR	R3	R4
# RETURN					#t224  
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
# REF					#V134 P111 R225
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	0
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# Boolean					#R225 V134 t226
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
# Branch					#t226 IFSKIP1 
	MOV	R3	FP
	ADI	R3	-24
	LDR	R3	R3
	BRZ	R3	IFSKIP1
# REF					#V135 P111 R227
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	4
	MOV	R4	FP
	ADI	R4	-28
	STR	R3	R4
# Boolean					#l104 R227 t228
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
# Branch					#t228 IFSKIP2 
	MOV	R3	FP
	ADI	R3	-32
	LDR	R3	R3
	BRZ	R3	IFSKIP2
# REF					#V135 P111 R229
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	4
	MOV	R4	FP
	ADI	R4	-36
	STR	R3	R4
# NEWI					#3 R229 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-36
	LDR	R4	R4
	STR	R3	R4
	ADI	R3	12
	STR	R3	FREE
# FRAME					#F138 R229 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing R229 as This PTR
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
# PEEK					#t230  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-40
	STR	R3	R4
# MOVE					#t230 R229 
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
# REF					#V135 P111 R231
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
# PUSH					#V135  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#insert(int,iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	insert(int,iNode)	
# PEEK					#t232  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-48
	STR	R3	R4
# RETURN					#t232  
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
# REF					#V134 P111 R233
IFSKIP1	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	0
	MOV	R4	FP
	ADI	R4	-52
	STR	R3	R4
# Boolean					#R233 V134 t234
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
# Branch					#t234 IFSKIP3 
	MOV	R3	FP
	ADI	R3	-56
	LDR	R3	R3
	BRZ	R3	IFSKIP3
# REF					#V136 P111 R235
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	8
	MOV	R4	FP
	ADI	R4	-60
	STR	R3	R4
# Boolean					#l104 R235 t236
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
# Branch					#t236 IFSKIP4 
	MOV	R3	FP
	ADI	R3	-64
	LDR	R3	R3
	BRZ	R3	IFSKIP4
# REF					#V136 P111 R237
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	ADI	R3	8
	MOV	R4	FP
	ADI	R4	-68
	STR	R3	R4
# NEWI					#3 R237 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-68
	LDR	R4	R4
	STR	R3	R4
	ADI	R3	12
	STR	R3	FREE
# FRAME					#F138 R237 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing R237 as This PTR
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
# PEEK					#t238  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-72
	STR	R3	R4
# MOVE					#t238 R237 
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
# REF					#V136 P111 R239
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
# PUSH					#V136  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	8
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#insert(int,iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	insert(int,iNode)	
# PEEK					#t240  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-80
	STR	R3	R4
# RETURN					#t240  
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
# PEEK					#t241  
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
# Boolean					#l104 P123 t242
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
# Branch					#t242 IFSKIP5 
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
# REF					#V135 P123 R243
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
# PUSH					#V135  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#inorder(iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	inorder(iNode)	
# PEEK					#t244  
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
# PEEK					#t245  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-28
	STR	R3	R4
# REF					#V136 P123 R246
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
# PUSH					#V136  
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	8
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#inorder(iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	inorder(iNode)	
# PEEK					#t247  
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
# REF					#V134 P127 R248
ELSESKIP5	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	ADI	R3	0
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# WRTI					#R248  
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
Message()	ADI	SP	0			# Allocates space on top of stack
# MOVE					#l146 V143 
	LDR	R3	l146
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
# FUNC					#F149  
print(int,int)	ADI	SP	-24			# Allocates space on top of stack
# Boolean					#P148 P147 t249
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
# Branch					#t249 WHILEEND0 
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	BRZ	R3	WHILEEND0
# Math					#P147 l150 t250
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	LDR	R4	l150
	MUL	R4	R3			# DO Math Operation on P147 andl150
	MOV	R5	FP
	ADI	R5	-24
	STR	R4	R5
# Math					#V142 t250 R251
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	0
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-24
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on V142 andt250
	MOV	R5	FP
	ADI	R5	-28
	LDR	R5	R5
	LDR	R5	R5
	STR	R4	R5
# WRTC					#R251  
	MOV	R3	FP
	ADI	R3	-28
	LDR	R3	R3
	LDB	R3	R3
	STB	R3	OUTPUT
	TRP	3	
# Math					#l150 P147 t252
	LDR	R3	l150
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l150 andP147
	MOV	R5	FP
	ADI	R5	-32
	STR	R4	R5
# MOVE					#t252 P147 
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
# FUNC					#F153  
msg1(int)	ADI	SP	-4			# Allocates space on top of stack
# WRTC					#l154  
	LDB	R3	l154
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l155  
	LDB	R3	l155
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l155  
	LDB	R3	l155
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l157  
	LDB	R3	l157
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l155  
	LDB	R3	l155
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l130  
	LDB	R3	l130
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l160  
	LDB	R3	l160
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l161  
	LDB	R3	l161
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l157  
	LDB	R3	l157
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l163  
	LDB	R3	l163
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l157  
	LDB	R3	l157
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l165  
	LDB	R3	l165
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l166  
	LDB	R3	l166
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l167  
	LDB	R3	l167
	STB	R3	OUTPUT
	TRP	3	
# WRTI					#P152  
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
# FUNC					#F171  
msg2(int)	ADI	SP	-8			# Allocates space on top of stack
# MOVE					#l146 V143 
	LDR	R3	l146
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4
# Math					#l173 V143 t253
	LDR	R3	l173
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	LDR	R4	R4
	ADD	R4	R3			# DO Math Operation on l173 andV143
	MOV	R5	FP
	ADI	R5	-16
	STR	R4	R5
# MOVE					#t253 V144 
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	8
	STR	R3	R4
# WRTC					#l174  
	LDB	R3	l174
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l175  
	LDB	R3	l175
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l176  
	LDB	R3	l176
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l161  
	LDB	R3	l161
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l178  
	LDB	R3	l178
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l179  
	LDB	R3	l179
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l180  
	LDB	R3	l180
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l166  
	LDB	R3	l166
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l157  
	LDB	R3	l157
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l130  
	LDB	R3	l130
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l160  
	LDB	R3	l160
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l165  
	LDB	R3	l165
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l166  
	LDB	R3	l166
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l157  
	LDB	R3	l157
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l188  
	LDB	R3	l188
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l130  
	LDB	R3	l130
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l160  
	LDB	R3	l160
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l161  
	LDB	R3	l161
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l157  
	LDB	R3	l157
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l163  
	LDB	R3	l163
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l157  
	LDB	R3	l157
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l165  
	LDB	R3	l165
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l166  
	LDB	R3	l166
	STB	R3	OUTPUT
	TRP	3	
# WRTI					#P170  
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
# FUNC					#F199  
msg3()	ADI	SP	0			# Allocates space on top of stack
# MOVE					#l200 V143 
	LDR	R3	l200
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4
# WRTC					#l130  
	LDB	R3	l130
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l130  
	LDB	R3	l130
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l160  
	LDB	R3	l160
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l161  
	LDB	R3	l161
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l157  
	LDB	R3	l157
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l163  
	LDB	R3	l163
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l157  
	LDB	R3	l157
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l165  
	LDB	R3	l165
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l166  
	LDB	R3	l166
	STB	R3	OUTPUT
	TRP	3	
# WRTC					#l167  
	LDB	R3	l167
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
# FUNC					#F212  
main	ADI	SP	-60			# Allocates space on top of stack
# NEWI					#4 K215 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
	ADI	R3	16
	STR	R3	FREE
# FRAME					#F145 K215 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	0
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K215 as This PTR
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
# PEEK					#t254  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-24
	STR	R3	R4
# MOVE					#t254 K215 
	MOV	R3	FP
	ADI	R3	-24
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# NEWI					#3 K214 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
	ADI	R3	12
	STR	R3	FREE
# FRAME					#F103 K214 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	0
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K214 as This PTR
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
# PEEK					#t255  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-28
	STR	R3	R4
# MOVE					#t255 K214 
	MOV	R3	FP
	ADI	R3	-28
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# FRAME					#F199 K215 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	0
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K215 as This PTR
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
# PEEK					#t256  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-32
	STR	R3	R4
# RDI					#K213  
	TRP	2	
	LDR	R4	INPUT
	MOV	R3	FP
	ADI	R3	-12
	STR	R4	R3
# WRTC					#l121  
	LDB	R3	l121
	STB	R3	OUTPUT
	TRP	3	
# Boolean					#l217 K213 t257
WHILEBEGIN1	LDR	R3	l217
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	MOV	R5	FP
	ADI	R5	-36
	CMP	R4	R3
	CMP	R3	R3			# Making Registor 3 zero
	BNZ	R4	BRN7
	STR	R3	R5
	JMP	BRNEND7	
BRN7	ADI	R3	1
	STR	R3	R5
BRNEND7	CMP	R13	R13			# NO OP Command
# Branch					#t257 WHILEEND1 
	MOV	R3	FP
	ADI	R3	-36
	LDR	R3	R3
	BRZ	R3	WHILEEND1
# Math					#l219 K213 t258
	LDR	R3	l219
	MOV	R4	FP
	ADI	R4	-12
	LDR	R4	R4
	MUL	R4	R3			# DO Math Operation on l219 andK213
	MOV	R5	FP
	ADI	R5	-40
	STR	R4	R5
# Math					#t258 l218 t259
	MOV	R3	FP
	ADI	R3	-40
	LDR	R3	R3
	LDR	R4	l218
	ADD	R4	R3			# DO Math Operation on t258 andl218
	MOV	R5	FP
	ADI	R5	-44
	STR	R4	R5
# Math					#l220 t259 t260
	LDR	R3	l220
	MOV	R4	FP
	ADI	R4	-44
	LDR	R4	R4
	SUB	R4	R3			# DO Math Operation on l220 andt259
	MOV	R5	FP
	ADI	R5	-48
	STR	R4	R5
# FRAME					#F106 K214 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-16
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K214 as This PTR
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#t260  
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
# PEEK					#t261  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-52
	STR	R3	R4
# Branch					#t261 IFSKIP7 
	MOV	R3	FP
	ADI	R3	-52
	LDR	R3	R3
	BRZ	R3	IFSKIP7
# FRAME					#F153 K215 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K215 as This PTR
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#K213  
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
# PEEK					#t262  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-56
	STR	R3	R4
# FRAME					#F119 K214 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K214 as This PTR
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
# PEEK					#t263  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-60
	STR	R3	R4
# JMP					#ELSESKIP6  
	JMP	ELSESKIP6	
# FRAME					#F171 K215 
IFSKIP7	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-8
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K215 as This PTR
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#K213  
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
# PEEK					#t264  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-64
	STR	R3	R4
# FRAME					#F199 K215 
ELSESKIP6	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	0
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K215 as This PTR
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
# PEEK					#t265  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-68
	STR	R3	R4
# RDI					#K213  
	TRP	2	
	LDR	R4	INPUT
	MOV	R3	FP
	ADI	R3	-12
	STR	R4	R3
# WRTC					#l121  
	LDB	R3	l121
	STB	R3	OUTPUT
	TRP	3	
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
l220	.INT	3	
l219	.INT	1000	
l218	.INT	6	
l217	.INT	0	
l200	.INT	5	
l188	.BYT	'r'	
l180	.BYT	'a'	
l179	.BYT	'c'	
l178	.BYT	'i'	
l176	.BYT	'p'	
l175	.BYT	'u'	
l174	.BYT	'D'	
l173	.INT	9	
l167	.BYT	':'	
l166	.BYT	't'	
l165	.BYT	'n'	
l163	.BYT	'm'	
l161	.BYT	'l'	
l160	.BYT	'E'	
l157	.BYT	'e'	
l155	.BYT	'd'	
l154	.BYT	'A'	
l150	.INT	1	
l146	.INT	14	
l131	.BYT	','	
l130	.BYT	' '	
l121	.BYT	10	
l117	.INT	0	
l108	.INT	1	
l104	.INT	0	
FREE	.INT	stFREE	
stFREE	.INT	0	
