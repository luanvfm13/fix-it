if (text == "") exit;

var _camera = view_camera[0];
if (_camera == -1) exit;

var _camera_x = camera_get_view_x(_camera);
var _camera_y = camera_get_view_y(_camera);
var _largura_camera = camera_get_view_width(_camera);
var _largura_caixa = min(310, _largura_camera - 10);
var _largura_texto = _largura_caixa - 16;
var _altura_caixa = max(40, string_height_ext(text, -1, _largura_texto) + 14);

draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(_camera_x + 5, _camera_y + 5, _camera_x + 5 + _largura_caixa, _camera_y + 5 + _altura_caixa, false);

draw_set_alpha(1);
draw_set_color(c_white);
draw_text_ext(_camera_x + 13, _camera_y + 10, text, -1, _largura_texto);
draw_set_color(c_white);