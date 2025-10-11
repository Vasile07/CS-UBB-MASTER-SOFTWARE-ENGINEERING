declare
fun {Fact N}
   if N == 0 then 1
   else
      {Fact N-1} * N
   end
end

{Browse {Fact 5}}

declare
fun {Comb N K}
   {Fact N} div ({Fact K} * {Fact N-K})
end

declare
N = 10
K = 3

{Browse {Comb N K}}


declare
fun {CustomFact N L}
   if N == L then N
   else
      {CustomFact (N-1) L} * N
   end
end
declare
fun {Numerator N K}
   {CustomFact N (N-K+1)}
end

declare
fun {Denominator K}
   {CustomFact K 1}
end

declare
fun {CombEff1 N K}
   if K == 0 then 1
   else
      {Numerator N K} div {Denominator K}
   end
end

{Browse {CombEff1 N K}}

declare
fun {CombEff2 N K}
   if K == 0 then 1
   else
      {CombEff2 N (K-1)} * ((N-K+1)/K)
   end
end

{Browse {CombEff2 N K}}







