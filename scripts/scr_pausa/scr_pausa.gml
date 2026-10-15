function fechar_pausa() {
    if (instance_exists(obj_pausa)) {
        global.ui_bloqueando_jogo = obj_pausa.lock_antes;
        instance_destroy(obj_pausa);
    }
}