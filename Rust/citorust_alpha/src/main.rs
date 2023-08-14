use std::ops::Add;

struct X {
    Y: i32,
}
impl Add for X {
    type Output = i32;
    fn add(self, other: X) -> Self::Output {
        self.Y + other.Y
    }
}
fn main() {
    let a = X { Y: 2 };
    let b = X { Y: 3 };
    let c = a + b; //works
}
