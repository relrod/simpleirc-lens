--------------------------------------------------------------------------------
-- |
-- Module      :  Network.SimpleIRC.Core.Lens
-- Copyright   :  (C) 2014 Ricky Elrod
-- License     :  BSD-style (see the file LICENSE)
-- Maintainer  :  Ricky Elrod <ricky@elrod.me>
-- Stability   :  provisional
-- Portability :  portable
--
-- This module provides lenses for types in
-- <https://hackage.haskell.org/package/simpleirc/docs/Network-SimpleIRC-Core.html Network.SimpleIRC.Core>.
-------------------------------------------------------------------------------

module Network.SimpleIRC.Core.Lens
       ( -- * 'IrcConfig'
         addr, port, secure, nick, pass, username, realname, channels, events,
         ctcpVersion, ctcpTime, ctcpPingTimeoutInterval
       ) where

import Network.SimpleIRC.Core

addr
  :: Functor f => (String -> f String) -> IrcConfig -> f IrcConfig
addr fn (IrcConfig a b c d e f g h i j k l) =
  fmap (\a' -> IrcConfig a' b c d e f g h i j k l) (fn a)

port :: Functor f => (Int -> f Int) -> IrcConfig -> f IrcConfig
port fn (IrcConfig a b c d e f g h i j k l) =
  fmap (\b' -> IrcConfig a b' c d e f g h i j k l) (fn b)

secure :: Functor f => (Bool -> f Bool) -> IrcConfig -> f IrcConfig
secure fn (IrcConfig a b c d e f g h i j k l) =
  fmap (\c' -> IrcConfig a b c' d e f g h i j k l) (fn c)

nick
  :: Functor f => (String -> f String) -> IrcConfig -> f IrcConfig
nick fn (IrcConfig a b c d e f g h i j k l) =
  fmap (\d' -> IrcConfig a b c d' e f g h i j k l) (fn d)

pass
  :: Functor f =>
     (Maybe String -> f (Maybe String)) -> IrcConfig -> f IrcConfig
pass fn (IrcConfig a b c d e f g h i j k l) =
  fmap (\e' -> IrcConfig a b c d e' f g h i j k l) (fn e)

username
  :: Functor f => (String -> f String) -> IrcConfig -> f IrcConfig
username fn (IrcConfig a b c d e f g h i j k l) =
  fmap (\f' -> IrcConfig a b c d e f' g h i j k l) (fn f)

realname
  :: Functor f => (String -> f String) -> IrcConfig -> f IrcConfig
realname fn (IrcConfig a b c d e f g h i j k l) =
  fmap (\g' -> IrcConfig a b c d e f g' h i j k l) (fn g)

channels
  :: Functor f =>
     ([String] -> f [String]) -> IrcConfig -> f IrcConfig
channels fn (IrcConfig a b c d e f g h i j k l) =
  fmap (\h' -> IrcConfig a b c d e f g h' i j k l) (fn h)

events
  :: Functor f =>
     ([IrcEvent] -> f [IrcEvent]) -> IrcConfig -> f IrcConfig
events fn (IrcConfig a b c d e f g h i j k l) =
  fmap (\i' -> IrcConfig a b c d e f g h i' j k l) (fn i)

ctcpVersion
  :: Functor f => (String -> f String) -> IrcConfig -> f IrcConfig
ctcpVersion fn (IrcConfig a b c d e f g h i j k l) =
  fmap (\j' -> IrcConfig a b c d e f g h i j' k l) (fn j)

ctcpTime
  :: Functor f =>
     (IO String -> f (IO String)) -> IrcConfig -> f IrcConfig
ctcpTime fn (IrcConfig a b c d e f g h i j k l) =
  fmap (\k' -> IrcConfig a b c d e f g h i j k' l) (fn k)

ctcpPingTimeoutInterval
  :: Functor f => (Int -> f Int) -> IrcConfig -> f IrcConfig
ctcpPingTimeoutInterval fn (IrcConfig a b c d e f g h i j k l) =
  fmap (\l' -> IrcConfig a b c d e f g h i j k l') (fn l)
