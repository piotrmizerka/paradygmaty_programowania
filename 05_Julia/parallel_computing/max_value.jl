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
    # TODO
    
end

function heavy_parallel(a)
    # TODO
    
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

julia -t