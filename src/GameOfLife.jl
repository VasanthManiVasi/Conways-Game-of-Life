module Game
include("World.jl")

using .World, BenchmarkTools, Plots, Images

gr()

function simulate(world = WorldState())
    for days in world
        display(plot(Gray.(world.current_state)))
        sleep(0.25)
    end
end

world = WorldState(max_days = 100)
simulate(world)
end
