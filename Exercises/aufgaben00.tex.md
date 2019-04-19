# Tutorial 0

## Exercise 1 - Installation

* Go to [Github.com](https://www.github.com) and open an account
* Install [JuliaPro](https://juliacomputing.com/products/juliapro.html) by following the steps below.

1. Open a terminal and execute the following commands. Pasting works with Ctrl+Shift+V

    ```
    cd
    git clone https://github.com/dlill/DynSysBio2019
    ```

1. Open a terminal and either copy-paste the commands in install.sh or
run install.sh by navigating to the folder containing install.sh and run

    ```
    ./install.sh
    ```

    Follow the instructions given during the installation.
    Unfortunately, we cannot use Julia in another way on the Cip-pools, since this would require updating the Cip-pool computers.

* Launch JuliaPro by executing the following command in a terminal

    ```
    ~/JuliaPro/JuliaPro-1.0.3.1/Launch_JuliaPro & exit
    ```

Have a quick look at `~/DynSysBio2019/Examples/FirstSteps.jl`

## Exercise 2 - Getting to know Julia

In your home-folder, create a new folder `~/DynSysBio2019_programming`.
In Atom, create a new file "~/DynSysBio2019_programming/tutorial0.jl" and solve the following questions in this script.

1. Create a 3x3 matrix $ A = \begin{pmatrix}1&2&3\\4&5&6\\7&8&9\end{pmatrix}$
1. Multiply each element of `A` by 2
1. Create a 3x3 matrix $ B = \begin{pmatrix}1&4&7\\2&5&8\\3&6&9\end{pmatrix}$
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
\dot{x} = f(x,\vec{p}) = p_1 x \left( 1-\frac{x}{p2} \right)
$$

find the points $\bar{x}$ where $\dot{x}=0$, numerically.

* Write one function `vh_ode(x, p)` and one function `vh_ode_jacobian(x,p)` returning $\f(x,\vec{p})$ and $f'(x,\vec{p})$, respectively.
* Implement the newton method $x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}$ in a function `newton_solve(x0, p; prec = 1e-8)` with initial value `x0`, parameter vector `p` and precision `prec`.
    Stop the iterations when $|x_{n+1}−x_n| < prec$ is reached.
* Test the newton steady-state solver with different starting values `x0` for different parameter sets.
    * Compare the results to the analytic solution

[Illustration of Newton’s method](https://en.wikipedia.org/wiki/Newton's_method#/media/File:NewtonIteration_Ani.gif)
