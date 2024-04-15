use raylib::ffi;
use rustler::{init, nif};

#[nif]
fn init_window(width: i32, height: i32, title: String) {
    unsafe {
        ffi::InitWindow(width, height, title.as_ptr() as *const i8);
    }
}

init!("raylib", [init_window]);
