import 'dart:io';

void main() {
  List<Map<String, dynamic>> gastos = [];
  List<String> categorias = ["Comida", "Transporte", "Entretenimiento", "Servicios"];

  while (true) {
    print("\n=== Gestor de Gastos Personales ===");
    print("1. Registrar gasto");
    print("2. Ver reporte");
    print("3. Salir");

    stdout.write("Seleccione una opción: ");
    int opcion = int.parse(stdin.readLineSync()!);

    if (opcion == 1) {
      // Menú de categorías
      print("\nSeleccione una categoría:");
      for (int i = 0; i < categorias.length; i++) {
        print("${i + 1}. ${categorias[i]}");
      }

      stdout.write("Ingrese el número de la categoría: ");
      int numCat = int.parse(stdin.readLineSync()!);

      if (numCat < 1 || numCat > categorias.length) {
        print("❌ Categoría inválida.");
        continue;
      }

      String categoria = categorias[numCat - 1];
      stdout.write("Monto del gasto: ");
      double monto = double.parse(stdin.readLineSync()!);

      gastos.add({"categoria": categoria, "monto": monto});
      print("✅ Gasto registrado en $categoria por \$${monto.toStringAsFixed(0)}");

    } else if (opcion == 2) {
      double total = 0;
      Map<String, double> porCategoria = {};

      for (var g in gastos) {
        total += g["monto"];
        porCategoria[g["categoria"]] = (porCategoria[g["categoria"]] ?? 0) + g["monto"];
      }

      print("\n📊 Reporte de gastos:");
      porCategoria.forEach((cat, val) {
        print("$cat: \$${val.toStringAsFixed(0)}");
      });
      print("Total mensual: \$${total.toStringAsFixed(0)}");

    } else if (opcion == 3) {
      print("👋 Saliendo...");
      break;

    } else {
      print("❌ Opción inválida.");
    }
  }
}