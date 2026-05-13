# Task 1
function simulate_requests_sequential(n)
    @sync begin
        for i in 1:n
            @async begin
                sleep(3 + rand())
                println("Task $i done")
            end
        end
    end
end
function simulate_requests_parallel(n)
    @sync begin
        for i in 1:n
            Threads.@spawn begin
                sleep(3 + rand())
                println("Task $i done")
            end
        end
    end
end
# Odp. na pytanie, czy zauwazasz roznice: raczej nie.


# Task 2
function process_data_parallel(n; nworkers=4)
    ch = Channel{Int}(10)
    results = Channel{Tuple}(10)

    @sync begin
        # --- PRODUCENT ---
        @async begin
            for i in 1:n
                put!(ch, i)
            end
            close(ch)
        end

        # --- KONSUMENCI ---
        for worker in 1:nworkers
            @async begin
                for x in ch
                    y = sqrt(x) + log(x)
                    put!(results, (worker, x, y))
                    yield()
                end
            end
        end
    end

    close(results)

    return collect(results)
end
