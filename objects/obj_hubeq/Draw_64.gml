draw_sprite_ext(spr_bteqp, 0, x, y, largura / sprite_get_width(spr_bteqp), altura / sprite_get_height(spr_bteqp), 0, c_white, 1);

var _equipado = variable_global_exists("tem_" + ferramenta_alvo) ? variable_global_get("tem_" + ferramenta_alvo) : false;
if (_equipado) {
    draw_set_color(c_lime);
    draw_set_font(fnt_undertale);
    draw_text(x + largura / 2 - 6, y + altura / 2 - 10, "✓");
    draw_set_color(c_white);
}