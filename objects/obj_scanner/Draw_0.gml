if (!scanner_active) exit;
if (player == noone) exit;
if (global.ui_bloqueando_jogo) exit;

draw_set_font(fnt_undertale);

var _cx = player.x;
var _cy = player.y;
var _r = scanner_range * (0.9 + (scan_pulse / scan_pulse_max) * 0.1);
var _ang = (current_time / 8) mod 360;


draw_set_alpha(0.08);
draw_set_color(make_color_rgb(90, 255, 160));
draw_circle(_cx, _cy, _r, false);


draw_set_alpha(0.45);
draw_set_color(c_lime);
draw_circle(_cx, _cy, _r, true);
draw_set_alpha(0.22);
draw_circle(_cx, _cy, _r * 0.66, true);
draw_circle(_cx, _cy, _r * 0.33, true);


draw_primitive_begin(pr_trianglefan);
draw_vertex_color(_cx, _cy, c_lime, 0.35);
for (var k = 0; k <= 20; k++) {
    var _d = _ang - 40 + k * 2;
    draw_vertex_color(_cx + lengthdir_x(_r, _d), _cy + lengthdir_y(_r, _d), c_lime, 0);
}
draw_primitive_end();


draw_set_alpha(0.9);
draw_set_color(c_lime);
draw_line_width(_cx, _cy, _cx + lengthdir_x(_r, _ang), _cy + lengthdir_y(_r, _ang), 2);


var _pulso = 0.6 + sin(current_time / 120) * 0.4;
for (var i = 0; i < ds_list_size(highlighted_problems); i++) {
    var _prob = highlighted_problems[| i];
    if (!instance_exists(_prob)) continue;

    var _x1 = _prob.x - _prob.sprite_width / 2 - 6;
    var _y1 = _prob.y - _prob.sprite_height / 2 - 6;
    var _x2 = _prob.x + _prob.sprite_width / 2 + 6;
    var _y2 = _prob.y + _prob.sprite_height / 2 + 6;
    var _t = 10;

    draw_set_alpha(_pulso);
    draw_set_color(c_red);
    draw_line_width(_x1, _y1, _x1 + _t, _y1, 2); draw_line_width(_x1, _y1, _x1, _y1 + _t, 2);
    draw_line_width(_x2, _y1, _x2 - _t, _y1, 2); draw_line_width(_x2, _y1, _x2, _y1 + _t, 2);
    draw_line_width(_x1, _y2, _x1 + _t, _y2, 2); draw_line_width(_x1, _y2, _x1, _y2 - _t, 2);
    draw_line_width(_x2, _y2, _x2 - _t, _y2, 2); draw_line_width(_x2, _y2, _x2, _y2 - _t, 2);

    var _label = variable_instance_exists(_prob, "problem_data") ? _prob.problem_data.nome : "!";
    var _lw = string_width(_label) + 10;
    var _lh = string_height(_label) + 4;
    var _lx = _prob.x - _lw / 2;
    var _ly = _y1 - _lh - 4;

    draw_set_alpha(0.75);
    draw_set_color(c_black);
    draw_rectangle(_lx, _ly, _lx + _lw, _ly + _lh, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_text(_lx + 5, _ly + 2, _label);
}

draw_set_alpha(1);
draw_set_color(c_white);