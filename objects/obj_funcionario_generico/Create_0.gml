sprite_index = spr_gerente_idle; // placeholder
image_speed = 1.5;
escala_base = abs(image_xscale);
if (escala_base == 0) escala_base = 1;

rota = [ { x: x, y: y } ]; 
indice_rota = 1;
espera = 0;               
espera_restante = 0;

dialogo_id = "";          
move_spd = 1.5;

estado = "andando";        // andando | esperando | falando | saindo
global.ui_bloqueando_jogo = true;