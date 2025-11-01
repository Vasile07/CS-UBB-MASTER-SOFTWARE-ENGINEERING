# Lab 3: List Processing and Expression Evaluation in Mozart/Oz

### Exercise 1: Finding an Element in a List

Define a function **`Member Xs Y`** that tests whether `Y` is an element of the list `Xs`.  
The function should return the truth values `true` or `false`.

Examples:
- `{Member [a b c] b}` → `true`  
- `{Member [a b c] d}` → `false`

➡️ [Solution](./member.oz)

---

### Exercise 2: Taking and Dropping Elements

Implement two functions:

- **`Take Xs N`** — returns the first `N` elements of the list `Xs`.  
  Example: `{Take [1 4 3 6 2] 3}` → `[1 4 3]`

- **`Drop Xs N`** — returns the list `Xs` without its first `N` elements.  
  Example: `{Drop [1 4 3 6 2] 3}` → `[6 2]`

➡️ [Solution](./take_and_drop.oz)

---

### Exercise 3: Zip and UnZip

The operation `A # B` constructs a tuple with label `#` and fields `A` and `B`,  
forming what is known as a **pair**. For example, `[a#1 b#2 c#3]` is a list of pairs.

#### a) `Zip`
Implement a function **`Zip`** that takes a pair `Xs#Ys` of two lists (of the same length)  
and returns a **pairlist**, where each element combines corresponding elements of the two lists.

Example:  
`{Zip [a b c]#[1 2 3]}` → `[a#1 b#2 c#3]`

#### b) `UnZip`
Implement a function **`UnZip`** that performs the inverse operation —  
converting a pairlist into a pair of lists.

Example:  
`{UnZip [a#1 b#2 c#3]}` → `[a b c]#[1 2 3]`

➡️ [Solution](./zip_and_unzip.oz)

---

### Exercise 4: Finding the Position of an Element in a List

Implement a function **`Position Xs Y`** that returns the **first position**  
of `Y` in the list `Xs`.  
List positions start from `1`.

Examples:
- `{Position [a b c] c}` → `3`  
- `{Position [a b c b] b}` → `2`

Try two versions:
1. One that assumes `Y` is an element of `Xs`.  
2. One that returns `0` if `Y` does not occur in `Xs`.

➡️ [Solution](./position.oz)

---

### Exercise 5: Arithmetic Expression Evaluation

An arithmetic expression can be represented as a tree of tuples:

1. **Integer:** `int(N)` — represents an integer value.  
2. **Addition:** `add(X Y)` — represents the sum of two expressions.  
3. **Multiplication:** `mul(X Y)` — represents the product of two expressions.

Implement a function **`Eval`** that takes an arithmetic expression and returns its value.

Example:  
`add(int(1) mul(int(3) int(4)))` → `13`

➡️ [Solution](./arithmetic_expressions.oz)
