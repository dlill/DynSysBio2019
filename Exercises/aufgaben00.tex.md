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







[Illustration of Newton’s method](https://en.wikipedia.org/wiki/Newton's_method#/media/File:NewtonIteration_Ani.gif)
