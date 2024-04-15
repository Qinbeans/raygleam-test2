use raylib::ffi;
use rustler::{init, nif};

#[nif]
fn init_window(width: i32, height: i32, title: String) {
    unsafe {
        ffi::InitWindow(width, height, title.as_ptr() as *const i8);
    }
}

#[nif]
fn close_window() {
    unsafe {
        ffi::CloseWindow();
    }
}

#[nif]
fn should_close() -> bool {
    unsafe {
        ffi::WindowShouldClose()
    }
}

#[nif]
fn begin_drawing() {
    unsafe {
        ffi::BeginDrawing();
    }
}

#[nif]
fn end_drawing() {
    unsafe {
        ffi::EndDrawing();
    }
}

#[nif]
fn clear_background(r: u8, g: u8, b: u8, a: u8) {
    let color = ffi::Color { r, g, b, a };
    unsafe {
        ffi::ClearBackground(color);
    }
}

#[nif]
fn draw_text(text: String, x: i32, y: i32, font_size: i32, r: u8, g: u8, b: u8, a: u8) {
    let color = ffi::Color { r, g, b, a };
    unsafe {
        ffi::DrawText(text.as_ptr() as *const i8, x, y, font_size, color);
    }
}

#[nif]
fn draw_fps(x: i32, y: i32) {
    unsafe {
        ffi::DrawFPS(x, y);
    }
}

#[nif]
fn draw_rectangle(x: i32, y: i32, width: i32, height: i32, r: u8, g: u8, b: u8, a: u8) {
    let color = ffi::Color { r, g, b, a };
    unsafe {
        ffi::DrawRectangle(x, y, width, height, color);
    }
}

#[nif]
fn draw_circle(x: i32, y: i32, radius: f32, r: u8, g: u8, b: u8, a: u8) {
    let color = ffi::Color { r, g, b, a };
    unsafe {
        ffi::DrawCircle(x, y, radius, color);
    }
}

#[nif]
fn draw_triangle(x1: f32, y1: f32, x2: f32, y2: f32, x3: f32, y3: f32, r: u8, g: u8, b: u8, a: u8) {
    let color = ffi::Color { r, g, b, a };
    let vector1 = ffi::Vector2 { x: x1, y: y1 };
    let vector2 = ffi::Vector2 { x: x2, y: y2 };
    let vector3 = ffi::Vector2 { x: x3, y: y3 };
    unsafe {
        ffi::DrawTriangle(vector1, vector2, vector3, color);
    }
}

#[nif]
fn draw_poly(x: f32, y: f32, sides: i32, radius: f32, rotation: f32, r: u8, g: u8, b: u8, a: u8) {
    let color = ffi::Color { r, g, b, a };
    let center = ffi::Vector2 { x, y };
    unsafe {
        ffi::DrawPoly(center, sides, radius, rotation, color);
    }
}

#[nif]
fn draw_line(x1: f32, y1: f32, x2: f32, y2: f32, r: u8, g: u8, b: u8, a: u8) {
    let color = ffi::Color { r, g, b, a };
    let start = ffi::Vector2 { x: x1, y: y1 };
    let end = ffi::Vector2 { x: x2, y: y2 };
    unsafe {
        ffi::DrawLineV(start, end, color);
    }
}

#[nif]
fn draw_pixel(x: f32, y: f32, r: u8, g: u8, b: u8, a: u8) {
    let color = ffi::Color { r, g, b, a };
    let position = ffi::Vector2 { x, y};
    unsafe {
        ffi::DrawPixelV(position, color);
    }
}

#[nif]
fn draw_texture(t_id: u32, t_width: i32, t_height: i32, t_mmap: i32, t_format: i32, x: i32, y: i32, r: u8, g: u8, b: u8, a: u8) {
    let texture = ffi::Texture2D { id: t_id, width: t_width, height: t_height, mipmaps: t_mmap, format: t_format };
    let color = ffi::Color { r, g, b, a };
    unsafe {
        ffi::DrawTexture(texture, x, y, color);
    }
}

#[nif]
fn set_target_fps(fps: i32) {
    unsafe {
        ffi::SetTargetFPS(fps);
    }
}

init!("raylib", [init_window, close_window, should_close, begin_drawing, end_drawing, clear_background, draw_text, draw_fps, draw_rectangle, draw_circle, draw_triangle, draw_poly, draw_line, draw_pixel, draw_texture, set_target_fps]);
