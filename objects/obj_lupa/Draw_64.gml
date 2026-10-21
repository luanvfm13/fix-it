if (room != restaurante) exit;
if (!instance_exists(obj_prota)) exit;
if (!obj_prota.tem_lupa) exit;

var _x = 100;
var _y = display_get_gui_height() - 70;
var _w = 60;
var _h = 42;

draw_set_color(make_color_rgb(70, 74, 86));
draw_rectangle(_x + _w, _y + 12, _x + _w + 10, _y + _h - 12, false);


draw_set_color(make_color_rgb(44, 48, 58));
draw_rectangle(_x, _y, _x + _w, _y + _h, false);
draw_set_color(c_black);
draw_rectangle(_x, _y, _x + _w, _y + _h, true);


var _s  = min(40 / sprite_get_width(lupa), 30 / sprite_get_height(lupa));
var _sw = sprite_get_width(lupa) * _s;
var _sh = sprite_get_height(lupa) * _s;
var _dx = _x + (_w - _sw) / 2 + sprite_get_xoffset(lupa) * _s;
var _dy = _y + (_h - _sh) / 2 + sprite_get_yoffset(lupa) * _s;
draw_sprite_ext(lupa, 0, _dx, _dy, _s, _s, 0, c_white, 1);


draw_set_color(c_lime);
draw_circle(_x + _w - 9, _y + _h - 9, 3, false);


desenhar_keycap(_x + 17, _y - 30, 26, 24, "E");

draw_set_color(c_white);