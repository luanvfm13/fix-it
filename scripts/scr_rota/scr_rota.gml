// talvez eu apague isso dps, n pensei em um jeito mais fácil doq criar script com função

/// dist_ponto_segmento(px, py, x1, y1, x2, y2)
// teoria da inclinação reta (x1,y1)-(x2,y2).
function dist_ponto_segmento(_px, _py, _x1, _y1, _x2, _y2) {
    var _dx = _x2 - _x1;
    var _dy = _y2 - _y1;
    var _len2 = _dx * _dx + _dy * _dy;
    if (_len2 == 0) return point_distance(_px, _py, _x1, _y1);
    var _t = clamp(((_px - _x1) * _dx + (_py - _y1) * _dy) / _len2, 0, 1);
    return point_distance(_px, _py, _x1 + _t * _dx, _y1 + _t * _dy);
}