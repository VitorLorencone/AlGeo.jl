#=

TODO: Fazer Tabela de Operações
TODO: Corrigir o show para mostrar o valor com subíndices
TODO: Adicionar a operação de soma
TODO: Exportar os vetores canônicos corretamente para o REPL

=#

module AlGeo

export Algeo, id
export Multivectors, AbstractGeometricAlgebraType, Blade, Multivector, OPTable, IPTable, GPTable
export bladeIndex, bladeScalar, bladeGeometricProduct, bladeInnerProduct, bladeOuterProduct, grade, gradeProjection, basisScalarProduct

include("Workspace.jl")

end