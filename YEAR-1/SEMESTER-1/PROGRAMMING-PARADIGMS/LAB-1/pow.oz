declare
fun {Pow N M}
   if M == 0 then 1
   else N * {Pow N M-1}
   end
end

declare
N = 5
M = 2
{Browse {Pow N M}}
