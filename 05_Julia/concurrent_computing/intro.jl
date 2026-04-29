using Base.Threads
using Random

t = @async begin
    sleep(1)
    println("done")
end

wait(t)