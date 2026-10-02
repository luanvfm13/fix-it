var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(0, 0, gui_w, gui_h, false);
draw_set_alpha(1);

draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _titulo = venceu ? "Missao Concluída com Sucesso!" : "TEMPO ESGOTADO";
draw_set_color(venceu ? c_lime : c_red);
draw_text(gui_w / 2, gui_h / 2 - 60, _titulo);

var _media = (global.coesao_count > 0) ? (global.coesao_total / global.coesao_count) : 0;

draw_set_color(c_white);
draw_text(gui_w / 2, gui_h / 2 - 10, "Coesão média: " + string(_media) + "%");
draw_text(gui_w / 2, gui_h / 2 + 14, "Moedas totais: " + string(global.moedas));

draw_set_color(c_gray);
draw_text(gui_w / 2, gui_h / 2 + 50, "[E / Enter / Espaço] Voltar ao escritório");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);