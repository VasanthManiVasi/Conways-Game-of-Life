using GameOfLife
using Test

@testset "rules.jl" begin
    A = GameOfLife.default_state()

    @test GameOfLife.neighborhood(A, CartesianIndex(62, 62)) == [1 1 0; 0 1 1; 0 1 0]

    @test GameOfLife.liferule(A, CartesianIndex(62, 62)) == 0

    @test GameOfLife.liferule([1 1 1; 0 0 1; 0 1 1], CartesianIndex(2, 2)) == 0

    @test GameOfLife.next(A) == (
        B = GameOfLife.default_state(); B[61:63, 61:63] = [1 1 1; 0 0 1; 0 1 1;]; 
        B
    )
end