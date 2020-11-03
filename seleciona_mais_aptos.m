function [mais_aptos] = seleciona_mais_aptos(populacao, mais_aptos_aproveitados)

    tamanho_populacao = size(populacao, 1);
    
    % Avalia afinidade
    vetor_afinidade = atribuicao_proporcional_aptidao(populacao);

    % Atribui afinidade a cada indivíduo
    populacao_afinidade = [populacao vetor_afinidade];
    
    % Ordena populacao baseada na afinidade
    populacao_ordenada = sortrows(populacao_afinidade, 3);
    
    % Seleciona os n1 mais aptos
    mais_aptos = populacao_ordenada(tamanho_populacao - mais_aptos_aproveitados + 1 : tamanho_populacao, 1:2);

end

