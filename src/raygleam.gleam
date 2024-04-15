import gleam/io
import raygleam/window
import raygleam/draw
import raygleam/colors

// Event loop is the while loop in the main function
fn event_loop() {
  case window.should_close() {
    True -> window.close_window()
    False -> {
      draw.begin_drawing()
      draw.clear_background(colors.white())
      draw.draw_text("Hello, world!", 10, 10, 20, colors.black())
      draw.end_drawing()
      event_loop()
    }
  }
}

pub fn main() {
  io.println("Hello, world!")
  window.init_window(800, 600, "Hello, world!")
  window.set_target_fps(60)
  event_loop()
  io.println("Goodbye, world!")
}
