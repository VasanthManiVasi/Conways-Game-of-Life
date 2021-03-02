module GameOfLife
export simulate, WorldState

include("World.jl")

using Plots, Images
gr()

function simulate(world = WorldState())
    for days in world
        display(plot(Gray.(world.current_state)))
        sleep(0.25)
    end
end

end
