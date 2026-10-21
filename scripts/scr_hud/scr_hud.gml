function desenhar_keycap(_x, _y, _w, _h, _lbl) {
    var _face  = make_color_rgb(230, 238, 238);
    var _corpo = make_color_rgb(44, 88, 96);
    var _base  = make_color_rgb(4, 10, 12);
    var _tinta = make_color_rgb(14, 26, 31);

    draw_set_color(_base);
    draw_rectangle(_x, _y + 3, _x + _w, _y + _h + 3, false);

    draw_set_color(_corpo);
    draw_rectangle(_x, _y, _x + _w, _y + _h, false);


    draw_set_color(_face);
    draw_rectangle(_x + 2, _y + 2, _x + _w - 2, _y + _h - 4, false);


    draw_set_alpha(0.6);
    draw_set_color(c_white);
    draw_line(_x + 3, _y + 3, _x + _w - 3, _y + 3);
    draw_set_alpha(1);

   
    draw_set_font(fnt_undertale);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(_tinta);
    draw_text(_x + _w / 2, _y + (_h - 4) / 2, _lbl);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}