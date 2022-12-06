// os/src/sbi.rs
#![allow(unused)] // 此行请放在该文件最开头
const SBI_SET_TIMER: usize = 0; //timer
const SBI_CONSOLE_PUTCHAR: usize = 1; //putchar
const SBI_CONSOLE_GETCHAR: usize = 2; //getchar
const SBI_CLEAR_IPI: usize = 3; //clear ipi
const SBI_SEND_IPI: usize = 4; //send ipi
const SBI_REMOTE_FENCE_I: usize = 5;
const SBI_REMOTE_SFENCE_VMA: usize = 6;
const SBI_REMOTE_SFENCE_VMA_ASID: usize = 7;
const SBI_SHUTDOWN: usize = 8;

use core::arch::asm;

//like syscall
fn sbi_call(which: usize, arg0: usize, arg1: usize, arg2: usize) -> usize {
    let mut ret; // mut var
    unsafe {
        asm!(
        "ecall",
        inlateout("x10") arg0 =>ret, // ret
        in("x11")arg1, //arg
        in("x12")arg2, //argument
        in("x17")which, //type
        )
    }
    //return
    ret
}

pub fn console_putchar(c: usize) {
    // sbi_call()
    // input :c
    sbi_call(SBI_CONSOLE_PUTCHAR, c, 0, 0);
}

pub fn shut_down() -> ! {
    sbi_call(SBI_SHUTDOWN, 0, 0, 0);
    panic!("should shut_down");
}
