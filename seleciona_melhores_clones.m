function [nova_populacao] = seleciona_melhores_clones(clones_maduros, num_clones);

        tamanho_populacao = size(mais_aptos, 1);
        vetor_afinidade = atribuicao_proporcional_aptidao(clones_maduros);
        nova_populacao = zeros(tamanho_populacao/num_clones,2);

        linha = 1;
        for i=1:tamanho_populacao
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