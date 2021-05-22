function decimalvector=ToDecimalVector(g)
    for i=1:g do
        decimalvector(i) = -1+(1+1)*rand() //zakres -1,1
    end
endfunction

function population=GeneratePopulation(n)
    //n - liczby jakiej potrzebujemy
    genes = 2 //dwa geny, współrzędne narzucone przez zadanie
        for i=1:n do
            population(i,:)=ToDecimalVector(genes)
        end
        
endfunction

