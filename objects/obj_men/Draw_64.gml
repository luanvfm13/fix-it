if (array_length(pilha) == 0) exit;
if (instance_exists(obj_dialogo) || instance_exists(obj_tablet) || instance_exists(obj_hub)) exit;

var _gui_w = display_get_gui_width();
var _pad = 10;
var _gap = 6;
var _max_w = min(_gui_w * 0.6, 560);
var _txt_w = _max_w - _pad * 2 - 4;
var _x = (_gui_w - _max_w) / 2;
var _y = 16;

draw_set_font(fnt_undertale);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (var i = 0; i < array_length(pilha); i++) {
    var _m = pilha[i];
    var _h = string_height_ext(_m.texto, -1, _txt_w) + _pad * 2;
    var _a = clamp(_m.vida / 15, 0, 1);

    draw_set_alpha(0.85 * _a);
    draw_set_color(make_color_rgb(14, 26, 31));
    draw_rectangle(_x, _y, _x + _max_w, _y + _h, false);

    draw_set_alpha(_a);
    draw_set_color((i == 0) ? make_color_rgb(242, 201, 76) : make_color_rgb(46, 91, 99));
    draw_rectangle(_x, _y, _x + 3, _y + _h, false);

    draw_set_color(make_color_rgb(230, 238, 238));
    draw_text_ext(_x + _pad + 4, _y + _pad, _m.texto, -1, _txt_w);

    _y += _h + _gap;
}

draw_set_alpha(1);
draw_set_color(c_white);