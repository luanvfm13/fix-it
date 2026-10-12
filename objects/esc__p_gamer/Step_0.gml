if (!global.ui_bloqueando_jogo && distance_to_object(obj_prota) < 11) {
    if (keyboard_check_pressed(ord("E"))) {
        if (global.etapa < 2) {
            var _d = instance_create_layer(x, y, "Instances", obj_dialogo);
            with (_d) {
                setup_dialogo("escritorio_sem_equipar");
            }
        } else {
            global.spawn_alvo = "esc_p_gamer";
            fade_to_room(gamer);
        }
    } else {
        obj_men.text = "[E] Voltar à recepção";
        obj_men.tempo = 10;
    }
}