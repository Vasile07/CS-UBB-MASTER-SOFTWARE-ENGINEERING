declare
fun {IsMember Env Id}
   case Env
   of nil then false
   [] H|T then
      case H
      of Id1#Expr then if Id1 == Id then true
		       else
			  {IsMember T Id}
		       end
      else
	 raise invalidStructure(H) end
      end
   end
end

fun {Fetch Env Id}
    case Env
    of nil then Id
    [] H|T then
       case H
       of Id1#Expr then if Id1 == Id then Expr
			else
			   {Fetch  T Id}		   
			end
       else
	  raise invalidStructure(H) end
       end
    end
end

fun {RemoveId Env Id}
   case Env
   of nil then nil
   [] H|T then
      case H
      of Id1#Expr then if Id1 == Id then {RemoveId T Id}
		       else H|{RemoveId T Id}
		       end
      else
	 raise invalidStructure(H) end
      end
   end
end
	
fun {Adjoin Env Pair}
   case Pair
   of Id#Expr then Pair|{RemoveId Env Id}
   else
      raise invalidStructure(Pair) end
   end
end

declare
L = [a#e1 b#y c#e3]

{Browse {IsMember L c} == true}
{Browse {IsMember L y} == false}

{Browse {Fetch L c} == e3}
{Browse {Fetch L d} == d}

{Browse {Adjoin L c#e4} == [c#e4 a#e1 b#y]}
{Browse {Adjoin L d#e4} == [d#e4 a#e1 b#y c#e3]}