if (!global.ui_bloqueando_jogo && distance_to_object(obj_prota) < 20) {
    if (keyboard_check_pressed(ord("E"))) {
        obj_prota.tem_scanner = true;
        obj_prota.tem_lupa = true;
        obj_prota.tem_tablet = true;

        obj_men.text = "Equipamento completo! Scanner, Lupa e Tablet prontos.";
        obj_men.tempo = 120;
    } else {
        obj_men.text = "[E] Equipar Scanner, Lupa e Tablet";
        obj_men.tempo = 10;
    }
}