# FRAME					#main this 
START	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	0
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R14	SP			# Stores Stack Pointer into Registor 14
	ADI	SP	-4
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4
	LDR	R8	l132			# Main Storing 0 as This PTR
	STR	R8	SP
	ADI	SP	-4
# CALL					#main  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R14			# Sets FP to new Frame
	STR	R10	FP
	JMP	main	
# QUIT					#  
	JMP	exit	
ERROR	STR	PC	OUTPUT
	TRP	1	
exit	TRP	0	
# FUNC					#F102  
iTree()	ADI	SP	0			# Allocates space on top of stack
# MOVE					#l103 V101 
						# Get l103 into registor R4 RHS = 1
	LDR	R4	l103			# Getting Literal null
						# Store registorR4 into  V101 RHS = 0
	MOV	R12	FP			# Storing Class Varible root
	ADI	R12	-8
	LDR	R12	R12
	ADI	R12	0
	STR	R4	R12
# RETURN					#this  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R13	FP
	ADI	R13	-4
	LDR	R14	R13
						# Get this into registor R3 RHS = 1
	MOV	R12	FP			# Getting Local 
	ADI	R12	-8
	LDR	R3	R12
	STR	R3	FP			# Stores return varible where Return address is
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F105  
add(int)	ADI	SP	-8			# Allocates space on top of stack
# NEWI					#2 V101 
	LDR	R3	FREE			# STORING current FREE PTR to 
						# Store registorR3 into  V101 RHS = 1
	MOV	R12	FP			# Storing Class Varible root
	ADI	R12	-8
	LDR	R12	R12
	ADI	R12	0
	STR	R3	R12
	ADI	R3	8			# Increasing FREE then Storing it
	STR	R3	FREE
# FRAME					#F126 V101 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R14	SP			# Stores Stack Pointer into Registor 14
	ADI	SP	-4
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4
						# Function call Storing V101 as This PTR
						# Get V101 into registor R8 RHS = 0
	MOV	R12	FP			# Getting Class Varible root
	ADI	R12	-8
	LDR	R3	R12
	ADI	R3	0
	STR	R8	SP
	ADI	SP	-4
# PUSH					#P104  
						# Get P104 into registor R3 RHS = 1
	MOV	R12	FP			# Getting Local key
	ADI	R12	-12
	LDR	R3	R12
	STR	R3	SP			# Pushes onto Stack for next Function to use
	ADI	SP	-4
# CALL					#iNode(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R14			# Sets FP to new Frame
	STR	R10	FP
	JMP	iNode(int)	
# PEEK					#t134  
	LDR	R7	SP			# loads what is returned from the prev function call
						# Store registorR7 into  t134 RHS = 0
	MOV	R12	FP			# Storing Local t0
	ADI	R12	-16
	STR	R7	R12
# MOVE					#t134 V101 
						# Get t134 into registor R4 RHS = 1
	MOV	R12	FP			# Getting Local t0
	ADI	R12	-16
	LDR	R4	R12
						# Store registorR4 into  V101 RHS = 0
	MOV	R12	FP			# Storing Class Varible root
	ADI	R12	-8
	LDR	R12	R12
	ADI	R12	0
	STR	R4	R12
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F109  
insert(int,iNode)	ADI	SP	-28			# Allocates space on top of stack
# Boolean					#l103 P108 t135
						# Get l103 into registor R3 RHS = 0
	LDR	R3	l103			# Getting Literal null
						# Get P108 into registor R4 RHS = 0
	MOV	R12	FP			# Getting Local node
	ADI	R12	-16
	LDR	R4	R12
	LDR	R4	R4
	CMP	R4	R3
	BRZ	R4	BRN0
	CMP	R4	R4			# Storing false into Registor R4
						# Store registorR4 into  t135 RHS = 0
	MOV	R12	FP			# Storing Local t1
	ADI	R12	-20
	STR	R4	R12
	JMP	BRNEND0	
						# Get l149 into registor R4 RHS = 1
BRN0	LDR	R4	l149			# Getting Literal 1
						# Store registorR4 into  t135 RHS = 0
	MOV	R12	FP			# Storing Local t1
	ADI	R12	-20
	STR	R4	R12
