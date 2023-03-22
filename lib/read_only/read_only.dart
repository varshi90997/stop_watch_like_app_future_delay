
///--------------------->first method
// void main() {
//
//   final list = [
//     {'name': 'John', 'age': 30},
//     {'name': 'Jane', 'age': 25},
//     {'name': 'Bob', 'age': 40},
//   ];
//
//
//   final map=Map.fromIterable(list,key:(element) => element['name'],value: (element) => element['age']);
//
//   print(map); // {John: 30, Jane: 25, Bob: 40}
// }

///--------------------->second method
// void main() {
//   final list = [
//     'John', 'Jane', 'Bob'
//   ];

//   final map = Map.fromEntries(list.asMap().entries.map((list) => MapEntry(list.key,list.value)));

//   print(map); // {1: John, 2: Jane, 3: Bob}
// }

///--------------------->third method
// void main()
// {
//   final list = ['John', 'Jane', 'Bob'];

//   var maps = list.asMap(); 
//   print(maps); // {0: John, 1: Jane, 2: Bob}
// }

///--------------------->fourth method
// class Person {
//   final String name;
//   final int age;

//   Person({required this.name, required this.age});
// }

// void main() {
//   List<Person> people = [
//     Person(name: 'Alice', age: 25),
//     Person(name: 'Bob', age: 30),
//     Person(name: 'Charlie', age: 35),
//   ];

//   Map<String, int> peopleMap = Map.fromIterable(
//     people,
//     key: (person) => person.name,
//     value: (person) => person.age,
//   );

//   //------>people[0].age//--> you can acsses like this

//   print(peopleMap); // Output: {Alice: 25, Bob: 30, Charlie: 35}
// }


///------------------------->fifth method--{{}}
// void main() {
//   List<Map<String, dynamic>> myList = [
//     {'id': 1, 'name': 'Alice'},
//     {'id': 2, 'name': 'Bob'},
//     {'id': 3, 'name': 'Charlie'},
//   ];

//   Map<int, String> myMap = Map.fromIterable(myList,
//       key: (item) => item['id'], value: (item) => item['name']);

//   print(myMap); // {1: Alice, 2: Bob, 3: Charlie}
// }

///------------------------->six method





















