if (!global.ui_bloqueando_jogo && distance_to_object(obj_prota) < 11) {
    if (keyboard_check_pressed(ord("E"))) {
       global.spawn_alvo = "esc_p_gamer";
	   room_goto(escritorio)
    } else {
        obj_men.text = "[E] Ir para o escritório";
        obj_men.tempo = 10;
    }
}