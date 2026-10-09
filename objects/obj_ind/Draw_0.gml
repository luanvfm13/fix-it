var _flutua = sin(current_time / 200) * 10;
var _teste = 0.6 + sin(current_time / 150) * 0.3;
var _fora = min(40, alvo_y - 15);
var _y = alvo_y - _fora + _flutua;

draw_set_alpha(_teste);
draw_set_color(cor);
draw_triangle(alvo_x - 8, _y - 12, alvo_x + 8, _y - 12, alvo_x, _y, false);
draw_set_alpha(1);
draw_set_color(c_white);