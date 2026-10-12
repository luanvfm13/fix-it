if (global.etapa != 0 || global.ui_bloqueando_jogo) exit;
if (!instance_exists(obj_prota)) exit;

if (point_in_rectangle(obj_prota.x, obj_prota.y, x, y, x + gatilho_w, y + gatilho_h)) {
    global.ui_bloqueando_jogo = true; 

    with (obj_ger) {
        if (estado == "esperando") {
            estado = "andando";
            abordando = true;
        }
    }
    instance_destroy();
}