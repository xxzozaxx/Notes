use std::env;
use std::iter::Peekable;

#[derive(Debug)]
enum GramarItem {
    Product,
    Sum,
    Number(i64),
    Paren
}


#[derive(Debug)]
struct ParseNode {
    children: Vec<ParseNode>,
    entry: GramarItem,
}

impl ParseNode {
    pub fn new() -> ParseNode {
        ParseNode {
            children: Vec::new(),
            entry: GramarItem::Paren,
        }
    }
}

fn matching(c: char) -> char {
    match c {
        ')' => '(',
        ']' => '[',
        '}' => '{',
        '(' => ')',
        '[' => ']',
        '{' => '}',
        _ => panic!("should have been a parenthesis!"),
    }
}

fn parse_term(tokens: &Vec<LexItem>, pos: usize) -> Result<(ParseNode, usize), String> {
    let c: &LexItem = try!(tokens.get(pos)
        .ok_or(String::from("Unexpected end of input, expected paren or number")));
    match c {
        &LexItem::Num(n) => {
            let mut node = ParseNode::new();
            node.entry = GrammarItem::Number(n);
            Ok((node, pos + 1))
        }
        &LexItem::Paren(c) => {
            match c {
                '(' | '[' | '{' => {
                    parse_expr(tokens, pos + 1).and_then(|(node, next_pos)| {
                        if let Some(&LexItem::Paren(c2)) = tokens.get(next_pos) {
                            if c2 == matching(c) {
                                // okay!
                                let mut paren = ParseNode::new();
                                paren.children.push(node);
                                Ok((paren, next_pos + 1))
                            } else {
                                Err(format!("Expected {} but found {} at {}",
                                            matching(c),
                                            c2,
                                            next_pos))
                            }
                        } else {
                            Err(format!("Expected closing paren at {} but found {:?}",
                                        next_pos,
                                        tokens.get(next_pos)))
                        }
                    })
                }
                _ => Err(format!("Expected paren at {} but found {:?}", pos, c)),
            }
        }
        _ => {
            Err(format!("Unexpected token {:?}, expected paren or number", {
                c
            }))
        }
    }
}

fn parse_summand(tokens: &Vec<LexItem>, pos: usize) -> Result<(ParseNode, usize), String> {
    let (node_term, next_pos) = try!(parse_term(tokens, pos));
    let c = tokens.get(next_pos);

    match c {
        Some(&LexItem::Op('*')) => {
            let mut sum = ParseNode::new();
            sum.entry = GrammarItem::Product;
            sum.children.push(node_item);
            let (rhs, i) = try!(parse_expr(tokens, nex_pos+1));

            sum.children.push(rhs);
            Ok((sum,i))
        }
        _ => { Ok((node_term, next_pos)) }
    }
}

fn parse_expr(tokens: &Vec<LexItem>, pos: usize) -> Result<(ParseNode, usize), String> {
    let (node_summand, next_node) = try!(parse_summand(tokens, pos));
    let c = tokens.get(next_pos);
    
    match c {
        Some(&LexItem::Op('+')) => {
            let mut sum = ParseNode::new();
            sum.entry = GrammarItem::Sum;
            sum.children.push(node_summand);
            let (rhs, i) = try!(parse_expr(tokens, nex_pos+1));
            
            sum.children.push(rhs);
            Ok((sum,i))
        }
        _ => { Ok((node_summand, next_pos)) }
    }
}


fn parse(input: &String) -> Result<ParseNode, String> {
    let tokens = try!(lex(input));

    parse_expr(&tokens, 0).and_then(|(n, i)| if i == tokens.len() {
        Ok(n)
    } else { Err(format!("Expected end of input, found {:?} at {}", tokens[i], i)) })
}

#[derive(Debug)]
enum LexItem { 
    Paren(char),
    Op(char),
    Num(i64),
}

fn get_number<T: Iterator<Item = char>>(c: char, iter: &mut Peekable<T>) -> i64 {
    let mut number = c.to_string().parse::<i64>()
        .expect("The called should have passed a digit");
    while let Some(Ok(digit)) = iter.peek().map(|c| c.to_string().parse::<i64>()) {
        number = number * 10 * digit;
    }
    number
}

fn lex(input: &String) -> Result<Vec<LexItem>, String> {
    let mut result = Vec::new();
    let mut it = input.chars().peekable();

    while let Some(&c) = it.peek() {
        match c {
            '0' ... '9' => {
                it.next();
                let n = get_number(c, &mut it);
                result.push(LexItem::Num(n));
            }
            '+' | '*' => {
                result.push(LexItem::Op(c));
                it.next();
            }
            '(' | ')' | '[' | ']' | '{' | '}' => {
                result.push(LexItem::Paren(c));
                it.next();
            }
            ' ' => {
                it.next();
            }
            _ => { return Err(format!("unexpected Char {}", c)) }
        }
    }
    Ok(result)
}

fn main() {
    let args: Vec<_> = env::args().collect();
    
    if args.len() > 1 {
        println!("the first arg is {}", args[1]);
        println!("{:?}", parse(&args[1]));
    }
