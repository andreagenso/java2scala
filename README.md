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

-- TOKEN generation: [branch token_generation]
Para pasar un archivo en especifico:
./dist/build/java2scala/java2scala  "/home/andrea/workspaceclipse_haskell/java2scala/test/Example.java"

Para testear ejemplos jdk1.7 
./dist/build/test/test
testscanner


-- AST generation: [branch ast_generation]
Para pasar un archivo en especifico:
./dist/build/java2scala/java2scala  "/home/andrea/workspaceclipse_haskell/java2scala/test/Example.java"

Para testear ejemplos jdk1.7 
./dist/build/test/test
testparser

-- AG generation [branch ag_generation / master]
./dist/build/java2scala/java2scala  "/home/andrea/workspaceclipse_haskell/java2scala/test/Example.java"