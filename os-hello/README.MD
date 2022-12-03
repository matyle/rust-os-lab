# 内核的第一条指令

## 内存布局
![](http://rcore-os.cn/rCore-Tutorial-Book-v3/_images/MemoryLayout.png)

### 段section
- 存放初始化变量，常量等
- 存放未初始化数据
- Heap堆
- 栈


根据文档riscv-spec-20191213.pdf中Ch2和Ch25
0x1000: auipc t0,0x0
Add Upper Immediate PC: rd = pc + imm[31:12]
U型指令
把当前指令的地址加上立即数这里的立即数对应的是寄存器中的高20位，相对于imm<<12，然后保存到寄存器t0
0x1004: addi a2,t0,40
ADD Immeiate: rd = rs1 + imm[11:0]
执行后 a2 = 0x1028
I型指令
0x1008: csrr a0,mhartid
伪指令
Control State Register Read: a0 = mhartid
mhartid寄存器，当前hart的id#0
0x100c: ld a1,32(t0)
Load Double-word: rd = rs1 + imm[11:0]
I型号指令
从地址rs1+imm[11:0]出加载4个字节的数据到寄存器rd
$a1 = [4bytes@0x1020]
0x1010: ld t0,24(t0)
$t0 = [4bytes@1018] 这里是1018出开始加载4个字节，小端内存序，所以寄存器中的数据应该是0x80000000
0x1014: jr t0
伪指令，jr rs <=> jalr x0, 0(rs)，Jump register
意思是跳转到t0位置

>>注意这里寄存器的名字
1.开头的t代表temporary，一般用于临时变量，t0~6
2.开头的a代表argument，表示是用于函数调用传入的参数，a0~7
3这里用到了a0,a1,a2，a0是hartid，a1和a2代表了个啥不是很确定
jr应该像个函数调用传的参数是hartid : a0,unknown: a1,unkown : a2,
4.没有用到堆栈，目测是8个以内参数和7个以内临时变量的函数吧
