include("GaFunctions.jl")

#= global a = quote
end

@eval function SetWorkSpace(Al::Algebra)
    
    symbolArray = []
    for i in eachindex(Al.Basis)
        push!(symbolArray, Symbol(Al.Basis[i][1]))
    end

    $([:($x = 1) for x in [:e1, :e2]]...)
    $a

end

function WorkSpace(Al::Algebra, expr::Expr)

    a = expr
    SetWorkSpace(Al)

end

al = CreateAlgebra(3)

b = quote
print(e1+e2)
end

WorkSpace(al, b) =#