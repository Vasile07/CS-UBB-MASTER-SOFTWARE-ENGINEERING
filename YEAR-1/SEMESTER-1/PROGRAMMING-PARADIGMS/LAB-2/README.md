# Lab 2: Recursion and Data Structures in Mozart/Oz

### Exercise 1: Combinations

The number of combinations of *k* items taken from *n* represents the number of subsets of size *k* that can be formed from a set of size *n*.

- **Function `Comb N K`** — computes combinations using the formula:  
  $$
  \binom{n}{k} = \frac{n!}{k!(n-k)!}
  $$

- **Function `CombEff1`** — computes combinations more efficiently using:  
  $$
  \binom{n}{k} = \frac{n \times (n-1) \times \dots \times (n-k+1)}{k \times (k-1) \times \dots \times 1}
  $$

- **Function `CombEff2`** — computes combinations using the same idea as above,  
  but performs the divisions step by step recursively:  
  $$
  \binom{n}{k} = \frac{n}{1} \times \frac{n-1}{2} \times \dots \times \frac{n-k+1}{k}
  $$

➡️ [Solution](./combinations.oz)

---

### Exercise 2: Reverse

Given a list `L = [x₁ x₂ ... xₙ]`, its reverse is `[xₙ ... x₂ x₁]`.

- **Function `Reverse L`** — computes the reverse of `L = [x₁ x₂ ... xₙ]`  
  by recursively reversing the sublist `[x₂ ... xₙ]` and appending `x₁` to the result.

- **Function `ReverseEff L R`** — computes the reverse efficiently using an accumulator `R`:  
  if `L` is empty, then `R` is empty; otherwise, it recursively reverses `[x₂ ... xₙ]`  
  and appends `x₁` to the accumulator `R`.

➡️ [Solution](.)

---

### Exercise 3: Infinite Structures

One of the advantages of **lazy evaluation** is support for infinite data structures.  
This can be useful, for example, to generate an infinite list of prime numbers.

- **Function `Prime`** — generates a list of prime numbers.  
  Modify it to make it *lazy*.  

- **Function `GetAfter N`** — using the lazy prime list,  
  return the first prime number greater than a given value `N`.

➡️ [Solution](.)

---

### Exercise 4: Binary Search Tree (BST)

Consider a binary search tree (BST) data structure of the following form:

`<BTree> ::= leaf(<Int>) | node(<Int>, <BTree>, <BTree>)`

The elements of this tree are **sorted** if it satisfies:

1. It is a leaf node with an integer value, or  
2. It is a node where:
   - both left and right subtrees are sorted, and  
   - all integers in the left subtree < the integer in the current node ≤  
     all integers in the right subtree.

Implement the following functions that manipulate or query a BST:

1. **`Insert :: (<BTree>, <Int>) → <BTree>`**  
   Inserts an integer into the BST.

2. **`Smallest :: <BTree> → <Int>`**  
   Returns the smallest element in the BST.

3. **`Biggest :: <BTree> → <Int>`**  
   Returns the largest element in the BST.

4. **`IsSortedBST :: <BTree> → <Bool>`**  
   Checks whether the given tree satisfies the sortedness property.

➡️ [Solution](.)
