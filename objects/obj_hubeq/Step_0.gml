var _equipado = variable_global_exists("tem_" + ferramenta_alvo) ? variable_global_get("tem_" + ferramenta_alvo) : false;
if (_equipado) exit;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
var _dentro = (_mx > x && _mx < x + largura && _my > y && _my < y + altura);

if (_dentro && mouse_check_button_pressed(mb_left)) {
    variable_global_set("tem_" + ferramenta_alvo, true);

    if (variable_instance_exists(obj_prota, "tem_" + ferramenta_alvo)) {
        obj_prota.tem_scanner = (ferramenta_alvo == "scanner") ? true : obj_prota.tem_scanner;
        obj_prota.tem_lupa    = (ferramenta_alvo == "lupa")    ? true : obj_prota.tem_lupa;
        obj_prota.tem_tablet  = (ferramenta_alvo == "tablet")  ? true : obj_prota.tem_tablet;
    }
}