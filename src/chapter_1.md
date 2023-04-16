# Chapter 1


Dependent Type Theory
=====================

Dependent type theory is a powerful and expressive language, allowing
you to express complex mathematical assertions, write complex hardware
and software specifications, and reason about both of these in a
natural and uniform way. Lean is based on a version of dependent type
theory known as the *Calculus of Constructions*, with a countable
hierarchy of non-cumulative universes and inductive types. By the end
of this chapter, you will understand much of what this means.

## Simple Type Theory

"Type theory" gets its name from the fact that every expression has an
associated *type*. For example, in a given context, ``x + 0`` may
denote a natural number and ``f`` may denote a function on the natural
numbers. For those who like precise definitions, a Lean natural number
is an arbitrary-precision unsigned integer.

Here are some examples of how you can declare objects in Lean and
check their types.


Any text between ``/-`` and ``-/`` constitutes a comment block that is
ignored by Lean. Similarly, two dashes `--` indicate that the rest of
the line contains a comment that is also ignored. Comment blocks can
be nested, making it possible to "comment out" chunks of code, just as
in many programming languages.

The ``def`` keyword declares new constant symbols into the
working environment. In the example above, `def m : Nat := 1`
defines a new constant `m` of type `Nat` whose value is `1`.
The ``#check`` command asks Lean to report their
types; in Lean, auxiliary commands that query the system for
information typically begin with the hash (#) symbol.
The `#eval` command asks Lean to evaluate the given expression.
You should try
declaring some constants and type checking some expressions on your
own. Declaring new objects in this manner is a good way to experiment
with the system.

What makes simple type theory powerful is that you can build new types
out of others. For example, if ``a`` and ``b`` are types, ``a -> b``
denotes the type of functions from ``a`` to ``b``, and ``a × b``
denotes the type of pairs consisting of an element of ``a`` paired
with an element of ``b``, also known as the *Cartesian product*. Note
that `×` is a Unicode symbol. The judicious use of Unicode improves
legibility, and all modern editors have great support for it. In the
Lean standard library, you often see Greek letters to denote types,
and the Unicode symbol `→` as a more compact version of `->`.


```lean
theorem and_commutative (p q : Prop) : p ∧ q → q ∧ p :=
assume hpq : p ∧ q,
have hp : p, from and.left hpq,
have hq : q, from and.right hpq,
show q ∧ p, from and.intro hq hp
```