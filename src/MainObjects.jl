import SparseArrays
using .SparseArrays

abstract type AbstractGeometricAlgebraType end

mutable struct Multivector <: AbstractGeometricAlgebraType

    val::SparseVector
    
    function Multivector(baseVectors::Vector, scalars::Vector)
        values = sparsevec(baseVectors, scalars)
        if values.n == 1
            return Blade(values)
        else
            return new(values)
        end
    end

end

mutable struct Blade <: AbstractGeometricAlgebraType

    val::SparseVector

end

function Base.getindex(m::AbstractGeometricAlgebraType, i::Int)
    return m.val[i]
end