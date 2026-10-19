if (!global.timer_ativo || room != restaurante) exit;

var _min = global.tempo_restante div 60;
var _seg = global.tempo_restante mod 60;
var _seg_str = string(_seg);
if (_seg < 10) _seg_str = "0" + _seg_str;

draw_set_color(c_white);
draw_text(display_get_gui_width() - 90, 10, string(_min) + ":" + _seg_str);


if (global.tempo_flash_t > 0) {
    var _alpha = min(1, global.tempo_flash_t / 30);
    var _sobe = (90 - global.tempo_flash_t) * 0.2;
    draw_set_alpha(_alpha);
     draw_set_color(global.tempo_flash_cor);
    draw_text(display_get_gui_width() - 90, 38 - _sobe, global.tempo_flash_txt);
    draw_set_alpha(1);
}

draw_set_color(c_white);