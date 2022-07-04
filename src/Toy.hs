module Toy where

type SourceCode = String
type Interactive = [Input] -> [Output]
type Input  = String
type Output = String

drive :: Interactive -> (String -> String)
drive f = unlines . f . lines

toy :: SoruceCode -> Interactive
toy prog inputs = map output . eval . initState prog inputs))

type Memory = ()

load :: SourceCode -> Memory
load = undefined

initState :: Memory -> ([Input] -> ToyState)
initState mem inputs = undefined

output :: Toystate -> Output
output state = undefined

type Toystate = ()

eval :: ToyState -> [ToyState]
eval state = state: rests
    where
        rests | isFinal state = []
              | otherwise     = eval [step state]

isFinal :: Toystate -> Bool
isFinal state = undefined

step :: ToyState -> ToyState
step state = undefined
