if (!global.ui_bloqueando_jogo && distance_to_object(obj_prota) < 11) {
	
	if (keyboard_check_pressed(ord("E"))) {
		fade_to_room(Room1);
	} else if (obj_prota.iGotThis) {
		obj_men.text = "Clique E para entrar ou R para usar a lupa";
		obj_men.tempo = 10;
	}

}