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
         addr, port, nick, pass, username, realname, channels, events,
         ctcpVersion, ctcpTime, ctcpPingTimeoutInterval
       ) where

import Network.SimpleIRC.Core

addr
  :: Functor f => (String -> f String) -> IrcConfig -> f IrcConfig
addr fn (IrcConfig a b c d e f g h i j k) =
  fmap (\a' -> IrcConfig a' b c d e f g h i j k) (fn a)

port :: Functor f => (Int -> f Int) -> IrcConfig -> f IrcConfig
port fn (IrcConfig a b c d e f g h i j k) =
  fmap (\b' -> IrcConfig a b' c d e f g h i j k) (fn b)

nick
  :: Functor f => (String -> f String) -> IrcConfig -> f IrcConfig
nick fn (IrcConfig a b c d e f g h i j k) =
  fmap (\c' -> IrcConfig a b c' d e f g h i j k) (fn c)

pass
  :: Functor f =>
     (Maybe String -> f (Maybe String)) -> IrcConfig -> f IrcConfig
pass fn (IrcConfig a b c d e f g h i j k) =
  fmap (\d' -> IrcConfig a b c d' e f g h i j k) (fn d)

username
  :: Functor f => (String -> f String) -> IrcConfig -> f IrcConfig
username fn (IrcConfig a b c d e f g h i j k) =
  fmap (\e' -> IrcConfig a b c d e' f g h i j k) (fn e)

realname
  :: Functor f => (String -> f String) -> IrcConfig -> f IrcConfig
realname fn (IrcConfig a b c d e f g h i j k) =
  fmap (\f' -> IrcConfig a b c d e f' g h i j k) (fn f)

channels
  :: Functor f =>
     ([String] -> f [String]) -> IrcConfig -> f IrcConfig
channels fn (IrcConfig a b c d e f g h i j k) =
  fmap (\g' -> IrcConfig a b c d e f g' h i j k) (fn g)

events
  :: Functor f =>
     ([IrcEvent] -> f [IrcEvent]) -> IrcConfig -> f IrcConfig
events fn (IrcConfig a b c d e f g h i j k) =
  fmap (\h' -> IrcConfig a b c d e f g h' i j k) (fn h)

ctcpVersion
  :: Functor f => (String -> f String) -> IrcConfig -> f IrcConfig
ctcpVersion fn (IrcConfig a b c d e f g h i j k) =
  fmap (\i' -> IrcConfig a b c d e f g h i' j k) (fn i)

ctcpTime
  :: Functor f =>
     (IO String -> f (IO String)) -> IrcConfig -> f IrcConfig
ctcpTime fn (IrcConfig a b c d e f g h i j k) =
  fmap (\j' -> IrcConfig a b c d e f g h i j' k) (fn j)

ctcpPingTimeoutInterval
  :: Functor f => (Int -> f Int) -> IrcConfig -> f IrcConfig
ctcpPingTimeoutInterval fn (IrcConfig a b c d e f g h i j k) =
  fmap (\k' -> IrcConfig a b c d e f g h i j k') (fn k)
