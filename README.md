# java2scala
Convert Java code to Scala

-- PROF
cabal clean
cabal configure --enable-library-profiling --enable-executable-profiling --enable-tests --enable-benchmarks
cabal build
cabal install --enable-profiling --ghc-options="-DEXTERNAL_UUAGC -fprof-auto -rtsopts"

./test +RTS -p

-- UUAGC
cabal clean
cabal configure --ghc-options="-DEXTERNAL_UUAGC"
cabal build --ghc-options="-DEXTERNAL_UUAGC"
cabal install --ghc-options="-DEXTERNAL_UUAGC"

./dist/build/java2scala/java2scala  "/home/andrea/workspaceclipse_haskell/java2scala/test/Example.java"
-- "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/TmpImport.java"

./dist/build/java2scala/java2scala "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/1compilationUnitSimple.java"

