function fade_to_room(_room) {
    if (!instance_exists(obj_fade)) {
        room_goto(_room); 
        return;
    }

    with (obj_fade) {
        if (estado != "parado") exit; 
        sala_destino = _room;
        estado = "saindo";
    }

    global.ui_bloqueando_jogo = true;
}
//67