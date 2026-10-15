if (!global.ui_bloqueando_jogo && distance_to_object(obj_prota) < 11) {
    if (keyboard_check_pressed(ord("E"))) {
        global.spawn_alvo = "res_p_inicio";
        fade_to_room(inicio);
    } else {
        obj_men.text = "[E] Voltar para a avenida";
        obj_men.tempo = 10;
    }
}