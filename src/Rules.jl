module Rules
export next

function neighborhood(A::Array, I::CartesianIndex)
    xmax, ymax = size(A)
    view(
        A,
        max(1, I[1] - 1):min(ymax, I[1] + 1),
        max(1, I[2] - 1):min(ymax, I[2] + 1),
    )
end

function liferule(A, I::CartesianIndex)
    num_ones = sum(neighborhood(A, I)) - A[I]
    if num_ones == 3
        return 1
    elseif num_ones == 2
        return A[I]
    else
        return 0
    end
end

function next(A::Array)
    B = zeros(size(A))
    for I in CartesianIndices(A)
        B[I] = liferule(A, I)
    end
    return B
end

end
