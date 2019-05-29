Dynamical Systems in Biology 
============================


Exercise 1: Enzyme dynamics
---------------------------

Implement the enzyme reaction

<p align="center"><img src="/Exercises/tex/ebbb92b4fc654e56924c810ec5759384.svg?invert_in_darkmode&sanitize=true" align=middle width=173.5165806pt height=46.36403144999999pt/></p>

-   using mass action kinetics:

<p align="center"><img src="/Exercises/tex/f18680f89433340961ebba8cf3aa58dd.svg?invert_in_darkmode&sanitize=true" align=middle width=199.3163667pt height=88.58448225pt/></p>






-   using the steady-state approximation:

<p align="center"><img src="/Exercises/tex/2ad00bf15ed38c11695f1224a4b8dd61.svg?invert_in_darkmode&sanitize=true" align=middle width=170.64354285pt height=113.59650719999999pt/></p>



-   using the quasi-steady state approximation:

<p align="center"><img src="/Exercises/tex/d187460ee5a9dcabd2f36bf6724364cf.svg?invert_in_darkmode&sanitize=true" align=middle width=252.24619365pt height=117.87457769999999pt/></p>




* To obtain time-courses of <img src="/Exercises/tex/3e18a4a28fdee1744e5e3f79d13b9ff6.svg?invert_in_darkmode&sanitize=true" align=middle width=7.11380504999999pt height=14.15524440000002pt/> and <img src="/Exercises/tex/8cd34385ed61aca950a6b06d09fb50ac.svg?invert_in_darkmode&sanitize=true" align=middle width=7.654137149999991pt height=14.15524440000002pt/>, you can either derive the algebraic solutions of <img src="/Exercises/tex/07ea40d17118bb2399c9a9bb5ecc5d66.svg?invert_in_darkmode&sanitize=true" align=middle width=25.83533534999999pt height=24.65753399999998pt/> wrt <img src="/Exercises/tex/4f4f4e395762a3af4575de74c019ebb5.svg?invert_in_darkmode&sanitize=true" align=middle width=5.936097749999991pt height=20.221802699999984pt/> and append that to the ode or write an additional function `ce(sol, p, t)` which takes the solution of the ode and returns the concentrations of <img src="/Exercises/tex/df334c035e4c5d094ae76b2c6f529f3c.svg?invert_in_darkmode&sanitize=true" align=middle width=26.37566909999999pt height=24.65753399999998pt/> and <img src="/Exercises/tex/07ea40d17118bb2399c9a9bb5ecc5d66.svg?invert_in_darkmode&sanitize=true" align=middle width=25.83533534999999pt height=24.65753399999998pt/>



1. Simulate the three dynamic systems with parameters <img src="/Exercises/tex/13f4a5e304e36b9bef73a21d70eda5ab.svg?invert_in_darkmode&sanitize=true" align=middle width=71.64004319999998pt height=24.65753399999998pt/>, <img src="/Exercises/tex/17f7bc0a246c0007404a5346ae28b839.svg?invert_in_darkmode&sanitize=true" align=middle width=81.91404044999999pt height=24.65753399999998pt/>, and <img src="/Exercises/tex/d4a645697d2f7de7f18500c8f4807ac4.svg?invert_in_darkmode&sanitize=true" align=middle width=71.64004319999998pt height=24.65753399999998pt/>. 
    Let the initial concentrations be $(e(0) = 10)$, $(c(0) = p(0) = 0)$, and $(s(0) = 10, 20, 50, 75, 100, 500)$. 
1. Take a closer look at the initial time frame of the full system implemented by mass-action kinetics. What do you observe?
1. Have a look at the dynamics of all implementations in phase space <img src="/Exercises/tex/04c429e9e93ade50366c838485173e34.svg?invert_in_darkmode&sanitize=true" align=middle width=20.49091274999999pt height=24.65753399999998pt/> vs. <img src="/Exercises/tex/bd972c06c10dc1121597b5779d02eb90.svg?invert_in_darkmode&sanitize=true" align=middle width=19.89923759999999pt height=24.65753399999998pt/>.


Exercise 2: Homework
---------------------------

![https://upload.wikimedia.org/wikipedia/commons/7/70/Lineweaver-Burke_plot.svg] \*

1. Using the implementation of the mass-action-kinetics ODE, create a *Lineweaver-Burk-Plot* and determine Vmax and Km from it. Substeps:
    * Simulate for different substrate concentrations
    * Determine the time range where product formation is linear.
    * In this time range, determine $V = \dot(p)$ and add it to the Lineweaver-Burk-Plot.
    




Cathedral exercise:
-------------------

On the historic depiction of the cathedral on a control box in front of
the Hof-Apotheke, corner KaJo / Münsterstrasse, one can see that four
steps lead to the main portal of the minster. Why is it only one today?


\* Pro bug catcher at the English Wikipedia \[CC BY-SA 3.0 \http://creativecommons.org/licenses/by-sa/3.0/\)\]