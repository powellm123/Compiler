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
	LDR	R3	l118			# Main Storing 0 as This PTR
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
# FUNC					#F104  
Cat(int)	ADI	SP	-8			# Allocates space on top of stack
# NEWI					#1 V102 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-8
	LDR	R4	R4
	ADI	R4	4
	STR	R3	R4
	ADI	R3	4
	STR	R3	FREE
# FRAME					#F110 V102 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-4
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing V102 as This PTR
	MOV	R3	FP
	ADI	R3	-8
	LDR	R3	R3
	ADI	R3	4
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#P103  
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4
# CALL					#Dog(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	Dog(int)	
# PEEK					#t114  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# MOVE					#t114 V102 
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
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
# FUNC					#F105  
run()	ADI	SP	0			# Allocates space on top of stack
# RTN					#  
	LDR	R15	FP			#  De-Allocating Current AR 
	MOV	R11	FP
	ADI	R11	-4
	LDR	R14	R11
	MOV	SP	FP			#  Set the SP and FP to new Location 
	MOV	FP	R14			#  Sets the FP to the Prev Frame Pointer
	JMR	R15				#  Jumping back to Caller 
# FUNC					#F110  
Dog(int)	ADI	SP	-4			# Allocates space on top of stack
# MOVE					#P109 V108 
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
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
# FUNC					#F111  
main	ADI	SP	-16			# Allocates space on top of stack
# NEWI					#3 K112 
	LDR	R3	FREE
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4
	ADI	R3	12
	STR	R3	FREE
# FRAME					#F104 K112 
	MOV	R1	SP			# ERROR Checking for Stack OverFlow
	ADI	R1	-8
	LDR	R2	FREE
	CMP	R1	R2
	BLT	R1	ERROR
	MOV	R0	SP			# Stores Stack Pointer into Registor 0
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
	STR	FP	SP			# Stores Location of FP into SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
						# Function call Storing K112 as This PTR
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	STR	R3	SP
	ADI	SP	-4			# Adjust Stack Pointer for Return Address
# PUSH					#l113  
	LDR	R3	l113
	STR	R3	SP
	ADI	SP	-4
# CALL					#Cat(int)  
	MOV	R10	PC
	ADI	R10	21
	MOV	FP	R0			# Sets FP to new Frame
	STR	R10	FP
	JMP	Cat(int)	
# PEEK					#t115  
	LDR	R3	SP			# loads what is returned from the prev function call
	MOV	R4	FP
	ADI	R4	-16
	STR	R3	R4
# MOVE					#t115 K112 
	MOV	R3	FP
	ADI	R3	-16
	LDR	R3	R3
	MOV	R4	FP
	ADI	R4	-12
	STR	R3	R4
# REF					#V102 K112 R116
	MOV	R3	FP
	ADI	R3	-12
	LDR	R3	R3
	ADI	R3	4
	MOV	R4	FP
	ADI	R4	-20
	STR	R3	R4
# REF					#V108 R116 R117
	MOV	R3	FP
	ADI	R3	-20
	LDR	R3	R3
	LDR	R3	R3
	ADI	R3	0
	MOV	R4	FP
	ADI	R4	-24
	STR	R3	R4
# WRTI					#R117  
	MOV	R3	FP
	ADI	R3	-24
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
l118	.INT	0	
l113	.INT	5	
FREE	.INT	stFREE	
stFREE	.INT	0	
