if (global.ui_bloqueando_jogo || !instance_exists(obj_prota)) exit;

if (distance_to_object(obj_prota) < 16) {
    if (keyboard_check_pressed(ord("E"))) {
        global.spawn_alvo = "";
        fade_to_room(Hosp);
    } else if (instance_exists(obj_men)) {
        obj_men.text = "[E] Visitar o hospital";
        obj_men.tempo = 10;
    }
}