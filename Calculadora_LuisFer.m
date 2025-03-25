function myFunction(a,b,c)
    A = imread(a); B = imread(b);
    A2 = im2double(A); B2 = im2double(B);
% Como la calculadora va a ser de imágenes, en estas líneas transformo las
% imágenes para poderles hacer cálculos matemáticos

    if ~(size(A2,3) == 1)
        A2 = rgb2gray(A2);
    elseif ~(size(B2,3) == 1)
        B2 = rgb2gray(B2);
    end
% Aquí ando asegurándome que las dos imágenes se conviertan a escala de
% grises para facilitar los cálculos

    if size(A2, 1) / size(A2, 2) > size(B2, 1) / size(B2, 2)
        B2_resized = imresize(B2, [size(A2, 1), size(A2,2)]);
    else
        B2_resized = imresize(B2, [size(A2,1), size(A2, 2)]);
    end
% Aquí ando asegurándome de que las dos imágenes tengan matrices de las
% mismas dimensiones para que no haya problemas de cálculos

    if c == "Suma"
        resultado = A2 + B2_resized;
    elseif c == "Diferencia"
        resultado = A2 - B2_resized;
    elseif c == "Producto"
        resultado = A2 .* B2_resized;
    elseif c == "Cociente"
        resultado = A2 ./ B2_resized;
    elseif c == "Potencia"
        resultado = A2 .^ B2_resized;
    elseif c == "Raiz"
        resultado = A2 .^ (1 ./ B2_resized); 
    elseif c == "<="
        resultado = A2 <= B2_resized;
    elseif c == ">="
        resultado = A2 >= B2_resized;
    elseif c == "=="
        resultado = A2 == B2_resized;
    elseif c == "~="
        resultado = A2 ~= B2_resized;
    elseif c == "AND"
        A2_1 = zeros(size(A2));
        A2_1(A2 < 0.5) = 0; A2_1(A2 >= 0.5) = 1;
        B2_resized(B2_resized < 0.5) = 0; B2_resized(B2_resized >= 0.5) = 1;
        A2_1 = logical(A2_1); B2_resized = logical(B2_resized);
        resultado = A2_1 & B2_resized; 
% Como AND solo funciona con operadores binarios lógicos, hice las
% variables de double a binario con thresholds y de ahí los pasé a logical
    elseif c == "OR"
        A2_1 = zeros(size(A2));
        A2_1(A2 < 0.5) = 0; A2_1(A2 >= 0.5) = 1;
        B2_resized(B2_resized < 0.5) = 0; B2_resized(B2_resized >= 0.5) = 1;
        A2_1 = logical(A2_1); B2_resized = logical(B2_resized);
        resultado = A2_1 | B2_resized;
    end   
    
% Ya con las imágenes del mismo tamaño, puedo hacerles la operación que yo
% quiera

    figure;
    subplot(2,3,1), imshow(a), title(a);
    subplot(2,3,2), imshow(b), title(b);
    subplot(2,3,3), imshow(resultado), title(c);
    subplot(2,3,4), imhist(A2),title(["Histograma de: ", a]);
    subplot(2,3,5), imhist(B2),title(["Histograma de: ", b]);
    subplot(2,3,6), imhist(resultado),title(["Histograma de: ", c]);
% Un subplot donde se ven las dos imágenes originales y su producto
end

% Calculadora("cameraman.tif","rice.png","Suma")
% Calculadora("cameraman.tif","rice.png","Diferencia")
% Calculadora("cameraman.tif","rice.png","Producto")
% Calculadora("cameraman.tif","rice.png","Cociente")
% Calculadora("cameraman.tif","rice.png","Potencia")
% Calculadora("cameraman.tif","rice.png","Raiz")
% Calculadora("cameraman.tif","rice.png","<=")
% Calculadora("cameraman.tif","rice.png",">=")
% Calculadora("cameraman.tif","rice.png","==")
% Calculadora("cameraman.tif","rice.png","~=")
% Calculadora("cameraman.tif","rice.png","AND")
% Calculadora("cameraman.tif","rice.png","OR")

% Calculadora("hands1.jpg","cameraman.tif","Suma")
% Calculadora("hands1.jpg","cameraman.tif","Diferencia")
% Calculadora("hands1.jpg","cameraman.tif","Producto")
% Calculadora("hands1.jpg","cameraman.tif","Cociente")
% Calculadora("hands1.jpg","cameraman.tif","Potencia")
% Calculadora("hands1.jpg","cameraman.tif","Raiz")
% Calculadora("hands1.jpg","cameraman.tif","<=")
% Calculadora("hands1.jpg","cameraman.tif",">=")
% Calculadora("hands1.jpg","cameraman.tif","==")
% Calculadora("hands1.jpg","cameraman.tif","~=")
% Calculadora("hands1.jpg","cameraman.tif","AND")
% Calculadora("hands1.jpg","cameraman.tif","OR")
