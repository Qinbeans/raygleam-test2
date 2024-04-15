-module(raylib).
% color is rgba as 4 parameters
-export([init_window/3, close_window/0, should_close/0, begin_drawing/0, end_drawing/0, clear_background/4, draw_text/8, draw_fps/2, draw_rectangle/8, draw_circle/7, draw_triangle/10, draw_poly/9, draw_line/8, draw_pixel/6, draw_texture/11, set_target_fps/1]).
-nifs([init_window/3, close_window/0, should_close/0, begin_drawing/0, end_drawing/0, clear_background/4, draw_text/8, draw_fps/2, draw_rectangle/8, draw_circle/7, draw_triangle/10, draw_poly/9, draw_line/8, draw_pixel/6, draw_texture/11, set_target_fps/1]).
-on_load(init/0).

init() ->
    erlang:load_nif("./priv/raygleam", 0).

init_window(_Width, _Height, _Title) ->
    exit(nif_library_not_loaded).

close_window() ->
    exit(nif_library_not_loaded).

should_close() ->
    exit(nif_library_not_loaded).

begin_drawing() ->
    exit(nif_library_not_loaded).

end_drawing() ->
    exit(nif_library_not_loaded).

clear_background(_R, _G, _B, _A) ->
    exit(nif_library_not_loaded).

draw_text(_Text, _X, _Y, _Font_size, _R, _G, _B, _A) ->
    exit(nif_library_not_loaded).

draw_fps(_X, _Y) ->
    exit(nif_library_not_loaded).

draw_rectangle(_X, _Y, _Width, _Height, _R, _G, _B, _A) ->
    exit(nif_library_not_loaded).

draw_circle(_X, _Y, _Radius, _R, _G, _B, _A) ->
    exit(nif_library_not_loaded).

draw_triangle(_X1, _Y1, _X2, _Y2, _X3, _Y3, _R, _G, _B, _A) ->
    exit(nif_library_not_loaded).

draw_poly(_X, _Y, _Sides, _Radius, _Rotation, _R, _G, _B, _A) ->
    exit(nif_library_not_loaded).

draw_line(_X1, _Y1, _X2, _Y2, _R, _G, _B, _A) ->
    exit(nif_library_not_loaded).

draw_pixel(_X, _Y, _R, _G, _B, _A) ->
    exit(nif_library_not_loaded).

draw_texture(_Texture_id, _Texture_width, _Texture_height, _Texture_mipmap, _Texture_format, _X, _Y, _R, _G, _B, _A) ->
    exit(nif_library_not_loaded).

set_target_fps(_Fps) ->
    exit(nif_library_not_loaded).