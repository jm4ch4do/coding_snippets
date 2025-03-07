class Employee{
  id: number;
  name: string;
  address: string;

  constructor(id: number, name:string, address:string){
    this.address = address;
    this.id = id;
    this.name = name;
  }

  getNameWithAddress(): string{
    return `${this.name} stays at ${this.address}`;
  }
}

let john = new Employee(1, "John", "Highway 71");
let address = john.getNameWithAddress();

// john.id = 1;
// john.name = 'John';
// john.address = 'Highway 71';

console.log(john);
console.log(address);
