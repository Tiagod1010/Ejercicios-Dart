import 'dart:io';

void main() {
  while (true) {
    print("\n=== Conversor de Unidades ===");
    print("1. Temperatura (Celsius <-> Fahrenheit)");
    print("2. Distancia (Metros <-> Kilómetros <-> Millas)");
    print("3. Peso (Gramos <-> Kilogramos <-> Libras)");
    print("4. Almacenamiento (KB <-> MB <-> GB)");
    print("5. Salir");

    stdout.write("Seleccione una opción: ");
    String opcion = stdin.readLineSync()!;

    switch (opcion) {
      case "1":
        stdout.write("Ingrese temperatura en Celsius: ");
        double c = double.parse(stdin.readLineSync()!);
        double f = (c * 9 / 5) + 32;
        print("$c °C = $f °F");
        break;

      case "2":
        stdout.write("Ingrese distancia en metros: ");
        double m = double.parse(stdin.readLineSync()!);
        print("$m m = ${m / 1000} km = ${(m / 1609).toStringAsFixed(2)} millas");
        break;

      case "3":
        stdout.write("Ingrese peso en gramos: ");
        double g = double.parse(stdin.readLineSync()!);
        print("$g g = ${g / 1000} kg = ${(g / 453.6).toStringAsFixed(2)} lb");
        break;

      case "4":
        stdout.write("Ingrese almacenamiento en KB: ");
        double kb = double.parse(stdin.readLineSync()!);
        print("$kb KB = ${kb / 1024} MB = ${(kb / (1024 * 1024)).toStringAsFixed(2)} GB");
        break;

      case "5":
        print("👋 Saliendo...");
        return;

      default:
        print("❌ Opción inválida.");
    }
  }
}