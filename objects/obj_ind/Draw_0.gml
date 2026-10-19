var _flut = sin(current_time / 200) * 10;
var _alfa = 0.6 + sin(current_time / 150) * 0.3;
desenhar_seta(alvo, alvo_x, alvo_y, _flut, _alfa, cor);
if (instance_exists(alvo2)) desenhar_seta(alvo2, alvo2.x, alvo2.y, _flut, _alfa, cor);