{-# LANGUAGE GeneralizedNewtypeDeriving, OverloadedStrings #-}
module Aria2.Types where

import Data.Text (Text)
import Data.String
import Data.Aeson
import Control.Applicative
import Control.Monad
import Network.URI

newtype GID = GID Text

instance ToJSON GID where
  toJSON (GID gid) = toJSON gid

instance FromJSON GID where
  parseJSON (String gid) = pure $ GID gid
  parseJSON _ = mzero

data OK = OK

instance ToJSON OK where
  toJSON OK = toJSON ("OK" :: String)

instance FromJSON OK where
  parseJSON (String "OK") = pure OK
  parseJSON _ = mzero

newtype MethodName = MethodName Text
          deriving (IsString)

newtype Host = Host Text
          deriving (IsString)

newtype Port = Port Text
          deriving (IsString)
