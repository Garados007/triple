module Triple exposing
  ( Triple, triple
  , first, second, third
  , insertFirst, insertSecond, insertThird
  , dropFirst, dropSecond, dropThird
  , mapFirst, mapSecond, mapThird, mapAll
  )

{-| The elm core library is missing some functions that are usefull and I use often for my projects.

This library contains many functions to work with Triple types that are similar to the Tuple but
contains three different values.
-}

-- CREATION

{-| a type alias for the triple (a, b, c) for convenience -}
type alias Triple a b c = (a, b, c)

{-| creates a new triple -}
triple : a -> b -> c -> Triple a b c
triple a b c = (a, b, c)

-- ACCESS

{-| Access the first entry of the triple type -}
first : Triple a b c -> a
first (a, _, _) = a

{-| Access the second entry of the triple type -}
second : Triple a b c -> b
second (_, b, _) = b

{-| Access the third entry of the triple type -}
third : Triple a b c -> c
third (_, _, c) = c

-- INSERTION

{-| Add a component before the tuple to create a triple -}
insertFirst : a -> (b, c) -> Triple a b c
insertFirst a (b, c) = (a, b, c)

{-| Insert a component inside a tuple to create a triple -}
insertSecond : b -> (a, c) -> Triple a b c
insertSecond b (a, c) = (a, b, c)

{-| Add a component after the tuple to create a triple -}
insertThird : c -> (a, b) -> Triple a b c
insertThird c (a, b) = (a, b, c)

-- REMOVING

{-| Drop the first component of the triple to create a tuple -}
dropFirst : Triple a b c -> (b, c)
dropFirst (_, b, c) = (b, c)

{-| Drop the second component of the triple to create a tuple -}
dropSecond : Triple a b c -> (a, c)
dropSecond (a, _, c) = (a, c)

{-| Drop the third component of the triple to create a tuple -}
dropThird : Triple a b c -> (a, b)
dropThird (a, b, _) = (a, b)

-- MAPPING

{-| Map the first component of the triple -}
mapFirst : (a1 -> a2) -> Triple a1 b c -> Triple a2 b c
mapFirst mapper (a, b, c) = (mapper a, b, c)

{-| Map the second component of the triple -}
mapSecond : (b1 -> b2) -> Triple a b1 c -> Triple a b2 c
mapSecond mapper (a, b, c) = (a, mapper b, c)

{-| Map the third component of the triple -}
mapThird : (c1 -> c2) -> Triple a b c1 -> Triple a b c2
mapThird mapper (a, b, c) = (a, b, mapper c)

{-| Map all components of the triple -}
mapAll : (a1 -> a2) -> (b1 -> b2) -> (c1 -> c2) -> Triple a1 b1 c1 -> Triple a2 b2 c2
mapAll mapA mapB mapC (a, b, c) = (mapA a, mapB b, mapC c)


