var _L = painel_layout();
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_alpha(1);

if (tipo == "controles") {
    desenhar_sprite_topo(spr_painel_controles, _L.x, _L.y, _L.s);
} else {
    draw_set_color(make_color_rgb(2, 136, 209));
    draw_rectangle(_L.x, _L.y, _L.x + _L.w, _L.y + _L.h, false);
    draw_set_color(make_color_rgb(1, 188, 212));
    draw_rectangle(_L.x + 12 * _L.s, _L.y + 12 * _L.s, _L.x + _L.w - 12 * _L.s, _L.y + _L.h - 12 * _L.s, false);

    draw_set_font(fnt_undertale);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);

    var _cx = _L.x + _L.w / 2;
    var _y = _L.y + 44 * _L.s;

    draw_set_color(make_color_rgb(248, 255, 240));
    draw_text(_cx, _y, "CREDITOS");
    _y += string_height("CREDITOS") + 28 * _L.s;

    var _lista = [
        ["Líder/Programador", "Luan"],
        ["Programador", "Davi"],
        ["Programador", "Iago"],
        ["Vice-líder troféu", "Agatha"]
    ];
    for (var i = 0; i < array_length(_lista); i++) {
        draw_set_color(make_color_rgb(18, 89, 162));
        draw_text(_cx, _y, _lista[i][0]);
        _y += string_height(_lista[i][0]);
        draw_set_color(make_color_rgb(248, 255, 240));
        draw_text(_cx, _y, _lista[i][1]);
        _y += string_height(_lista[i][1]) + 16 * _L.s;
    }

    _y += 12 * _L.s;
    draw_set_color(make_color_rgb(18, 89, 162));
    draw_text(_cx, _y, "Feito com GameMaker Studio 2");

    desenhar_sprite_topo(spr_botao_x, _L.x + _L.w - 80 * _L.s, _L.y + 12 * _L.s, _L.s);
}

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);