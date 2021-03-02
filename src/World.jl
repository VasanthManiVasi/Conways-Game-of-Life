mutable struct WorldState
    max_days::Int
    current_state::Array
end

include("Rules.jl")

function WorldState(;
    max_days::Int = 100,
    initial_state::Array = default_state(),
)
    world_size = size(initial_state)
    if length(world_size) != 2
        error("The world is not 2 dimensional")
    elseif world_size[1] < 3 || world_size[2] < 3
        error("The world is too small (less than 3x3)")
    elseif state_check(initial_state) == false
        error("The cells do not have a binary state (0 or 1)")
    end
    WorldState(max_days, initial_state)
end

function state_check(initial_state)
    for i in initial_state
        if i ∉ [0, 1]
            return false
        end
    end
    return true
end

function default_state()
    A = fill(0, 128, 128)
    A[61:63, 61:63] = [
        1 1 0
        0 1 1
        0 1 0
    ]
    return A
end

Base.length(world::WorldState) = world.max_days

function Base.iterate(world::WorldState, state = 0)
    if state > world.max_days
        return nothing
    end
    world.current_state = next(world.current_state)
    world, state + 1
end