# Tutorial 0

## Exercise 1 - Installation

* Go to [Github.com] and open an account

* Install [JuliaPro](https://juliacomputing.com/products/juliapro.html) by following the steps below.
1. Open a terminal and execute the following command. Pasting works with Ctrl+Shift+V

    ```
    git clone https://github.com/dlill/DynSysBio2019
    ```

1. Open a terminal and either copy-paste the commands in install.sh or
run install.sh by navigating to the folder containing install.sh and run

    ```
    ./install.sh
    ```

    Follow the instructions given during the installation.
    Unfortunately, we cannot use Julia in another way on the Cip-pools, since this would require updating the Cip-pool computers.


## Exercise 2 - Getting to know Julia

In your home-folder, create a new folder `DynSysBio2019_programming` and create the file tutorial0.jl.
Solve the following questions in the script.
You can get inspiration from `DynSysBio2019/Examples/FirstSteps.jl`


1. Create a 3x3 matrix A with entries 1:9
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
