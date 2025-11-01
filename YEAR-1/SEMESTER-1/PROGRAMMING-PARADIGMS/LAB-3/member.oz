declare
fun {Member Xs Y}
   case Xs
   of nil then false
   [] H|T then if H == Y then true else {Member T Y}
	       end
   end
end

declare
L = [1 2 3 4 5]

{Browse {Member L 0}}
