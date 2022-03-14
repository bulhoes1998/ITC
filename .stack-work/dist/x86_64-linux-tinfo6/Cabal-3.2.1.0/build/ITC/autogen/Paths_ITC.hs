{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_ITC (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/lucas/projetos/ITC/.stack-work/install/x86_64-linux-tinfo6/5eb9e2bb6f427d9393fb5ea12478a88375424d5174301896ecce4eecd4dadb04/8.10.7/bin"
libdir     = "/home/lucas/projetos/ITC/.stack-work/install/x86_64-linux-tinfo6/5eb9e2bb6f427d9393fb5ea12478a88375424d5174301896ecce4eecd4dadb04/8.10.7/lib/x86_64-linux-ghc-8.10.7/ITC-0.1.0.0-1tsVLYUtRjDKBH4lAoc3PH-ITC"
dynlibdir  = "/home/lucas/projetos/ITC/.stack-work/install/x86_64-linux-tinfo6/5eb9e2bb6f427d9393fb5ea12478a88375424d5174301896ecce4eecd4dadb04/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/lucas/projetos/ITC/.stack-work/install/x86_64-linux-tinfo6/5eb9e2bb6f427d9393fb5ea12478a88375424d5174301896ecce4eecd4dadb04/8.10.7/share/x86_64-linux-ghc-8.10.7/ITC-0.1.0.0"
libexecdir = "/home/lucas/projetos/ITC/.stack-work/install/x86_64-linux-tinfo6/5eb9e2bb6f427d9393fb5ea12478a88375424d5174301896ecce4eecd4dadb04/8.10.7/libexec/x86_64-linux-ghc-8.10.7/ITC-0.1.0.0"
sysconfdir = "/home/lucas/projetos/ITC/.stack-work/install/x86_64-linux-tinfo6/5eb9e2bb6f427d9393fb5ea12478a88375424d5174301896ecce4eecd4dadb04/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ITC_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ITC_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "ITC_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "ITC_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ITC_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ITC_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
