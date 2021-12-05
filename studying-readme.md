# Cardano Notes

## Notes

### Scripting

The IO monads in Plutus output nothing because they output out of the
program onto the blockchain. We can output true or false or
whatever. If the output type is not "nothing", then we may have a
problem. Better yet, we attempt to capture errors.

To look up values in the ValidationMonad, we can use lkp functions:

 - lkpOutputs
 - lkpTxOut
 - lkpValue
 
There are many such functions that provide utility for this sort of
thing in the Ledger library. We also find wonderful functions that
generate objects of type Script from the Context, MintingPolicy, and
Redeemer, for example. We can also validate using the StakeValidator.

The `ValidationMonad` itself is of the type 

```
type ValidationMonad :: (* -> *) -> Constraint
``` 

`getTip` will provide the tip. Type `get` in the repl and then tab for
command completion.

### Applications

The `StakeValidator` should be super useful for writing smart
contracts that allow funds or NFTs or what have you to be unlocked
upon successful delegation of stake (or something like that, anyway).



## Progres

### Tasks 

 - [ ] Make an app
 - [ ] 
 
### Log

After updating to the newest git in the remote, you can run nix-shell
and then `cabal build plutus-core` and then `cabal repl PlutusCore`.
You can find all of the other modules that you can repl into in the
`.cabal` file in plutus-core.

20211008150548NJ Working on this and making good progress.

20211009094121NJ Block is a type.

20211009094925NJ I need to check the lecture notes to figure out how to get the Blockchain object in the first place.

```haskell

valuePaidTo :: TxInfo -> PubKeyHash -> Value

mkTxInfo :: ValidationMonad m => Tx -> m TxInfo
mkValidatorScript ::
  PlutusTx.Code.CompiledCode
    (PlutusTx.Builtins.Internal.BuiltinData
     -> PlutusTx.Builtins.Internal.BuiltinData
     -> PlutusTx.Builtins.Internal.BuiltinData
     -> ())
  -> Validator
```

The validator monad contains TxInfo. How do we extract it?

`:t valuePaidTo (mkTxInfo) () `

```
:t getPubKey . toPublicKey $ privateKey1
getPubKey . toPublicKey $ privateKey1
pubKeyAddress $ toPublicKey $ privateKey1

:t txOutAddress . head . outputsProduced

:t unValidatorScript . mkValidatorScript

:t scriptHash . unValidatorScript . mkValidatorScript

:t scriptHashAddress

:t fromCompiledCode

-- The following are from Ledger.Scripts and Plutus.ChainIndex respectively.
-- FromJSON is from Data.Aeson.

:t unValidatorScript . ValidatorFromHash . FromJSON
```

The definition of validatorHash can be found in Ledger.Scripts. ValidatorHash

```
-- | Script runtime representation of a @Digest SHA256@.
newtype ValidatorHash =
    ValidatorHash Builtins.BuiltinByteString
    deriving (IsString, Haskell.Show, Serialise, Pretty) via LedgerBytes
    deriving stock (Generic)
    deriving newtype (Haskell.Eq, Haskell.Ord, Eq, Ord, Hashable, ToData, FromData, UnsafeFromData)
    deriving anyclass (FromJSON, ToJSON, ToJSONKey, FromJSONKey, NFData)
```

 - [ ] Maybe use a lens to get something out of a monad?
 
20211009134448NJ I think the constraints or functions like
`spendsOutput` are technically performing static analysis.

> address: The address of an utxo says where the output is ``going''.
> The address stipulates the conditions for unlocking the output.  This
> can be a public key hash, or (in the eutxo-model) a script hash.

The above quote is from the [plutus ledger glossary](https://github.com/input-output-hk/plutus/blob/e2cd641501d13715120329092b3a93df35493a44/plutus-report/glossary.tex). Thus, the address, or contains, a script hash.

20211009181150NJ Found some awesome tools in Plutus.Contract that appear to be for an application backend in which we watch an Address and get chain info until a certain time.

```
watchAddressUntilTime ::
  AsContractError e =>
  Plutus.V1.Ledger.Address.Address
  -> Plutus.V1.Ledger.Time.POSIXTime
  -> Contract
       w
       s
       e
       (Data.Map.Internal.Map
          Plutus.V1.Ledger.Tx.TxOutRef Ledger.Tx.ChainIndexTxOut)
```

[Source](https://github.com/input-output-hk/plutus/blob/e2cd641501d13715120329092b3a93df35493a44/plutus-contract/src/Plutus/Contract/Request.hs)

20211012153235NJ 

Check out the following code. I figured this out. God it was painful.

```haskell
:t deriveXPub (XPub (Edwards25519.pointCompressed $ xprvPub (deriveXPrv (XPrv (Edwards25519.scalar $ fst $ hFinalize $ hInitSeed $ hardenedTag) (snd $ hFinalize $ hInitSeed $ hardenedTag)) 1)) (snd $ hFinalize $ hInitSeed $ hardenedTag)) 10
```

[Link](https://input-output-hk.github.io/ouroboros-network/cardano-crypto)

[Cardano Tx Dependencies](https://hackage.haskell.org/package/cardano-transactions-1.0.0/dependencies)

> 10.1. Language options
> 
> The language extensions control what variation of the language are
> permitted.
> 
> Language options can be controlled in two ways:
> 
>     Every language option can switched on by a command-line flag
>     “-X...” (e.g. -XTemplateHaskell), and switched off by the flag
>     “-XNo...”; (e.g. -XNoTemplateHaskell).  Language options
>     recognised by Cabal can also be enabled using the LANGUAGE
>     pragma, thus {-# LANGUAGE TemplateHaskell #-} (see LANGUAGE
>     pragma).

[The link](https://downloads.haskell.org/~ghc/8.4.3/docs/html/users_guide/glasgow_exts.html#language-pragma)

B.MemView nullPtr (1::Int)

:t B.create 5

B.copyByteArrayToPtr :: ba -> Ptr p -> IO ()

(B.copyByteArrayToPtr . (B.zero 0))

B.create 5 . B.zero 1

XPrv (fst <$> (hFinalize . hInitSeed <$> seedNew)) (snd <$> (hFinalize . hInitSeed <$> seedNew))

(fmap XPrv (Edwards25519.scalar <$> fst <$> (hFinalize . hInitSeed <$> seedNew))) <*> (snd <$> (hFinalize . hInitSeed <$> seedNew))
