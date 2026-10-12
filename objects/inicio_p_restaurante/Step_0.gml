if (!global.ui_bloqueando_jogo && distance_to_object(obj_prota) < 11) {
    if (keyboard_check_pressed(ord("E"))) {
        if (global.etapa < 3) {
            var _d = instance_create_layer(x, y, "Instances", obj_dialogo);
            with (_d) {
                setup_dialogo("lanchonete_bloqueada");
            }
        } else {
            global.spawn_alvo = "inicio_p_res";
            fade_to_room(restaurante);
        }
    } else if (obj_prota.iGotThis) {
        obj_men.text = "Clique E para entrar no Restaurante";
        obj_men.tempo = 10;
    }
}