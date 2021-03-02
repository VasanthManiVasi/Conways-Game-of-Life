# GameOfLife

This is a package for simulating the cellular automaton [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) in Julia.

# Installation

```julia
using Pkg
Pkg.add("https://github.com/VasanthManiVasi/Conways-Game-of-Life")
Pkg.test("GameOfLife")
```

# Example
```julia
using GameOfLife

# Using the default world state
simulate(max_days = 100, speed = 80)

# Using a pre-defined world state
A = rand(0:1, 100, 100)
simulate(max_days = 150, speed = 80, initial_state = A)
```