using Base.Threads

function merge(left, right)
    result = similar(left, length(left) + length(right))
    i = j = k = 1

    while i <= length(left) && j <= length(right)
        if left[i] < right[j]
            result[k] = left[i]; i += 1
        else
            result[k] = right[j]; j += 1
        end
        k += 1
    end

    while i <= length(left)
        result[k] = left[i]; i += 1; k += 1
    end
    while j <= length(right)
        result[k] = right[j]; j += 1; k += 1
    end

    return result
end

function mergesort_sequential(a, cutoff=10_000)
    if length(a) <= cutoff
        return sort(a)
    end

    mid = length(a) ÷ 2 # the same as div(length(a), 2)

    left = mergesort_sequential(a[1:mid], cutoff)
    right = mergesort_sequential(a[mid+1:end], cutoff)

    return merge(left, right)
end

function mergesort_parallel(a, cutoff=10_000)
    if length(a) <= cutoff
        return sort(a)
    end

    mid = length(a) ÷ 2

    left_task = @spawn mergesort_parallel(a[1:mid], cutoff)
    right = mergesort_parallel(a[mid+1:end], cutoff)
    left = fetch(left_task)

    return merge(left, right)
end

a = rand(10^6)

# warm-up
mergesort_sequential(a)
mergesort_parallel(a)
@time begin
    @info "merge_sort, sequential", mergesort_sequential(a)[div(length(a), 2)]
end

println()

@time begin
    @info "merge_sort, parallel", mergesort_parallel(a)[div(length(a), 2)]
end