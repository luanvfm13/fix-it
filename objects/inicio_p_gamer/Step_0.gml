if (!global.ui_bloqueando_jogo && distance_to_object(obj_prota) < 11) {
    if (keyboard_check_pressed(ord("E"))) {
        fade_to_room(gamer);
    } else {
        obj_men.text = "[E] Entrar Na G.A.M.E.R.";
        obj_men.tempo = 10;
    }
}