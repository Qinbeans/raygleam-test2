/// Returns true if the window should close, false otherwise.
@external(erlang, "raylib", "should_close")
pub fn should_close() -> Bool

/// Initializes the window. The return value can be ignored.
@external(erlang, "raylib", "init_window")
pub fn init_window(width: Int, height: Int, title: String) -> Int

/// Closes the window. The return value can be ignored.
@external(erlang, "raylib", "close_window")
pub fn close_window() -> Int

/// Set target FPS (maximum).
@external(erlang, "raylib", "set_target_fps")
pub fn set_target_fps(fps: Int) -> Int
