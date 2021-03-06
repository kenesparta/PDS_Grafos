classdef Filtro
    properties
        grau
        coeficientes        
        matriz_adjacencia        
        S_pred % saidas de predicao
        tam % Tamanho da matriz de adjacencia
    end
    
    % S_con: S conhecido
    % S_tr: S par treino
    methods
        function filtro = Filtro(matriz_adjacencia, grau, S_con, S_tr)
            filtro.matriz_adjacencia = matriz_adjacencia;
            filtro.tam = length(matriz_adjacencia);
            filtro.grau = grau + 1;
            filtro.coeficientes = filtro.filtro_coeficientes(S_con, S_tr);
            filtro.S_pred = filtro.saida_filtro_construido(S_con);
        end
    end
    
    methods (Hidden = true, Access = private)
        function coef = filtro_coeficientes(filtro, S_con, S_tr)
            saida = zeros(filtro.tam, filtro.grau);
            for i=1:filtro.grau
                saida(1:end,i) = diag(S_con) * ...
                                 filtro.matriz_adjacencia ^ (i-1) * ...
                                 S_tr;
            end
            [Q,R] = qr(saida);
            coef = pinv(R) * (Q' * ones(filtro.tam,1));
            %coef =  pinv(saida' * saida) * (saida' * ones(filtro.tam,1));
        end
        function pred = saida_filtro_construido(filtro, S_con)
            saida = zeros(filtro.tam);
            for i=1:filtro.grau
                saida = saida + filtro.coeficientes(i) * filtro.matriz_adjacencia ^ (i-1);
            end
            pred = saida * S_con';
        end
    end    
end

