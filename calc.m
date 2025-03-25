clear all;
close all;
clc;

% Cargar archivos
img1 = imread('cameraman.tif');
img2 = imread('moon2.tif');


% Redimensionar las imágenes al mismo tamaño (256)
img1 = imresize(img1, [256 256]);
img2 = imresize(img2, [256 256]);

while true
    % C LCPreguntar al usuario por la operación a realizar
    disp('Seleccione la operación a realizar:');
    disp('1. AND');
    disp('2. OR');
    disp('3. <=');
    disp('4. >=');
    disp('5. ==');
    disp('6. ~=');
    disp('7. +');
    disp('8. -');
    disp('9. x');
    disp('10. / ');
    disp('11. EXIT');
    choice = input('Ingrese su elección: ');

    % Salir del bucle si el usuario elige salir
    if choice == 11
        break;
    end

    % Realizar la operación seleccionada
    switch choice
        case 1
            % Convertir imágenes a booleanas utilizando un umbral fijo de 120
            img1_bool = convertir_a_booleano(img1);
            img2_bool = convertir_a_booleano2(img2);

            % Operación AND
            result_img = img1_bool & img2_bool;
            operation = 'AND';
            
        case 2
            % Convertir imágenes a booleanas utilizando un umbral fijo de 120
            img1_bool = convertir_a_booleano(img1);
            img2_bool = convertir_a_booleano2(img2);

            % Operación OR
            result_img = img1_bool | img2_bool;
            operation = 'OR';

        case 3
            % Redimensionar img2 para que coincida con las dimensiones de img1
            img2 = imresize(img2, [size(img1, 1), size(img1, 2)]);

            % Operación <=
            result_img = img1 <= img2;
            operation = ' <=';

         case 4
            % Redimensionar img2 para que coincida con las dimensiones de img1
            img2 = imresize(img2, [size(img1, 1), size(img1, 2)]);

            % Operación >=
            result_img = img1 >= img2;
            operation = ' >=';

         case 5
            % Redimensionar img2 para que coincida con las dimensiones de img1
            img2 = imresize(img2, [size(img1, 1), size(img1, 2)]);

            % Operación 0=
            result_img = img1 == img2;
            operation = ' ==';

         case 6
            % Redimensionar img2 para que coincida con las dimensiones de img1
            img2 = imresize(img2, [size(img1, 1), size(img1, 2)]);

            % Operación 0=
            result_img = img1 ~= img2;
            operation = ' ~=';

          case 7
            % Redimensionar img2 para que coincida con las dimensiones de img1
            img2 = imresize(img2, [size(img1, 1), size(img1, 2)]);

            % Operación 0=
            result_img = img1 + img2;
            operation = ' +';

           case 8
            % Redimensionar img2 para que coincida con las dimensiones de img1
            img2 = imresize(img2, [size(img1, 1), size(img1, 2)]);

            % Operación 0=
            result_img = img1 - img2;
            operation = ' -';

           case 9
             % Redimensionar img2 para que coincida con las dimensiones de img1
            img2 = imresize(img2, [size(img1, 1), size(img1, 2)]);

            % Operación 0=
            result_img = img1 .* img2;
            operation = ' x';
   
          case 10
            % Redimensionar img2 para que coincida con las dimensiones de img1
            img2 = imresize(img2, [size(img1, 1), size(img1, 2)]);

            % Operación 0=
            result_img = img1 ./ img2;
            operation = ' /';
        
           

        otherwise
            disp('Opción no válida. Intente de nuevo.');
            continue;
    end

    % Mostrar imágenes originales y sus histogramas
    figure;
    subplot(3, 2, 1), imshow(img1), title('Imagen 1 (Original)');
    subplot(3, 2, 2), imhist(img1), title('Histograma de Imagen 1');
    subplot(3, 2, 3), imshow(img2), title('Imagen 2 (Original)');
    subplot(3, 2, 4), imhist(img2), title('Histograma de Imagen 2');

    % Mostrar resultado de la operación lógica y su histograma
    subplot(3, 2, 5), imshow(result_img), title(['Resultado de Operación ', operation]);
    subplot(3, 2, 6), imhist(result_img), title(['Histograma de Resultado ', operation]);

    % Preguntar si el usuario desea realizar otra operación
    another_operation = input('¿Desea realizar otra operación? (s/n): ', 's');
    if lower(another_operation) ~= 's'
        break;
    end
end

disp('Programa finalizado.');
% Función para convertir una imagen a booleano usando un umbral fijo de 120
function img_bool = convertir_a_booleano(img)
    img_bool = img; % Copiar la imagen original
    img_bool(img < 70) = 0; % Establecer a 0 los valores menores que el umbral
    img_bool(img >= 70) = 1; % Establecer a 1 los valores mayores o iguales al umbral
end

% Función para convertir una imagen a booleano usando un umbral fijo de 120
function img2_bool = convertir_a_booleano2(img2)
    img2_bool = img2; % Copiar la imagen original
    img2_bool(img2 < 50) = 0; % Establecer a 0 los valores menores que el umbral
    img2_bool(img2 >= 50) = 1; % Establecer a 1 los valores mayores o iguales al umbral
end

