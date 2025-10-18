declare
fun {Insert BTree Val}
   case BTree
   of nil then leaf(value: Val)
   [] leaf(value: V) then
      if Val < V then node(value: V left: leaf(value: Val) right: nil)
      else node(value: V left: nil right: leaf(value: Val))
      end
   [] node(value: V left: Left right: Right) then
      if Val < V then node(value: V left: {Insert Left Val} right: Right)
      else node(value: V left: Left right: {Insert Right Val})
      end
   end
end
fun {Smallest BTree}
   case BTree
   of nil then raise error('BTree is empty') end
   [] leaf(value: V) then V
   [] node(value: V left: nil right:_) then V
   [] node(value: V left: Left right: _) then {Smallest Left}
   end
end
fun {Biggest BTree}
   case BTree
   of nil then raise error('BTree is empty') end
   [] leaf(value: V) then V
   [] node(value: V left:  _ right: nil) then V
   [] node(value: V left: _ right: Right) then {Biggest Right}
   end
end
fun {IsSortedBST Tree}
   case Tree
   of nil then true
   [] leaf(value: _) then true
   [] node(value: V left: Left right: nil) then {And (V > {Biggest Left})  {IsSortedBST Left}}						 
   [] node(value: V left: nil right: Right) then {And (V =< {Smallest Right}) {IsSortedBST Right}}
   [] node(value: V left: Left right: Right) then {And (V > {Biggest Left})
						   {And (V =< {Smallest Right})
						    {And {IsSortedBST Left}
						     {IsSortedBST Right}
						    }						      
						   }						   
						  }	
   end
end


/*
       5
     /   \
    3     9
   /     / \ 
  1     6   11
 /
0



*/

declare
BTree1 = nil
BTree2 = {Insert BTree1 5}
BTree3 = {Insert BTree2 3}
BTree4 = {Insert BTree3 9}
BTree5 = {Insert BTree4 6}
BTree6 = {Insert BTree5 11}
BTree7 = {Insert BTree6 1}
BTree = {Insert BTree7 0}

{Browse BTree}
{Browse {Smallest BTree}}
{Browse {Biggest BTree}}
{Browse {IsSortedBST BTree}}

/*
       5
     /   \
    3     9
   /     
  4    
*/

declare
Tree1 = node(value: 5
	     left: node(
		      value: 3
		      left: leaf(value: 4)
		      right: nil
		      )
	     right: leaf(value: 9)
	    )

{Browse {IsSortedBST Tree1}}

/*
5
 \
  5
   \
    5
     \
      6
       \
        5
*/

declare
Tree2 = node(value: 5
	     left: nil
	     right: node(
		       value: 5
		       left: nil
		       right: node(
				 value: 6
				 left: nil
				 right: leaf(value: 5)
				 )
		       )
	    )
{Browse {IsSortedBST Tree2}}


