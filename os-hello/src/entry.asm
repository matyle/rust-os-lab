    .section .text.entry # 第 2 行表明我们希望将第 2 行后面的内容全部放到一个名为 .text.entry 的段中。最低地址，最先被执行
    .global _start # 全局符号 其他模块可以使用
_start:
    li x1,100 #Load Immediate 加载立即数


