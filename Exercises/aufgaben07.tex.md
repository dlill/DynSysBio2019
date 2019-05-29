Dynamical Systems in Biology 
============================


Exercise 1: Enzyme dynamics
---------------------------

Implement the enzyme reaction

$$ \begin{align*} 
S + E 
{{k_{ {\scriptscriptstyle}1} \atop \longrightarrow} \atop {\longleftarrow \atop k_{{\scriptscriptstyle}-1}}} 
C \stackrel{k_{2}}{\longrightarrow} 
P + E. 
\end{align*} $$

-   using mass action kinetics:

$$ \begin{align} 
\dot{s} & = k_{{\scriptscriptstyle}-1} \cdot c - k_{{\scriptscriptstyle}1} s \cdot e \\ 
\dot{e} & = (k_{{\scriptscriptstyle}-1} + k_{{\scriptscriptstyle}2}) \cdot c - k_{{\scriptscriptstyle}1} \cdot s \cdot e \\ 
\dot{c} & = k_{{\scriptscriptstyle}1} \cdot s \cdot e - (k_{{\scriptscriptstyle}-1} + k_{{\scriptscriptstyle}2}) \cdot c \\ 
\dot{p} & = k_{{\scriptscriptstyle}2} \cdot c, 
\end{align}
$$

-   using the steady-state approximation:

$$ 
\begin{align} 
\dot{s} & = - \dot{p} = -\frac{k_{{\scriptscriptstyle}2} \mathrm{e}_{{\scriptscriptstyle}T}\cdot s}{\frac{k_{{\scriptscriptstyle}-1}}{k_{\scriptscriptstyle}1}} + s} \\ 
c & = \frac{\mathrm{e}_{{\scriptscriptstyle}T} \cdot s}{\frac{k_{{\scriptscriptstyle}-1}}{k_{{\scriptscriptstyle}1}} + s}. 
\end{align} 
$$

-   using the quasi-steady state approximation:

$$ 
\begin{align} 
\dot{s} & = - \dot{p} = - \frac{k_{{\scriptscriptstyle}2} \mathrm{e}_{{\scriptscriptstyle}T} \cdot s}{\frac{k_{{\scriptscriptstyle}-1}}{k_{{\scriptscriptstyle}1}} + s} \\ 
c & = \frac{\mathrm{e}_{{\scriptscriptstyle}T} \cdot s}{K_{{\scriptscriptstyle}m} + s} \quad \text{mit} \quad K_{{\scriptscriptstyle}m} = \frac{k_{{\scriptscriptstyle}-1} + k_{{\scriptscriptstyle}2}}{k_{{\scriptscriptstyle}1}} 
\end{align}
$$

-   Simulate the three dynamic systems with parameters $(k_1 =
    0.1)$, $(k_{-1} = 0.1)$, and $(k_2 =
    0.1)$. Let the initial concentrations be $(e(0) =
    10)$, $(c(0) = 0)$, and $(s(0) = 10, 20, ...,
    100)$. *Hint: The return value of the ODE function is a
    list, the first entry being the derivatives. The list may contain
    more named elements, e.g., to return values of algebraic expressions
    of the ODE states and parameters.*

-   Take a closer look at the initial time frame of the full system
    implemented by mass-action kinetics. What do you observe?

-   Have a look at the dynamics of all implementations in phase space
    $(s)$ vs. $(c)$.


Cathedral exercise:
-------------------

On the historic depiction of the cathedral on a control box in front of
the Hof-Apotheke, corner KaJo / Münsterstrasse, one can see that four
steps lead to the main portal of the minster. Why is it only one today?

