classdef Nos < handle 
    properties
        imagemAsociada        
        vizinhanca        
    end
    
    properties (Constant = true)
        KNN = 8; % Vizinhos cercanos
    end
    
    methods
        % matriz_imagem: deve ser uma matriz 28x28 e normalizada
        %                com valores menores do que 1.
        function no = Nos(matriz_imagem, etiqueta)
            no.imagemAsociada = ImgGraf(matriz_imagem, etiqueta);
        end
    end
end
