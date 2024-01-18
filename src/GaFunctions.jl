include("MainObjects.jl")

"""
    bladeIndex(vec, Al)::Array

Function that returns the indexes of a blade.

# Arguments
- `vec::Blade` : A Blade.
- `Al::Algebra` : The Algebra, it is setted as CurrentAlgebra.

# Return
Returns an array with all indexes of that blade.

"""
function bladeIndex(vec::Blade, Al::Algebra = CurrentAlgebra)::Array{}
    return Al.Indexes[vec.val.nzind]
end

"""
    bladeScalar(vec)::Any

Function that returns scalar of a Blade.

# Arguments
- `vec::Blade` : A Blade.

# Return
A real number, the scalar.

"""
function bladeScalar(vec::Blade)::Any
    return vec.val.nzval[1]
end

"""
    lenElements(vec)::Int

Function that returns the length of elements in an Abstract Geometric Algebra Type.

# Arguments
- `vec::AbstractGeometricAlgebraType` : A multivector or a Blade.

# Return
An integer, the ammount of elements.

"""
function lenElements(vec::AbstractGeometricAlgebraType)::Int
    return length(vec.val.nzind)
end

"""
    grade(vec)::Int

Function that returns the grade of the Blade.

# Arguments
- `vec::Blade` : A Blade.

# Return
An integer, the grade of the blade.

"""
function grade(vec::Blade)::Int
    if bladeIndex(vec)[1] == [0]
        return 0
    end
    return length(bladeIndex(vec)[1])
end

"""
    gradeProjection(vec, k)::Blade

Function that returns the grade Projection between a Blade and an Integer.

# Arguments
- `vec::Blade` : A Blade.
- `k::Int` : An integer to the Grade Projection

# Return
The result Blade. It might be the 1D blade "1"

"""
function gradeProjection(vec::Blade, k::Int)::Blade
    if grade(vec) == k
        return vec
    else
        return Multivectors([1],[0])
    end
end

"""
    basisScalarProduct(ei, ej, Al)::Int

Function that returns the Scalar Product between two basis blades.

# Arguments
- `ei::Blade` : A Blade.
- `ej::Blade` : A Blade.
- `Al::Algebra` : The Algebra, it is setted as CurrentAlgebra.

# Return
The result Integer.

"""
function basisScalarProduct(ei::Blade, ej::Blade, Al::Algebra = CurrentAlgebra)::Int
    i = bladeIndex(ei)[1]
    j = bladeIndex(ej)[1]

    if(length(i) != 1 || length(j) != 1 || i[1] == 0 || j[1] == 0)
        throw(DomainError(i, "This operation must be executed with basis blades."))
    end
    
    if i[1] != j[1]
        return 0
    elseif i[1] >= 1 && j[1] <= Al.p
        return 1
    else
        return -1
    end
end

"""
    bladeGeometricProduct(ei, ej, Al)::Blade

Function that returns the Geometric Product between two blades.
It is used for the Operation Table, it is high cost for single operations over time.

# Arguments
- `ei::Blade` : A Blade.
- `ej::Blade` : A Blade.
- `Al::Algebra` : The Algebra, it is setted as CurrentAlgebra.

# Return
The result Blade.

"""
function bladeGeometricProduct(ei::Blade, ej::Blade, Al::Algebra = CurrentAlgebra)::Blade
    i = bladeIndex(ei)
    j = bladeIndex(ej)

    finalScalar = bladeScalar(ei) * bladeScalar(ej)
    finalIndex = setdiff(union(i[1], j[1]), intersect(i[1], j[1]))

    if i[1][1] == 0 && j[1][1] == 0
        return Multivectors([1],[finalScalar])
    elseif i[1][1] == 0
        return bladeScalarProduct(ej, bladeScalar(ei))
    elseif j[1][1] == 0
        return bladeScalarProduct(ei, bladeScalar(ej))
    end
        

    if i[1][1] == 0
        return ej
    elseif j[1][1] == 0
        return ei
    end

    function signalSwitch(i, j):Int
        if length(i[1]) == 0 || length(j[1]) == 0
            return 1
        end
        for k in eachindex(i[1])
            for l in eachindex(j[1])
                if i[1][k] == j[1][l]
                    if i[1][k] >= 1 && j[1][l] <= Al.p
                        resp = (-1)^(length(i[1]) - k + l - 1)
                        i[1] = filter(x -> x != i[1][k], i[1])
                        j[1] = filter(x -> x != j[1][l], j[1])
                        return resp * signalSwitch(i, j)
                    else
                        resp = (-1)^(length(i[1]) - k + l)
                        i[1] = filter(x -> x != i[1][k], i[1])
                        j[1] = filter(x -> x != j[1][l], j[1])
                        return resp * signalSwitch(i, j)
                    end
                end
            end
        end
        return 1
    end

    finalScalar = finalScalar*signalSwitch(i, j)
    
    if length(finalIndex) == 0
        finalIndex = [0]
    end

    swap = 0
    for i in 2:length(finalIndex)
        key = finalIndex[i]
        j = i - 1
        while j > 0 && finalIndex[j] > key
            finalIndex[j + 1] = finalIndex[j]
            swap+=1
            j -= 1
        end
        finalIndex[j + 1] = key
    end

    finalScalar *= (-1)^(swap)

    return Multivectors([findfirst(x -> x == finalIndex, Al.Indexes)],[finalScalar])

end

"""
    bladeScalarProduct(ei, k)::Blade

Function that returns the Scalar Product between a blades and a 1D Number.

# Arguments
- `ei::Blade` : A Blade.
- `k::Number` : A scalar.

# Return
The result Blade.

"""
function bladeScalarProduct(ei::Blade, k::Number)::Blade
    finalScalar = ei.val.nzval[1] * k
    return Multivectors([ei.val.nzind[1]], [finalScalar])
end

"""
    bladeInnerProduct(ei, ej)::Blade

Function that returns the Inner Product between two blades.
It is used for the Operation Table, it is high cost for single operations over time.

# Arguments
- `ei::Blade` : A Blade.
- `ej::Blade` : A Blade.

# Return
The result Blade.

"""
function bladeInnerProduct(ei::Blade, ej::Blade)

    k = grade(ei)
    l = grade(ej)
    if k != 0 && l != 0
        return gradeProjection(bladeGeometricProduct(ei, ej), abs(k-l))
    elseif k == 0
        return ej
    else
        return ei
    end

end

"""
    bladeOuterProduct(ei, ej)::Blade

Function that returns the Outer Product between two blades.
It is used for the Operation Table, it is high cost for single operations over time.

# Arguments
- `ei::Blade` : A Blade.
- `ej::Blade` : A Blade.

# Return
The result Blade.

"""
function bladeOuterProduct(ei::Blade, ej::Blade)
    k = grade(ei)
    l = grade(ej)
    return gradeProjection(bladeGeometricProduct(ei,ej), l+k)

end

# Functions for operator overloading between types.

function Base.:*(ei::Blade, ej::Blade)::Blade
    return bladeGeometricProduct(ei,ej)
end

function Base.:*(ei::Blade, k::Number)::Blade
    return bladeScalarProduct(ei,k)
end
function Base.:*(k::Number, ei::Blade)::Blade
    return bladeScalarProduct(ei,k)
end

function Base.:|(ei::Blade, ej::Blade)::Blade
    return bladeInnerProduct(ei,ej)
end

function Base.:^(ei::Blade, ej::Blade)::Blade
    return bladeOuterProduct(ei,ej)
end

function ⋅(ei::Blade, ej::Blade)::Blade
    return basisScalarProduct(ei, ej)
end