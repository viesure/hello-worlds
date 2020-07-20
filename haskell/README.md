# hello-worlds

## haskell

### Install Glasgow Haskell Compiler
execute this script and follow the instructions

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

### hello-world-stdout
the commands have to be executed inside the `hello-world-stdout` directory.

#### build
```bash
ghc hello-world.hs
```

#### run
```bash
./hello-world
```

### hello-world-rest
this application is running on port `12345`.

the commands have to be executed inside the `hello-world-rest` directory.

#### build
```bash
cabal install
```

#### run
```bash
cabal run
```

#### routes
* `/hello-world`: returns "Hello, World!" 

