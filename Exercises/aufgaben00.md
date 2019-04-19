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

1. Create a 3x3 matrix <img src="/Exercises/tex/5b4f8bcfe91b62204611205be29f473f.svg?invert_in_darkmode&sanitize=true" align=middle width=120.54794564999999pt height=67.39784699999998pt/>
1. Multiply each element of `A` by 2
1. Create a 3x3 matrix <img src="/Exercises/tex/a8f0d8389c6ebd93ef0e47b7ce074856.svg?invert_in_darkmode&sanitize=true" align=middle width=121.51255214999998pt height=67.39784699999998pt/>
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

<p align="center"><img src="/Exercises/tex/c55c49c2be5f67ef7b340d2eb1a55ef6.svg?invert_in_darkmode&sanitize=true" align=middle width=201.53053799999998pt height=39.452455349999994pt/></p>

find the points <img src="/Exercises/tex/33717a96ef162d4ca3780ca7d161f7ad.svg?invert_in_darkmode&sanitize=true" align=middle width=9.39498779999999pt height=18.666631500000015pt/> where <img src="/Exercises/tex/34c7b19072da69fdf4b1063f0d40084a.svg?invert_in_darkmode&sanitize=true" align=middle width=39.53180549999999pt height=21.95701200000001pt/>, numerically.

* Write one function `vh_ode(x, p)` and one function `vh_ode_jacobian(x,p)` returning <img src="/Exercises/tex/587651b88bc08f8a274f2a60f58dbd44.svg?invert_in_darkmode&sanitize=true" align=middle width=47.57426519999999pt height=24.65753399999998pt/> and <img src="/Exercises/tex/b7fa994adcc703965f9f8cdcb3e44bb5.svg?invert_in_darkmode&sanitize=true" align=middle width=52.18614059999998pt height=24.7161288pt/>, respectively.
* Implement the newton method <img src="/Exercises/tex/694692dbcc038e13ffe9257860f4c2e2.svg?invert_in_darkmode&sanitize=true" align=middle width=145.92777539999997pt height=33.20539859999999pt/> in a function `newton(x0, p; prec = 1e-8)` with initial value `x0`, parameter vector `p` and precision `prec`.
    Stop the iterations when $|x_{n+1}−x_n| < prec$ is reached.
* Test the newton steady-state solver with different starting values `x0` for different parameter sets.
    * Compare the results to the analytic solution

[Illustration of Newton’s method](https://en.wikipedia.org/wiki/Newton's_method#/media/File:NewtonIteration_Ani.gif)
