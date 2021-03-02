using GameOfLife
using Test

@testset "GameOfLife.jl" begin
    include("rules.jl")
    include("world.jl")
end
