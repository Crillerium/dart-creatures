use std::io;
use rand::Rng;

fn main() {
    println!("Let's Guess A Number!");
    let secret = rand::thread_rng().gen_range(1..=100);
    println!("Input A Number: {secret}");
    let mut guess = String::new();
    io::stdin().read_line(&mut guess).expect("Error Happend");
    println!("Print: {guess}");
}
