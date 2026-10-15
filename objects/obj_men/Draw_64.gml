if (text == "") exit;
if (instance_exists(obj_dialogo) || instance_exists(obj_tablet) || instance_exists(obj_hub)) exit;

var _gui_w = display_get_gui_width();
var _pad = 12;
var _max_w = min(_gui_w * 0.6, 560);
var _txt_w = _max_w - _pad * 2;
var _h = string_height_ext(text, -1, _txt_w) + _pad * 2;
var _x = (_gui_w - _max_w) / 2;
var _y = 16;
var _a = clamp(tempo / 20, 0, 1);

draw_set_font(fnt_undertale);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_alpha(0.85 * _a);
draw_set_color(make_color_rgb(14, 26, 31));
draw_rectangle(_x, _y, _x + _max_w, _y + _h, false);

draw_set_alpha(_a);
draw_set_color(make_color_rgb(46, 91, 99));
draw_rectangle(_x, _y, _x + _max_w, _y + _h, true);

draw_set_color(make_color_rgb(230, 238, 238));
draw_text_ext(_x + _pad, _y + _pad, text, -1, _txt_w);

draw_set_alpha(1);
draw_set_color(c_white);