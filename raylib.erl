-module(raylib).
-export([init_window/3]).
-nifs([init_window/3]).
-on_load(init/0).

init() ->
    ok = erlang:load_nif("priv/raygleam", 0).

init_window(_Width, _Height, _Title) ->
    exit(nif_library_not_loaded).
