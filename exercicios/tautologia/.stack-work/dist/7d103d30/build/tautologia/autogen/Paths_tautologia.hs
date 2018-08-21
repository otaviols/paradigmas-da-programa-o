{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_tautologia (
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

bindir     = "C:\\Users\\ramon\\Downloads\\tautologia\\.stack-work\\install\\bf6b262a\\bin"
libdir     = "C:\\Users\\ramon\\Downloads\\tautologia\\.stack-work\\install\\bf6b262a\\lib\\x86_64-windows-ghc-8.4.3\\tautologia-0.1.0.0-30fKEeHiaHV3TTfZ8iYoco-tautologia"
dynlibdir  = "C:\\Users\\ramon\\Downloads\\tautologia\\.stack-work\\install\\bf6b262a\\lib\\x86_64-windows-ghc-8.4.3"
datadir    = "C:\\Users\\ramon\\Downloads\\tautologia\\.stack-work\\install\\bf6b262a\\share\\x86_64-windows-ghc-8.4.3\\tautologia-0.1.0.0"
libexecdir = "C:\\Users\\ramon\\Downloads\\tautologia\\.stack-work\\install\\bf6b262a\\libexec\\x86_64-windows-ghc-8.4.3\\tautologia-0.1.0.0"
sysconfdir = "C:\\Users\\ramon\\Downloads\\tautologia\\.stack-work\\install\\bf6b262a\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "tautologia_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "tautologia_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "tautologia_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "tautologia_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tautologia_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "tautologia_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
