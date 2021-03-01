module World
export World

using .Rules

mutable struct World
    max_days::Int
    current_state::Array
    function World(;max_days = 0, initial_state = default_state())
        world_size = size(initial_state)
        if length(world_size) != 2
            throw("The world is not 2 dimensional")
        elseif world_size[0] < 3 || world_size[1] < 3
            throw("The world is too small (less than 3x3)")
        elseif state_check(initial_state) == false
            throw("The cells do not have a binary state (0 or 1)")
        end
        World(max_days, initial_state, zeros(size(initial_state)))
    end
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
    A[61:63,61:63] = [1 1 0
                      0 1 1
                      0 1 0]
    return A
end

Base.length(world::World) = world.max_days

Base.iterate(world::World, state = 0)
    if state > world.max_days
        nothing
    end
    world.current_state = next(world.current_state)
    world, state + 1
end
