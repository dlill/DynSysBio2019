Dynamical Systems in Biology 
============================


Exercise 1: Enzyme dynamics
---------------------------

Implement the enzyme reaction

<p align="center"><img src="/Exercises/tex/644ba0cb77827ea9d31067fe78716642.svg?invert_in_darkmode&sanitize=true" align=middle width=173.5165806pt height=46.36403144999999pt/></p>

-   using mass action kinetics:

<p align="center"><img src="/Exercises/tex/2fc364363cc0e00b0c87d35e2bcf4b95.svg?invert_in_darkmode&sanitize=true" align=middle width=199.3163667pt height=88.58448225pt/></p>

-   using the steady-state approximation:

<p align="center"><img src="/Exercises/tex/b0f0f0db712aa54827dc372f81c285b4.svg?invert_in_darkmode&sanitize=true" align=middle width=121.43728574999999pt height=24.0502977pt/></p>

-   using the quasi-steady state approximation:

<p align="center"><img src="/Exercises/tex/b40429c7f93b1f128c51c43df481066c.svg?invert_in_darkmode&sanitize=true" align=middle width=257.91534944999995pt height=86.99391689999999pt/></p>

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

