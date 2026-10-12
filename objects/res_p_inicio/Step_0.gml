if (!global.ui_bloqueando_jogo && distance_to_object(obj_prota) < 11) {
	
	if (keyboard_check_pressed(ord("E"))) {
		global.spawn_alvo = "res_p_inicio";
		fade_to_room(inicio);
	} else if (obj_prota.iGotThis) {
		obj_men.text = "Clique E para entrar No Restaurante";
		obj_men.tempo = 10;
	}

}