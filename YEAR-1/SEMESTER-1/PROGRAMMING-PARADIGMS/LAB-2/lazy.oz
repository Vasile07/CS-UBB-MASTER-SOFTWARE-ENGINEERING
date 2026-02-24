% Filters(L,E) removes from list L all elements divisible by E
declare
fun lazy {Filter L H}
   case L of
      nil then nil
   [] A|As then if (A mod H) == 0 then {Filter As H}
		else A|{Filter As H} end
   end
end


% Sieve(L) keeps first element of list, then aplies Filter(L,Fe) to remove all numbers divisible by it. It then recursively repets this process on the filtered list
declare
fun lazy {Sieve L}
   case L of
      nil then nil
   [] H|T then H|{Sieve {Filter T H}}
   end
end

declare
fun lazy {Gen N}
   N|{Gen N+1}
end

declare
fun lazy {Prime} {Sieve {Gen 2}} end

L = {Prime}
{Browse L}

case L of
   X|T then {Browse X}
   case T of
      H|_ then {Browse H}
   end
end


declare
fun {GetAfterHelp N L}
   case L of
      H|T then if H =< N then {GetAfterHelp N T} else H
	       end
   end
   
end
fun {GetAfter N}
   {GetAfterHelp N {Prime}}
end

{Browse {GetAfter 5}}




