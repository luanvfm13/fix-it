if (fim_campanha) {
    tempo_final++;
    if (tempo_final >= game_get_speed(gamespeed_fps) * 4) {
        fade_to_room(Menu);
    }
    exit;
}

if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space)) {
    if (venceu && !demitido && !fim_campanha) {
        global.spawn_alvo = "gamer_p_inicio";
        global.timer_ativo = false;
        global.jogo_acabou = false;
        fade_to_room(gamer);
    } else {
        fade_to_room(Menu);
    }
}