BRNEND0	CMP	R13	R13			# NO OP Command
# Branch					#t135 IFSKIP0 
						# Get t135 into registor R3 RHS = 0
	MOV	R12	FP			# Getting Local t1
	ADI	R12	-20
	LDR	R3	R12
	BRZ	R3	IFSKIP0
# NEWI					#2 P108 
	LDR	R3	FREE			# STORING current FREE PTR to 
						# Store registorR3 into  P108 RHS = 1
	MOV	R12	FP			# Storing Local node
	ADI	R12	-16
	STR	R3	R12
	LDR	R3	R3
	ADI	R3	8			# Increasing FREE then Storing it
	STR	R3	FREE
# FRAME					#F126 P108 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R14	SP			# Stores Stack Pointer into Registor 14
	ADI	SP	-4
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4
						# Function call Storing P108 as This PTR
						# Get P108 into registor R8 RHS = 0
	MOV	R12	FP			# Getting Local node
	ADI	R12	-16
	LDR	R8	R12
	STR	R8	SP
	ADI	SP	-4
# PUSH					#P107  
						# Get P107 into registor R3 RHS = 1
	MOV	R12	FP			# Getting Local key
	ADI	R12	-12
	LDR	R3	R12
	STR	R3	SP			# Pushes onto Stack for next Function to use
	ADI	SP	-4
# CALL					#iNode(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R14			# Sets FP to new Frame
	STR	R10	FP
	JMP	iNode(int)	
# PEEK					#t136  
	LDR	R7	SP			# loads what is returned from the prev function call
						# Store registorR7 into  t136 RHS = 0
	MOV	R12	FP			# Storing Local t2
	ADI	R12	-24
	STR	R7	R12
# MOVE					#t136 P108 
						# Get t136 into registor R4 RHS = 1
	MOV	R12	FP			# Getting Local t2
	ADI	R12	-24
	LDR	R4	R12
						# Store registorR4 into  P108 RHS = 0
	MOV	R12	FP			# Storing Local node
	ADI	R12	-16
	STR	R4	R12
# RETURN					#l111  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R13	FP
	ADI	R13	-4
	LDR	R14	R13
						# Get l111 into registor R3 RHS = 1
	LDR	R3	l111			# Getting Literal true
	STR	R3	FP			# Stores return varible where Return address is
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# JMP					#ELSESKIP0  
	JMP	ELSESKIP0	
# REF					#V123 P108 R137
						# Get P108 into registor R3 RHS = 1
IFSKIP0	MOV	R12	FP			# Getting Local node
	ADI	R12	-16
	LDR	R12	R12			# EXTRA LOAD IN PUT
	LDR	R3	R12
	ADI	R3	0			# Add Offset to R3 to get the right address
						# Store registorR3 into  R137 RHS = 0
	MOV	R12	FP			# Storing Local R3
	ADI	R12	-28
	STR	R3	R12
# WRTI					#R137  
						# Get R137 into registor R3 RHS = 1
	MOV	R12	FP			# Getting Object Varible R3
	ADI	R12	-28
	LDR	R12	R12
	ADI	R12	-28
	LDR	R3	R12
	STR	R3	OUTPUT			# Does the write to screen
	TRP	1	
# WRTC					#l112  
						# Get l112 into registor R3 RHS = 1
	LDB	R3	l112			# Getting Literal ' '
	STB	R3	OUTPUT			# Does the write to screen
	TRP	3	
# REF					#V124 V101 R138
						# Get V101 into registor R3 RHS = 1
	MOV	R12	FP			# Getting Class Varible root
	ADI	R12	-8
	LDR	R3	R12
	ADI	R3	0
	ADI	R3	4			# Add Offset to R3 to get the right address
						# Store registorR3 into  R138 RHS = 0
	MOV	R12	FP			# Storing Local R4
	ADI	R12	-32
	STR	R3	R12
# FRAME					#F109 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-28
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R14	SP			# Stores Stack Pointer into Registor 14
	ADI	SP	-4
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4
						# Function call Storing this as This PTR
						# Get this into registor R8 RHS = 0
	MOV	R12	FP			# Getting Local 
	ADI	R12	-8
	LDR	R8	R12
	STR	R8	SP
	ADI	SP	-4
# PUSH					#P107  
						# Get P107 into registor R3 RHS = 1
	MOV	R12	FP			# Getting Local key
	ADI	R12	-12
	LDR	R3	R12
	STR	R3	SP			# Pushes onto Stack for next Function to use
	ADI	SP	-4
