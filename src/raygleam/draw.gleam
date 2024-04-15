import raygleam/types.{type Color, type Texture, type Vector2}

/// Consider this a complicated version of `clear_background`.
@external(erlang, "raylib", "clear_background")
fn local_clear_background(r: Int, g: Int, b: Int, a: Int) -> Int

/// Clears the window with the given color.
pub fn clear_background(color: Color) {
  local_clear_background(color.r, color.g, color.b, color.a)
}

/// Begin drawing state
@external(erlang, "raylib", "begin_drawing")
pub fn begin_drawing() -> Int

/// End drawing state
@external(erlang, "raylib", "end_drawing")
pub fn end_drawing() -> Int

@external(erlang, "raylib", "draw_text")
fn local_draw_text(
  text: String,
  x: Int,
  y: Int,
  size: Int,
  r: Int,
  g: Int,
  b: Int,
  a: Int,
) -> Int

/// Draw text
pub fn draw_text(text: String, x: Int, y: Int, size: Int, color: Color) -> Int {
  local_draw_text(text, x, y, size, color.r, color.g, color.b, color.a)
}

/// Draw FPS to window
@external(erlang, "raylib", "draw_fps")
pub fn draw_fps(x: Int, y: Int) -> Int

@external(erlang, "raylib", "draw_rectangle")
fn local_draw_rectangle(
  x: Int,
  y: Int,
  width: Int,
  height: Int,
  r: Int,
  g: Int,
  b: Int,
  a: Int,
) -> Int

/// Draw rectangle
pub fn draw_rectangle(
  x: Int,
  y: Int,
  width: Int,
  height: Int,
  color: Color,
) -> Int {
  local_draw_rectangle(x, y, width, height, color.r, color.g, color.b, color.a)
}

@external(erlang, "raylib", "draw_circle")
fn local_draw_circle(
  x: Int,
  y: Int,
  radius: Int,
  r: Int,
  g: Int,
  b: Int,
  a: Int,
) -> Int

/// Draw circle
pub fn draw_circle(x: Int, y: Int, radius: Int, color: Color) -> Int {
  local_draw_circle(x, y, radius, color.r, color.g, color.b, color.a)
}

@external(erlang, "raylib", "draw_triangle")
fn local_draw_triangle(
  x1: Float,
  y1: Float,
  x2: Float,
  y2: Float,
  x3: Float,
  y3: Float,
  r: Int,
  g: Int,
  b: Int,
  a: Int,
) -> Int

/// Draw triangle
pub fn draw_triangle(v1: Vector2, v2: Vector2, v3: Vector2, color: Color) -> Int {
  local_draw_triangle(
    v1.x,
    v1.y,
    v2.x,
    v2.y,
    v3.x,
    v3.y,
    color.r,
    color.g,
    color.b,
    color.a,
  )
}

@external(erlang, "raylib", "draw_poly")
fn local_draw_poly(
  x: Float,
  y: Float,
  sides: Int,
  radius: Float,
  rotation: Float,
  r: Int,
  g: Int,
  b: Int,
  a: Int,
) -> Int

/// Draw polygon
pub fn draw_poly(
  center: Vector2,
  sides: Int,
  radius: Float,
  rotation: Float,
  color: Color,
) -> Int {
  local_draw_poly(
    center.x,
    center.y,
    sides,
    radius,
    rotation,
    color.r,
    color.g,
    color.b,
    color.a,
  )
}

@external(erlang, "raylib", "draw_line")
fn local_draw_line(
  x1: Float,
  y1: Float,
  x2: Float,
  y2: Float,
  r: Int,
  g: Int,
  b: Int,
  a: Int,
) -> Int

/// Draw line
pub fn draw_line(v1: Vector2, v2: Vector2, color: Color) -> Int {
  local_draw_line(v1.x, v1.y, v2.x, v2.y, color.r, color.g, color.b, color.a)
}

@external(erlang, "raylib", "draw_pixel")
fn local_draw_pixel(x: Float, y: Float, r: Int, g: Int, b: Int, a: Int) -> Int

/// Draw pixel
pub fn draw_pixel(v: Vector2, color: Color) -> Int {
  local_draw_pixel(v.x, v.y, color.r, color.g, color.b, color.a)
}

@external(erlang, "raylib", "draw_texture")
fn local_draw_texture(
  t_id: Int,
  t_width: Int,
  t_height: Int,
  t_mmap: Int,
  t_format: Int,
  x: Int,
  y: Int,
  r: Int,
  g: Int,
  b: Int,
  a: Int,
) -> Int

/// Draw texture
pub fn draw_texture(texture: Texture, x: Int, y: Int, color: Color) -> Int {
  local_draw_texture(
    texture.id,
    texture.width,
    texture.height,
    texture.mipmaps,
    texture.format,
    x,
    y,
    color.r,
    color.g,
    color.b,
    color.a,
  )
}
