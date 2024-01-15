ori $29,$0,12
ori $2,$0, 0x00001234
ori $3, $0, 0x3456 
addu $4, $2, $3   
subu $6, $3, $4
sw $2, 0($0)
sw $3, 4($0)
sw $4, 4($29)
lw $5, 0($0)
beq $2, $5, _lb2
_lb1:lw $3, 4($29)
_lb2:lw $5, 4($0)
beq $3, $5, _lb1  
jal F_Test_JAL
or $1,$2,$3
xor $1,$2,$3
nor $1,$2,$3
F_Test_JAL:slt $10,$2,$3
slti $10,$2,12
srl $11,$2,3
srlv $12,$2,$29
addi $13,$2,12
andi  $7,$29,12
and $8,$29,$2
xori $14,$2,12
jr $31