# PUSH					#R138  
						# Get R138 into registor R3 RHS = 1
	MOV	R12	FP			# Getting Object Varible R4
	ADI	R12	-32
	LDR	R12	R12
	ADI	R12	-32
	LDR	R3	R12
	LDR	R3	R3
	STR	R3	SP			# Pushes onto Stack for next Function to use
	ADI	SP	-4
# CALL					#insert(int,iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R14			# Sets FP to new Frame
	STR	R10	FP
	JMP	insert(int,iNode)	
# PEEK					#t139  
	LDR	R7	SP			# loads what is returned from the prev function call
						# Store registorR7 into  t139 RHS = 0
	MOV	R12	FP			# Storing Local t5
	ADI	R12	-36
	STR	R7	R12
# RETURN					#t139  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R13	FP
	ADI	R13	-4
	LDR	R14	R13
						# Get t139 into registor R3 RHS = 1
	MOV	R12	FP			# Getting Local t5
	ADI	R12	-36
	LDR	R3	R12
	STR	R3	FP			# Stores return varible where Return address is
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
# FUNC					#F114  
print()	ADI	SP	-4			# Allocates space on top of stack
# REF					#V123 V101 R140
						# Get V101 into registor R3 RHS = 1
	MOV	R12	FP			# Getting Class Varible root
	ADI	R12	-8
	LDR	R3	R12
	ADI	R3	0
	ADI	R3	0			# Add Offset to R3 to get the right address
						# Store registorR3 into  R140 RHS = 0
	MOV	R12	FP			# Storing Local R6
	ADI	R12	-12
	STR	R3	R12
# WRTI					#R140  
						# Get R140 into registor R3 RHS = 1
	MOV	R12	FP			# Getting Object Varible R6
	ADI	R12	-12
	LDR	R12	R12
	ADI	R12	-12
	LDR	R3	R12
	STR	R3	OUTPUT			# Does the write to screen
	TRP	1	
# WRTC					#l115  
						# Get l115 into registor R3 RHS = 1
	LDB	R3	l115			# Getting Literal '\n'
	STB	R3	OUTPUT			# Does the write to screen
	TRP	3	
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F118  
inorder(iNode)	ADI	SP	-20			# Allocates space on top of stack
# Boolean					#l103 P117 t141
						# Get l103 into registor R3 RHS = 0
	LDR	R3	l103			# Getting Literal null
						# Get P117 into registor R4 RHS = 0
	MOV	R12	FP			# Getting Local node
	ADI	R12	-12
	LDR	R4	R12
	LDR	R4	R4
	CMP	R4	R3
	BRZ	R4	BRN1
	CMP	R4	R4			# Storing false into Registor R4
						# Store registorR4 into  t141 RHS = 0
	MOV	R12	FP			# Storing Local t7
	ADI	R12	-16
	STR	R4	R12
	JMP	BRNEND1	
						# Get l149 into registor R4 RHS = 1
BRN1	LDR	R4	l149			# Getting Literal 1
						# Store registorR4 into  t141 RHS = 0
	MOV	R12	FP			# Storing Local t7
	ADI	R12	-16
	STR	R4	R12
BRNEND1	CMP	R13	R13			# NO OP Command
# Branch					#t141 IFSKIP1 
						# Get t141 into registor R3 RHS = 0
	MOV	R12	FP			# Getting Local t7
	ADI	R12	-16
	LDR	R3	R12
	BRZ	R3	IFSKIP1
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# REF					#V123 P117 R142
						# Get P117 into registor R3 RHS = 1
IFSKIP1	MOV	R12	FP			# Getting Local node
	ADI	R12	-12
	LDR	R12	R12			# EXTRA LOAD IN PUT
	LDR	R3	R12
	ADI	R3	0			# Add Offset to R3 to get the right address
						# Store registorR3 into  R142 RHS = 0
	MOV	R12	FP			# Storing Local R8
	ADI	R12	-20
	STR	R3	R12
# WRTI					#R142  
						# Get R142 into registor R3 RHS = 1
	MOV	R12	FP			# Getting Object Varible R8
	ADI	R12	-20
	LDR	R12	R12
	ADI	R12	-20
	LDR	R3	R12
	STR	R3	OUTPUT			# Does the write to screen
	TRP	1	
