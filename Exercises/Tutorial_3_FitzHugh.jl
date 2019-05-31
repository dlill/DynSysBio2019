#using Pkg
#Pkg.add("DifferentialEquations")
using Plots
using DifferentialEquations

a = 0.25
eps = 0.002
Iapp = 0.0
gam = 1.1
p = [a,eps,gam,Iapp]
tspan = (0.0,1000.0)

function FN(du,u,t,p)
    du[1] = u[1]*(a-u[1])*(u[1]-1)-u[2]+Iapp
    du[2] = eps*(u[1]-gam*u[2])
end

function apply(u0)
    prob = ODEProblem(FN,u0,tspan)
    sol = solve(prob)
end

sol1 = apply([0.1,0.0])
sol2 = apply([0.2,0.0])
sol3 = apply([0.3,0.0])
sol4 = apply([0.4,0.0])

p1 = plot(sol1,linecolor = :red)
p2 = plot!(sol2, linecolor = :blue)
p3 = plot!(sol3, linecolor = :green)
p4 = plot!(sol4, linecolor = :yellow)

# Phase-space
p1 = plot(sol1,vars = (1,2),linecolor = :red,xlims = (-0.25,1),ylims = (0,0.125))
p2 = plot!(sol2,vars = (1,2), linecolor = :blue,xlims = (-0.25,1),ylims = (0,0.125))
p3 = plot!(sol3,vars = (1,2), linecolor = :green,xlims = (-0.25,1),ylims = (0,0.125))
p4 = plot!(sol4,vars = (1,2), linecolor = :yellow,xlims = (-0.25,1),ylims = (0,0.125), xlabel="v",ylabel="w")

# Nullclines
# dv = -v^3 + (a-1)*v^2 -a*v -w = 0
#-> w = -v^3 + (a-1)*v^2 -a*v
# dw = eps*(v-gam*w) = 0
# -> w = v/gamma

function FNnc(u,p)
    ncv = u.*(a.-u).*(u.-1).+Iapp
    ncw = u./gam
    nc = [ncv,ncw]
end

u = collect(-0.25:0.1:1.5)
nc = FNnc(u,p)
plot!(u,nc)

# One sees that v grows for v0>0.25 (yellow&green) until
# they intersect with the nullcline (turkis) and then decreases
# while w grows rapidly.
# They all follow the trajectory until they reach the fixed point (0,0)


## Testing influence of Iapp
u0 = [0.3;0.0]
Iapp = 0.02
sol5 = apply(u0)
nc5 = FNnc(u,[a,eps,gam,Iapp])
Iapp = 0.1
sol6 = apply(u0)
nc6 = FNnc(u,[a,eps,gam,Iapp])
Iapp = 0.5
sol7 = apply(u0)
nc7 = FNnc(u,[a,eps,gam,Iapp])
Iapp = 0.7
sol8 = apply(u0)
nc8 = FNnc(u,[a,eps,gam,Iapp])

p5 = plot(sol5,linecolor = :red)
p6 = plot!(sol6,linecolor = :blue)
p7 = plot!(sol7,linecolor = :green)
p8 = plot!(sol8,linecolor = :yellow)

p5 = plot(sol5,vars = (1,2),linecolor = :red, label="Iapp=0.02")
p5nc = plot!(u,nc5,linecolor = :red, linestyle = :dash, label="Nullcline, Iapp=0.02",ylim=(0,0.8))
p6 = plot!(sol6,vars = (1,2),linecolor = :blue, label="Iapp=0.1")
p6nc = plot!(u,nc6,linecolor = :blue, linestyle = :dash, label="Nullcline, Iapp=0.1")
p7 = plot!(sol7,vars = (1,2),linecolor = :green, label="Iapp=0.5")
p7nc = plot!(u,nc7,linecolor = :green, linestyle = :dash, label="Nullcline, Iapp=0.5")
p8 = plot!(sol8,vars = (1,2),linecolor = :yellow, label="Iapp=0.7",xlim=(-0.25,1.5))
p8nc = plot!(u,nc8,linecolor = :yellow, linestyle = :dash, label="Nullcline, Iapp=0.7")

# Iapp gives higher/lower threshold for firing
