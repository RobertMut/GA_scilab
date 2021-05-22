//Funkcja cel realizuje aktualnie tę część kodu


/*function fitness=CalculateFitnessLF(population)
    //Obliczenie ilości kolumn i wierszy populacji
    rows = size(population)(1)
    columns = size(population)(2)
    //Uzyskanie zmiennych
    variables = GetVariable(expressionStr)
//dbg    disp(variables)
    //Przydzielenie danych do zmiennych
    data = AssignData(population, variables)
//dbg    disp("pop rows= " +  string(rows) + " data rows = " + string(size(data)(1)))
//dbg   disp("pop columns= " +  string(columns) + " data columns = " + string(size(data)(2)))
    k = 1
    for i=1:rows do
        for j=1:columns do
            //przydzielamy kolumne.
            //przydzielamy kolumne+1
            execstr(data(i,j))
            //disp(data(j,i))

            end
            fitness(k) = abs(1/evstr(expressionStr))
            k = k + 1
    end
endfunction

function variables=GetVariable(expressionStr)
    //Uzyskanie wektora true - zmienne, false -  cyfr i innych 
    letterVect = isletter(expressionStr)
    v=1
    //Rozdzielenie stringa gdyż nie ma niejawnej konwersji do chara
    expressionStr = strsplit(expressionStr)
    for i=1:length(letterVect) do
        //Sprawdzenie każdego znaku wyrażenia
        if letterVect(i) == %T then
            //przydzielenie zmiennych
            variables(v) = expressionStr(i)
            v = v+1
        end
    end
endfunction

function data=AssignData(population, variables)
    //kolumny
    for i=1:size(population)(2) do
        //wiersze
        for j=1:size(population)(1) do
            //wpuszczam w zmienną
            vars = string(variables(i))
//dbg     disp("Vars = "+vars)
            //wpuszczam wartość
            pop = string(population(j,i))
//dbg     disp("Pops = "+pop)
            data(j,i) = vars+"="+pop
        end
    end
//dbg    disp(data)
endfunction
*/
