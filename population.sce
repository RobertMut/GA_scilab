function binaryvector=ToBinaryVector(n, g)
    //generowany jest wektor liczb binarnych (genów) na podstawie
    //liczby losowej n
    //długości wektora g
    for i=1:g do
        binaryvector(i) = modulo(n,2)
//debug        disp(binaryvector(i))
        n = floor(n/2)
//debug        disp(n)
    end
endfunction
function decimalvector=ToDecimalVector(n, g)
    for i=1:g do
        decimalvector(i) = GenerateRandomNmb(n)
    end
endfunction

function random=GenerateRandomNmb(in)
    //generuje liczbę pseudolosową z zakresu <1,in>
    random = round((rand()*in)+1)
endfunction

function population=GeneratePopulation(n, genes, r)
    //generuje populację na podstawie
    //n - liczby jakiej potrzebujemy
    //genes - genów ile chcemy
    //r - górny zakres liczby losowej
    
    x = input("1 - wektor liczb binarnych; 2 wektor liczb całkowitych - ");
    if x==1 then
        
        ran = GenerateRandomNmb(r)
        for i=1:n do
            population(i,:)=ToBinaryVector(r, genes)
        end
        
    elseif x==2 then
        
        for i=1:n do
            population(i,:)=ToDecimalVector(r, genes)
        end
        
    else
        disp("Niepoprawna wartość")
    end
endfunction

