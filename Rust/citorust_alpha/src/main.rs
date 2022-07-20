mod testaaaas {
    #[test]
    fn it_works() {
        let result = 2 + 2;
        assert_eq!(result, 4);
    }

    #[test]
    fn yo() {
        let result = 2 + 2;
        assert_eq!(result, 4);
    }
}


use std::{collections::HashMap, fmt::Display};

fn main() {
    let a = String::from("yaa");
    let mut b = HashMap::new();
    b.insert("yo", a);
    let mut scores = HashMap::new();
    scores.insert(String::from("Blue"), 10);

    let insertedValue = scores.entry(String::from("Yellow"));
    let y: i32;

    
}


pub trait Something {
    fn Moo(&self) -> String {
        return "y0o".to_string();
    }
}

struct X<T> {
    yo: T,
}

impl<T: Display> ToString for X<T> {
    fn to_string(&self) -> String {
        return "".to_string();
    }
    // --snip--
}
