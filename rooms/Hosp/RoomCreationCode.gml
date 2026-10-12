global.timer_ativo = true;
if (!global.missao_hospital_iniciada) {
    global.tempo_restante = 360;
    global.missao_hospital_iniciada = true;
}
global.foi_demitido = false;
global.jogo_acabou = false;
global.jogo_vencido = false;

with (obj_global) {
    tempo_step_acumulado = 0;
}