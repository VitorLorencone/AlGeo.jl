include("OperationTable.jl")

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

function Base.:(==)(ei::AbstractGeometricAlgebraType, ej::AbstractGeometricAlgebraType)::Bool
    return ei.val == ej.val
end
function Base.:(!=)(ei::AbstractGeometricAlgebraType, ej::AbstractGeometricAlgebraType)::Bool
    return !(ei == ej)
end

function Base.:-(ei::AbstractGeometricAlgebraType)::AbstractGeometricAlgebraType
    return -1 * ei
end