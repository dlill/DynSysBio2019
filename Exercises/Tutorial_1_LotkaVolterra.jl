
using Plots
using LaTeXStrings

function euler(init,pars,dt,tmax)
    N = Int(tmax/dt)
    x = Vector(undef,N+1)
    y = Vector(undef,N+1)
    x[1] = init[1]
    y[1] = init[2]
    for i in 1:N
        dx = a*x[i] - b*x[i]*y[i]
        dy = c*x[i]*y[i] - d*y[i]
        x[i+1] = x[i] + dt*dx
        y[i+1] = y[i] + dt*dy
    end
    t = range(1,length=N+1,step=dt)
    return t,[x,y]
end

a= 2/3; b=4/30; c=1/10; d=1
pars = [a,b,c,d]
init = [10,15]
t,x = euler(init,pars,1e-3,50)

init2 = [15,10]
t2,x2 = euler(init2,pars,1e-3,50);

p1 = plot(t,x, label="",xlabel="Time", ylabel="pop. [au]", title = L"x_0 < y_0")
p2 = plot(t2,x2, label=["Prey","Predator"],legendtitle="Species",xlabel="Time", title = L"x_0 > y_0")
plot(p1,p2)

plot([x[1],x2[1]],[x[2],x2[2]],label=[L"x_0 < y_0",L"x_0 > y_0"],legendtitle="init",title="Phase space",xlabel="x",ylabel="y")

function euler_noise(init,pars,dt,tmax,sd)
    N = Int(tmax/dt)
    x = Vector(undef,N+1)
    y = Vector(undef,N+1)
    x[1] = init[1]
    y[1] = init[2]
    for i in 1:N
        dx = a*x[i] - b*x[i]*y[i]
        dy = c*x[i]*y[i] - d*y[i]
        noisex = sqrt(dt)*randn()*sd[1]
        noisey = sqrt(dt)*randn()*sd[2]
        x[i+1] = x[i] + dt*dx + noisex
        y[i+1] = y[i] + dt*dy + noisey
        if x[i+1]<0 x[i+1] = 0 end
        if y[i+1]<0 y[i+1] = 0 end
    end
    t = range(1,length=N+1,step=dt)
    return t,[x,y]
end

init = [10,10]
t,x = euler_noise(init,pars,1e-3,100,[.3,.3])
t2,x2 = euler_noise(init,pars,1e-3,100,[0,0])

p1 = plot(t,x, label="",xlabel="Time", ylabel="pop. [au]", title = "noise")
p2 = plot(t2,x2, label=["Prey","Predator"],legendtitle="Species",xlabel="Time", title = "no noise")
plot(p1,p2)

p1 = plot(t,[x[1],x2[1]], label="",xlabel="Time", ylabel="pop. [au]", title = "Prey")
p2 = plot(t2,[x[2],x2[2]], label=["noise","no noise"],legendtitle="Species",xlabel="Time", title = "Predator")
plot(p1,p2)

plot([x[1],x2[1]],[x[2],x2[2]],label=["noise","no noise"],title="Phase space",xlabel="x",ylabel="y")

function euler_ext(init,pars,dt,tmax,sd)
    N = Int(tmax/dt)
    x = Vector(undef,N+1)
    y = Vector(undef,N+1)
    x[1] = init[1]
    y[1] = init[2]
    for i in 1:N
        dx = a*x[i]*(1-x[i]/K) - b*x[i]*y[i]/(x[i]+S)
        dy = c*x[i]*y[i]/(x[i]+S) - d*y[i]
        noisex = sqrt(dt)*randn()*sd[1]
        noisey = sqrt(dt)*randn()*sd[2]
        x[i+1] = x[i] + dt*dx + noisex
        y[i+1] = y[i] + dt*dy + noisey
        if x[i+1]<0 x[i+1] = 0 end
        if y[i+1]<0 y[i+1] = 0 end
    end
    t = range(1,length=N+1,step=dt)
    return t,[x,y]
end

pars = a,b,c,d,K,S = [1,1,1,1/3,30,10]
init = [1,1]
t,x1  = euler_ext(init,pars,1e-3,100,[0.5,0.5])
t,x1no = euler_ext(init,pars,1e-3,100,[0,0])

init = [10,10]
t,x10  = euler_ext(init,pars,1e-3,100,[0.5,0.5])
t,x10no = euler_ext(init,pars,1e-3,100,[0,0]);

p1 = plot(t,[x1[1]  ,x10[1]]  ,label="",title="Prey",ylabel="noise")
p2 = plot(t,[x1[2]  ,x10[2]]  ,title="Predator",label=[L"x_0 = y_0 = 1",L"x_0 = y_0 = 10"])
p3 = plot(t,[x1no[1],x10no[1]],label="",xlabel="time",ylabel="no noise")
p4 = plot(t,[x1no[2],x10no[2]],label="",xlabel="time")
plot(p1,p2,p3,p4)

p1 = plot([x1[1],x10[1]],[x1[2],x10[2]],label="",title="nnoise",xlabel="x",ylabel="y")
p2 = plot([x1no[1],x10no[1]],[x1no[2],x10no[2]],label=[L"x_0 = y_0 = 1",L"x_0 = y_0 = 10"],title="no noise",xlabel="x",ylabel="y")
plot(p1,p2)

## Interpretation:
# K = carrying capacity or maximum population size (if population is greater than K it decreases, if population is lower than K it increases)
# S = Michaelis constant: concentration at half reaction rate v/2
# Change of system by multiplying v~x/(x+S):
# reaction rate linear for small x (v~x/S), saturation for large x (v~1)
# Change of system by adding -x/K:
# population maximum evens out (otherwise x or y can go to infinity)
# noise:
# no attractor
