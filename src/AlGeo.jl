#=

TODO: Fazer Tabela de Operações
TODO: Corrigir o show para mostrar o valor com subíndices
TODO: Adicionar a operação de soma
TODO: Exportar os vetores canônicos corretamente para o REPL

=#

module AlGeo
export Algeo, Multivectors, bladeIndex, bladeScalar, bladeGeometricProduct, bladeInnerProduct, bladeOuterProduct, grade, gradeProjection, basisScalarProduct

include("Workspace.jl")

R3 = Algeo(-1)
println(R3)
#println(e1*e2)
#println(grade(2*e1))

end