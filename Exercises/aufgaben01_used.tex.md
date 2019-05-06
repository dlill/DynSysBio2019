# Tutorial 1

Update the exercises-folder by running

```
cd DynSysBio2019
git pull
```

## Exercise 5: Lotka-Volterra
--------------------------

The ODEs of the Lotka-Volterra model $$ \dot{\vec x} = f( \vec x) $$ are given by:
$$ \dot x(t) = a \cdot x(t) - b \cdot x(t) \cdot y(t), $$
$$ \dot y(t) = c \cdot x(t) \cdot y(t) - d \cdot y(t), $$
where all parameters $$ (a,b,c,d) \element \mathbb{R}^4_+ $$ are positive.

-   Write a 'function euler(ini, pars, dt, tmax)`
    integrating the LV system via the Euler method for a set of initial
    values `ini`, parameters `pars`, stepsize `dt` for $$ t \element [0,tmax] $$.
    The function should return the variables `time, x, y`. *Reminder Euler:*
    $$ \vec x_{n+1} = \vec x_n + f(\vec x_n) \cdot dt $$.

-   Plot solutions of the LV system using in configuration
    and phase space for a = 2/3, b =
    4/30, c = 1/10, d = 1 and a set of initial values $$ (x(t=0),
    y(t=0)) = {(10,15), (15,10)}.
-   Add a noise term to the euler integration:$$ \vec x_{n+1} = \vec x_n +
    f(\vec x_n) \cdot dt + \epsilon \cdot \sqrt{dt}$$ with $$epsilon \prop \mathbb{N}(0, sd).
    Use `sd = [sdx, sdy]` as additional argument of your
    euler function and avoid $$ x_n < 0$$. Compare
    the solutions obtained with `sd = [.3, .3]` to the standard
    solutions without noise by plotting.



## Exercise 6: Lotka-Volterra extended
-----------------------------------

The LV system can be extended to:
$$ \dot x(t) = a \cdot x(t) \cdot \left(1- \frac{x(t)}{K} \right)) - b \cdot \frac{x(t)}{x(t) +S} \cdot y(t), $$
$$ \dot y(t) = c \cdot \frac{x(t)}{x(t) +S} \cdot y(t) - d \cdot y(t), $$
where also K and S are positive parameters.

-   Repeat Exercise 1 for the extended equations using $$a = b = c = 1; d=\frac{1}{3}; K
    = 30, S=10 and (x(0),y(0)) = {(1,1), (10,10)}.

-   Interpret the extended system:
    -   What is the meaning of the parameters?
    -   What are the qualitative differences of both systems?
    -   Compare how the noise affects both systems.



## Cathedral exercise

The choir of the cathedral is slightly inclined relative to the main
nave. Why?
