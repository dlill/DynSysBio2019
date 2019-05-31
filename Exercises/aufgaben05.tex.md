Dynamical Systems in Biology 
============================


Exercise 1: Enzyme dynamics
---------------------------

Implement the enzyme reaction

$$
\begin{aligned} 
S + E 
{{k_{ 1} \atop \longrightarrow} \atop {\longleftarrow \atop k_{-1}}} 
C \stackrel{k_2}{\longrightarrow} 
P + E. 
\end{aligned} 
$$

-   using mass action kinetics:

$$ 
\begin{aligned} 
\dot{s} & = k_{-1} \cdot c - k_1 s \cdot e \\ 
\dot{e} & = (k_{-1} + k_2) \cdot c - k_1 \cdot s \cdot e \\ 
\dot{c} & = k_1 \cdot s \cdot e - (k_{-1} + k_2) \cdot c \\ 
\dot{p} & = k_2 \cdot c, 
\end{aligned}
$$






-   using the steady-state approximation:

$$ 
\begin{aligned} 
\dot{s} & = - \dot{p} = -\frac{k_2 e_{T}\cdot s}{\frac{k_{-1}}{k_1} + s} } \\ 
c & = \frac{e_{T} \cdot s}{\frac{k_{-1}}{k_1} + s} \\
e &= e_T - c. 
\end{aligned} 
$$




*One big remark is that one has to carefully think about what this solution means.*
*In any case, we lost the mass conservation encoded into the ODEs of the mass-action-kinetics system, which can be seen comparing the following two plots:*


````julia
mysol = ma_sol(collect(0:0.1:60));
````


````
Error: UndefVarError: ma_sol not defined
````



````julia
plot(mysol.t, 
    mysol[1,:].+mysol[3,:].+mysol[4,:], 
    ylims = (9.9,10.1), 
    yticks = 9.9:0.1:10.1)
````


````
Error: UndefVarError: mysol not defined
````



````julia

mysol = ssa_sol(collect(0:0.1:60));
````


````
Error: UndefVarError: ssa_sol not defined
````



````julia
plot(mysol.t, mysol[1,:].+mysol[3,:].+mysol[4,:])
````


````
Error: UndefVarError: mysol not defined
````





-   using the quasi-steady state approximation:

$$ 
\begin{aligned} 
\dot{s} & = - \dot{p} = - \frac{k_2 e_{T} \cdot s}{K_m + s} \\ 
c & = \frac{e_{T} \cdot s}{K_m + s} \\
e &= e_T - c
\quad \text{with} \quad K_m = \frac{k_{-1} + k_2}{k_1} 
\end{aligned}
$$






