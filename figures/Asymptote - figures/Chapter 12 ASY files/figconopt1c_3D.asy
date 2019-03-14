import graph3;

//ASY file for figconopt1c3D.asy in Chapter 12

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={-2,2};
real[] myzchoice={5};
defaultpen(0.5mm);
pair xbounds=(-1.5,3);
pair ybounds=(-3,2.5);
pair zbounds=(-1,7);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=x^2 - y^2 + 5
triple f(pair t) {
  return (t.x,t.y,t.x^2-t.y^2+5);
}
surface s=surface(f,(-1.5,-3),(2.25,2.5),16,16,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//Draw triangle in plane
draw((-1,-2,0)--(0,1,0)--(2,-2,0)--cycle,red+dashed+linewidth(1));

//Draw triangle on surface
triple g(real t) {return (t,-2,t^2+1);}
path3 mypath=graph(g,-1,2,operator ..); draw(mypath,red); //side 1
triple g(real t) {return (t,3*t+1,t^2-(3*t+1)^2+5);}
path3 mypath=graph(g,-1,0,operator ..); draw(mypath,red); //side 2
triple g(real t) {return (t,-3*t/2+1,t^2-(-3*t/2+1)^2+5);}
path3 mypath=graph(g,0,2,operator ..); draw(mypath,red); //side 3

//Dots at 7 points
dotfactor=4;
dot((-1,-2,2));dot((2,-2,5)); dot((0,1,4)); //at corner of triangles
dot((0,0,5)); //maximum
dot((0,-2,1)); //minimum
dot((1.2,-0.8,5.8));dot((-3/8,-1/8,5.125)); //along edges of triangles





// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//Draw the parabola z=y^2 for t from -2 to 2
//triple g(real t) {return (0,t,t^2);}
//path3 mypath=graph(g,-2,2,operator ..); draw(mypath,blue);


//Draw the surface z=1/(1+x^2+y^2)
//triple f(pair t) {
//  return (t.x,t.y,1/(1+(t.x)^2+(t.y)^2));
//}
//surface s=surface(f,(-2,-2),(2,2),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);


//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-2,2,operator ..);

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);