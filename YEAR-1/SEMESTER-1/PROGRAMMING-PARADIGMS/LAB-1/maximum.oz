declare
fun {Max N M}
   if N == 0 then M
   else
      if M == 0 then N
      else
	 1 + {Max N-1 M-1}
      end
   end
end

declare
N = 21
M = 15

{Browse {Max N M}}

   