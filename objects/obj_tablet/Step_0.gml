switch (estado) {
    case "escolhendo":
        if (!instance_exists(problema_alvo)) {
            instance_destroy();
            exit;
        }

        var _opcoes = problema_alvo.problem_data.opcoes;
        var _total = array_length(_opcoes);
		
		if (array_length(ordem_opcoes) != _total) {
    ordem_opcoes = criar_ordem_embaralhada(_total);
}

        if (keyboard_check_pressed(vk_down)) {
            opcao_selecionada = (opcao_selecionada + 1) mod _total;
        }
        if (keyboard_check_pressed(vk_up)) {
            opcao_selecionada = (opcao_selecionada - 1 + _total) mod _total;
        }
        if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_escape)) {
            instance_destroy();
            exit;
        }

        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
           var _indice_real = ordem_opcoes[opcao_selecionada];
		resultado = resolve_problem(problema_alvo, _indice_real);
            if (resultado == undefined) {
                instance_destroy();
                exit;
            }
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