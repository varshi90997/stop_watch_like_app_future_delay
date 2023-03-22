///--------------------->first method
// void main() {

//   final list = [
//     {'name': 'John', 'age': 30},
//     {'name': 'Jane', 'age': 25},
//     {'name': 'Bob', 'age': 40},
//   ];


//   final map=Map.fromIterable(list,key:(element) => element['name'],value: (element) => element['age']);

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

///--------------------->third method