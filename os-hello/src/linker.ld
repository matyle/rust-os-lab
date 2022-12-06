OUTPUT_ARCH(riscv)
ENTRY(_start)
BASE_ADDRESS = 0x80200000;

SECTIONS
{
    . = BASE_ADDRESS;
    skernel = .;

    stext = .;
    .text : {
        *(.text.entry)
        *(.text .text.*)
    }

    . = ALIGN(4K);
    etext = .;
    srodata = .;
    .rodata : {
        *(.rodata .rodata.*)
        *(.srodata .srodata.*)
    }

    . = ALIGN(4K);
    erodata = .;
    sdata = .;
    .data : {
        *(.data .data.*)
        *(.sdata .sdata.*)
    }

    . = ALIGN(4K);
    edata = .;
    .bss : {
        *(.bss.stack)
        sbss = .;
        *(.bss .bss.*)
        *(.sbss .sbss.*)
    }

    . = ALIGN(4K);
    ebss = .;
    ekernel = .;

    /DISCARD/ : {
        *(.eh_frame)
    }
}
/* OUTPUT_ARCH(riscv) */
/* /1* 全局符合 *1/ */
/* ENTRY(_start) */
/* /1* 程序入口地址 *1/ */
/* BASE_ADDRESS = 0x80200000; */

/* SECTIONS */
/* { */
/* 	/1* "." is current address *1/ */
/*     . = BASE_ADDRESS; */ 
/*     skernel = .; */

/*     stext = .; */
/*     .text : { */
/* 			/1* 先于任何段 BASE_ADDRESS 开始 *1/ */
/* /1* <ObjectFile>(SectionName) *1/ */
/*         *(.text.entry) */
/*         *(.text .text.*) */
/*     } */

/*     . = ALIGN(4K); */
/*     etext = .; */
/*     srodata = .; */
/*     .rodata : { */
/*         *(.rodata .rodata.*) */
/*         *(.srodata .srodata.*) */
/*     } */

/*     . = ALIGN(4K); */
/*     erodata = .; */
/*     sdata = .; */
/*     .data : { */
/*         *(.data .data.*) */
/*         *(.sdata .sdata.*) */
/*     } */

/*     . = ALIGN(4K); */
/*     edata = .; */
/*     .bss : { */
/*         *(.bss.stack) */
/*         sbss = .; */
/*         *(.bss .bss.*) */
/*         *(.sbss .sbss.*) */
/*     } */

/*     . = ALIGN(4K); */
/*     ebss = .; */
/*     ekernel = .; */

/*     /DISCARD/ : { */
/*         *(.eh_frame) */
/*     } */
/* } */
