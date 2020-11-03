function [clones_maturados] = mutacao_proporcional(clones, taxa_fixa_mutacao)
    
    tamanho_populacao = size(clones, 1);
    vetor_afinidade = atribuicao_proporcional_aptidao(clones);
    clones_maturados = zeros(tamanho_populacao, 2);
    
    for i = 1:tamanho_populacao
        % taxa de mutação inversamente proporcional à afinidade
        taxa_proporcional_mutacao = 1/(vetor_afinidade(i) + 1);
        clones_maturados(i, 1:2) = mutacao(clones(i, 1:2), taxa_fixa_mutacao * taxa_proporcional_mutacao); 
    end

end

