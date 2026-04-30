# do wklejania w konsoli, odpalonej za pmoca julia -t 14

using Base.Threads

# 1. Creating a task
t = @async begin
    sleep(1)
    println("done")
end
wait(t)


# 2. Creating multiple tasks. Uwaga: bez @sync ryzyko nieoczekiwanego zakończenia programu przed wykonaniem tasków nawet.
@sync begin
    @async begin
        sleep(3)
        println("A")
    end

    @async begin
        sleep(2)
        println("B")
    end
end


# 3. @async vs @spawn: non-parallel vs parallel execution. Wywolac raz na jednym a raz na wielu CPU
@sync begin
    @async begin
        s = 0.0
        for i in 1:10^8
            s += sin(i)
        end
        @info "A", s
    end

    @async begin
        s = 0.0
        for i in 1:10^8
            s += sin(i)
        end
        @info "B", s
    end
end

@sync begin
    @spawn begin
        s = 0.0
        for i in 1:10^8
            s += sin(i)
        end
        @info "A", s
    end

    @spawn begin
        s = 0.0
        for i in 1:10^8
            s += sin(i)
        end
        @info "B", s
    end
end

# Task 1: @async ≠ parallel
# Zaimplementuj funkcję:

# simulate_requests(n)

# która:

# tworzy n tasków
# każdy:
# śpi losowy czas (3–4s)
# zwraca swój id

# Wypisz wyniki w kolejności zakończenia.

# Zaimplementuj powyższe w wersji z @async i @spawn.
function simulate_requests_seqeuential(n)
    # TODO
end

function simulate_requests_parallel(n)
    # TODO
end
# Czy obserwujesz różnicę w czasie wykonania? Dlaczego?


# 4. Channels: producer-consumer pattern
function producer(c::Channel)
           put!(c, "start")
           for n=1:4
               put!(c, 2n)
           end
           put!(c, "stop")
       end;

chnl = Channel()
@async producer(chnl)

# Call the following line subsequently in the REPL to see the results:
take!(chnl)
close(chnl) # zamyka kanal


# Task 2
# Zbuduj taki system:

# process_data(n)
# producent generuje liczby 1:n
# konsumenci (minimum 2) pobierają liczby i dla każdej pobranej liczby x liczą: sqrt(x) + log(x)

# Uwagi:

# Channel (sugerowane 2 kanały: jeden do komunikacji producent-silnik obliczeniowy, drugi do komunikacji silnik obliczeniowy-uzytkownik)
# minimum 3 taski
# uwaga na zamykanie kanałów!

# Przykladowe podejscie:
function process_data_parallel(n; nworkers=4)
    ch = Channel{Int}(10)
    results = Channel{Tuple}(10)

    @sync begin
        # --- PRODUCENT - SILNIKI OBLICZENIOWE ---
        @async begin
            # TODO
        end

        # --- SILNIKI OBLICZENIOWE - UZYTKOWNIK ---
        for worker in 1:nworkers
            @async begin
                # TODO
            end
        end
    end

    # TODO
end
