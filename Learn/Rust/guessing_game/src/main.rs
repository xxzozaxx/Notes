extern crate rand;
use std::io;             // for standerd I/O
use std::cmp::Ordering;  // Compare type
use rand::Rng;           // rand => random, Rng => range

fn main() {
    println!("Guess the number!");
    let secret_num = rand::thread_rng().gen_range(1, 100);
    // println!("Secret is: {}", secret_num);

    loop {
        println!("please input your guess. ");

        let mut guess = String::new();          /* :: mean associated function of str type*/
        io::stdin().read_line(&mut guess)       // could be std::io::stdin()
            .expect("Failed to take input.");
        let guess: u32 = match guess.trim().parse() { // error handle
            Ok(num) => num,
            Err(_) => continue,
        };

        println!("You guessed: {}", guess);
        match guess.cmp(&secret_num) {
            Ordering::Less => println!("Too small"),
            Ordering::Greater => println!("Too big"),
            Ordering::Equal => {
                println!("Yup, exactly");
                break;
            }
        }
    }
}
