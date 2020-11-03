% ativa ou inativa exibição do gráfico
global exibe_grafico;
exibe_grafico = 1;

% inicialização de variáveis
max_iteracao = 50;
tamanho_populacao = 50; % N
mais_aptos_aproveitados = 50; % n1

taxa_clonagem = 0.1; % beta
num_clones = taxa_clonagem * tamanho_populacao; % Nc

taxa_mutacao = 0.1; % rho

% inicializa população
populacao = cria_populacao(tamanho_populacao);

% iterações do algoritmo imunológico
for iteracao = 1:max_iteracao
    
    % exibe população 
    exibe_populacao(populacao);
    
    % seleciona n1 mais aptos
    mais_aptos = seleciona_mais_aptos(populacao, mais_aptos_aproveitados);
    
    % TODO clonagem: cada individuo gera Nc clones
    clones = clonagem(mais_aptos, num_clones);
    
    % TODO mutação: os menos aptos sofrem mais mutação
    clones_maduros = mutacao_proporcional(clones, taxa_mutacao);
    
    % TODO seleção de clones: seleciona o melhor a cada Nc clones 
    nova_populacao = seleciona_melhores_clones(clones_maduros, num_clones);
    
    % Substitui população
    populacao = nova_populacao;
    
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
