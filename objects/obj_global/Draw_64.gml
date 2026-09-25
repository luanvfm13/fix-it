if (!global.timer_ativo) exit;

var _min = global.tempo_restante div 60;
var _seg = global.tempo_restante mod 60;
var _seg_str = string(_seg);
if (_seg < 10) _seg_str = "0" + _seg_str;

draw_set_color(c_white);
draw_text(display_get_gui_width() - 90, 10, string(_min) + ":" + _seg_str);
draw_set_color(c_white);