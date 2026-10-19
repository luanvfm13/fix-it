if (fase != "imagem") exit;

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _s = max(_gw / 800, _gh / 600);

draw_set_color(c_black);
draw_rectangle(0, 0, _gw, _gh, false);
desenhar_sprite_topo(spr_fim, (_gw - 800 * _s) / 2, (_gh - 600 * _s) / 2, _s);
draw_set_color(c_white);