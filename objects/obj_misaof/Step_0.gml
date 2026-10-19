if (espera > 0) { espera--; exit; }

if (!iniciado) {
    iniciado = true;
    var _media = (global.coesao_count > 0) ? (global.coesao_total / global.coesao_count) : 0;

    if (fim_campanha) {
        spr_fim = (_media >= 90) ? spr_fim_otimo : ((_media >= 60) ? spr_fim_bem : spr_fim_mal);
    } else if (img_override == "fim_tempo") {
        spr_fim = spr_fim_mal;
    } else {
        spr_fim = spr_fim_demitido;
    }
    fase = "imagem";
}

if (!saindo && (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"))
    || keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_enter))) {
    saindo = true;
    global.ui_bloqueando_jogo = false;
    fade_to_room(Menu);
}