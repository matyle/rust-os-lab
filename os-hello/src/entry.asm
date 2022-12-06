    .section .text.entry # 第 2 行表明我们希望将第 2 行后面的内容全部放到一个名为 .text.entry 的段中。最低地址，最先被执行
    .global _start # 全局符号 其他模块可以使用
_start:
    # li x1,100 #Load Immediate 加载立即数
		la sp, boot_stack_top #sp = boot_stack_top,not consider stack overflow now.
		call rust_main

		.section .bss.stack
		.global boot_stack_lower_bound #low_bound limit
boot_stack_lower_bound:
    .space 4096*16
		.global  boot_stack_top

boot_stack_top:


# strip


