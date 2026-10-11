if (room != escritorio || dialogo_id == "" || global.ui_bloqueando_jogo || !instance_exists(obj_prota)) exit;

var _player = instance_find(obj_prota, 0);
if (point_distance(x, y, _player.x, _player.y) >= distancia_interacao) exit;

with (obj_men) {
    text = "[E] Examinar";
    tempo = 2;
}

if (keyboard_check_pressed(ord("E"))) {
    with (obj_men) {
        text = "";
        tempo = 0;
    }

    var _dialog_id = dialogo_id;
    var _dialog = instance_create_depth(0, 0, -300, obj_dialogo);
    with (_dialog) {
        setup_dialogo(_dialog_id);
    }
}
