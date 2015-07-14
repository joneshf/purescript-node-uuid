module Node.UUID where

  import Prelude
  import Control.Monad.Eff (Eff())

  import Data.Argonaut ((?>>=), encodeJson, toString)
  import Data.Argonaut.Decode (DecodeJson)
  import Data.Argonaut.Encode (EncodeJson)
  import Data.Either (Either(..))
  import Data.Foreign (readString)
  import Data.Foreign.Class (IsForeign)

  foreign import uuid :: {}

  foreign import data UUID :: *
  foreign import data UUIDEff :: !
  type UUIDBuffer = Array Number

  instance eqUUID :: Eq UUID where
    eq ident ident' = showuuid ident == showuuid ident'

  instance showUUID :: Show UUID where
    show ident = showuuid ident

  instance readUUID :: IsForeign UUID where
    read u = (\u' -> parse u' # unparse) <$> readString u

  instance decodeJsonUUID :: DecodeJson UUID where
    decodeJson json = toString json
                 ?>>= "UUID"
                  >>= parse
                  >>> unparse
                  >>> Right

  instance encodeJsonUUID :: EncodeJson UUID where
    encodeJson uuid = encodeJson $ show uuid

  foreign import showuuid :: UUID -> String
  foreign import v1 :: forall eff. Eff (uuid :: UUIDEff | eff) UUID
  foreign import v4 :: forall eff. Eff (uuid :: UUIDEff | eff) UUID
  foreign import runUUID :: Eff (uuid :: UUIDEff) UUID -> UUID
  foreign import parse :: String -> UUIDBuffer
  foreign import unparse :: UUIDBuffer -> UUID
