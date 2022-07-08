
fn main() {
    let mut x= 1;
    let z = 'xyz_loop: loop {
        if x==20 {
           'two: loop {
            if x==25 {
                break 'two;
            }
            x+=1;
           }
           break 'xyz_loop x;
        }
        x+=1;
    };
    println!("{}", z);
}

