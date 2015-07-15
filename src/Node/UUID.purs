module Node.UUID where

  import Control.Monad.Eff (Eff())

  import Data.Argonaut.Combinators ((?>>=))
  import Data.Argonaut.Decode (DecodeJson, decodeMaybe)
  import Data.Argonaut.Encode (EncodeJson, encodeJson)
  import Data.Either (Either(Right))
  import Data.Foreign (readString)
  import Data.Foreign.Class (IsForeign)

  import Prelude (Eq, Show, (#), ($), (==), (<$>), (>>>), (>>=), show)

  foreign import data UUID :: *
  foreign import data UUIDEff :: !

  foreign import uuid :: {}
  foreign import showuuid :: UUID -> String
  foreign import v1 :: forall eff. Eff (uuid :: UUIDEff | eff) UUID
  foreign import v4 :: forall eff. Eff (uuid :: UUIDEff | eff) UUID
  foreign import runUUID :: Eff (uuid :: UUIDEff) UUID -> UUID
  foreign import parse :: String -> UUIDBuffer
  foreign import unparse :: UUIDBuffer -> UUID

  type UUIDBuffer = Array Number

  instance eqUUID :: Eq UUID where
    eq ident ident' = showuuid ident == showuuid ident'

  instance showUUID :: Show UUID where
    show ident = showuuid ident

  instance isForeignUUID :: IsForeign UUID where
    read u = (\u' -> parse u' # unparse) <$> readString u

  instance decodeJsonUUID :: DecodeJson UUID where
    decodeJson json = decodeMaybe json
                 ?>>= "UUID"
                  >>= parse
                  >>> unparse
                  >>> Right

  instance encodeJsonUUID :: EncodeJson UUID where
    encodeJson uuid = encodeJson $ show uuid
