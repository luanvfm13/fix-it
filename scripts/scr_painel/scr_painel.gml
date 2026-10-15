function painel_layout() {
    var _gw = display_get_gui_width();
    var _gh = display_get_gui_height();
    var _s = min((_gw * 0.9) / 800, (_gh * 0.9) / 600);
    var _w = 800 * _s;
    var _h = 600 * _s;
    return { x: (_gw - _w) / 2, y: (_gh - _h) / 2, s: _s, w: _w, h: _h };
}
function desenhar_sprite_topo(_spr, _x, _y, _escala) {
    draw_sprite_ext(_spr, 0,
        _x + sprite_get_xoffset(_spr) * _escala,
        _y + sprite_get_yoffset(_spr) * _escala,
        _escala, _escala, 0, c_white, 1);
}