# Purely Functional Data Structures

This repository will contain implementations of some purely functional data structures discussed in [Okasaki's book](https://www.goodreads.com/en/book/show/594288.Purely_Functional_Data_Structures). 

## Heaps

Heap is data structure that supports the following interface

```haskell
class Heap h where
    empty :: Ord e => h e
    push :: Ord e => h e -> e -> h e
    pop :: Ord e => h e -> h e
    peek :: h e -> e
```

### Leftist heap

## Sets

Set is data structure that supports the following interface

```haskell
class Set s where
    empty :: Ord e => s e
    add :: Ord e => s e -> e -> s e
    remove :: Ord e => s e -> e -> s e
    contains :: Ord e => s e -> e -> Bool
```