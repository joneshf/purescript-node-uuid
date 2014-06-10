module Data.UUID where

  import Control.Monad.Eff

  import Data.Either
  import Data.Foreign

  foreign import uuid
    "var uuid;\
    \try {\
    \  require;\
    \  uuid = require('node-uuid');\
    \} catch (e) {\
    \  uuid = window.uuid;\
    \}" :: {}

  foreign import data UUID :: *
  foreign import data UUIDEff :: !
  type UUIDBuffer = [Number]

  instance eqUUID :: Eq UUID where
    (==) ident ident' = showuuid ident == showuuid ident'
    (/=) ident ident' = not (ident == ident')

  instance showUUID :: Show UUID where
    show ident = showuuid ident

  instance readUUID :: ReadForeign UUID where
    read = ForeignParser \x -> Right $ unparse $ parse $ show x

  foreign import showuuid
    "function showuuid(ident) {\
    \  return ident.toString();\
    \}" :: UUID -> String

  foreign import v1
    "function v1() {\
    \  return uuid.v1();\
    \}" :: forall eff. Eff (uuid :: UUIDEff | eff) UUID

  foreign import v4
    "function v4() {\
    \  return uuid.v4();\
    \}" :: forall eff. Eff (uuid :: UUIDEff | eff) UUID

  foreign import runUUID
    "function runUUID(UUID) {\
    \  return UUID();\
    \}" :: Eff (uuid :: UUIDEff) UUID -> UUID

  foreign import parse
    "function parse(str) {\
    \  return uuid.parse(str);\
    \}" :: String -> UUIDBuffer

  foreign import unparse
    "function unparse(buffer) {\
    \  return uuid.unparse(buffer);\
    \}" :: UUIDBuffer -> UUID
