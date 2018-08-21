{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_factcheck2 (
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

bindir     = "C:\\Users\\otavio\\factcheck2\\.stack-work\\install\\fa6a03d3\\bin"
libdir     = "C:\\Users\\otavio\\factcheck2\\.stack-work\\install\\fa6a03d3\\lib\\x86_64-windows-ghc-8.4.3\\factcheck2-0.1.0.0-E2DFkiNxr0BLe8uw14U40y-factcheck2"
dynlibdir  = "C:\\Users\\otavio\\factcheck2\\.stack-work\\install\\fa6a03d3\\lib\\x86_64-windows-ghc-8.4.3"
datadir    = "C:\\Users\\otavio\\factcheck2\\.stack-work\\install\\fa6a03d3\\share\\x86_64-windows-ghc-8.4.3\\factcheck2-0.1.0.0"
libexecdir = "C:\\Users\\otavio\\factcheck2\\.stack-work\\install\\fa6a03d3\\libexec\\x86_64-windows-ghc-8.4.3\\factcheck2-0.1.0.0"
sysconfdir = "C:\\Users\\otavio\\factcheck2\\.stack-work\\install\\fa6a03d3\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "factcheck2_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "factcheck2_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "factcheck2_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "factcheck2_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "factcheck2_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "factcheck2_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
