% Ativa ou inativa exibição do gráfico
global exibe_grafico;
exibe_grafico = 1;

% Inicialização de variáveis

duracao_pausa = 0.1;

max_iteracao = 50;
tamanho_populacao = 50; % N
mais_aptos_aproveitados = 50; % n1

taxa_clonagem = 0.1; % beta
num_clones = taxa_clonagem * tamanho_populacao; % Nc

taxa_fixa_mutacao = 0.6; % rho

% Inicializa população
populacao = cria_populacao(tamanho_populacao);

% Iterações do algoritmo imunológico
for iteracao = 1:max_iteracao
    
    % Exibe população 
    exibe_populacao(populacao);
    
    % Seleciona n1 mais aptos (não faz diferença se n1 = N)
    mais_aptos = seleciona_mais_aptos(populacao, mais_aptos_aproveitados);
    
    % Clonagem: cada individuo gera Nc clones
    clones = clonagem(mais_aptos, num_clones);
    
    % Mutação: os menos aptos sofrem mais mutação
    clones_maduros = mutacao_proporcional(clones, taxa_fixa_mutacao);
    
    % Seleção de clones: seleciona o melhor a cada Nc clones 
    nova_populacao = seleciona_melhores_clones(clones_maduros, num_clones);
    
    % Substitui população
    populacao = nova_populacao;
    
    % Exibição
    pause(duracao_pausa);
    
end

% Exibe o melhor indivíduo
melhor_individuo = obtem_melhor_individuo(populacao);
melhor_X = populacao(melhor_individuo, 1);
melhor_Y = populacao(melhor_individuo, 2);
disp('Melhor indivíduo:');
disp(melhor_individuo);
disp('Coordenadas do melhor indivíduo:');
disp([melhor_X melhor_Y]); 
disp('Valor obtido pelo melhor indivíduo:');
disp(bird(melhor_X, melhor_Y));
