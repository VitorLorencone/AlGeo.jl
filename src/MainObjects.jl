import SparseArrays
using .SparseArrays

abstract type AbstractGeometricAlgebraType end

mutable struct Multivector <: AbstractGeometricAlgebraType

    val::SparseVector

end

mutable struct Blade <: AbstractGeometricAlgebraType

    val::SparseVector

end

function Multivectors(baseVectors::Array, scalars::Array)

    max = 2^(CurrentAlgebra.p + CurrentAlgebra.q)

    for i in baseVectors
        @assert 0 <= i <= max
    end

    values = sparsevec(baseVectors, scalars)
    if length(baseVectors) == 1
        return Blade(values)
    else
        return Multivector(values)
    end
end

function Base.getindex(m::AbstractGeometricAlgebraType, i::Int)
    return m.val[i]
end