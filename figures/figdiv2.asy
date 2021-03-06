import graph;
size(150,150);

// vector field F = <x/(x^2+y^2), y/(x^2+y^2) > 


usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");


defaultpen(fontsize(8));

bool incolor;
incolor = true;

pen colorone;
pen colortwo;
pen mainvect;
pen bgvect;

if(incolor) { 
	colorone = blue+1.5pt+linejoin(0);
	colortwo = red+1.5pt+linejoin(0);
	mainvect = blue + linejoin(0);
	bgvect = rgb(.6,.6,.6)+linejoin(0);
	} else
	{
	colorone = black+1.5pt+linejoin(0);
	colortwo = gray+1.5pt+linejoin(0);
	mainvect = black + linejoin(0);
	bgvect = rgb(.6,.6,.6)+linejoin(0);
	};	
pair xbounds=(-2.8,2.8);
pair ybounds=(-2.8,2.8);
real[] myxchoice={-2,2};
real[] myychoice={-2,2};

xaxis("",xbounds.x,xbounds.y,arrow=Arrow(DefaultHead,size=4));
yaxis("",ybounds.x,ybounds.y,arrow=Arrow(DefaultHead,size=4));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0));
//label("\phantom{$x$}",(xbounds.x-0.05*(xbounds.y-xbounds.x),0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x)));
//label("\phantom{$y$}",(0,ybounds.x-0.05*(ybounds.y-ybounds.x)));

draw((-.1,2)--(.1,2));
draw((2,-.1)--(2,.1));
label("$a$",(2,0),SE);
label("$a$",(0,2),NW);

pair a=(-2.5,-2.5);
pair b=(-.42,0);

pair vectfunction(pair z) {return (z.x/(z.x^2+z.y^2),z.y/(z.x^2+z.y^2));}
path vector(pair t) {return -vectfunction(t)/2 -- vectfunction(t)/2;}

add(vectorfield(vector,a,b,5,5,bgvect));

pair a=(-2.5,.42);
pair b=(0,2.5);
add(vectorfield(vector,a,b,5,5,bgvect));

pair a=(.42,0);
pair b=(2.5,2.5);
add(vectorfield(vector,a,b,5,5,bgvect));

pair a=(0,-2.5);
pair b=(2.5,-.42);
add(vectorfield(vector,a,b,5,5,bgvect));


//pair f(real x) {return (cos(x),sin(x));}
//real g(real x) {return x^4;}
//pair G(real x) {return (x,g(x));}

//pair G(real t) {return (.2,t);}

pair F(real x) {return (2*cos(x),2*sin(x));}
draw(graph(F,0,2pi,operator ..),colorone,arrow=MidArrow(5));

//draw(graph(f,0,pi/2,operator ..),colortwo,arrow=MidArrow(5));
//draw(graph(f,0,.8,operator ..),colorone+linetype(new real[] {4,2}),arrow=MidArrow(5));

//filldraw(shift(0,.33)*scale(.03)*unitcircle,black);
//label("$A$",(.1,.4));//filltype=Fill(white+opacity(.7)));
//label("$C_2$",(.75,.77),filltype=Fill(white+opacity(.7)));
label("$R$",(0,.5),filltype=Fill(white+opacity(.7)));