# WRTC					#l112  
						# Get l112 into registor R3 RHS = 1
	LDB	R3	l112			# Getting Literal ' '
	STB	R3	OUTPUT			# Does the write to screen
	TRP	3	
# REF					#V124 P117 R143
						# Get P117 into registor R3 RHS = 1
	MOV	R12	FP			# Getting Local node
	ADI	R12	-12
	LDR	R12	R12			# EXTRA LOAD IN PUT
	LDR	R3	R12
	ADI	R3	4			# Add Offset to R3 to get the right address
						# Store registorR3 into  R143 RHS = 0
	MOV	R12	FP			# Storing Local R9
	ADI	R12	-24
	STR	R3	R12
# FRAME					#F118 this 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-20
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R14	SP			# Stores Stack Pointer into Registor 14
	ADI	SP	-4
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4
						# Function call Storing this as This PTR
						# Get this into registor R8 RHS = 0
	MOV	R12	FP			# Getting Local 
	ADI	R12	-8
	LDR	R8	R12
	STR	R8	SP
	ADI	SP	-4
# PUSH					#R143  
						# Get R143 into registor R3 RHS = 1
	MOV	R12	FP			# Getting Object Varible R9
	ADI	R12	-24
	LDR	R12	R12
	ADI	R12	-24
	LDR	R3	R12
	LDR	R3	R3
	STR	R3	SP			# Pushes onto Stack for next Function to use
	ADI	SP	-4
# CALL					#inorder(iNode)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R14			# Sets FP to new Frame
	STR	R10	FP
	JMP	inorder(iNode)	
# PEEK					#t144  
	LDR	R7	SP			# loads what is returned from the prev function call
						# Store registorR7 into  t144 RHS = 0
	MOV	R12	FP			# Storing Local t10
	ADI	R12	-28
	STR	R7	R12
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F126  
iNode(int)	ADI	SP	-4			# Allocates space on top of stack
# MOVE					#P125 V123 
						# Get P125 into registor R4 RHS = 1
	MOV	R12	FP			# Getting Local key
	ADI	R12	-12
	LDR	R4	R12
						# Store registorR4 into  V123 RHS = 0
	MOV	R12	FP			# Storing Class Varible root
	ADI	R12	-8
	LDR	R12	R12
	ADI	R12	0
	STR	R4	R12
# MOVE					#l103 V124 
						# Get l103 into registor R4 RHS = 1
	LDR	R4	l103			# Getting Literal null
						# Store registorR4 into  V124 RHS = 0
	MOV	R12	FP			# Storing Class Varible next
	ADI	R12	-8
	LDR	R12	R12
	ADI	R12	4
	STR	R4	R12
# RETURN					#this  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R13	FP
	ADI	R13	-4
	LDR	R14	R13
						# Get this into registor R3 RHS = 1
	MOV	R12	FP			# Getting Local 
	ADI	R12	-8
	LDR	R3	R12
	STR	R3	FP			# Stores return varible where Return address is
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F128  
main	ADI	SP	-24			# Allocates space on top of stack
# NEWI					#3 K130 
	LDR	R3	FREE			# STORING current FREE PTR to 
						# Store registorR3 into  K130 RHS = 1
	MOV	R12	FP			# Storing Local tree
	ADI	R12	-16
	STR	R3	R12
	ADI	R3	12			# Increasing FREE then Storing it
	STR	R3	FREE
# FRAME					#F102 K130 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	0
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R14	SP			# Stores Stack Pointer into Registor 14
	ADI	SP	-4
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4
						# Function call Storing K130 as This PTR
						# Get K130 into registor R8 RHS = 0
	MOV	R12	FP			# Getting Local tree
	ADI	R12	-16
	LDR	R8	R12
	STR	R8	SP
	ADI	SP	-4
# CALL					#iTree()  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R14			# Sets FP to new Frame
	STR	R10	FP
	JMP	iTree()	
# PEEK					#t145  
	LDR	R7	SP			# loads what is returned from the prev function call
						# Store registorR7 into  t145 RHS = 0
	MOV	R12	FP			# Storing Local t11
	ADI	R12	-20
	STR	R7	R12
# MOVE					#t145 K130 
						# Get t145 into registor R4 RHS = 1
	MOV	R12	FP			# Getting Local t11
	ADI	R12	-20
	LDR	R4	R12
						# Store registorR4 into  K130 RHS = 0
	MOV	R12	FP			# Storing Local tree
	ADI	R12	-16
	STR	R4	R12
