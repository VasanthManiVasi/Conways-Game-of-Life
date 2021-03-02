module GameOfLife
export simulate, WorldState

include("World.jl")

using Plots, Images
gr()

function simulate(;max_days::Int = 100, initial_state::Array = GameOfLife.default_state(), speed::Int = 90)
    if !(0 < speed < 101)
        throw("speed must be between 1 to 100")
    end

    world = WorldState(max_days, initial_state)
    for (days, generation) in zip(world, 1:max_days)
        p = plot(Gray.(world.current_state .== 0), framestyle = :none)
        title!(string("Generation ", generation))
        display(p)
        sleep(1 - (speed * 0.01))
    end
end

end
