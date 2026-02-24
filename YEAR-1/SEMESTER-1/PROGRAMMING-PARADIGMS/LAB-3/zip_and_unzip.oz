declare
fun {Zip Pair}
   case Pair
   of Xs#Ys then
      case Xs
      of nil then nil
      [] HXs|TXs then
	 case Ys
	 of HYs|TYs then HXs#HYs|{Zip TXs#TYs}
	 end
      end
   end
end

fun {ReverseHelp L Rez}
   case L
   of nil then Rez
   [] H|T then {ReverseHelp T H|Rez}
   end
end

fun {Reverse L}
   {ReverseHelp L nil}
end

fun {UnZipHelp L Xs Ys}
   case L
   of nil then {Reverse Xs}#{Reverse Ys}
   [] E1#E2|T then {UnZipHelp T E1|Xs E2|Ys}
   end
end

fun {UnZip L}
   {UnZipHelp L nil nil}
end

{Browse {Zip [a b c]#[1 2 3]}}
{Browse {UnZip [a#1 b#2 c#3]}}
	    