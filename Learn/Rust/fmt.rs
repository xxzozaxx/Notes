use std::fmt;

struct Point {
    x: i32,
    y: i32,
}

fn main() {
    println!("{} of {:b} Special formatting can ve specified after a"
             , 1
             , 2);
    print!("btw, b mean binary \n");

    // you can right-aligin text.
    println!("{number:>width$}", number=1, width=6);
    println!("{number:<}", number=2);
    println!("{number:^width$}", number=3, width=6);

    // you can pad number with extra zero
    println!("{number:*>width$}", number=1, width=6);
    println!("{number:*<width$}", number=2, width=6);
    println!("{number:*^width$}", number=3, width=6);

    // argument with number
    println!("My name is {}, {0} {1}", "Ahmed", "Khaled");

    // pi
    println!("π s roughly {:.*}", 2, 3.141592);

    /* ------------- Debug impl for Point ---------*/
    impl fmt::Debug for Point {
        /*
         * it take borrow copy of self
         *         and Formatter as f (formatting rule I guess)
         */
        fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
            // I think firs { to display the second one, also the same with }
            write!(f, "Point {{ x: {}, y: {} }}",
                   self.x,
                   self.y)
        }
    }
    /* ------------- impl END here ---------*/
    let origin = Point { x:0, y:0};
    println!("Origin is: {:?}", origin);

}
