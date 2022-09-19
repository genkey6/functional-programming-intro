import Control.Monad.Writer

enable :: (a -> a) -> Writer (Endo a) ()
enable = tell . Endo

plusEvenMinusOdd :: [Int] -> Writer (Endo Int) ()
plusEvenMinusOdd [] = return ()
plusEvenMinusOdd (n:ns) = do
  enable (\x -> if even n then x + n else x - n)
  plusEvenMinusOdd ns
