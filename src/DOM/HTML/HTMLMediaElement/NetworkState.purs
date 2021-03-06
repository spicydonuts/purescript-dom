module DOM.HTML.HTMLMediaElement.NetworkState (NetworkState(..)) where

import Prelude
import Data.Maybe (Maybe(..))
import Data.Enum (class Enum, class BoundedEnum, Cardinality(..), defaultSucc, defaultPred)

data NetworkState
  = NETWORK_EMPTY
  | NETWORK_IDLE
  | NETWORK_LOADING
  | NETWORK_NO_SOURCE

derive instance eqNetworkState :: Eq NetworkState

instance ordNetworkState :: Ord NetworkState where
  compare x y = compare (fromEnumNetworkState x) (fromEnumNetworkState y)

instance boundedNetworkState :: Bounded NetworkState where
  bottom = NETWORK_EMPTY
  top = NETWORK_NO_SOURCE

instance enumNetworkState :: Enum NetworkState where
  succ = defaultSucc toEnumNetworkState fromEnumNetworkState
  pred = defaultPred toEnumNetworkState fromEnumNetworkState

instance boundedEnumNetworkState :: BoundedEnum NetworkState where
  cardinality = Cardinality 4
  toEnum = toEnumNetworkState
  fromEnum = fromEnumNetworkState

instance showNetworkState :: Show NetworkState where
  show NETWORK_EMPTY = "NETWORK_EMPTY"
  show NETWORK_IDLE = "NETWORK_IDLE"
  show NETWORK_LOADING = "NETWORK_LOADING"
  show NETWORK_NO_SOURCE = "NETWORK_NO_SOURCE"

toEnumNetworkState :: Int -> Maybe NetworkState
toEnumNetworkState 0 = Just NETWORK_EMPTY
toEnumNetworkState 1 = Just NETWORK_IDLE
toEnumNetworkState 2 = Just NETWORK_LOADING
toEnumNetworkState 3 = Just NETWORK_NO_SOURCE
toEnumNetworkState _ = Nothing

fromEnumNetworkState :: NetworkState -> Int
fromEnumNetworkState NETWORK_EMPTY = 0
fromEnumNetworkState NETWORK_IDLE = 1
fromEnumNetworkState NETWORK_LOADING = 2
fromEnumNetworkState NETWORK_NO_SOURCE = 3
