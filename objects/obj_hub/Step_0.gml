var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

painel_w = gui_w * 0.6;
painel_h = painel_w * (sprite_get_height(spr_hubeq) / sprite_get_width(spr_hubeq));
painel_x = (gui_w - painel_w) / 2;
painel_y = (gui_h - painel_h) / 2;

with (obj_hubeq) {
    x = other.painel_x + rel_x * other.painel_w;
    y = other.painel_y + rel_y * other.painel_h;
    largura = rel_w * other.painel_w;
    altura = rel_h * other.painel_h;
}

var _fechar_x = painel_x + painel_w * 0.882;
var _fechar_y = painel_y + painel_h * 0.181;
var _fechar_raio = painel_w * 0.018;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left) && point_distance(_mx, _my, _fechar_x, _fechar_y) < _fechar_raio) {
    instance_destroy();
}

if (keyboard_check_pressed(vk_escape)) {
    instance_destroy();
}