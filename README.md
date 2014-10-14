# Module Documentation

## Module Node.UUID

### Types

    data UUID :: *

    type UUIDBuffer  = [Number]

    data UUIDEff :: !


### Type Class Instances

    instance decodeJsonUUID :: DecodeJson UUID

    instance encodeJsonUUID :: EncodeJson UUID

    instance eqUUID :: Eq UUID

    instance readUUID :: IsForeign UUID

    instance showUUID :: Show UUID


### Values

    parse :: String -> UUIDBuffer

    runUUID :: Eff (uuid :: UUIDEff) UUID -> UUID

    showuuid :: UUID -> String

    unparse :: UUIDBuffer -> UUID

    uuid :: {  }

    v1 :: forall eff. Eff (uuid :: UUIDEff | eff) UUID

    v4 :: forall eff. Eff (uuid :: UUIDEff | eff) UUID



