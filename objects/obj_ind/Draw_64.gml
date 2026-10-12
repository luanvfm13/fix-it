if (!instance_exists(alvo) || alvo.object_index != obj_hubeq) exit;

var _cx = alvo.x + alvo.largura / 2;
var _cy = alvo.y - 12;
var _flutua = sin(current_time / 200) * 6;

draw_set_alpha(0.8);
draw_set_color(cor);
draw_triangle(_cx - 8, _cy - 12 + _flutua, _cx + 8, _cy - 12 + _flutua, _cx, _cy + _flutua, false);
draw_set_alpha(1);
draw_set_color(c_white);