if (player == noone || !player.tem_scanner) exit;

var _x = 16;
var _y = display_get_gui_height() - 70;
var _w = 60;
var _h = 42;

draw_set_color(make_color_rgb(70, 74, 86));
draw_rectangle(_x + _w, _y + 12, _x + _w + 10, _y + _h - 12, false);

draw_set_color(make_color_rgb(44, 48, 58));
draw_rectangle(_x, _y, _x + _w, _y + _h, false);
draw_set_color(c_black);
draw_rectangle(_x, _y, _x + _w, _y + _h, true);

var _tx = _x + 6;
var _ty = _y + 6;
var _tw = _w - 12;
var _th = 20;
draw_set_color(make_color_rgb(8, 36, 22));
draw_rectangle(_tx, _ty, _tx + _tw, _ty + _th, false);

draw_set_alpha(0.25);
draw_set_color(c_lime);
for (var gx = _tx; gx <= _tx + _tw; gx += 6) draw_line(gx, _ty, gx, _ty + _th);
for (var gy = _ty; gy <= _ty + _th; gy += 5) draw_line(_tx, gy, _tx + _tw, gy);
draw_set_alpha(1);

if (scanner_active) {
    var _lx = _tx + ((current_time / 10) mod _tw);
    draw_set_color(c_lime);
    draw_line_width(_lx, _ty, _lx, _ty + _th, 2);
}

draw_set_color(scanner_cooldown > 0 ? c_red : c_lime);
draw_circle(_x + _w - 9, _y + _h - 9, 3, false);

draw_set_color(c_silver);
draw_rectangle(_x + 8, _y + _h - 10, _x + 18, _y + _h - 4, false);

desenhar_keycap(_x + 17, _y - 30, 26, 24, "R");

draw_set_color(c_white);