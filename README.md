# Module Documentation

## Module Data.UUID

### Types

    data UUID :: *

    type UUIDBuffer  = [Prim.Number]

    data UUIDEff :: !


### Type Class Instances

    instance eqUUID :: Eq UUID

    instance readUUID :: ReadForeign UUID

    instance showUUID :: Show UUID


### Values

    parse :: Prim.String -> UUIDBuffer

    runUUID :: Eff (uuid :: UUIDEff) UUID -> UUID

    showuuid :: UUID -> Prim.String

    unparse :: UUIDBuffer -> UUID

    uuid :: {  }

    v1 :: forall eff. Eff (uuid :: UUIDEff | eff) UUID

    v4 :: forall eff. Eff (uuid :: UUIDEff | eff) UUID