1. Simulate the three dynamic systems with parameters $(k_1 = 0.1)$, $(k_{-1} = 0.1)$, and $(k_2 = 0.1)$. 
    Let the initial concentrations be $(e(0) = 10)$, $(c(0) = p(0) = 0)$, and $(s(0) = 10, 20, 50, 75, 100, 500)$. 
    Other parameters for the simulations are $e_T = e(0) = 10$ and `tspan = (0.0, 60.0).

````julia
p = [0.1 0.1 0.1 10]
tspan = (0.,60.)
s0_values = [10, 20, 50, 75, 100]

ma_sols = Vector(undef, length(s0_values))
ssa_sols =  Vector(undef, length(s0_values))
qsa_sols =  Vector(undef, length(s0_values))

for (s0,i) in zip(s0_values, 1:length(s0_values))
    
    c0_ma = 0 
    u0_ma = [s0 p[4]-c0_ma c0_ma 0]
    ma_prob = ODEProblem(ma_ode!, u0_ma, tspan, p)
    ma_sols[i] = solve(ma_prob)

    c0_ssa = p[4]*s0/((p[2])/p[1] + s0) 
    u0_ssa = [s0 p[4]-c0_ssa c0_ssa 0]
    ssa_prob = ODEProblem(ssa_ode!, u0_ssa, tspan, p)
    ssa_sols[i] = solve(ssa_prob)
    
    c0_qsa = p[4]*s0/((p[2]+p[3])/p[1] + s0) 
    u0_qsa = [s0 p[4]-c0_qsa c0_qsa 0]
    qsa_prob = ODEProblem(qsa_ode!, u0_qsa, tspan, p)
    qsa_sols[i] = solve(qsa_prob)

end
````


````
Error: UndefVarError: ODEProblem not defined
````



````julia

# doesnt yet work...
# myplot = plot(layout = 4)
# for (ma, ssa,qsa) in zip(ma_sols, ssa_sols, qsa_sols)
#     s = plot(ma, vars = 1);
#     e = plot(ma, vars = 2);
#     c = plot(ma, vars = 3);
#     p = plot(ma, vars = 4);
#     
#     s = plot!(s, ssa, vars = 1);
#     e = plot!(e, ssa, vars = 2);
#     c = plot!(c, ssa, vars = 3);
#     p = plot!(p, ssa, vars = 4);
#     
#     s = plot!(s, qsa, vars = 1);
#     e = plot!(e, qsa, vars = 2);
#     c = plot!(c, qsa, vars = 3);
#     p = plot!(p, qsa, vars = 4);
# 
#     display(plot!(myplot, plot(s,e,c,p)))
# end

# substrate: you can see that the initial conditions don't really match since I didn't take into account that at the beginning, some of the substrate is sequestered into the complex.
# However, the linear decrease is well matched for high substrate concentrations.
plot()
````


````
Error: UndefVarError: plot not defined
````



````julia
for (ma, ssa,qsa) in zip(ma_sols, ssa_sols, qsa_sols)
    display(plot!(ma,  vars = 1))
    display(plot!(ssa, vars = 1, linestyle = :dot))
    display(plot!(qsa, vars = 1, linestyle = :dash))
end
````


````
Error: UndefRefError: access to undefined reference
````



````julia

# complex: The approximations assume that complexes are created instantaneously whereas it has to be created first in the more realistic (for the initial phase) mass-action setting.
plot()
````


````
Error: UndefVarError: plot not defined
````



````julia
for (ma, ssa,qsa) in zip(ma_sols, ssa_sols, qsa_sols)
    display(plot!(ma,  vars = 3, color = :red))
    display(plot!(ssa, vars = 3, linestyle = :dot, color = :green))
    display(plot!(qsa, vars = 3, linestyle = :dash, color = :blue))
end
````


````
Error: UndefRefError: access to undefined reference
````




1. Take a closer look at the initial time frame of the full system implemented by mass-action kinetics. What do you observe?

````julia
# Apparently, the substrate is consumed quickly, but this is only due to complex formation. 
# Product formation only starts slowly and then goes into the linear phase.
plot(ma_sol, tspan = (0.,5.))
````


````
Error: UndefVarError: plot not defined
````




1. Have a look at the dynamics of all implementations in phase space $(s)$ vs. $(c)$.

````julia
# Again we observe that the approximations already start with ready-made complexes
plot(ma_sol, vars = (1,3), color = :red)
````


````
Error: UndefVarError: plot not defined
````



````julia
plot!(ssa_sol, vars = (1,3), color = :green)
````


````
Error: UndefVarError: plot! not defined
````



````julia
plot!(qsa_sol, vars = (1,3), color = :blue)
````


````
Error: UndefVarError: plot! not defined
````






Exercise 2: Homework
---------------------------

In this exercise, we wish to determine $Vmax$ and $K_m$ with the help of a *Lineweaver-Burk-Plot*.
Those are described in the Script, p.107 and on https://en.wikipedia.org/wiki/Lineweaver%E2%80%93Burk_plot 

![Lineweaver Burk plot](https://upload.wikimedia.org/wikipedia/commons/7/70/Lineweaver-Burke_plot.svg)



1. Using the implementation of the mass-action-kinetics ODE, create a Lineweaver-Burk-Plot and determine Vmax and Km from it. Substeps:
    * Simulate the mass-action-kinetics ODE  with the parameters from above and for $s(0) = 100$.
    * Plot $frac{1}{V} = \frac{1}{\dot{p}}$ vs $\frac{1}{s}$ 
    * Determine $Vmax$ and $K_m$ from the plot.
    




Cathedral exercise:
-------------------

On the historic depiction of the cathedral on a control box in front of
the Hof-Apotheke, corner KaJo / Münsterstrasse, one can see that four
steps lead to the main portal of the minster. Why is it only one today?


\* Pro bug catcher at the English Wikipedia \[CC BY-SA 3.0 \http://creativecommons.org/licenses/by-sa/3.0/\)\]