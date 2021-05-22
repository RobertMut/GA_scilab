function newPop=NewPopulation(population, fitness, p)
    fittestIndex = GetFittest(fitness) //ustalenie indeksu - który osobnik jest najlepszy
    j = 1
    for i=1:size(fitness)(1)
        if (i~=fittestIndex) 
        other(j,:) = population(i,:)
        j = j+1
        end
    end
    fittest = population( fittestIndex,: )
    for i=1:size(other)(1)
        new(i,:) = Crossover(fittest, other(i,:), p)
    end
    newPop = MergePopulation(population, new)
endfunction

function fittest=GetFittest(fitness)
    m = min(fitness)
    for i=1:size(fitness)(1)
        if(fitness(i) == m) then
            fittest = i 
        end
    end
endfunction

function child=Crossover(parent1, parent2, p)
    rnd = round(0+(0+100)*rand())
        genes(1,1) = mean( [parent1(1,1),parent2(1,1)] )
        genes(1,2) = mean( [parent1(1,2), parent2(1,2)] )
        child=Mutate(genes, rnd, p)
endfunction

function mutated=Mutate(genes,rnd, p)
    if( rnd < p*100) then
        index = round(1+(0+1)*rand())
        mutated(1,index) = mean([genes(1,index), rand()])
    else 
    mutated = genes 
    end
endfunction

function merged=MergePopulation(population1, population2)
    //merged(,:,)=[]
    for i=1:size(population2)(1)
        population1(size(population1)(1)+1,:) = population2(i,:)
    end
    merged = population1
endfunction

