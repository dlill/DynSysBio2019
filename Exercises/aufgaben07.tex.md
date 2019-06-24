# Tutorial 7

# Exercise 1: Positive cooperative feedback

Consider a protein $A$ being phosphorylated by a stimulus $S$ with rate $k_1$ and dephosphorylated with rate $k_{-1}$. The phosphorylation is cooperatively enhanced by a positiv feedback with hill coefficient $k=4$ and rate $k_2$:

$$ 
\frac{\mathrm{d}}{\mathrm{d}t} pA = k_{1} \cdot S \cdot A + k_{2} \cdot A \cdot \frac{pA^4}{K_{m}^4 + pA^4} - k_{-1}\cdot pA. 
$$

Further assume that the total amount of protein equals 1 ($pA + A = A_{\mathrm{total}} = 1$):

$$ 
\frac{\mathrm{d}}{\mathrm{d}t} pA = \left( k_{1} \cdot S + k_{2} \cdot \frac{pA^4}{K_m^4 + pA^4}\right) \cdot (1-pA) - k_{ -1}\cdot pA. 
$$

The parameters are given by $k_{1} = 0.1$, $k_{-1} = 1$, $k_{2} = 2$ and $K_{m} = 0.3$.


* Use the following system for the exercises
````julia

using DifferentialEquations, Plots

function feedback!(du, u, p, t) 
    A, pA = u
    S, k1, k_1, k2, Km = p
    du[2] = (k1*S+k2*pA^4/(Km^4 + pA^4))*(1-pA) - k_1*pA
    du[1] = -du[2]
    return du
end

p =  [1 0.1 1 2 0.3] # S, k1, k_1, k2, Km
u0 =  [1. 0] # A, pA 
tspan = (0, 20.)

prob = ODEProblem(feedback!, u0, tspan, p)
sol = solve(prob)
````




* Compare the solution with the solution without a positive feedback.



* Compute the system's steady state (see last tutorial) and run a quick consistency check that the results make sense. 
    (If they don't, choose another method to compute the steady states or tune the hyperparameters to obtain more meaningful results.)


* Write a function `tune_input(f, u0, input, p)` for the following task
    Stimulate the system with input `S in [0,2]` starting with $ S = 0 $ , increasing $ S $ in small steps until $ S = 2 $ and then reducing $ S $ in small steps until $ S = 0 $ again. 
    In each step, compute the steady state of the system and take its value as initial value for the next $ S $ value. Start with $ pA=0 $ for $ S=0 $.
    * Plot $ pA $ vs $ S $.
    * How is the observed phenomenon called in physics?
    * What is its meaning in biological systems? 




* Generate a rate balance plot to illustrate the mode of action: plot the build and decay fluxes of $pA$ as a function of $pA$.
*   How can you extract information on the qualitative dynamics, especially the stability of the fixed points, from this plot?

* Evaluate the system for smaller values of $k_2$ and discover another, qualitatively different behavior of the system. How can this behavior be explained?



# Exercise 2

This model of a gene regulatory network was taken from [here](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0003478#pone-0003478-g002)
* If you have time, read the first few paragraphs of the introduction

Assume this model describes a stem cell which is about to differentiate into one of two possible phenotypes (e.g. a skin cell or a muscle cell).
To know, which cell type this cell has to choose, it processes the external information provided by the ratio of two biochemicals $O$ and $S$. 
In this model, the ratio is given as parameter `O_by_S == p[1]`.

* Use your `tune_input` function from exercise 1 to find two different phenotypes (steady states) depending on the input. For reasonable ranges of the input, browse the paper)
* Why is there a region of bistability (i.e. a range of inputs with two stable steady states)? 

````julia

function model2!(du, u, p, t)
    N, G = u
    O_by_S,    a1,a2,b1,b2,b3,γ_n,c1,c2,d1,d2,d3,γ_g = p
    du[1] = (a1*O_by_S + a2*O_by_S * N) / (1 + b1*O_by_S + b2*O_by_S*N + b3*O_by_S*G) - γ_n * N
    du[2] = (c1*O_by_S + c2*G) / (1 + d1*O_by_S + d2*G + d3*N) - γ_g * G
end
# p2 =O_by_S  a1  a2    b1  b2    b3  γ_n  c1   c2   d1   d2   d3  γ_g
p2 = [1       .02 .0125 .02 .0125 .03 .01  .05 .0125 .05 .0125 .05 .01]
u2 = ones(2)
````







Cathedral exercise:
-------------------
What is the story of the most famous waterspout?