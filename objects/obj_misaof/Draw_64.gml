var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(0, 0, gui_w, gui_h, false);
draw_set_alpha(1);

draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var _largura_bloco = 320;
var _y = gui_h / 2 - 90;

var _titulo = "TEMPO ESGOTADO";
var _cor_titulo = c_red;
if (demitido) {
    _titulo = "VOCÊ FOI DEMITIDO";
    _cor_titulo = c_red;
} else if (venceu) {
    _titulo = "MISSÃO CONCLUÍDA!";
    _cor_titulo = c_lime;
}
draw_set_color(_cor_titulo);
draw_text(gui_w / 2, _y, _titulo);
_y += string_height(_titulo) + 20;

var _media = (global.coesao_count > 0) ? (global.coesao_total / global.coesao_count) : 0;
var _cat = get_categoria_coesao(_media);

draw_set_color(_cat.cor);
draw_text(gui_w / 2, _y, _cat.titulo);
_y += string_height(_cat.titulo) + 8;

draw_set_color(c_white);
draw_text_ext(gui_w / 2, _y, _cat.texto, 18, _largura_bloco);
_y += string_height_ext(_cat.texto, 18, _largura_bloco) + 20;

draw_text(gui_w / 2, _y, "Coesão média: " + string(_media) + "%");
_y += 22;
draw_text(gui_w / 2, _y, "Moedas totais: " + string(global.moedas));
_y += 36;

draw_set_color(c_gray);
draw_text(gui_w / 2, _y, "[E / Enter / Espaço] Voltar ao escritório");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);