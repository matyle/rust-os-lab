    .section .text.entry # 第 2 行表明我们希望将第 2 行后面的内容全部放到一个名为 .text.entry 的段中。最低地址，最先被执行
    .global _start # 全局符号 其他模块可以使用
_start:
    li x1,100 #Load Immediate 加载立即数


>>注意这里寄存器的名字
1.开头的t代表temporary，一般用于临时变量，t0~6
2.开头的a代表argument，表示是用于函数调用传入的参数，a0~7
3这里用到了a0,a1,a2，a0是hartid，a1和a2代表了个啥不是很确定
jr应该像个函数调用传的参数是hartid : a0,unknown: a1,unkown : a2,
4.没有用到堆栈，目测是8个以内参数和7个以内临时变量的函数吧
