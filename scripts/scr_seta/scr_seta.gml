function desenhar_seta(_alvo, _ax, _ay, _flut, _alfa, _cor) {
    if (!instance_exists(_alvo) || _alvo.object_index == obj_hubeq) return;
    var _fora = min(40, _ay - 15);
    var _y = _ay - _fora + _flut;
    draw_set_alpha(_alfa);
    draw_set_color(_cor);
    draw_triangle(_ax - 8, _y - 12, _ax + 8, _y - 12, _ax, _y, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}