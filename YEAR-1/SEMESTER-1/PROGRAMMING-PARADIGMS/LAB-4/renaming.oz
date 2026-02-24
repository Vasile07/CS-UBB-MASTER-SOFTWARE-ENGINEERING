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

Cnt = {NewCell 0}

fun {NewId}
   Cnt := @Cnt + 1
   {String.toAtom {Append "id<" {Append {Int.toString @Cnt} ">"}}}
end

fun {RenameHelp Expr Env}
   case Expr
   of lam(Id Expr1) then
      if {IsMember Env Id} then
	 lam({Fetch Env Id} {RenameHelp Expr1 Env})
      else
	 local Env1 in
	    Env1 = {Adjoin Env Id#{NewId}}
	    lam({Fetch Env1 Id} {RenameHelp Expr1 Env1})
	 end
      end
   [] let(Id#Expr1 Expr2) then
      if {IsMember Env Id} then
	 let({Fetch Env Id}#{RenameHelp Expr1 Env} {RenameHelp Expr2 Env})
      else
	 local Env1 in
	    Env1 = {Adjoin Env Id#{NewId}}
	    let({Fetch Env1 Id}#{RenameHelp Expr1 Env1} {RenameHelp Expr2 Env1})
	 end
      end
   [] apply(Expr1 Expr2) then
      apply({RenameHelp Expr1 Env} {RenameHelp Expr2 Env})
   [] Id then
      if {IsMember Env Id} then
	 {Fetch Env Id}
      else
	 Id
      end
   end
end

fun {Rename Expr}
   {RenameHelp Expr nil}
end

	 
{Browse {Rename lam(z lam(x z))}}
{Browse {Rename let(id#lam(z z) apply(id y))}}