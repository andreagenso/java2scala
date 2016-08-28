# java2scala
Convert Java code to Scala


cabal clean
cabal configure --enable-library-profiling --enable-executable-profiling --enable-tests --enable-benchmarks
cabal build
cabal build --ghc-options="-prof" -p


Cabal file:

executable my-project-profiling
  main-is:
    Profiling.hs
  ghc-options:
    -O2
    -threaded
    -fprof-auto
    "-with-rtsopts=-N -p -s -h -i0.1"
  build-depends:
    base >= 4.5 && < 5

-O2 enables aggressive optimization.
-threaded enables concurrency.
-fprof-auto enables automatic cost-centre annotations for profiling. Details here.
-with-rtsopts bakes in the runtime settings.