Dynamical Systems in Biology 
============================


Exercise 1: Enzyme dynamics
---------------------------

Implement the enzyme reaction

<p align="center"><img src="/Exercises/tex/c38885ec45bf63269c81696288aaa25d.svg?invert_in_darkmode&sanitize=true" align=middle width=173.5165806pt height=46.36403144999999pt/></p>

-   using mass action kinetics:

<p align="center"><img src="/Exercises/tex/466d85097a62a50d7c9736a1915ff11b.svg?invert_in_darkmode&sanitize=true" align=middle width=199.3163667pt height=88.58448225pt/></p>

-   using the steady-state approximation:

<p align="center"><img src="/Exercises/tex/0003a35ac7c214f8817aa09aa317a052.svg?invert_in_darkmode&sanitize=true" align=middle width=170.2953417pt height=90.74722635pt/></p>

-   using the quasi-steady state approximation:

<p align="center"><img src="/Exercises/tex/a9cf4a99e2edbda23731b1046a0a893f.svg?invert_in_darkmode&sanitize=true" align=middle width=257.91534944999995pt height=86.99391689999999pt/></p>

-   Simulate the three dynamic systems with parameters <img src="/Exercises/tex/6ee47948e50771f7cae925c3c31e015e.svg?invert_in_darkmode&sanitize=true" align=middle width=71.64004319999998pt height=24.65753399999998pt/>, $(k_{-1} = 0.1)$, and $(k_2 =
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

