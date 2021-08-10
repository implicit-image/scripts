#!/usr/bin/env stack
{-
  stack --resolver lts-18.5 script
-}

import System.IO (withFile, IOMode(..), hGetContents)
import System.Environment (getArgs)
import Control.Monad (forM_)

main :: IO ()
main =
  do
  (f:_) <- getArgs
  withFile f ReadMode $ \h -> do
    c <- (return . lines) =<< hGetContents h
    forM_ c $ putStrLn
