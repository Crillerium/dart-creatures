use std::io;
fn main() {
    println!("Let's Guess A Number!");
    println!("Input A Number: ");
    let mut guess = String::new();
    io::stdin().read_line(&mut guess).expect("Error Happend");
    println!("Print: {guess}");
}
