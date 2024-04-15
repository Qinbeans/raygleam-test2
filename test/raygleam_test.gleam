import gleeunit
import gleeunit/should
import raygleam/window
import raygleam/draw
import raygleam/colors
import gleam/list

pub fn main() {
  gleeunit.main()
}

type State {
  Text(x: Int, y: Int)
  Iterations(Int)
}

fn event_loop(state: List(State)) {
  case window.should_close() {
    True -> window.close_window()
    False -> {
      draw.begin_drawing()
      draw.clear_background(colors.white())
      case
        list.fold(state, False, fn(b, s) {
          b
          || case s {
            Text(x, y) -> {
              draw.draw_text("Hello, world!", x, y, 20, colors.black())
              False
            }
            Iterations(i) -> {
              case i % 61 {
                0 -> {
                  should.equal(i, 61)
                  True
                }
                _ -> False
              }
            }
          }
        })
      {
        True -> window.close_window()
        False -> {
          draw.end_drawing()
          event_loop(
            // Update loop
            list.map(state, fn(s) {
              case s {
                Text(x, y) -> Text(x + 1, y + 1)
                Iterations(i) -> Iterations(i + 1)
              }
            }),
          )
        }
      }
    }
  }
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  let state = [Text(10, 10), Iterations(1)]
  window.init_window(800, 600, "Hello, world!")
  window.set_target_fps(60)
  event_loop(state)
}
