if (!global.ui_bloqueando_jogo && distance_to_object(obj_prota) < 11) {
    
	
    obj_men.text = "[E] Sair da G.A.M.E.R.";
    obj_men.tempo = 10;

    if (keyboard_check_pressed(ord("E"))) {

        if (global.etapa == 4) {
           
            var _d = instance_create_layer(x, y, "Instances", obj_dialogo);
            with (_d) {
                setup_dialogo("sair_sem_gerente");
            }
        } 
        else if (global.etapa < 3) {
           
            var _falas = "sair_sem_gerente";
            if (global.etapa == 1) _falas = "gerente_nao_despediu";
            if (global.etapa == 2) _falas = "gerente_nao_despediu_equipado";

            var _d2 = instance_create_layer(x, y, "Instances", obj_dialogo);
            with (_d2) {
                setup_dialogo(_falas);
            }
        } 
        else if (global.etapa == 3) {
  
            global.spawn_alvo = "gamer_p_inicio";
            fade_to_room(inicio);
        }
    }
}
