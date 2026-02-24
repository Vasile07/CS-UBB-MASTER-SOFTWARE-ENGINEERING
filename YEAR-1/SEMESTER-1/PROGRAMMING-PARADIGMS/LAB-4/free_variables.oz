declare
fun {Concat L1 L2}
   case L1
   of nil then L2
   [] H|T then H|{Concat T L2}
   end
end

fun {Find List X}
    case List of 
      nil then false
      [] H|T then 
            if H == X then true 
            else {Find T X} 
            end
      end
end

declare
fun {FreeSet_aux Expr Bounded}
   case Expr of
      apply(Expr1 Expr2) then 
            {Concat {FreeSet_aux Expr1 Bounded} {FreeSet_aux Expr2 Bounded}}
      
      [] lam(Id Expr1) then 
            {FreeSet_aux Expr1 Id|Bounded}
      
      [] let(Id#Expr1 Expr2) then 
            {Concat {FreeSet_aux Expr1 Id|Bounded} {FreeSet_aux Expr2 Id|Bounded}}
      
      [] Id then
            if {Find Bounded Id} then nil 
            else [Id] 
            end
    end
end

fun {FreeSet Expr}
    {FreeSet_aux Expr nil}
end

{Browse {FreeSet apply(x let(x#y x))}}
{Browse {FreeSet apply(y apply(let(x#x x) y))}}