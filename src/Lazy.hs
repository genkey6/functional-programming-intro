module Lazy where

-- 再帰的定義による無限列
nats :: [Integer]
nats = 0 : map (+1) nats

-- フィボナッチ数列
fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

-- 無限に広がる2分木
data Tree a = Leaf { element :: a }
            | Fork { element :: a
                    , left    :: Tree a
                    , right   :: Tree a
            } deriving Show

-- 各ノードにそのノードの深さが入った無限に広がる2分木
dtree :: Tree Integer
dtree = dtree' 0 where
    dtree' depth = Fork { element = depth
                        , left = dtree' (depth + 1)
                        , right = dtree' (depth + 1)
                        }

-- 平均値を遅延評価で求める
mean :: [Double] -> Double
mean xs = let (res, len) = foldl (\(m, n) x -> (m + x / len, n + 1)) (0, 0) xs in res
