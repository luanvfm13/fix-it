if (instance_exists(problema_alvo)) {
    snap_id = problema_alvo.problem_id;
    snap_nome = problema_alvo.problem_data.nome;
}

switch (estado) {
    case "diagnosticando":
        if (!instance_exists(problema_alvo)) { instance_destroy(); exit; }

        if (keyboard_check_pressed(vk_down)) diagnostico_selecionado = (diagnostico_selecionado + 1) mod 3;
        if (keyboard_check_pressed(vk_up))   diagnostico_selecionado = (diagnostico_selecionado - 1 + 3) mod 3;
        if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_escape)) { instance_destroy(); exit; }

        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
            var _diagnostico = get_diagnostico_data(problema_alvo.problem_id);
            diagnostico_correto = (ordem_diagnosticos[diagnostico_selecionado] == _diagnostico.indice_correto);
            ordem_opcoes = criar_ordem_embaralhada(array_length(problema_alvo.problem_data.opcoes));
            opcao_selecionada = 0;
            estado = "escolhendo";
        }
        break;

    case "escolhendo":
        if (!instance_exists(problema_alvo)) { instance_destroy(); exit; }

        var _n = array_length(problema_alvo.problem_data.opcoes);
        if (array_length(ordem_opcoes) != _n) ordem_opcoes = criar_ordem_embaralhada(_n);

        if (keyboard_check_pressed(vk_down)) opcao_selecionada = (opcao_selecionada + 1) mod _n;
        if (keyboard_check_pressed(vk_up))   opcao_selecionada = (opcao_selecionada - 1 + _n) mod _n;
        if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_escape)) { estado = "diagnosticando"; break; }

        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
  
            var _nota = diagnostico_correto ? 2 : 1;
            resultado = resolve_problem(problema_alvo, ordem_opcoes[opcao_selecionada],
                [_nota, _nota, _nota, _nota], diagnostico_correto);
            if (resultado == undefined) { instance_destroy(); exit; }
            estado = "resultado";
        }
        break;

    case "resultado":
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))
         || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"))) {
            instance_destroy();
        }
        break;
}