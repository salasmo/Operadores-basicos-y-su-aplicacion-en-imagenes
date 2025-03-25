clc;
clear;
close all;

% Main loop to allow continuous operations
disp("Basic Operators and Their Application in Images")

while true
    disp('Select the 1st image 😎:');
    [file1, path1] = uigetfile({'*.jpg;*.png;*.bmp;*.tif', 'Image Files (*.jpg, *.png, *.bmp, *.tif)'}, 'Image 1');
    if isequal(file1, 0)
        disp('No file selected. Au revoir 👌');
        break;
    end
    disp('Select the 2nd image 😎 (Same size as 1st):');
    [file2, path2] = uigetfile({'*.jpg;*.png;*.bmp;*.tif', 'Image Files (*.jpg, *.png, *.bmp, *.tif)'}, 'Image 2');
    if isequal(file2, 0)
        disp(['404 Not Found 😔']);
        break;
    end

    % Read the images
    img1 = imread(fullfile(path1, file1));
    img2 = imread(fullfile(path2, file2));

    % Check size
    if ~isequal(size(img1), size(img2))
        disp('Please be sure that the images are the same size 😔');
        continue;
    end

    % Convert images to grayscale
    if size(img1, 3) == 3 
        img1 = rgb2gray(img1);
    end
    if size(img2, 3) == 3
        img2 = rgb2gray(img2);
    end

    % Display original images
    figure;
    subplot(2, 3, 1);
    imshow(img1);
    title('Image 1');

    subplot(2, 3, 2);
    imshow(img2);
    title('Image 2');

    % Display histograms
    subplot(2, 3, 4);
    imhist(img1);
    title('Histogram of Image 1');

    subplot(2, 3, 5);
    imhist(img2);
    title('Histogram of Image 2');

    % Ask user for operation type
    disp('Select an operation:');
    disp('1. Logical Operations');
    disp('2. Mathematical Operations');
    disp('3. Exit');
    choice = input('Enter your choice (1, 2, or 3): ');

    if choice == 3
        disp('Au revoir 👌');
        break;
    end

    % Perform selected operation
    switch choice
        case 1 % Logical Operations
            disp('Select a logical operation:');
            disp('1. <= (Less than or equal to)');
            disp('2. >= (Greater than or equal to)');
            disp('3. == (Equal to)');
            disp('4. ~= (Not equal to)');
            disp('5. AND');
            disp('6. OR');
            logical_choice = input('Enter your choice (1-6): ');

            switch logical_choice
                case 1
                    result = img1 <= img2;
                    operation_name = 'Less than or equal to';
                case 2
                    result = img1 >= img2;
                    operation_name = 'Greater than or equal to';
                case 3
                    result = img1 == img2;
                    operation_name = 'Equal to';
                case 4
                    result = img1 ~= img2;
                    operation_name = 'Not equal to';
                case 5
                    result = img1 & img2;
                    operation_name = 'AND';
                case 6
                    result = img1 | img2;
                    operation_name = 'OR';
                otherwise
                    disp('Invalid choice. Returning to main menu.');
                    continue;
            end

        case 2 % Mathematical Operations
            disp('Select a mathematical operation:');
            disp('1. Addition (+)');
            disp('2. Subtraction (-)');
            disp('3. Multiplication (*)');
            disp('4. Division (/)');
            math_choice = input('Enter your choice (1-4): ');

            switch math_choice
                case 1
                    result = img1 + img2;
                    operation_name = 'Addition';
                case 2
                    result = img1 - img2;
                    operation_name = 'Subtraction';
                case 3
                    result = img1 .* img2;
                    operation_name = 'Multiplication';
                case 4
                    result = img1 ./ img2;
                    operation_name = 'Division';
                otherwise
                    disp('Invalid choice. Returning to menu.');
                    continue;
            end

        otherwise
            disp('Invalid choice. Returning to menu.');
            continue;
    end

    % Display the result and its histogram
    subplot(2, 3, 3);
    imshow(result);
    title(['Result: ', operation_name]);

    subplot(2, 3, 6);
    imhist(result);
    title('Histogram of Result');

    % Ask user if they want to continue
    cont = input('Do you want to perform another operation? (y/n): ', 's');
    if lower(cont) ~= 'y'
        disp('Au revoir 👌');
        break;
    end
end