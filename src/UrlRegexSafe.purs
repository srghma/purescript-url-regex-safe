module UrlRegexSafe where

import Data.String.Regex (Regex) as Regex

type UrlRegexSafeOptions =
  { exact          :: Boolean
  , strict         :: Boolean
  , auth           :: Boolean
  , localhost      :: Boolean
  , parens         :: Boolean
  , apostrophes    :: Boolean
  , trailingPeriod :: Boolean
  , ipv4           :: Boolean
  , ipv6           :: Boolean
  -- | , tlds           :: Boolean -- TODO: how to expose?
  -- | , returnString   :: Boolean -- cannot expose
  }

foreign import urlRegexSafe :: UrlRegexSafeOptions -> Regex.Regex

defaultUrlRegexSafeOptions :: UrlRegexSafeOptions
defaultUrlRegexSafeOptions =
  { exact: false
  , strict: false
  , auth: false
  , localhost: true
  , parens: false
  , apostrophes: false
  , trailingPeriod: false
  , ipv4: true
  , ipv6: true
  }
