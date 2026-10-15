var _L = painel_layout();
var _gx = device_mouse_x_to_gui(0);
var _gy = device_mouse_y_to_gui(0);

var _x1, _y1, _x2, _y2;
if (tipo == "controles") {
    _x1 = _L.x + 711 * _L.s;  _y1 = _L.y + 16 * _L.s;
    _x2 = _L.x + 768 * _L.s;  _y2 = _L.y + 48 * _L.s;
} else {
    _x1 = _L.x + _L.w - 80 * _L.s;  _y1 = _L.y + 12 * _L.s;
    _x2 = _L.x + _L.w - 12 * _L.s;  _y2 = _L.y + 40 * _L.s;
}

var _clicou_x = mouse_check_button_pressed(mb_left) && point_in_rectangle(_gx, _gy, _x1, _y1, _x2, _y2);
if (_clicou_x || keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("X"))) {
    instance_destroy();
}