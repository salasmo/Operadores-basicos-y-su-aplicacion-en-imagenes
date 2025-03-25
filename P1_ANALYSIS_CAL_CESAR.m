clear all
close all
clc

Im1=imread("C:\Users\chati\OneDrive\Imágenes\IM1.jpg");% Cargo ambas imagenes y las guarda en sus respectivas variables
Im2=imread("C:\Users\chati\OneDrive\Imágenes\Im2.jpg");

Im1_d=im2double(Im1);% Convierto los valores de la matriz de las imagenes en un rango de 0 o 1
Im2_d=im2double(Im2);

Im1_prev=rgb2gray(Im1_d); % Convierto a escala de grises
Im2_prev=rgb2gray(Im2_d);

Im1_r = imresize(Im1_prev, size(Im2_prev));% Redimensiono la imagen 1 al tamaño de la imagen 2

Im1_1=imadjust(Im1_r);% Ajusto el contraste de las imagenes para que se visualice mejor
Im2_1=imadjust(Im2_prev);

figure;%Visualizo las imagenes originales y sus respectivos histogramas
subplot(2, 3, 1), imshow(Im1_1), title('Imagen 1');
subplot(2, 3, 2), imshow(Im2_1), title('Imagen 2');
subplot(2, 3, 4), imhist(Im1_1), title('Histograma Imagen 1');
subplot(2, 3, 5), imhist(Im2_1), title('Histograma Imagen 2');

while true %Con el ciclo while y dentro del mismo stich e ifs, puedo elegir las opciones de operaciones logicas o matemáticas a realizar sin reiniciar el programa
    op = input('Selecciona la operación de estas opciones (+, -, *, /, ==, ~=, AND, OR, <=, >=) o "salir" para terminar: ', 's');
    
    if strcmpi(op, 'salir') %Si la opcion ingresada es de salida, con este if rompo el ciclo while y termino la interacción
        break;
    end
    
    switch op
        case '+'
            r=Im1_1+Im2_1;
            titulo='Suma';
        case '-'
            r=Im1_1-Im2_1;
            titulo='Resta';
        case '*'
            r=Im1_1.*Im2_1;
            titulo='Multiplicación';
        case '/'
            r=Im1_1./Im2_1;
            titulo='División';
        case '=='
            r=Im1_1==Im2_1;
            titulo='Igualdad (==)';
        case '~='
            r=Im1_1~=Im2_1;
            titulo='Desigualdad (~=)';
        case 'AND'
            r=Im1_1&Im2_1;
            titulo='AND';
        case 'OR'
            r=Im1_1|Im2_1;
            titulo='OR';
        case '<='
            r=Im1_1<=Im2_1;
            titulo='Menor o igual que (<=)';
        case '>='
            r=Im1_1>=Im2_1;
            titulo='Mayor o igual que (>=)';
        otherwise
            disp('Selección no válida. Intenta de otra vez.');
            continue;
    end
    
    figure;%Visualizo las imagenes originales y el resultado final, con sus respectivos histogramas
    subplot(3, 2, 1), imshow(Im1_1), title('Imagen 1');
    subplot(3, 2, 2), imshow(Im2_1), title('Imagen 2');
    subplot(3, 2, 6), imshow(r), title('Resultado');
    subplot(3, 2, 5), imhist(r), title('Histograma Resultado');
    subplot(3, 2, 3), imhist(Im1_1), title('Histograma Imagen 1');
    subplot(3, 2, 4), imhist(Im2_1), title('Histograma Imagen 2');
end
