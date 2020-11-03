function [nova_populacao] = seleciona_melhores_clones(clones_maduros, num_clones);

        tamanho_populacao = size(clones_maduros, 1);
        vetor_afinidade = atribuicao_proporcional_aptidao(clones_maduros);
        tamanho_nova_populacao = tamanho_populacao/num_clones;
        nova_populacao = zeros(tamanho_nova_populacao, 2);

        linha = 1;
        for i=1:tamanho_nova_populacao
            indice_maior_afinidade = linha;
            maior_afinidade = 0;
            for j=1:num_clones
                if(vetor_afinidade(linha) > maior_afinidade)
                    maior_afinidade = vetor_afinidade(linha);
                    indice_maior_afinidade = linha;
                end
                linha = linha + 1;
            end
            nova_populacao(i,:) = clones_maduros(indice_maior_afinidade,:);
        end
end