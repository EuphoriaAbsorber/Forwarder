import 'dart:io';

class Question {
  final String text;
  final int categoryPos;

  const Question({required this.text, required this.categoryPos});
}

var survey = const [
  Question(text: "Будешь плавать?", categoryPos: 0),
  Question(text: "Хочешь увидеть дикую природу?", categoryPos: 1),
  Question(text: "Место рядом с горами?", categoryPos: 2),
  Question(text: "Отправишься в современный город?", categoryPos: 3),
  Question(text: "Будешь ходить в музеи?", categoryPos: 4),
  Question(text: "Хочешь посетить культурный центр?", categoryPos: 5),
  Question(text: "Едешь тусить?", categoryPos: 6),
  Question(text: "Летишь вкусно поесть?", categoryPos: 7),
];

class City {
  final String name;
  final int category;

  const City({required this.name, required this.category});
}

var places = [
  City(name: "Петербург", category: int.parse("11111001", radix: 2)),
  City(name: "Сочи", category: int.parse("11001111", radix: 2)),
  City(name: "Париж", category: int.parse("11111000", radix: 2)),
  City(name: "Рим", category: int.parse("00110000", radix: 2)),
  City(name: "Турция", category: int.parse("11000011", radix: 2)),
  City(name: "Вьетнам", category: int.parse("11000011", radix: 2)),
  City(name: "Уфа", category: int.parse("00010000", radix: 2)),
  City(name: "Крым", category: int.parse("01110011", radix: 2)),
];

void main(List<String> arguments) {

  var result = 0;

  for(var question in survey) {
    stdout.write("${question.text} : ");
    switch(stdin.readLineSync()) {
      case "+":
      case "?": result |= 1 << question.categoryPos; break;
    }
  }

  bin(result);
  print("");



  var temp = places.where((city) => city.category & result == result);

  for(var city in temp) {
    print(city.name);
  }

}

void binQ(int num) {
  for(var question in survey) {
    print("${question.text} : ${num & 1 << question.categoryPos != 0}");
  }
}

int rate(int num) {
  int count = 0;
  while(num!= 0) {
    num &= num - 1;
    ++count;
  }
  return count;
}

void bin(int num) {
  for(int i = 0; i<32; ++i) {
    if(i != 0 && i % 8 == 0) stdout.write(" ");
    stdout.write(num & 1 << i != 0 ? '1' : '0');
  }
}