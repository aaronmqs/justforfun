function dx = nonlinearsystem(t,x)
dx = [
    x(2)-x(1)*(x(1)^2 + x(2)^2);
    -x(1)-x(2)*(x(1)^2 + x(2)^2);
    ];