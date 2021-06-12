exec("population.sce",-1)
exec("T03_cel.sci",-1)
//exec("T03_mapa.sci",-1)
exec("selection.sci",-1)
exec("evolution.sce",-1)
function result=GeneticAlgorithm(N, M, p)
    disp(["1 - rogalikowa dolina";"2 - paraboloida obrotowa, regularna kotlina"..
    ;"3 - bananowa dolina";"4 - dolki"])
    userIn = input("Wybierz cel") 
    pop = GeneratePopulation(N)
    for i=1:M do
        fit = objectiveFunc(pop, userIn)
        pop = NewPopulation(pop, fit, p)
        pop = KillWeakest(pop, userIn)
    end
    rpop = pop
    fittestIndex = GetFittest(rpop)
    result = rpop( fittestIndex,: )
    disp("Cel:")
    disp(cel(result))
    disp("Wynik:")
    disp(result)
    show_window(0)
    Graph(pop)
    show_window(1)
    Map(result, userIn)
endfunction
function Graph(population)
    xtitle("GA", 'Osobniki', 'Wartość')
    plot2d(population)
    xgrid
    legend("X", "Y")

endfunction

function Map(result, userIn)
    //exec('T03_mapa.sci',-1)
    Maps(userIn)
    plot(result(1),result(2),'or')
    set(gca(), "font_style",2, "font_size", 3)
    xstring(result(1),result(2),"Wynik")
endfunction
function Maps(which_one)
    x1_0=-1:0.05:1;
    x2_0=x1_0;
    nsx=size(x1_0,2);
    xx1=ones(nsx,1)*x1_0;
    xx2=x2_0'*ones(1,nsx);

// rogalikowa dolina
    if (which_one == 1) then
        ff=(0.25-xx1.^2-xx2.^2).^2+0.1*xx1+0.055;
    end
// paraboloida obrotowa, regularna kotlina
    if (which_one == 2) then
        ff=3*xx1.^2+xx2.^2+0.01;
    end
// bananowa dolina
    if (which_one == 3) then
        ff=3*(xx2-xx1.^2).^2 +0.1*xx1.^2+0.01;
    end
// dolki
    if (which_one == 4) then
        ff=xx1.^2+xx2.^2+(sin(2*%pi*xx1).^2).*(sin(2*%pi*xx2).^2)+0.01;
    end
clf
contour2d(x1_0,x2_0,log(ff)',10,rect=[-1,-1,1,1]) ;
endfunction

