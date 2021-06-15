function newPop=NewPopulation(population, fitness, p)
    fittestIndex = GetFittest(fitness); //ustalenie indeksu - który osobnik jest najlepszy
    new(,:,)=[];
    j = 1;
    for i=1:size(fitness)(1)
        if (i~=fittestIndex) 
        other(j,:) = population(i,:);
        j = j+1;
        end
    end
    fittest = population( fittestIndex,: );
    for i=1:size(other)(1)
        new(i,:) = Crossover(fittest, other(i,:), p);

    end
    newPop = MergePopulation(population, new);
endfunction

function fittest=GetFittest(fitness)
    m = min(fitness);
    for i=1:size(fitness)(1)
        if(fitness(i) == m) then
            fittest = i;
        end
    end
endfunction

function child=Crossover(parent1, parent2, p)
    r = rand();
    rnd = round(0+(0+100)*r);
        genes = (1-r)*parent1+r*parent2;
        child=Mutate(genes, rnd, p);
endfunction

function mutated=Mutate(genes,rnd, p)
    mutated = genes;
    if( rnd < p) then
        index = round(1+(0+1)*rand());
        mutated = mutated + 0.2*[0.5-rand(), 0.5-rand()];
    end
endfunction

function merged=MergePopulation(population1, population2)
    //merged(,:,)=[]
    for i=1:size(population2)(1)
        population1(size(population1)(1)+1,:) = population2(i,:);
    end
    merged = population1;
endfunction

function f=objectiveFunc(x,which_one)
    
// x -  macierz n x 2, n = ilosc punktow, x(i,:) - wsp. i-tego punktu
//
// rogalikowa dolina
    if (which_one == 1) then
        f=(0.25-x(:,1).^2-x(:,2).^2).^2+0.1*x(:,1)+0.055;
    end
//
// paraboloida obrotowa, regularna kotlina
    if (which_one == 2) then
        f=3*x(:,1).^2+x(:,2).^2+0.01;
    end
//
// bananowa dolina
    if (which_one == 3) then
        f=3*(x(:,2)-x(:,1).^2).^2 + 0.1*x(:,1).^2+0.01;
    end
// dolki
    if (which_one == 4) then
        f=x(:,1).^2+x(:,2).^2+(sin(2*%pi*x(:,1))).^2 + (sin(2*%pi*x(:,2))).^2+0.01;
    end

endfunction

