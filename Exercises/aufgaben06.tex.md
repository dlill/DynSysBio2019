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

$$
\begin{aligned}
\dot{u} &= f(u,p) \\
\dot{\frac{\partial u}{\partial p}} = \partial_u f \partial_p x + \partial_p f
\end{aligned}
$$

    * Usually much more efficient, since you can take advantage of sparsity
    * In DifferentialEquations.jl: `ODELocalSensitivityProblem`
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
* Algorithmic differention / automatic differentiation / autodiff 
    * Let the programming language do the work
        * Idea: Propagate derivatives through the function via chain rule
    * Good example on wikipedia
    * Very efficient for some problems and very convenient
    * Drawback: Implementation easiest if all functions are implemented in the same language
        * This is ** *the* ** reason why to use julia.



Exercise 1: Enzyme reaction chain
---------------------------------

Consider a chain of Michaelis-Menten enzyme reactions:

$$ S \stackrel{E_{1}}{\longrightarrow} S_{1}
\stackrel{E_{2}}{\longrightarrow} S_{2}
\stackrel{E_{3}}{\longrightarrow} S_{3}
\stackrel{E_{4}}{\longrightarrow} P 
$$

for a constant concentration $S=1$ and given
$V_{max}$ and $K_{M}$
values:

$$ 
\begin{align\*} 
      &V_{max} &  K_{M} \\ 
E_{1} &0.1 & 0.1 \\ 
E_{2} &1.0 & 1.0 \\ 
E_{3} &1.0 & 0.1 \\ 
E_{4} &5.0 & 5.0 \\ 
\end{align\*}
$$

-   Implement the system and plot the solution in config-space.



-   Determine the steady state concentrations $S_{1}, S_{2}$ and $S_{3}$ and the steady state flux
    $J$ by simulating the system for long time periods.




- Have a look at the function `SteadyStateProblem` and use it to
  calculate the steady state concentrations of the enzymes $S_1$, $S_2$ and $S_3$.
  How do you think it works i.e. what's the math behind it (think back to the very first tutorial)?



- Use the solution to calculate the flux



# [] could be solved with Interactive.jl but drop this here?
-   Evaluate the steady state concentrations and flux by varying the
    $V_{{max}}$ values. Use the `manipulate`
    package for an interactive visualization and plot the original
    values along.

-   Calculate the control coefficients $\frac{\partial \log S_{steady}{\partial \log p}$ and $\frac{\partial \log J}{\partial \log p}$ using `ForwardDiff.jl`.
    * Hint: http://docs.juliadiffeq.org/latest/analysis/sensitivity.html#Examples-using-ForwardDiff.jl-1

# [] Implement using ForwardDiff.jl


- Plot the control coefficients: Which parameters have the highest control over which variables?






# Homework

- Run the following system with the Euler method and use a custom finite difference function to obtain the parameter derivatives for different sizes of $\Delta p$
- Then, implement the sensitivity equations for f! and compare the results





Cathedral exercise:
-------------------

Why is the cathedral tower at the bottom foursided while being octagonal
at the top?