Dynamical Systems in Biology 
============================


Exercise 1: Enzyme dynamics
---------------------------

Implement the enzyme reaction

$$
\begin{aligned} 
S + E 
{{k_{ 1} \atop \longrightarrow} \atop {\longleftarrow \atop k_{-1}}} 
C \stackrel{k_{2}}{\longrightarrow} 
P + E. 
\end{aligned} 
$$

-   using mass action kinetics:

$$ 
\begin{aligned} 
\dot{s} & = k_{-1} \cdot c - k_{1} s \cdot e \\ 
\dot{e} & = (k_{-1} + k_{2}) \cdot c - k_{1} \cdot s \cdot e \\ 
\dot{c} & = k_{1} \cdot s \cdot e - (k_{-1} + k_{2}) \cdot c \\ 
\dot{p} & = k_{2} \cdot c, 
\end{aligned}
$$

-   using the steady-state approximation:

$$ 
\begin{aligned} 
\dot{s} & = - \dot{p} = -\frac{k_{2} \mathrm{e}_{T}\cdot s}{\frac{k_{-1}}{k_1}} + s} \\ 
c & = \frac{\mathrm{e}_{T} \cdot s}{\frac{k_{-1}}{k_{1}} + s}. 
\end{aligned} 
$$

-   using the quasi-steady state approximation:

$$ 
\begin{aligned} 
\dot{s} & = - \dot{p} = - \frac{k_{2} \mathrm{e}_{T} \cdot s}{\frac{k_{-1}}{k_{1}} + s} \\ 
c & = \frac{\mathrm{e}_{T} \cdot s}{K_{m} + s} \quad \text{mit} \quad K_{m} = \frac{k_{-1} + k_{2}}{k_{1}} 
\end{aligned}
$$

-   Simulate the three dynamic systems with parameters $(k_1 = 0.1)$, $(k_{-1} = 0.1)$, and 
    $(k_2 = 0.1)$. Let the initial concentrations be 
    $(e(0) = 10)$, $(c(0) = 0)$, and 
    $(s(0) = 10, 20, ..., 100)$. 

-   Take a closer look at the initial time frame of the full system
    implemented by mass-action kinetics. What do you observe?

-   Have a look at the dynamics of all implementations in phase space
    $(s)$ vs. $(c)$.


Cathedral exercise:
-------------------

On the historic depiction of the cathedral on a control box in front of
the Hof-Apotheke, corner KaJo / Münsterstrasse, one can see that four
steps lead to the main portal of the minster. Why is it only one today?

