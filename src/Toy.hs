module Toy where

type SourceCode = String
type Interactive = [Input] -> [Output]
type Input  = String
type Output = String

drive :: Interactive -> (String -> String)
drive f = unlines . f . lines

toy :: SoruceCode -> Interactive
toy prog inputs = map output . eval . initState prog inputs

type Label  = String
type Memory = [(Label, Contact)]

data Content
     = Code Code
     | Data Int

load :: SourceCode -> Memory
load = undefined

initState :: Memory -> ([Input] -> ToyState)
initState mem inputs = undefined

output :: Toystate -> Output
output state = case state of
    (_, _, _, _, output) -> output

type Toystate = (Final, Memory, Acc, [Input], Output)

type Final = Bool
type Acc   = Int

eval :: ToyState -> [ToyState]
eval state = state: rests
    where
        rests | isFinal state = []
              | otherwise     = eval [step state]

isFinal :: Toystate -> Bool
isFinal (f, _, _, _, _) = f

step :: ToyState -> ToyState
step state = execute (decode(fetch state)) state

type Code = (Operator, Operand)

data Operator
    = STOP
    | GET
    | PRINT
    | LOAD
    | STORE
    | ADD
    | SUB
    | GOTO
    | IFZERO
    | IFPOS
    deriving (Show, Read)

data Operand
    = None
    | Num Int
    | Lab Label
    deriving (Show)

fetch :: ToyState -> Code
fetch state = undefined

type Instruction = Toystate -> ToyState

decode :: Code -> Instruction
decode code = undefined

execete :: Instruction -> ToyState -> ToyState
execute cmd state = cmd state
