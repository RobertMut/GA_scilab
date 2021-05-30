function result=GeneticAlgorithm(N, M, p)
        pop = GeneratePopulation(N)
    for i=1:M do
        fit = cel(pop)
        pop = NewPopulation(pop, fit, p)
        pop = KillWeakest(pop)
    end
    rpop = pop
    fittestIndex = GetFittest(rpop)
    result = rpop( fittestIndex,: )
    disp("Cel:")
    disp(cel(result))
    disp("Wynik:")
    disp(result)
    Graph(pop)
    Map(pop)
endfunction
function Graph(population)
    subplot(211)
    xtitle("GA", 'Osobniki', 'Wartość')
    plot2d(population)
    legend("X", "Y")
endfunction
function Map(res)
    subplot(212)
    x1_0=-1:0.05:1;
    x2_0=x1_0;
    nsx=size(x1_0,2);
    xx1=ones(nsx,1)*x1_0;
    xx2=x2_0'*ones(1,nsx);

// rogalikowa dolina
    ff=(0.25-xx1.^2-xx2.^2).^2+0.1*xx1+0.055;

// paraboloida obrotowa, regularna kotlina
    //ff=3*xx1.^2+xx2.^2+0.01;

// bananowa dolina
    //ff=3*(xx2-xx1.^2).^2 +0.1*xx1.^2+0.01;

// dolki
    //ff=xx1.^2+xx2.^2+(sin(2*%pi*xx1).^2).*(sin(2*%pi*xx2).^2)+0.01;
    clf
    contour2d(x1_0,x2_0,log(ff)',10,rect=[-1,-1,1,1]) ;





endfunction
