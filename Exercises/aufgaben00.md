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
In Atom, create a new file "tutorial0.jl" and solve the following questions in this script.


1. Create a 3x3 matrix `A`
``\alpha`` <img src="/Exercises/tex/8217ed3c32a785f0b5aad4055f432ad8.svg?invert_in_darkmode&sanitize=true" align=middle width=10.16555099999999pt height=22.831056599999986pt/>

$<img src="/Exercises/tex/811faa13eba25cc2006465941349e99a.svg?invert_in_darkmode&sanitize=true" align=middle width=49.79120189999999pt height=45.84475500000001pt/>ksjdfh$



``left(<p align="center"><img src="/Exercises/tex/06bee61a8d87a92667e68c312e0016bc.svg?invert_in_darkmode&sanitize=true" align=middle width=8.21920935pt height=148.67579924999998pt/></p>\right)``
1. Multiply each element of A by 2
    1. Solve this question twice, once with for loops, once with .
1. Divide the elements element-wise by Matrix B.
1. Replace all entries A==5 by A = 0
1. Create a 3x3 Identity Matrix by Matrix-multiplying A with its inverse.



## Exercise 3

* Goals of the exercise:
    * Learn simple Julia functions
    * Write the Verhulst ODE as function which takes as input a *state* and *parameters*
    * Own implementation of the Newton method to solve for roots.

1. Write a function vh_ode(x, p) which evaluates the Verhulst-ODE


1. Write a function newton_solve(x0, prec, p) with initial value x0 and precision prec. Stop the iterations when |xn+1−xn|< prec is reached.
1. Test the newton steady-state solver with different parameter settings.
