if (!global.ui_bloqueando_jogo && distance_to_object(obj_prota) < 11) {
    if (keyboard_check_pressed(ord("E"))) {
        if (global.etapa < 1) {
            var _d = instance_create_layer(x, y, "Instances", obj_dialogo);
            with (_d) {
                setup_dialogo("gerente_nao_falou");
            }
        } else {
            global.spawn_alvo = "gamer_p_esc";
            room_goto(escritorio);
        }
    } else {
        obj_men.text = "[E] Ir para o escritório";
        obj_men.tempo = 10;
    }
}