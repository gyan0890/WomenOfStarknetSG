#[derive(Copy, Drop)]
enum Data {
    Integer: u128,
    Felt: felt252,
    Tuple: (u32, u32),
}

fn main() {
    let mut messages: Array<Data> = array![];
    messages.append(Data::Integer(100));
    messages.append(Data::Felt('hello world'));
    messages.append(Data::Tuple((10, 30)));

    match messages.get(3){
        Option::Some(x) => {
            match x.unbox() {
                Data::Integer(value) => { println!("Integer value is {}", value) },
                Data::Felt(hello) => { println!("Felt string is {}", hello) },
                Data::Tuple((x, y)) => { println!("Tuple consists of {} and {}", x, y) },
            }
        },
        Option::None => {println!("Index is invalid")}
    }
}
