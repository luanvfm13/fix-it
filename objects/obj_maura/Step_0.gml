balaou.x = x + 10;
balaou.y = y - 40;

var _perto = distance_to_object(obj_prota) < 20;
balaou.visible = _perto && !global.ui_bloqueando_jogo;

if (_perto && !global.ui_bloqueando_jogo && !instance_exists(obj_dialogo)) {
    if (keyboard_check_pressed(ord("E"))) {
        var _id_dialogo = dialogo_id;
        var _dialogo = instance_create_layer(x, y, "Instances", obj_dialogo);
        with (_dialogo) {
            setup_dialogo(_id_dialogo);
        }
    }
}