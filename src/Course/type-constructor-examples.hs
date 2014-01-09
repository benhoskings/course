flatten ::
  List (List a)
  -> List a
flatten = flatMap id

class C f where
  flatMap' ::
    (a -> f b)
    -> f a
    -> f b

instance C List where
  flatMap' =
    flatMap

instance C ((->) t) where
  flatMap' k g =
    \x -> k (g x) x

--  many instances

flatten' ::
  C f =>
  f (f a)
  -> f a
flatten' =
   flatMap' id
