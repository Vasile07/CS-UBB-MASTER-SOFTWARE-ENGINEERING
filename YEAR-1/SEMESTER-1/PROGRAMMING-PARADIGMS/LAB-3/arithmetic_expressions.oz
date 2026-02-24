declare
fun {Eval Expr}
   case Expr
   of int(N) then N
   [] add(X Y) then ({Eval X} + {Eval Y})
   [] mul(X Y) then ({Eval X} * {Eval Y})
   else
      raise invalidExpression(Expr) end
   end
end

{Browse {Eval add(int(1) mul(int(3) int(4)))}}