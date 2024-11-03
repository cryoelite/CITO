use azure_functions::{
    bindings::{HttpRequest, HttpResponse},
    func,
};

#[func]
pub fn process(req: HttpRequest) -> HttpResponse {
    "Hello from Rust!".into()
}
