#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;

#[get("/hello-world")]
fn hello_world() -> &'static str {
    "hello world"
}

#[get("/hello-world/<name>")]
fn hello_name(name: String) -> String {
    format!("hello {}",  name)
}

fn main() {
    rocket::ignite().mount("/", routes![hello_world, hello_name]).launch();
}
