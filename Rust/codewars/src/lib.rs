use std::collections::btree_map::Range;

#[cfg(test)]
pub mod test {
    use super::*;
    #[test]
    fn sample_test() {
        assert_eq!(
            unique_in_order("AAAABBBCCDAABBB".chars()),
            vec!['A', 'B', 'C', 'D', 'A', 'B']
        );
    }
}

pub fn run() {}

fn unique_in_order<T>(sequence: T) -> Vec<T::Item>
where
    T: std::iter::IntoIterator,
    T::Item: std::cmp::PartialEq + std::fmt::Debug,
{
    let it = &sequence.into_iter();
    let x: &T = *it;
    let arr: Vec<<T as IntoIterator>::Item> = vec![];
    for i in sequence {
        
    }
    return arr;
}
