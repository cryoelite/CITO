use std::fs::File;

use chrono::{Datelike, Days, Duration};

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let start_day = chrono::NaiveDate::from_ymd_opt(2023, 05, 10).unwrap();
    let end_day = chrono::NaiveDate::from_ymd_opt(2023, 12, 30).unwrap();
    let base_path = r#"C:\NFBase\GitHub\Personal_Notes\Daisy\journals\"#;
    let mut iterator_date = start_day;

    while iterator_date != end_day {
        let file_path = String::from(format!(
            "{}{}_{}_{}.md",
            base_path,
            iterator_date.year_ce().1,
            iterator_date.month0() + 1,
            iterator_date.day0() + 1
        ));

        println!("Creating {}", file_path);
        File::create(file_path)?;
        iterator_date = chrono::NaiveDate::checked_add_days(iterator_date, Days::new(1)).unwrap();
    }

    Ok(())
}
