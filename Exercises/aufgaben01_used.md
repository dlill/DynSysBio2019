# Tutorial 1

If you use git: Update the exercises-folder by running

```
cd DynSysBio2019
git pull
```

## Exercise 5: Lotka-Volterra
--------------------------

The ODEs of the Lotka-Volterra model <p align="center"><img src="/Exercises/tex/8bcc0f5c2ef0a9448134c41aa890d8bd.svg?invert_in_darkmode&sanitize=true" align=middle width=63.5301579pt height=19.754775149999997pt/></p> are given by:
<p align="center"><img src="/Exercises/tex/98d8bbc57f7059f7685d1b48902d6c60.svg?invert_in_darkmode&sanitize=true" align=middle width=209.65521225pt height=16.438356pt/></p>
<p align="center"><img src="/Exercises/tex/55fc8c73dd9f3ccf1c01c4a9c5e11474.svg?invert_in_darkmode&sanitize=true" align=middle width=208.0894827pt height=16.438356pt/></p>
where all parameters <p align="center"><img src="/Exercises/tex/9900db81b613fdfaf9d965044e507557.svg?invert_in_darkmode&sanitize=true" align=middle width=88.08035445pt height=19.6365114pt/></p> are positive.

-   Write a 'function euler(ini, pars, dt, tmax)`
    integrating the LV system via the Euler method for a set of initial
    values `ini`, parameters `pars`, stepsize `dt` for $$ t \element [0,tmax] $$.
    The function should return the variables `time, x, y`. *Reminder Euler:*
    $$ \vec x_{n+1} = \vec x_n + f(\vec x_n) \cdot dt $$.

-   Plot solutions of the LV system using in configuration
    and phase space for a = 2/3, b =
    4/30, c = 1/10, d = 1 and a set of initial values $$ (x(t=0),
    y(t=0)) = {(10,15), (15,10)}.
-   Add a noise term to the euler integration:<p align="center"><img src="/Exercises/tex/e62b3adc3fe3642314f58d0e66a7745e.svg?invert_in_darkmode&sanitize=true" align=middle width=229.69435664999997pt height=19.57873335pt/></p> with $$epsilon \prop \mathbb{N}(0, sd).
    Use `sd = [sdx, sdy]` as additional argument of your
    euler function and avoid $$ x_n < 0$$. Compare
    the solutions obtained with `sd = [.3, .3]` to the standard
    solutions without noise by plotting.



## Exercise 6: Lotka-Volterra extended
-----------------------------------

The LV system can be extended to:
<p align="center"><img src="/Exercises/tex/8571fce56d0ac4c0abebdfda7e67f37e.svg?invert_in_darkmode&sanitize=true" align=middle width=347.55668805pt height=39.452455349999994pt/></p>
<p align="center"><img src="/Exercises/tex/dcec65e3d2a2aa99b8f4e84e14e28f77.svg?invert_in_darkmode&sanitize=true" align=middle width=243.15317895pt height=38.83491479999999pt/></p>
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
