function [clones] = clonagem(mais_aptos, num_clones)

    tamanho_populacao = size(mais_aptos, 1);
    tamanho_clones = tamanho_populacao * num_clones;
    
    clones = zeros(tamanho_clones, 2);
    
    indice = 1;
    for i = 1:tamanho_populacao
        for j = 1:num_clones
            clones(indice, 1:2) = mais_aptos(i, 1:2);
            indice = indice + 1;
        end
    end
    
end

