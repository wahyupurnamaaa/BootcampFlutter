import 'armor_titan.dart';
import 'attack_titan.dart';
import 'beast_titan.dart';
import 'human.dart';

void main() {
  // Membuat objek dari setiap class
  ArmorTitan armorTitan = ArmorTitan();
  AttackTitan attackTitan = AttackTitan();
  BeastTitan beastTitan = BeastTitan();
  Human human = Human();

  // Mengisi powerPoint untuk setiap objek
  armorTitan.powerPoint = 8;
  attackTitan.powerPoint = 3; // Akan diubah menjadi 5
  beastTitan.powerPoint = 7;
  human.powerPoint = 2; // Akan diubah menjadi 5

  // Menampilkan powerPoint setiap objek
  print("Power Point Armor Titan: ${armorTitan.powerPoint}");
  print("Power Point Attack Titan: ${attackTitan.powerPoint}");
  print("Power Point Beast Titan: ${beastTitan.powerPoint}");
  print("Power Point Human: ${human.powerPoint}");

  // Menampilkan method khusus setiap class
  print("\nMethod khusus setiap class:");
  print("Armor Titan: ${armorTitan.terjang()}");
  print("Attack Titan: ${attackTitan.punch()}");
  print("Beast Titan: ${beastTitan.lempar()}");
  print("Human: ${human.killAllTitan()}");
}