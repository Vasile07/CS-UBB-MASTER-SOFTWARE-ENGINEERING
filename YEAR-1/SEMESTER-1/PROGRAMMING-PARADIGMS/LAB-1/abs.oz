declare
fun {Abs X}
   if {IsFloat X} == true then
      if X >= 0.0 then X
      else ~X
      end
   else
      if {IsInt X} == true then
	 if X >= 0 then X
	 else ~X
	 end
      else
	 raise 'X must be a ' end
      end
   end
end

declare
RealPositiveNumber = 5.25
AbsRealPositiveNumber = {Abs RealPositiveNumber}
RealNegativeNumber = ~RealPositiveNumber
AbsRealNegativeNumber = {Abs RealNegativeNumber}
IntegerPositiveNumber = 5
AbsIntegerPositiveNumber = {Abs IntegerPositiveNumber}
IntegerNegativeNumber = ~IntegerPositiveNumber
AbsIntegerNegativeNumber = {Abs IntegerNegativeNumber}

{Browse RealPositiveNumber}
{Browse AbsRealPositiveNumber}
{Browse RealNegativeNumber}
{Browse AbsRealNegativeNumber}
{Browse IntegerPositiveNumber}
{Browse AbsIntegerPositiveNumber}
{Browse IntegerNegativeNumber}
{Browse AbsIntegerNegativeNumber}
   