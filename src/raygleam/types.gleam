/// Color object
pub type Color {
  Color(r: Int, g: Int, b: Int, a: Int)
}

/// Vector2 object
pub type Vector2 {
  Vector2(x: Float, y: Float)
}

pub type Texture {
  Texture(id: Int, width: Int, height: Int, mipmaps: Int, format: Int)
}
