import System.IO
import Data.Char


type KeyCode = String
type KeySymbol = String

main :: IO ()
main = do
  keylines <- lines <$> (hGetContents =<< openFile "./keys.txt" ReadMode)
  writeFile "./keyconfig.txt" $ concatMap mkKeyConfig keylines


getKeySymbol :: String -> KeySymbol
getKeySymbol keyline
  | length nospaces >= 4 = (!! 0) $ getSymbolString nospaces
  | otherwise            = ""
  where
    nospaces = words keyline
    getSymbolString [] = []
    getSymbolString (x:xs)
      | elem '=' x = xs
      | otherwise   = getSymbolString xs

getKeyCode :: String -> KeyCode
getKeyCode keyline = let line = words keyline in
  if length line > 3 then
    line !! 1
  else
    mempty


mkKeyConfig :: String -> String
mkKeyConfig keyline
  | expr !! 1 /= "" && expr !! 3 /= "" = concat expr
  | otherwise                          = ""
  where
    sym = getKeySymbol $ fmap toUpper keyline
    code = getKeyCode $ fmap toUpper keyline
    gap =  replicate (25 - length sym) ' '
    expr = ["set $KEY_", sym, gap, code, "\n"]
