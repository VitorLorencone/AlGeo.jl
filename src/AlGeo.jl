#=

TODO: Corrigir o show para mostrar o valor com subíndices
TODO: Adicionar a operação de soma

=#

module AlGeo

export Algeo, id
export Multivectors, AbstractGeometricAlgebraType, Blade, Multivector, OPTable, IPTable, GPTable ### Remover os 3 ultimos?
export bladeIndex, bladeScalar, bladeGeometricProduct, bladeInnerProduct, bladeOuterProduct, grade, gradeProjection, basisScalarProduct

include("Workspace.jl")

end