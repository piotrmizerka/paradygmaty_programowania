using Base.Threads
using Random

# --- wersja sekwencyjna ---
function max_seq(a)
    m = -Inf
    for x in a
        if x > m
            m = x
        end
    end
    return m
end

function heavy_seq(a)
    s = 0.0
    @inbounds for x in a
        s += sin(x)^2 + cos(x)^2 + log(x) + exp(x)
    end
    return s
end

# --- wersja równoległa ---
function max_parallel(a)
    local_max = fill(-Inf, nthreads())

    @threads for i in eachindex(a)
        tid = threadid()
        @inbounds local_max[tid] = max(local_max[tid], a[i])
    end

    return maximum(local_max)
end

function heavy_parallel(a)
    partial = zeros(nthreads())

    @threads for tid in 1:nthreads()
        local_sum = 0.0
        for i in tid:nthreads():length(a)
            x = a[i]
            local_sum += sin(x)^2 + cos(x)^2 + log(x) + exp(x)
        end
        partial[tid] = local_sum
    end

    return sum(partial)
end

a = rand(10^8)
@time begin
    @info "max, sequential", max_seq(a)
end
@time begin
    @info "max, parallel", max_parallel(a)
end

println()

b = rand(10^8)
@time begin
    @info "heavy, sequential",heavy_seq(b)
end
@time begin
    @info "heavy, parallel", heavy_parallel(b)
end
