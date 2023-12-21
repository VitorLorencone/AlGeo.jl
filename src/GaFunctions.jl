include("MainObjects.jl")

function bladeIndex(vec::Blade, Al::Algebra = CurrentAlgebra)::Array{}
    return Al.Indexes[vec.val.nzind]
end

function bladeScalar(vec::Blade)::Any
    return vec.val.nzval[1]
end

function lenElements(vec::AbstractGeometricAlgebraType)::Int
    return length(vec.val.nzind)
end

function grade(vec::Blade)::Int
    if bladeIndex(vec)[1] == [0]
        return 0
    end
    return length(bladeIndex(vec)[1])
end

function gradeProjection(vec::Blade, k::Int)::Blade
    if grade(vec) == k
        return vec
    else
        return Multivectors([1],[0])
    end
end

function basisScalarProduct(ei::Blade, ej::Blade, Al::Algebra = CurrentAlgebra)::Int
    i = bladeIndex(ei)[1]
    j = bladeIndex(ej)[1]
    @assert length(i) == 1 && length(j) == 1
    @assert i[1] != 0 && j[1] != 0
    
    if i[1] != j[1]
        return 0
    elseif i[1] >= 1 && j[1] <= Al.p
        return 1
    else
        return -1
    end
end

function bladeGeometricProduct(ei::Blade, ej::Blade, Al::Algebra = CurrentAlgebra)
    i = bladeIndex(ei)
    j = bladeIndex(ej)
    finalScalar = bladeScalar(ei) * bladeScalar(ej)
    finalIndex = setdiff(union(i[1], j[1]), intersect(i[1], j[1]))

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

    #println(finalIndex)
    #println(finalScalar)
    return Multivectors([findfirst(x -> x == finalIndex, Al.Indexes)],[finalScalar])

end

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

function bladeOuterProduct(ei::Blade, ej::Blade)
    k = grade(ei)
    l = grade(ej)
    return gradeProjection(bladeGeometricProduct(a,b), l+k)

end

function createConsts()
    for i in 2:length(CurrentAlgebra.Basis)
        varName = Symbol(CurrentAlgebra.Basis[i][1])
        k = [i]
        varValue = Multivectors(k,[1])
        eval(Meta.parse("const global $(varName) = Multivectors($k,[1])"))
    end
end

#= k = CreateAlgebra(3)
println(CurrentAlgebra.Indexes)
a = Multivectors([4],[1])
b = Multivectors([5],[1])
println(bladeGeometricProduct(a,b))
println(bladeInnerProduct(a,b))
println(bladeOuterProduct(a,b)) =#