if (global.tempo_flash_t > 0) global.tempo_flash_t--;
if (!instance_exists(player)) player = instance_find(obj_prota, 0);
if (player == noone) exit;

if (!variable_instance_exists(id, "problems_detected")
 || !ds_exists(problems_detected, ds_type_list)
 || !variable_instance_exists(id, "highlighted_problems")
 || !ds_exists(highlighted_problems, ds_type_list)) exit;

if (!variable_instance_exists(player, "tem_scanner")) {
    show_debug_message("obj_prota sem 'tem_scanner' mds bug é chato");
    exit;
}


if (keyboard_check_pressed(ord("R")) && scanner_cooldown <= 0 && !global.ui_bloqueando_jogo) {
   
    if (!player.tem_scanner) {
        if (instance_exists(obj_men)) {
            obj_men.text = "Scanner não equipado.";
            obj_men.tempo = 90;
        }
    } 
  
    else if (global.tempo_restante <= scan_custo_tempo) {
        if (instance_exists(obj_men)) {
            obj_men.text = "Tempo insuficiente para varrer.";
            obj_men.tempo = 90;
        }
    } 
    else {

        global.tempo_restante -= scan_custo_tempo;

        global.scans_usados += 1;
        global.tempo_flash_t = 90;
        global.tempo_flash_txt = "-" + string(scan_custo_tempo) + "s";

        
        scanner_active = true;
        scan_timer = scan_duration;
        scanner_cooldown = scanner_cooldown_max;

        if (instance_exists(obj_men)) {
            obj_men.text = "Varrendo área... (-" + string(scan_custo_tempo) + "s)";
            obj_men.tempo = scan_duration;
        }
    }
}

if (scanner_cooldown > 0) {
    scanner_cooldown--;
}

if (scanner_active) {
    scan_timer--;
    if (scan_timer <= 0) {
        scanner_active = false;
    }
    
    scan_pulse += 1;
    if (scan_pulse > scan_pulse_max) {
        scan_pulse = 0;
    }
}

ds_list_clear(problems_detected);

if (instance_exists(player)) {
    with (obj_problema) {
        var _dist = distance_to_object(other.player);
        if (_dist <= other.scanner_range) {
            ds_list_add(other.problems_detected, id);
        }
    }
}


if (scanner_active) {
    ds_list_clear(highlighted_problems);
    var _size = ds_list_size(problems_detected);
    for (var i = 0; i < _size; i++) {
        var _prob = problems_detected[| i];
        ds_list_add(highlighted_problems, _prob);
        if (instance_exists(_prob)) {
            _prob.is_highlighted = true;
            registrar_evidencia(_prob.problem_id, "scanner");
        }
    }
} else {
    var _size = ds_list_size(highlighted_problems);
    for (var i = 0; i < _size; i++) {
        var _prob = highlighted_problems[| i];
        if (instance_exists(_prob)) {
            _prob.is_highlighted = false;
        }
    }
    ds_list_clear(highlighted_problems);
}

if (instance_exists(player)) {
    player.iGotThis = (ds_list_size(problems_detected) > 0);
}
