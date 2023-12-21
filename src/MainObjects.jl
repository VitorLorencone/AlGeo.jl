include("Algebra.jl")
using .Alg
import SparseArrays
using .SparseArrays

abstract type AbstractGeometricAlgebraType end

mutable struct Multivector <: AbstractGeometricAlgebraType

    val::SparseVector

end

mutable struct Blade <: AbstractGeometricAlgebraType

    val::SparseVector

end

function Multivectors(baseVectors::Array, scalars::Array, Al::Algebra = CurrentAlgebra)

    max = 2^(Al.p + Al.q)

    for i in baseVectors
        @assert 0 <= i <= max
    end

    values = sparsevec(baseVectors, scalars, max)
    if length(baseVectors) == 1
        return Blade(values)
    else
        return Multivector(values)
    end
end

function Base.getindex(m::AbstractGeometricAlgebraType, i::Int)
    return m.val[i]
end

function Base.show(io::IO, a::AbstractGeometricAlgebraType)
    ind = a.val.nzind
    val = a.val.nzval
    ans = ""

    for i in eachindex(ind)
        if ind[i] > 1
            ans = ans * string(val[i]) * CurrentAlgebra.Basis[ind[i]][1] * " + "
        elseif ind[1] == 1
            ans = ans * string(val[i]) * " + "
        end
    end
    ans = ans[1:end-2]
    print(ans)
end

for i in 2:length(CurrentAlgebra.Basis)
    varName = Symbol(CurrentAlgebra.Basis[i][1])
    k = [i]
    varValue = Multivectors(k,[1])
    eval(Meta.parse("const $(varName) = Multivectors($k,[1])"))
end