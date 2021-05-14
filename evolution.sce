function newPop=NewPopulation(population, fitness)
    m = mean(fitness)
    newPop(,:,)=[]
    f=1
    dm = 1
    disp(m)
    for i=1:size(fitness)(1) do
        if(fitness(i) >= m) then
            disp("Good")
            fittest(f,:) = population(i,:)
            f=f+1
        else
            toDoMutation(dm,:) = population(i,:)
            dm=dm+1
        end
    end
    s = size(fittest)(1)
    even = modulo(s,2)
    if (even==1) then
        s=s-1
    end
    disp(s)
    for j=1:2:s do
        p1=fittest(j,:)
        p2=fittest(j+1,:)
        tmp = crossover(p1, p2)
        newPop(size(newPop)(1)+1,:) = p1
        newPop(size(newPop)(1)+1,:) = p2
        newPop(size(newPop)(1)+1,:) = tmp(1,:)
        newPop(size(newPop)(1)+1,:) = tmp(2,:)
    end
    mutated = mutation(toDoMutation, m)
    for k=1:size(mutated)(1)
        newPop(size(newPop)(1)+1,:) = mutated(k)
    end
    
endfunction

function child=crossover(parent1, parent2)
    genesHalf = ceil(size(parent1)(2)/2)
    genes = size(parent1)(2)
    child(1,1:genesHalf-1) = parent1(1,genesHalf-1)
    child(2,1:genesHalf-1) = parent2(1,genesHalf-1)
    for i=1:2 do
        
        for k=genesHalf:genes do
            if (parent1(1,k) > parent2(1,k)) then
            child(i,k) = parent1(1,k)
           else
            child(i,k) = parent2(1,k)
            end
        end
    end
    
endfunction 

function mutated=mutation(toBeMutated, m)
    height = size(toBeMutated)(1)
    width = size(toBeMutated)(2)
    mutated=[]
    for i=1:height do
        tmp = toBeMutated(i,:)
        tmp(round((rand()*width)+1))=round((rand()*100)+1)
        mutated(i,:) = tmp //czasami rzuca błędem w tym miejscu
        end
endfunction
