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



-   using the quasi-steady state approximation:

$$ 
\begin{aligned} 
\dot{s} & = - \dot{p} = - \frac{k_2 e_{T} \cdot s}{K_m + s} \\ 
c & = \frac{e_{T} \cdot s}{K_m + s} \\
e &= e_T - c
\quad \text{with} \quad K_m = \frac{k_{-1} + k_2}{k_1} 
\end{aligned}
$$




* To obtain time-courses of $c$ and $e$, you can either derive the algebraic solutions of $c(t)$ wrt $t$ and append that to the ode or write an additional function `ce(sol, p, t)` which takes the solution of the ode and returns the concentrations of $e(t)$ and $c(t)$



1. Simulate the three dynamic systems with parameters $(k_1 = 0.1)$, $(k_{-1} = 0.1)$, and $(k_2 = 0.1)$. 
    Let the initial concentrations be $(e(0) = 10)$, $(c(0) = p(0) = 0)$, and $(s(0) = 10, 20, 50, 75, 100, 500)$. 
1. Take a closer look at the initial time frame of the full system implemented by mass-action kinetics. What do you observe?
1. Have a look at the dynamics of all implementations in phase space $(s)$ vs. $(c)$.


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