if (!global.ui_bloqueando_jogo && distance_to_object(obj_prota) < 20) {
    if (keyboard_check_pressed(ord("E"))) {
        if (!instance_exists(obj_hub)) {
            instance_create_depth(0, 0, -200, obj_hub);
        }
    } else {
        obj_men.text = "[E] Abrir equipamento";
        obj_men.tempo = 10;
    }
}