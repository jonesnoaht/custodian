{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds         #-}

module MyLib (someFunc
             , genSvg
             , contents
             ) where

import Graphics.Rasterific
import Codec.CBOR
import Codec.CBOR.Read
import Data.Aeson
import qualified Data.ByteString as BS
import Cardano.Crypto.Wallet
import Cardano.Crypto.Wallet.Encrypted
import Cardano.Crypto.Wallet.Types
import Cardano.Crypto.Wallet.Pure
import Cardano.Crypto.Encoding.BIP39
import Cardano.Crypto.Encoding.Seed
import Crypto.Math.Edwards25519
import Crypto.Math.Bits
import Crypto.Math.Bytes
import Crypto.Math.NatMath
import Crypto.ECC.Ed25519Donna
import Crypto.ECC.Ed25519BIP32
import Crypto.Encoding.BIP39
import Crypto.Encoding.BIP39.Dictionary
import Crypto.Encoding.BIP39.English
import Graphics.Svg
import Data.Text.Lazy
import System.Random

someFunc :: IO ()
someFunc = putStrLn "someFunc"

genSvg :: Element -> Text
genSvg content =
  prettyText $ doctype
  <> with (svg11_ content) [Version_ <<- "1.1", Width_ <<- "500", Height_ <<- "300"]

contents :: Element
contents =
  rect_ [ Width_ <<- "400", Height_ <<- "200", Stroke_ <<- "black", Fill_ <<- "white" ]
  <> text_   [ X_ <<- "10", Y_ <<- "20", Font_size_ <<- "20"
             , Text_anchor_ <<- "start", Stroke_ <<- "black", Fill_ <<- "white" ] "words words words"
