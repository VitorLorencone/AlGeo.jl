module AlGeo
export Algeo, createConsts, Multivectors, bladeIndex, bladeScalar, bladeGeometricProduct, bladeInnerProduct, bladeOuterProduct, grade, gradeProjection, basisScalarProduct

include("Workspace.jl")

#= println(Algeo(3))
println(CurrentAlgebra.Indexes)
println(e3)
println(e1e2)
println(e3*e1e2)
println(e3|e1e2)
println(e3^e1e2)
println(3*5*e1e3) =#

#= println(Algeo(0, 1, ["i"]))
println(i * i) =#

end