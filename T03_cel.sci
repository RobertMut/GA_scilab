function f=cel(x)

// x -  macierz n x 2, n = ilosc punktow, x(i,:) - wsp. i-tego punktu
//
// rogalikowa dolina

f=(0.25-x(:,1).^2-x(:,2).^2).^2+0.1*x(:,1)+0.055;
//
// paraboloida obrotowa, regularna kotlina
//f=3*x(:,1).^2+x(:,2).^2+0.01;
//
// bananowa dolina
//f=3*(x(:,2)-x(:,1).^2).^2 + 0.1*x(:,1).^2+0.01;
//
// dolki
//f=x(:,1).^2+x(:,2).^2+(sin(2*%pi*x(:,1))).^2 + (sin(2*%pi*x(:<2))).^2+0.01;

endfunction
