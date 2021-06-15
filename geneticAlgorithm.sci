function result=GeneticAlgorithm(N, M, p)
    close();
    exec("population.sci",-1);
    exec("selection.sci",-1);
    exec("evolution.sci",-1);
    disp(["1 - rogalikowa dolina";"2 - paraboloida obrotowa, regularna kotlina"..
    ;"3 - bananowa dolina";"4 - dolki"]);
    userIn = input("Wybierz cel: ");
    pop = GeneratePopulation(N);
    show_window(0);
    for i=1:M do
        fit = ObjectiveFunc(pop, userIn);
        pop = NewPopulation(pop, fit, p);
        MapPoint(pop);
        pop = KillWeakest(pop, userIn);
    end
    Maps(userIn);
    rpop = pop;
    fittestIndex=GetFittest(rpop);
    result = rpop( fittestIndex,: );
    disp("Cel:");
    disp(cel(result));
    disp("Wynik:");
    disp(result);
    show_window(1);
    Graph(pop);
    show_window(2);
    MapPoint(result);
    Maps(userIn);
    xstring(result(1),result(2),"Wynik");
endfunction
function Graph(population)
    xtitle(["Olena Mikhieieva 19415";"Robert Mutniański 18555"], 'Osobniki', 'Wartość');
    plot2d(population);
    xgrid;
    legend("X", "Y");

endfunction

function MapPoint(result)
    for i=1:size(result)(1)
        plot(result(i,1),result(i,2),'or');
    end
endfunction
function Maps(which_one)
    set(gca(), "font_style",2, "font_size", 3);
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
    xtitle(["Olena Mikhieieva 19415";"Robert Mutniański 18555"]);
    contour2d(x1_0,x2_0,log(ff)',10,rect=[-1,-1,1,1]) ;
endfunction

