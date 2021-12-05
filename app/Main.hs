{-# LANGUAGE OverloadedStrings #-}

module Main where

import GHC.IO
import Graphics.Rasterific
import qualified Codec.CBOR as CB
import Data.Text.Lazy (unpack)
import MyLib


main :: IO ()
main = do
  let filename = "phrase.svg" in
    Prelude.writeFile filename mySvg
  where
    mySvg = Data.Text.Lazy.unpack $ genSvg contents
