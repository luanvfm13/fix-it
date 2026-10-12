if (room != inicio) exit;
if (!debug_rota && global.etapa != 5) exit;
if (instance_exists(obj_dialogo)) exit;

var _off = (current_time / 40) mod 12;

draw_set_alpha(0.35);
draw_set_color(c_aqua);

for (var i = 0; i < array_length(pontos) - 1; i++) {
    var _x1 = pontos[i].x;
    var _y1 = pontos[i].y;
    var _x2 = pontos[i + 1].x;
    var _y2 = pontos[i + 1].y;
    var _len = point_distance(_x1, _y1, _x2, _y2);
    var _dir = point_direction(_x1, _y1, _x2, _y2);

    for (var s = _off; s < _len; s += 12) {
        var _px = _x1 + lengthdir_x(s, _dir);
        var _py = _y1 + lengthdir_y(s, _dir);
        var _c = 5;


        var _tx = _px + lengthdir_x(_c, _dir);
        var _ty = _py + lengthdir_y(_c, _dir);
        var _ax = _px + lengthdir_x(_c * 0.6, _dir + 140);
        var _ay = _py + lengthdir_y(_c * 0.6, _dir + 140);
        var _bx = _px + lengthdir_x(_c * 0.6, _dir - 140);
        var _by = _py + lengthdir_y(_c * 0.6, _dir - 140);

        draw_triangle(_tx, _ty, _ax, _ay, _bx, _by, false);
    }
}

draw_set_alpha(1);
draw_set_color(c_white);