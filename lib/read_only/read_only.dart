///---------------------------===========================================>list to map methods
///--------------------->first method---->{{ fromIterable() method }}
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

///--------------------->second method---->{{ fromEntries() method }}
// void main() {
//   final list = [
//     'John', 'Jane', 'Bob'
//   ];

//   final map = Map.fromEntries(list.asMap().entries.map((list) => MapEntry(list.key,list.value)));

//   print(map); // {1: John, 2: Jane, 3: Bob}
// }

///--------------------->third method---->{{ asMap() method }}-->easy
// void main()
// {
//   final list = ['John', 'Jane', 'Bob'];

//   var maps = list.asMap(); 
//   print(maps); // {0: John, 1: Jane, 2: Bob}
// }

///--------------------->fourth method---->{{ model method }}
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


///------------------------->fifth method--{{fromIterable method}}
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

///------------------------->how to use npm in flutter

//fvm install 3.3.4
//fvm list
//fvm use 3.3.4

///---------------------------===============================================================>map to list methods
///------------------------->first method--{{model  entries}}
//class Person {
//   final String name;
//   final int age;
//
//   Person({required this.name, required this.age});
// }
//
// void main() {
//   Map<String, int> ages = {
//     'John': 30,
//     'Mary': 25,
//     'Bob': 40,
//   };
//
//   List<Person> persons = ages.entries
//       .map((entry) => Person(name: entry.key, age: entry.value))
//       .toList();
//
//
//   List forAdd=[];
//   for(int i=0;i<ages.length;i++)
//   {
//      print(persons[i].name);
//     forAdd.add(persons[i].name);
//   }
//
//   print(forAdd.toString());
//   // Output: [Person{name: John, age: 30}, Person{name: Mary, age: 25}, Person{name: Bob, age: 40}]
// }

///------------------------->second method--{{model  entries}}-->easy
// void main()
// {
//   Map<String, dynamic> myMap = {
//     "name": "John",
//     "age": 30,
//     "email": "john@example.com"
//   };
//
//   List<dynamic> myList = myMap.values.toList();
//
//   print(myList); // Output: [John, 30, john@example.com]
// }

///------------------------->third method--{{entries and sorting key wise}}
//void main()
// {
//   Map<String, int> map = {'apple': 1, 'banana': 2, 'orange': 3};
// List list = map.entries.toList()
//   ..sort((a, b) => a.key.compareTo(b.key))
//   ..map((entry) => entry.value)
//   .toList();
//
//   print(list.toString());
// }/// out put ---->[MapEntry(apple: 1), MapEntry(banana: 2), MapEntry(orange: 3)]

///------------------------->fourth method--{{easy method}}

//void main()
// {
// Map<String, int> myMap = {'apple': 1, 'banana': 2, 'orange': 3};
//
// List<MapEntry<String, int>> mapEntries = myMap.entries.toList();
//
// // You can then convert this List<MapEntry> to a List of any other type
// List<String> keys = myMap.keys.toList();
// List<int> values = myMap.values.toList();
//
//
//   print(mapEntries.toString());//output---->[MapEntry(apple: 1), MapEntry(banana: 2), MapEntry(orange: 3)]
//   print(keys.toString());//output---->[apple, banana, orange]
//   print(values.toString());//output---->[1, 2, 3]
// }

///---------------------------===============================================================>all string methods
// String myString = '  Hello World!  ';
// print(myString.length); // Prints 15
// print(myString.toLowerCase()); // Prints "  hello world!  "
// print(myString.trim()); // Prints "Hello World!"
// print(myString.startsWith('  ')); // Prints true
// print(myString.endsWith('!  ')); // Prints true
// print(myString.substring(3, 8)); // Prints "lo Wo"
// print(myString.split(' ')); // Prints ["", "", "Hello", "World!", "", ""]
// print(myString.replaceFirst('Hello', 'Hi')); // Prints "  Hi World!  "
// print(myString.replaceAll('o', '0')); // Prints "  Hell0 W0rld!  "

//length - Returns the length of the string.
// toLowerCase() - Returns a new string with all characters converted to lowercase.
// toUpperCase() - Returns a new string with all characters converted to uppercase.
// trim() - Returns a new string with whitespace removed from both ends.
// startsWith() - Returns true if the string starts with the specified character or substring.
// endsWith() - Returns true if the string ends with the specified character or substring.
// substring() - Returns a new string that is a substring of the original string.
// split() - Returns a list of substrings separated by the specified delimiter.
// replaceFirst() - Returns a new string with the first occurrence of a substring replaced with another string.
// replaceAll() - Returns a new string with all occurrences of a substring replaced with another string.

///---------------------------===============================================================>all map methods
//Map<String, int> myMap = {'apple': 1, 'banana': 2, 'orange': 3};
// print(myMap.isEmpty); // Prints false
// print(myMap.length); // Prints 3
// print(myMap.keys); // Prints ["apple", "banana", "orange"]
// print(myMap.values); // Prints [1, 2, 3]
// print(myMap.containsKey('apple')); // Prints true
// print(myMap.containsValue(2)); // Prints true
// myMap.forEach((key, value) => print('$key: $value')); // Prints "apple: 1", "banana: 2", "orange: 3"
// Map<String, int> newMap = myMap.map((key, value) => MapEntry(key.toUpperCase(), value * 2));
// print(newMap); // Prints {"APPLE": 2, "BANANA": 4, "ORANGE": 6}
// myMap.remove('banana');
// print(myMap); // Prints {"apple": 1, "orange": 3}
// myMap.clear();
// print(myMap); // Prints {}

//isEmpty - Returns true if the map is empty.
// length - Returns the number of key-value pairs in the map.
// keys - Returns an iterable containing all the keys in the map.
// values - Returns an iterable containing all the values in the map.
// containsKey(key) - Returns true if the map contains a key equal to the specified key.
// containsValue(value) - Returns true if the map contains a value equal to the specified value.
// forEach((key, value) => { }) - Applies a function to each key-value pair in the map.
// map((key, value) => { }) - Returns a new map with the results of applying a function to each key-value pair in the map.
// remove(key) - Removes the key-value pair with the specified key from the map.
// clear() - Removes all key-value pairs from the map.

///---------------------------===============================================================>all list methods

//List<String> myList = ['apple', 'banana', 'orange'];
// print(myList.isEmpty); // Prints false
// print(myList.length); // Prints 3
// myList.add('pear');
// print(myList); // Prints ["apple", "banana", "orange", "pear"]
// myList.insert(1, 'mango');
// print(myList); // Prints ["apple", "mango", "banana", "orange", "pear"]
// myList.remove('mango');
// print(myList); // Prints ["apple", "banana", "orange", "pear"]
// myList.removeAt(2);
// print(myList); // Prints ["apple", "banana", "pear"]
// print(myList.contains('banana')); // Prints true
// myList.forEach((element) => print(element)); // Prints "apple", "banana", "pear"
// List<String> newList = myList.map((element) => element.toUpperCase()).toList();
// print(newList); // Prints ["APPLE", "BANANA", "PEAR"]
// List<String> subList = myList.sublist(1, 3);
// print(subList); // Prints ["banana", "pear"]

///--------> json serialization and deserialization in flutter
/////object to map --->encoding
// //map to object --->decoding
///--------> Future builder in flutter
///--------> stream builder in flutter

















