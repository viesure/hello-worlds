# Rust

## Getting started

First we have to install Rust. We do so by using the [Rust tool chain](https://www.rust-lang.org/tools/install):
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Setting up the project

In our project directory, we need to set the project up to use rust nightly:
```
rustup override set nightly
```

This is because next we'll be [adding rocket](https://rocket.rs/v0.4/guide/getting-started/), our web api framework, to our dependencies.
We do so by adding it to the `Cargo.toml`
```
[dependencies]
rocket = "0.4.5"
```

Rocket requires rust nightly to run.

Check if everything works, by executing `cargo build`

## Hello World!

In the `scr/main.rs` file, we set up our routes.

There are 2 routes: `/hello-world` and `/hello-world/<name>`
The first one returns 'hello world', while the other one returns 'hello <name>'.

Both routes are mounted using `/` as the base path.

To start it, we run `cargo run`

The endpoints can now be reached under http://localhost:8000/hello-world

## Further Reading

* https://www.rust-lang.org/learn
* https://doc.rust-lang.org/rust-by-example/
* https://rocket.rs/v0.4/guide/
