# java2scala
Convert Java code to Scala


cabal clean

cabal configure --enable-library-profiling --enable-executable-profiling --enable-tests --enable-benchmarks

cabal build

cabal build --ghc-options="-prof" -p

./test +RTS -p