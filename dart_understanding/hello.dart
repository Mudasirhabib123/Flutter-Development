import 'dart:io';

void main() {
  stdout.writeln('Bismillah Hir Rahmaniraheem');
  print('Enter Youyr Name');
  String input = stdin.readLineSync();
  List<String> names = ['Ali', 'saad', 'adnan'];
  // for (var name in names) {
  //   printer(name);
  // }

  printer(input);
}

void printer(String name) {
  print("Hello $name");
}
