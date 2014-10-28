--------------------------------------------------------------------------------
-- |
-- Module      :  Network.SimpleIRC.Messages.Lens
-- Copyright   :  (C) 2014 Ricky Elrod
-- License     :  BSD-style (see the file LICENSE)
-- Maintainer  :  Ricky Elrod <ricky@elrod.me>
-- Stability   :  provisional
-- Portability :  portable
--
-- This module provides lenses for types in
-- <https://hackage.haskell.org/package/simpleirc/docs/Network-SimpleIRC-Messages.html Network.SimpleIRC.Messages>.
-------------------------------------------------------------------------------

module Network.SimpleIRC.Messages.Lens
       ( -- * 'IrcMessage'
         nick, user, host, server, code, msg, chan, origin, other, raw
       ) where

import Data.ByteString
import Network.SimpleIRC.Messages

nick
  :: Functor f =>
     (Maybe ByteString -> f (Maybe ByteString))
     -> IrcMessage -> f IrcMessage
nick fn (IrcMessage a b c d e f g h i j) =
  fmap (\a' -> IrcMessage a' b c d e f g h i j) (fn a)

user
  :: Functor f =>
     (Maybe ByteString -> f (Maybe ByteString))
     -> IrcMessage -> f IrcMessage
user fn (IrcMessage a b c d e f g h i j) =
  fmap (\b' -> IrcMessage a b' c d e f g h i j) (fn b)

host
  :: Functor f =>
     (Maybe ByteString -> f (Maybe ByteString))
     -> IrcMessage -> f IrcMessage
host fn (IrcMessage a b c d e f g h i j) =
  fmap (\c' -> IrcMessage a b c' d e f g h i j) (fn c)

server
  :: Functor f =>
     (Maybe ByteString -> f (Maybe ByteString))
     -> IrcMessage -> f IrcMessage
server fn (IrcMessage a b c d e f g h i j) =
  fmap (\d' -> IrcMessage a b c d' e f g h i j) (fn d)

code
  :: Functor f =>
     (ByteString -> f ByteString) -> IrcMessage -> f IrcMessage
code fn (IrcMessage a b c d e f g h i j) =
  fmap (\e' -> IrcMessage a b c d e' f g h i j) (fn e)

msg
  :: Functor f =>
     (ByteString -> f ByteString) -> IrcMessage -> f IrcMessage
msg fn (IrcMessage a b c d e f g h i j) =
  fmap (\f' -> IrcMessage a b c d e f' g h i j) (fn f)

chan
  :: Functor f =>
     (Maybe ByteString -> f (Maybe ByteString))
     -> IrcMessage -> f IrcMessage
chan fn (IrcMessage a b c d e f g h i j) =
  fmap (\g' -> IrcMessage a b c d e f g' h i j) (fn g)

origin
  :: Functor f =>
     (Maybe ByteString -> f (Maybe ByteString))
     -> IrcMessage -> f IrcMessage
origin fn (IrcMessage a b c d e f g h i j) =
  fmap (\h' -> IrcMessage a b c d e f g h' i j) (fn h)

other
  :: Functor f =>
     (Maybe [ByteString] -> f (Maybe [ByteString]))
     -> IrcMessage -> f IrcMessage
other fn (IrcMessage a b c d e f g h i j) =
  fmap (\i' -> IrcMessage a b c d e f g h i' j) (fn i)

raw
  :: Functor f =>
     (ByteString -> f ByteString) -> IrcMessage -> f IrcMessage
raw fn (IrcMessage a b c d e f g h i j) =
  fmap (\j' -> IrcMessage a b c d e f g h i j') (fn j)
