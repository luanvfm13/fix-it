if (instance_exists(obj_painel)) exit;

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_alpha(1);

draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var _w = min(_gw * 0.4, 360);
var _x = (_gw - _w) / 2;
var _y = _gh / 2 - 120;

draw_set_color(make_color_rgb(248, 255, 240));
draw_text(_gw / 2, _y, "PAUSA");
_y += 60;

for (var i = 0; i < array_length(opcoes); i++) {
    var _sel = (i == opcao);
    draw_set_color(_sel ? make_color_rgb(242, 201, 76) : make_color_rgb(143, 167, 170));
    draw_text(_gw / 2, _y, (_sel ? "> " : "  ") + opcoes[i]);
    _y += 40;
}

draw_set_halign(fa_left);
draw_set_color(c_white);