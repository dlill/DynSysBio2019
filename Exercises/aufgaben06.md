# Tutorial 6

A short note on derivatives in scientific programming
---------------------------

* Derivatives are very important for a lot things
    * Efficient optimization
    * Sensitivity analysis
    * Today: Control theory

**Ways to obtain derivatives**

* Code them manually
    * Possible for simple cases, potentially also automizable through computer algebra systems (Mathematica, sympy, yacas)
* ODEs: Sensitivity Equations 
    * Reason: Integrator algorithms choose their step sizes according to the problem to minimize the numerical integration error
        * Different parameters -> different step sizes -> different errors -> with finite differences this leads to catastrophic errors and your derivs will be just rubbish
    * Idea: Just integrate the derivatives along with the ode itself:
    * Usually much more efficient, since you can take advantage of sparsity
    * In DifferentialEquations.jl: `ODELocalSensitivityProblem`

<p align="center"><img src="/Exercises/tex/a11fcc1aa25c105b3a07810f15617249.svg?invert_in_darkmode&sanitize=true" align=middle width=142.03428195pt height=65.73130739999999pt/></p>

* Finite differences 
    * Difference quotient with finite $h$
    * Higher order derivatives possible by iterative derivation, e.g. https://en.wikipedia.org/wiki/Discrete_Laplace_operator and https://github.com/JuliaDiffEq/DiffEqOperators.jl
    * They are ok for quick checks or as last resort, but better avoid them in "real problems"
    * `FDM.jl` for some more sophisticated implementations
* Complex-step derivatives
    * Are like finite-differences but with the advantage that there is no truncation error
    * https://en.wikipedia.org/wiki/Numerical_differentiation#Complex-variable_methods 
* Adjoint sensitivities: For scalar valued functions, very efficient for systems with many parameters
    * More here
* Algorithmic / automatic differentiation
    * Let the programming language do the work
    * Idea: Propagate derivatives through the function via chain rule
    * Good example on https://en.wikipedia.org/wiki/Automatic_differentiation
    * Very efficient for some problems and very convenient
    * Drawback: Implementation easiest if all functions are implemented in the same language
    * This is ** *the* ** reason why to use julia.


Exercise 1: Enzyme reaction chain
---------------------------------

Consider a chain of Michaelis-Menten enzyme reactions:

<p align="center"><img src="/Exercises/tex/cb81c9ae79e19d25fea0ece6e70c9e36.svg?invert_in_darkmode&sanitize=true" align=middle width=218.6926962pt height=19.82989635pt/></p>

for a constant concentration <img src="/Exercises/tex/d84206481777e6d1fdc67afe1b978c8a.svg?invert_in_darkmode&sanitize=true" align=middle width=41.16422309999999pt height=22.465723500000017pt/> and given
<img src="/Exercises/tex/4b0719fa448d72b968514a8038e45187.svg?invert_in_darkmode&sanitize=true" align=middle width=35.838656699999994pt height=22.465723500000017pt/> and <img src="/Exercises/tex/7ff9f34d88375649140a54d0ec53587e.svg?invert_in_darkmode&sanitize=true" align=middle width=27.730668899999987pt height=22.465723500000017pt/>
values:

<p align="center"><img src="/Exercises/tex/d856cc10e234c8ef56d3dc1e20709aa6.svg?invert_in_darkmode&sanitize=true" align=middle width=101.16059249999999pt height=112.32872805pt/></p>

-   Implement the system and plot the solution in config-space.





-   Determine the steady state concentrations <img src="/Exercises/tex/035338c566fdee799fc39fd257ec8ac9.svg?invert_in_darkmode&sanitize=true" align=middle width=41.39273984999999pt height=22.465723500000017pt/> and <img src="/Exercises/tex/c68ef56934194a9ec1b74723b82e220e.svg?invert_in_darkmode&sanitize=true" align=middle width=16.632471899999988pt height=22.465723500000017pt/> and the steady state flux
    $J$ by simulating the system for long time periods.




- Have a look at the function `SteadyStateProblem` and use it to
  calculate the steady state concentrations of the enzymes <img src="/Exercises/tex/264fba1c7ab2f0bc1611dac6780708a6.svg?invert_in_darkmode&sanitize=true" align=middle width=16.632471899999988pt height=22.465723500000017pt/>, <img src="/Exercises/tex/7684afeaf2968f03abc32b7d309d9ff2.svg?invert_in_darkmode&sanitize=true" align=middle width=16.632471899999988pt height=22.465723500000017pt/> and <img src="/Exercises/tex/e7169a2e6327a4bcd8ca4eb4a4ed9056.svg?invert_in_darkmode&sanitize=true" align=middle width=16.632471899999988pt height=22.465723500000017pt/>.
  How do you think it works i.e. what's the math behind it (think back to the very first tutorial)?




- Use the solution to calculate the flux




-   Calculate the control coefficients <img src="/Exercises/tex/7a2fd94fad05d47d3b51a2ed6732827b.svg?invert_in_darkmode&sanitize=true" align=middle width=72.5650233pt height=32.85834419999999pt/> and <img src="/Exercises/tex/fb3dee2285d6e0d0f04aed56a3f2cd0f.svg?invert_in_darkmode&sanitize=true" align=middle width=37.5797829pt height=30.648287999999997pt/> using `ForwardDiff.jl`.
    * Hint: http://docs.juliadiffeq.org/latest/analysis/sensitivity.html#Examples-using-ForwardDiff.jl-1




- Plot the control coefficients: Which parameters have the highest control over which variables?






# Homework

- Run the following system with the Euler method and use a custom finite difference function to obtain the parameter derivatives for different sizes of <img src="/Exercises/tex/67b12e5154d85faf7bd6f256f2eebdaa.svg?invert_in_darkmode&sanitize=true" align=middle width=21.969238499999992pt height=22.465723500000017pt/>
- Then, implement the sensitivity equations for f! and compare the results




Cathedral exercise:
-------------------

Why is the cathedral tower at the bottom foursided while being octagonal
at the top?
