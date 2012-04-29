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
	LDR	R3	l108			# Main Storing 0 as This PTR
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
# FUNC					#F100  
main	ADI	SP	-12			# Allocates space on top of stack
# MOVE					#l102 K101 
	LDR	R3	l102
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4			# Stores 5 into i
# MOVE					#l104 K103 
	LDR	R3	l104
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4			# Stores 6 into j
# Boolean					#K103 K101 t107
	MOV	R3	FP
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
	STR	R3	R5
	JMP	BRNEND0	
BRN0	ADI	R3	1
	STR	R3	R5
BRNEND0	CMP	R13	R13
# Branch					#t107 IFSKIP0 
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	BRZ	R3	IFSKIP0
# WRTI					#l105  
	LDR	R3	l105
	STR	R3	OUTPUT
	TRP	1	
# JMP					#ELSESKIP0  
	JMP	ELSESKIP0	
# WRTI					#l106  
IFSKIP0	LDR	R3	l106
	STR	R3	OUTPUT
	TRP	1	
# RTN					#  
ELSESKIP0	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
l108	.INT	0	
l106	.INT	2	
l105	.INT	1	
l104	.INT	6	
l102	.INT	5	
FREE	.INT	stFREE	
stFREE	.INT	0	
