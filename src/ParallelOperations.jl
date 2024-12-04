# Useless by now
#Talvez a soma de multivetores não seja linear. Corrigir isso com mais memória?

include("Workspace.jl")
using BenchmarkTools
using Base.Threads

mutable struct AtomicAbstractGeometricAlgebraType
    valor::AbstractGeometricAlgebraType
    lock::SpinLock
end

function initialize_atomic_agat(valor_inicial::AbstractGeometricAlgebraType)
    return AtomicAbstractGeometricAlgebraType(valor_inicial, Threads.SpinLock())
end

function atomic_add_agat!(variavel::AtomicAbstractGeometricAlgebraType, valor::AbstractGeometricAlgebraType)
    Threads.lock(variavel.lock)
    variavel.valor = multivectorSum(variavel.valor, valor)
    Threads.unlock(variavel.lock)
end

function multivectorGPMulti(ei::AbstractGeometricAlgebraType, ej::AbstractGeometricAlgebraType)::AbstractGeometricAlgebraType
    result = initialize_atomic_agat(Multivectors([1],[0]))
    Threads.@threads for i in eachindex(ei.val.nzind)
        for j in eachindex(ej.val.nzind)
            atomic_add_agat!(result, bladeGeometricProduct(Multivectors([ei.val.nzind[i]],[ei.val.nzval[i]]), Multivectors([ej.val.nzind[j]],[ej.val.nzval[j]])))
        end
    end
    return result.valor
end

n = 10
Setup(n)
mv = Multivectors(collect(1:2^n), ones(2^n))

println(Threads.nthreads())

result_sem_threads = @benchmark  multivectorGP(mv, mv)
result_com_threads = @benchmark  multivectorGPMulti(mv, mv)

show(stdout, "text/plain", result_sem_threads)
println()
show(stdout, "text/plain", result_com_threads)