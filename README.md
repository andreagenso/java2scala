# java2scala
Convert Java code to Scala

-- PROF
cabal clean

cabal configure --enable-library-profiling --enable-executable-profiling --enable-tests --enable-benchmarks

cabal build

cabal install --enable-profiling --ghc-options="-DEXTERNAL_UUAGC -fprof-auto -rtsopts"


-- UUAGC
cabal clean
cabal configure --ghc-options="-DEXTERNAL_UUAGC"
cabal build --ghc-options="-DEXTERNAL_UUAGC"
cabal install --ghc-options="-DEXTERNAL_UUAGC"

./test +RTS -p