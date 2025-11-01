# Lab 4: Lambda Calculus Operations in Mozart/Oz

This lab explores core operations of the **lambda calculus** using Mozart/Oz:  
identifying free variables, managing environments, renaming bound variables,  
and performing substitutions safely within expressions.

---

### Exercise 1: Free Variables

Each variable captured in a `lam` or `let` construct is **bound**,  
while variables not captured are **free**.

Examples:
- In `lam(x apply(y x))`, the variable **`y`** is free and **`x`** is bound.  
- In `apply(x let(x#y x))`, the first `x` and `y` are free, while the last `x` is bound.

Implement a function **`FreeSet`** that returns all free variables in an expression.

Examples:
- {FreeSet apply(x let(x#y x))} % returns [x y]
- {FreeSet apply(y apply(let(x#x x) y))} % returns [y]


➡️ [Solution](.)

---

### Exercise 2: Environment / Mapping

During lambda evaluation, we maintain an **environment** mapping identifiers to expressions.  
An environment is represented as a list of pairs:
Env = [Id1#Expr1 Id2#Expr2 ...]

Implement the following functions:

1. **`IsMember :: (Env Id) → Boolean`**  
   Checks whether a given identifier exists in the environment.  
   - `{IsMember [a#E1 b#y c#E3] c}` → `true`  
   - `{IsMember [a#E1 b#y c#E3] y}` → `false`

2. **`Fetch :: (Env Id) → Expr`**  
   Returns the expression associated with an identifier (or the identifier itself if not found).  
   - `{Fetch [a#E1 b#y c#E3] c}` → `E3`  
   - `{Fetch [a#E1 b#y c#E3] d}` → `d`

3. **`Adjoin :: (Env Id#Expr) → Env`**  
   Adds or updates a mapping in the environment.  
   - `{Adjoin [a#E1 b#y c#E3] c#E4}` → `[c#E4 a#E1 b#y]`  
   - `{Adjoin [a#E1 b#y c#E3] d#E4}` → `[d#E4 a#E1 b#y c#E3]`

➡️ [Solution](.)

---

### Exercise 3: Renaming Bound Variables

Bound variables in `lam` or `let` constructs are placeholders that can be renamed  
without changing the meaning of the lambda term.

Examples of equivalent forms:

Implement the following functions:

1. **`IsMember :: (Env Id) → Boolean`**  
   Checks whether a given identifier exists in the environment.  
   - `{IsMember [a#E1 b#y c#E3] c}` → `true`  
   - `{IsMember [a#E1 b#y c#E3] y}` → `false`

2. **`Fetch :: (Env Id) → Expr`**  
   Returns the expression associated with an identifier (or the identifier itself if not found).  
   - `{Fetch [a#E1 b#y c#E3] c}` → `E3`  
   - `{Fetch [a#E1 b#y c#E3] d}` → `d`

3. **`Adjoin :: (Env Id#Expr) → Env`**  
   Adds or updates a mapping in the environment.  
   - `{Adjoin [a#E1 b#y c#E3] c#E4}` → `[c#E4 a#E1 b#y]`  
   - `{Adjoin [a#E1 b#y c#E3] d#E4}` → `[d#E4 a#E1 b#y c#E3]`

➡️ [Solution](.)

---

### Exercise 3: Renaming Bound Variables

Bound variables in `lam` or `let` constructs are placeholders that can be renamed  
without changing the meaning of the lambda term.

Examples of equivalent forms:
lam(z z) = lam(y y) = lam(a a)
let(id#lam(z z) apply(id y)) = let(a#lam(b b) apply(a y))


Use the helper function **`NewId`** to generate unique identifiers:

```oz
Cnt = {NewCell 0}

fun {NewId}
   Cnt := @Cnt + 1
   {String.toAtom (Append "id<" (Append (Int.toString @Cnt) ">"))}
end
```


Each call to `{NewId}` produces a unique identifier:
{NewId} → id<1>
{NewId} → id<2>
{NewId} → id<3>


Implement a function **`Rename`** that returns a new lambda term  
where all bound variables are uniquely renamed.

Examples:
{Rename lam(z lam(x z))} → lam(id<1> lam(id<2> id<1>))
{Rename let(id#lam(z z) apply(id y))} → let(id<3>#lam(id<4> id<4>) apply(id<3> y))

➡️ [Solution](.)

---

### Exercise 4: Substitution

Lambda terms are evaluated via **substitution**.  
Define a function **`Subs :: (Id#Expr Expr) → Expr`**  
that replaces all **free occurrences** of an identifier in an expression  
with a given value, while respecting bound variables.

Example reduction:
```
apply(lam(x apply(x y)) lam(x x))
= Subs(x#lam(x x) apply(x y))
= apply(lam(x x) y)
```


Rules to follow:
- Substitute **only free occurrences** of identifiers.  
- Avoid substituting bound variables of the same name.  
- Prevent **clashes** between free variables of the argument and bound variables of the target expression.

Example — safe renaming before substitution:
```
(Subs x#lam(y z) apply(x lam(z apply(x z))))
→ Rename lam(z apply(x z)) = lam(id<1> apply(x id<1>))
→ apply(lam(y z) lam(id<1> apply((lam y z) id<1>)))
```

➡️ [Solution](.)
