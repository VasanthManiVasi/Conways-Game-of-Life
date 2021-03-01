include("GameOfLife.jl")

using .GameOfLife, BenchmarkTools, Plots

gr()
function default_state()
    A = fill(0, 128, 128)
    A[61:63,61:63] = [1 1 0
                      0 1 1
                      0 1 0]
    return A
end

function simulate(A = default_state())
    for i in 1:100
        A = life(A)
        display(plot(gray_img(A)))
        sleep(0.5)
    end
end
simulate()
