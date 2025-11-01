declare
fun {Take Xs N}
   if N == 0 then nil
   else
      case Xs
      of nil then nil
      [] H|T then H|{Take T (N-1)}
      end
   end
end

fun {Drop Xs N}
   if N == 0 then Xs
   else
      case Xs
      of nil then nil
      [] _|T then {Drop T (N-1)}
      end
   end
end

%{Browse {Take [1 4 3 6 2] 3}}
{Browse {Drop [1 4 3 6 2] 3}}