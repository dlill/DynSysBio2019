# Tutorial 0

## Exercise 1 - Installation

* Go to [Github.com](https://www.github.com) and register
* Install [JuliaPro](https://juliacomputing.com/products/juliapro.html): Open a terminal and execute the following commands

    ```
    cd
    git clone https://github.com/dlill/DynSysBio2019
    cd DynSysBio2019
    sh ./installJuliaPro.sh
    ```

    Follow the instructions given during the installation.

* Launch JuliaPro by executing the following command in a terminal

    ```
    ~/JuliaPro/JuliaPro-1.0.3.1/Launch_JuliaPro & exit
    ```

* Have a quick look at some examples in `~/DynSysBio2019/Examples/FirstSteps.jl`

## Exercise 2 - Getting to know Julia

Create a new folder `~/DynSysBio2019_programming`.
Create a new file `~/DynSysBio2019_programming/tutorial0.jl` to solve the following questions in this script.

1. Create a 3x3 matrix  $$ A = \begin{pmatrix}1&2&3 \\\\ 4&5&6 \\\\ 7&8&9\end{pmatrix} $$
1. Multiply each element of `A` by 2
1. Create a 3x3 matrix $$ B = \begin{pmatrix}1&4&7\\\\2&5&8\\\\3&6&9\end{pmatrix}$$
1. Divide `A` by `B` element-wise.
1. Replace all entries A==5 by A = 0
1. Create a 3x3 Identity Matrix by Matrix-multiplying `B` with its inverse.
1. Create a vector `v` containing the numbers 1 to 10
    1. By using `[...]`
    1. By using `collect`
    1. By using a `for`-loop
    1. By using a `while`-loop


## Exercise 3 - Newton method

Given the ODE for the Verhulst model

$$
\dot{x} = f(x,\vec{p}) = p_1 x \left( 1-\frac{x}{p_2} \right)
$$

find the points $\bar{x}$ where $\dot{x}=0$, numerically.

* Write one function `vh_ode(x, p)` and one function `vh_ode_jacobian(x,p)` returning $f(x,\vec{p})$ and $f'(x,\vec{p})$, respectively.
* Implement the newton method $x_{n+1} = x_n - \frac{f(x_n,\vec{p})}{f'(x_n,\vec{p})}$ in a function `newton(x0, p; prec = 1e-8)` with initial value `x0`, parameter vector `p` and precision `prec`.
    Stop the iterations when $|x_{n+1}−x_n| < prec$ is reached.
* Test the newton solver with different starting values $x0$ for different parameter sets $\vec{p}$.
    * Compare the results to the analytic solution

### Solution

````julia

# This is a comment, it is not evaluated when the code is executed.
# Use comments to explain why you are doing what you are doing.

# Question 1: What does giving a default value such as p = [1 1] mean?
# How does it affect the behaviour of the function when it is called?
# Question 2: What does the semicolon ";" before p = [1 1] mean?
#             Read https://docs.julialang.org/en/v1/manual/functions/index.html#Optional-Arguments-1
function vh_ode(x; p = [1 1])
    p[1]*x*(1-x/p[2])
end
function vh_ode_jacobian(x; p = [1 1])
    p[1]*((1-x/p[2]) - x/p[2])
end

# Test the two functions to be sure that it works
# Question: Do results make sense analytically?
vh_ode(1) # Calls with default parameters p = [1 1]
vh_ode(1, p = [2 2]) # Overwrite the default argument
vh_ode(2) # Call at a different x-value
# Question 3: why doesn't this line work? (related to Question 2)
vh_ode(1, [2 2])
vh_ode_jacobian(1)
vh_ode_jacobian(1, p = [2 2])
vh_ode_jacobian(2)

# Implement the newton method
# Question: What does prec = 1e-6 mean in this function? google "e notation"
function newton(x0, p = [1 1]; prec = 1e-6)

    x1 = x0 - vh_ode(x0,p = p)/vh_ode_jacobian(x0,p = p)
    x_vec = [x0, x1]

    # Question: What does push() do? -> Read the docs ?push
    # Question: What does !push() do? -> google "julialang push!"
    while abs(x_vec[length(x_vec)] - x_vec[length(x_vec)-1]) > prec
        x = last(x_vec)
        push!(x_vec, x-vh_ode(x, p = p)/vh_ode_jacobian(x,p = p))
    end

    return last(x_vec)
end

# Test the newton method
# Converging to the different optima, have a parameter set and initial conditions where it doesn't work
newton(10, [1 2])
newton(1.1,  [1, 2])
newton(0.9, [1, 2])
# Question: what's going wrong here?
newton(1, [1, 2])

# Lowering the precision gives worse results
newton(10, [1, 2], prec = 1)

# Question: Change the return value of newton() such that all intermediate steps x_vec are returned.
# Look at how long this vector (?length) becomes as you change prec from prec = 1e-12 to prec = 1,
#   choose some intermediate precisions as well.
````







[Illustration of Newton’s method](https://en.wikipedia.org/wiki/Newton's_method#/media/File:NewtonIteration_Ani.gif)
