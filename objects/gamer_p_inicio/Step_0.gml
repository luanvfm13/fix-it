if (!global.ui_bloqueando_jogo && distance_to_object(obj_prota) < 11) {
    if (keyboard_check_pressed(ord("E"))) {
        if (global.etapa == 4) {
            var _d = instance_create_layer(x, y, "Instances", obj_dialogo);
            with (_d) {
                setup_dialogo("gerente_nao_missao_hosp");
            }
        } else if (global.etapa < 3) {
            var _falas = (global.etapa == 0) ? "gerente_nao_falou" : "gerente_nao_despediu";
            if (global.etapa == 2) _falas = "gerente_nao_despediu_equipado";
            var _d2 = instance_create_layer(x, y, "Instances", obj_dialogo);
            with (_d2) {
                setup_dialogo(_falas);
            }
        } else {
            global.spawn_alvo = "gamer_p_inicio";
            fade_to_room(inicio);
        }
    } else {
        obj_men.text = "[E] Sair da G.A.M.E.R.";
        obj_men.tempo = 10;
    }
}