# RDI					#K129  
	TRP	2				# reads from keyboard, looks for int
	LDR	R3	INPUT
						# Store registorR3 into  K129 RHS = 1
	MOV	R12	FP			# Storing Local key
	ADI	R12	-12
	STR	R3	R12
# WRTC					#l115  
						# Get l115 into registor R3 RHS = 1
	LDB	R3	l115			# Getting Literal '\n'
	STB	R3	OUTPUT			# Does the write to screen
	TRP	3	
# Boolean					#l132 K129 t146
						# Get l132 into registor R3 RHS = 0
WHILEBEGIN0	LDR	R3	l132			# Getting Literal 0
						# Get K129 into registor R4 RHS = 0
	MOV	R12	FP			# Getting Local key
	ADI	R12	-12
	LDR	R4	R12
	CMP	R4	R3
	BNZ	R4	BRN2
	CMP	R4	R4			# Storing false into Registor R4
						# Store registorR4 into  t146 RHS = 0
	MOV	R12	FP			# Storing Local t12
	ADI	R12	-24
	STR	R4	R12
	JMP	BRNEND2	
						# Get l149 into registor R4 RHS = 1
BRN2	LDR	R4	l149			# Getting Literal 1
						# Store registorR4 into  t146 RHS = 0
	MOV	R12	FP			# Storing Local t12
	ADI	R12	-24
	STR	R4	R12
BRNEND2	CMP	R13	R13			# NO OP Command
# Branch					#t146 WHILEEND0 
						# Get t146 into registor R3 RHS = 0
	MOV	R12	FP			# Getting Local t12
	ADI	R12	-24
	LDR	R3	R12
	BRZ	R3	WHILEEND0
# FRAME					#F105 K130 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-8
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R14	SP			# Stores Stack Pointer into Registor 14
	ADI	SP	-4
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4
						# Function call Storing K130 as This PTR
						# Get K130 into registor R8 RHS = 0
	MOV	R12	FP			# Getting Local tree
	ADI	R12	-16
	LDR	R8	R12
	STR	R8	SP
	ADI	SP	-4
# PUSH					#K129  
						# Get K129 into registor R3 RHS = 1
	MOV	R12	FP			# Getting Local key
	ADI	R12	-12
	LDR	R3	R12
	STR	R3	SP			# Pushes onto Stack for next Function to use
	ADI	SP	-4
# CALL					#add(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R14			# Sets FP to new Frame
	STR	R10	FP
	JMP	add(int)	
# PEEK					#t147  
	LDR	R7	SP			# loads what is returned from the prev function call
						# Store registorR7 into  t147 RHS = 0
	MOV	R12	FP			# Storing Local t13
	ADI	R12	-28
	STR	R7	R12
# FRAME					#F114 K130 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R14	SP			# Stores Stack Pointer into Registor 14
	ADI	SP	-4
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4
						# Function call Storing K130 as This PTR
						# Get K130 into registor R8 RHS = 0
	MOV	R12	FP			# Getting Local tree
	ADI	R12	-16
	LDR	R8	R12
	STR	R8	SP
	ADI	SP	-4
# CALL					#print()  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R14			# Sets FP to new Frame
	STR	R10	FP
	JMP	print()	
# PEEK					#t148  
	LDR	R7	SP			# loads what is returned from the prev function call
						# Store registorR7 into  t148 RHS = 0
	MOV	R12	FP			# Storing Local t14
	ADI	R12	-32
	STR	R7	R12
# RDI					#K129  
	TRP	2				# reads from keyboard, looks for int
	LDR	R3	INPUT
						# Store registorR3 into  K129 RHS = 1
	MOV	R12	FP			# Storing Local key
	ADI	R12	-12
	STR	R3	R12
# WRTC					#l115  
						# Get l115 into registor R3 RHS = 1
	LDB	R3	l115			# Getting Literal '\n'
	STB	R3	OUTPUT			# Does the write to screen
	TRP	3	
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
l149	.INT	1	
l132	.INT	0	
l115	.BYT	10	
l112	.BYT	' '	
l111	.INT	1	
l103	.INT	0	
FREE	.INT	stFREE	
stFREE	.INT	0	
