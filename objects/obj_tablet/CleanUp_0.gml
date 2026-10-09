if (global.bronca_pendente != "") {
    var _id = global.bronca_pendente;
    global.bronca_pendente = "";
    var _d = instance_create_depth(0, 0, -300, obj_dialogo);
    with (_d) {
        setup_dialogo(_id);
    }
} else {
    global.ui_bloqueando_jogo = false;
}