# The Elements of Programming

Every powerful language has 3 mechanisms to combine simple ideas to form more complex ideas.
These are: <br>

- **primitive expressions** - represent the simplest entities the language is concerned with
- **combination** - compound elements are built from simpler ones
- **abstraction** - compound elements are named and manipulated as units

There are 2 types of elements: <br>

- **data** - things that we want to manipulate
- **procedures** - descriptions of the rules for manipulating data

A language should describe primitive data/procedures and have methods for combining/abstracting them.


## 1.1.1 expressions

Expressions representing numbers may be combined with an expression representing a primitive procedure (such as + or *) to form a combination. <br>
Such as: <br>

`(+ 137 349)`

Interpreters operate in a REPL (Read-Eval-Print Loop): <br>

1. Reads an expression from terminal
2. Evaluates the expression
3. Prints the result

## 1.1.2 Naming and the Environment

Programming languages need to be able to use names to refer to computational objects (such as the name identifies a *variable* whose *value* is the object). <br>
This is the simplest means of abstraction as a simple variable name allows us to refer to the result of a compound operation.

## 1.1.3 Evaluating Combinations

The interpreter itself is following procedures: <br>

1. Evaluate the subexpressions of the combination.
2. Apply the procedure that is the value of the leftmost subexpression (the operator) to the arguments that are the values of the other subexpressions (the operands).

In order to evaluate a combination, you must first evaluate each element of the combination. The evaluation rule is *recursive* as one of it's steps is to invoke itself. <br>

Recursion is a good technique when dealing with a tree-like object. <br>

'Special forms', such as assigning a value to a variable are NOT combinations. <br>

The various kinds of expressions (each with its associated evaluation rule) constitute the syntax of the programming language. <br>

## 1.1.4 Compound Procedures

*Procedure definitions* are a more powerful means of abstraction by which a compound operation can be given a name and referred to as a unit (functions). <br>

*To square something, multiply it by itself* is expressed as: <br>

`(define (square x) (* x x))`

Then we can use that procedure definition like: <br>

`(square 21)`

to get the answer *441* <br>

We can use these to define other procuderes. For example, x2+y2 can be expressed as: <br>

`(+ (square x) (square y))`

## 1.1.5 The Substitution Model for Procedure Application

When evaluating a combination whose operator names a compound procedure, you: <br>

1. Retrieve the body of the combination (function)
2. Replace the parameters with the argument

so we <br>

1. Evaluate the operator to get the procedure to be applied
2. Evaluate the operands to get the arguments
3. Substitute these arguments into the procedure, which reduces to a simpler procedure.

`(f 5)`

The first step is to retrieve the body

`(sum-of-squares (+ a 1) (* a 2))`

then replace the parameters

`(sum-of-squares (+ a 1) (* a 2))`

To get

`(sum-of-squares (+ 5 1) (* 5 2))`

Then the arguments are evaluated again

`(+ (square 6) (square 10))`

Before being reduced

`(+ (* 6 6) (* 10 10))`

Then

`(+ 36 100)`

Then

`136`

This is called the *substitution model*, the meaning of procedure application. <br>

**IMPORTANT**

- The substitution model doesn't describe how interpreters work.
- The purpose of the substitution model is to help us think about procedure application.


### Applicative Order vs Normal Order

- *applicative-order evaluation* (the first evaluation method) - “evaluate the arguments and then apply”
- *normal-order evaluation* - “fully expand and then reduce”

Normal-order evaluation goes as follows: <br>

`(sum-of-squares (+ 5 1) (* 5 2))`

Gets expanded to

```
(+ (square (+ 5 1)) 
   (square (* 5 2)))
```

Then

```
(+ (* (+ 5 1) (+ 5 1)) 
   (* (* 5 2) (* 5 2)))
```

Before reducing

```
(+ (* 6 6) 
   (* 10 10))

(+ 36 100)

136
```

## 1.1.6 Conditional Expressions and Predicates

*Case Analysis* - defining a procedure/expression by testing cases and taking different actions depending depending on the different cases.

```
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
```

The 'abs' variable is assigned the value of 'x' if x > 0, '0' if x = 0, -x if x < 0. <br>
Each case is an expression and the first expression is a *predicate* - an expression where the value is either true or false. <br>

The interpreter evaluates each conditional expressional, until one is a predicate is found whose value is true, and then the *consequent expression* is returned as the value of the conditional expression. If none are true, the value of the conditonal expression is 'undefined' <br>

Another way to write conditional expressions is as follows: <br>

```
(define (abs x)
  (if (< x 0)
      (- x)
      x))
```

The interpreter evaluates the predicate, if it's true, it evaluates the *consequent* and returns it's value, otherwise it evaluates the *alternative* and returns that value. <br>

There are also logical composition operations: <br>

`(and ⟨e₁⟩ … ⟨eₙ⟩)`

The interpreter evaluates the expressions ⟨e⟩ one at a time, in left-to-right order. If any ⟨e⟩ evaluates to false, the value of the and expression is false, and the rest of the ⟨e⟩’s are not evaluated. If all ⟨e⟩’s evaluate to true values, the value of the and expression is the value of the last one.

`(or ⟨e₁⟩ … ⟨eₙ⟩)`

The interpreter evaluates the expressions ⟨e⟩ one at a time, in left-to-right order. If any ⟨e⟩ evaluates to a true value, that value is returned as the value of the or expression, and the rest of the ⟨e⟩’s are not evaluated. If all ⟨e⟩’s evaluate to false, the value of the or expression is false.

`(not ⟨e₁⟩ … ⟨eₙ⟩)`

The value of a not expression is true when the expression ⟨e⟩ evaluates to false, and false otherwise. <br>

'and' and 'or' are special forms, not procedures, as the subexpressions aren't always evaluated. <br>
'not' is an ordinary procedure.
