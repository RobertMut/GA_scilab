function selectedPopulation=KillWeakest(population, userIn)
    selectedPopulation(:,:) = [];
    fitness = objectiveFunc(population, userIn);
    m = mean(fitness);
    for i=1:size(fitness)(1)
        if (fitness(i)<m)
        selectedPopulation(size(selectedPopulation)(1)+1,:) = population(i,:);
        end
    end
    
endfunction
