fun {Append L1 L2}
   case L1 of
      nil then L2
   [] H|T then H|{Append T L2}
   end
end

declare
fun {Reverse L}
   case L
   of nil then nil
   [] H|T then {Append {Reverse T}[H]}
   end
end

{Browse {Reverse ['I' 'want' 2 go 'there']}}

declare
fun {ReverseEfficient L Rez}
   case L
   of nil then Rez
   [] H|T then {ReverseEfficient T (H|Rez)}
   end
end

{Browse {ReverseEfficient ['I' 'want' 2 go 'there'] nil}}