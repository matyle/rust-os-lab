use crate::{println, sbi::shut_down};
use core::panic::PanicInfo;
// use crate::console::print

#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    // loop {}
    if let Some(location) = info.location() {
        // println!("Panic at{}:{}{}", location.file)
        println!(
            "Panic at{}:{}{}",
            location.file(),
            location.line(),
            info.message().unwrap()
        );
    } else {
        println!("panicked:{}", info.message().unwrap());
    }
    shut_down()
}
