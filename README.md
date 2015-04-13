# Module Documentation

## Module Node.UUID

#### `uuid`

``` purescript
uuid :: {  }
```


#### `UUID`

``` purescript
data UUID :: *
```


#### `UUIDEff`

``` purescript
data UUIDEff :: !
```


#### `UUIDBuffer`

``` purescript
type UUIDBuffer = [Number]
```


#### `eqUUID`

``` purescript
instance eqUUID :: Eq UUID
```


#### `showUUID`

``` purescript
instance showUUID :: Show UUID
```


#### `readUUID`

``` purescript
instance readUUID :: IsForeign UUID
```


#### `decodeJsonUUID`

``` purescript
instance decodeJsonUUID :: DecodeJson UUID
```


#### `encodeJsonUUID`

``` purescript
instance encodeJsonUUID :: EncodeJson UUID
```


#### `showuuid`

``` purescript
showuuid :: UUID -> String
```


#### `v1`

``` purescript
v1 :: forall eff. Eff (uuid :: UUIDEff | eff) UUID
```


#### `v4`

``` purescript
v4 :: forall eff. Eff (uuid :: UUIDEff | eff) UUID
```


#### `runUUID`

``` purescript
runUUID :: Eff (uuid :: UUIDEff) UUID -> UUID
```


#### `parse`

``` purescript
parse :: String -> UUIDBuffer
```


#### `unparse`

``` purescript
unparse :: UUIDBuffer -> UUID
```




