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
    * Try to avoid that
* ODEs: Sensitivity Equations 
    * Reason: Integrator algorithms choose their step sizes according to the problem to minimize the numerical integration error
        * Different parameters -> different step sizes -> different errors -> with finite differences this leads to catastrophic errors and your derivs will be just rubbish
    * Idea: Just integrate the derivatives along with the ode itself:
    * Usually much more efficient, since you can take advantage of sparsity
    * In DifferentialEquations.jl: `ODELocalSensitivityProblem`
<p align="center"><img src="/Exercises/tex/9276faed150d6f6ac2beac56406116fb.svg?invert_in_darkmode&sanitize=true" align=middle width=160.47149745pt height=77.39588504999999pt/></p>

* Finite differences 
    * Difference quotient with finite $ h $ 
    * Higher order derivatives possible by iterative derivation, e.g. https://en.wikipedia.org/wiki/Discrete_Laplace_operator and https://github.com/JuliaDiffEq/DiffEqOperators.jl
    * They are ok for quick checks or as last resort, but better avoid them in "real problems"
    * `FDM.jl` for some more sophisticated implementations
<p align="center"><img src="/Exercises/tex/ac1b3fcca7cc8b9f72520503e50eec28.svg?invert_in_darkmode&sanitize=true" align=middle width=229.59840585pt height=34.7253258pt/></p>

* Complex-step derivatives
    * Are like finite-differences but with the advantage that there is no truncation error
    * https://en.wikipedia.org/wiki/Numerical_differentiation#Complex-variable_methods 

* Adjoint sensitivities 
    * For problems consisting of scalar valued function `obj(x(p))` + constraint `constr(x,p) = 0`
    * obtain gradient of f without calculating the model sensitivities themselves
    * Best for systems with many parameters
    * More here https://cs.stanford.edu/~ambrad/adjoint_tutorial.pdf


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

-   You can copy the following code:


````julia

function enzyme_ode!(du, u, p, t)
    S1, S2, S3, P = u
    S, v0,  v1, v2,  v3, K0, K1, K2, K3 = p 

    dS1 = v0*S /(K0 + S ) - v1*S1/(K1 + S1)
    dS2 = v1*S1/(K1 + S1) - v2*S2/(K2 + S2)
    dS3 = v2*S2/(K2 + S2) - v3*S3/(K3 + S3)
    dP  = v3*S3/(K3 + S3)
    
    du[:] = [dS1, dS2, dS3, dP]
end

u0 = zeros(4) #[S1, S2, S3, P]
p = [1 0.1 1 0.1 5 0.1 1 1 5] #[S, v0, K0, v1, K1, v2, K2, v3, K3]

tspan = (0., 100.)
prb = ODEProblem(enzyme_ode!, u0, tspan, p)
sol = solve(prb)

plot(sol)
````




-   Determine the steady state concentrations <img src="/Exercises/tex/035338c566fdee799fc39fd257ec8ac9.svg?invert_in_darkmode&sanitize=true" align=middle width=41.39273984999999pt height=22.465723500000017pt/> and <img src="/Exercises/tex/c68ef56934194a9ec1b74723b82e220e.svg?invert_in_darkmode&sanitize=true" align=middle width=16.632471899999988pt height=22.465723500000017pt/> and the steady state flux <img src="/Exercises/tex/b811e700d37f07c3be5c655875ceb7a3.svg?invert_in_darkmode&sanitize=true" align=middle width=45.450756449999986pt height=30.267491100000004pt/> by simulating the system for long time periods.




- Have a look at the function `SteadyStateProblem` and use it to
  calculate the steady state concentrations of the enzymes <img src="/Exercises/tex/264fba1c7ab2f0bc1611dac6780708a6.svg?invert_in_darkmode&sanitize=true" align=middle width=16.632471899999988pt height=22.465723500000017pt/>, <img src="/Exercises/tex/7684afeaf2968f03abc32b7d309d9ff2.svg?invert_in_darkmode&sanitize=true" align=middle width=16.632471899999988pt height=22.465723500000017pt/> and <img src="/Exercises/tex/e7169a2e6327a4bcd8ca4eb4a4ed9056.svg?invert_in_darkmode&sanitize=true" align=middle width=16.632471899999988pt height=22.465723500000017pt/> without simulating the system
  How does this work i.e. what's the math behind it (think back to the very first tutorial)?




- Use the steady-state solution of the substrates to calculate the flux




- One at a time, increase each parameter by 10% and evaluate its effect on <img src="/Exercises/tex/51f9b2aca768c5ee7f18b00ee38be8dc.svg?invert_in_darkmode&sanitize=true" align=middle width=34.66892384999999pt height=22.831056599999986pt/>


-   Calculate the control coefficients <img src="/Exercises/tex/7a2fd94fad05d47d3b51a2ed6732827b.svg?invert_in_darkmode&sanitize=true" align=middle width=72.5650233pt height=32.85834419999999pt/> and <img src="/Exercises/tex/fb3dee2285d6e0d0f04aed56a3f2cd0f.svg?invert_in_darkmode&sanitize=true" align=middle width=37.5797829pt height=30.648287999999997pt/> using `ForwardDiff.jl`.
    * Look at: http://docs.juliadiffeq.org/latest/analysis/sensitivity.html#Examples-using-ForwardDiff.jl-1




- Plot the control coefficients: Which parameters have the highest control over which variables? 






# Homework

* Implement the control coefficients with finite differences, evaluate the control coefficients for different `h = 10. .^ [-16:0;]`, determine the order magnitude of `h` where it becomes numericall instable.

Cathedral exercise:
-------------------

Why is the cathedral tower at the bottom foursided while being octagonal
at the top?
