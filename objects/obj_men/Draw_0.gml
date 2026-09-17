if (text == "") exit;

draw_sprite(spr_dialogo, 0, x, y);

draw_set_alpha(1);
draw_set_color(c_white);
draw_text(15, 340, text);
draw_set_color(c_white);