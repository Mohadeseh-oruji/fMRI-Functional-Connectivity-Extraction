

%% 1. Define input folder
basePath = 'G:\39subjects\results\firstlevel\RRC_01';

%% 2. Initialize variables
allData = [];
connections = {};
referenceNames = {};

%% 3. Process all three conditions
for c = 1:3

    fprintf('Processing Condition %d...\n', c);

    fileName = fullfile(basePath, ...
        sprintf('resultsROI_Condition%03d.mat', c));

    if ~isfile(fileName)
        error('File not found: %s', fileName);
    end

    data = load(fileName);

    names = data.names;
    Z = data.Z;

    % Check ROI consistency
    if c == 1
        referenceNames = names;

        for row = 1:size(Z,1)
            for col = row+1:size(Z,2)

                connection = sprintf('%s-%s', ...
                    names{row}, names{col});

                connections = [connections, connection];

            end
        end

    else
        if ~isequal(names, referenceNames)
            error('ROI names or order differ in Condition %d', c);
        end
    end

    % Check subject count
    if size(Z,3) ~= 39
        error('Unexpected subject count in Condition %d', c);
    end

    % Extract FC values
    for i = 1:size(Z,3)

        subjectValues = [];

        for row = 1:size(Z,1)
            for col = row+1:size(Z,2)

                value = Z(row,col,i);
                subjectValues = [subjectValues, value];

            end
        end

        allData = [allData; i, c, subjectValues];

    end

end

%% 4. Create table
header = [{'Subject','Condition'}, connections];

output = [header; num2cell(allData)];

%% 5. Check data quality
values = allData(:,3:end);

fprintf('\nTotal observations: %d\n', size(allData,1));
fprintf('Total FC features: %d\n', size(values,2));
fprintf('Missing values: %d\n', sum(isnan(values(:))));
fprintf('Infinite values: %d\n', sum(isinf(values(:))));

%% 6. Export Excel file
outputFile = fullfile(basePath, 'FC_All_Conditions.xlsx');

writecell(output, outputFile);

fprintf('\nExcel file successfully created:\n%s\n', outputFile);

%% 7. Open Excel file
winopen(outputFile);

fprintf('\nAnalysis completed successfully!\n');