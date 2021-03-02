using GameOfLife
using Test

@testset "world.jl" begin
    @test_nowarn WorldState()
    @test_nowarn WorldState(initial_state = rand(0:1, 10, 10))
    @test_nowarn WorldState(initial_state = rand(0:1, 3, 3))

    @test_throws ErrorException WorldState(initial_state = rand(0:1, 10, 10, 10))
    @test_throws ErrorException WorldState(initial_state = rand(0:1, 10, 10, 1))
    @test_throws ErrorException WorldState(initial_state = rand(0:1, 10))
    @test_throws ErrorException WorldState(initial_state = rand(0:1, 2, 2))
    @test_throws ErrorException WorldState(initial_state = rand(0:1, 3, 2))
    @test_throws ErrorException WorldState(initial_state = rand(0:2, 3, 3))

    @test GameOfLife.state_check([2]) == false
    @test GameOfLife.state_check([0]) == true
    @test GameOfLife.state_check([1]) == true
    @test GameOfLife.state_check([0 1 1; 1 0 1;]) == true
    @test GameOfLife.state_check([0 1 1; 1 0 -1;]) == false

    world = WorldState()
    @test length(world)  == 100
    @test length(WorldState(max_days = 999999)) == 999999

    @test iterate(world, 10)[2] == 11
    @test iterate(world, 100)[2] == 101
    @test isnothing(iterate(world, 101)) == true
end
