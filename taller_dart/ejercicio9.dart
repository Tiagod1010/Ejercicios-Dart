import 'dart:io';

void main() {
  Map<String, List<Map<String, dynamic>>> servicios = {
    "restaurantes": [
      {"nombre": "La cosecha", "direccion": "Calle 123", "calificacion": 4.5},
      {"nombre": "El buen sabor", "direccion": "Avenida 45", "calificacion": 4.0},
      {"nombre": "Comida Rápida", "direccion": "Calle 78", "calificacion": 3.5},
      {"nombre": "Gourmet Express", "direccion": "Avenida 12", "calificacion": 4.8}
    ],

    "farmacias": [
      {"nombre": "Farmacia Salud", "direccion": "Calle 678", "calificacion": 4.2},
      {"nombre": "Farmacia Vida", "direccion": "Avenida 90", "calificacion": 3.8},
      {"nombre": "Farmacia Bienestar", "direccion": "Calle 34", "calificacion": 4.6},
      {"nombre": "Farmacia Central", "direccion": "Avenida 56", "calificacion": 4.3}
    ],

    "cajeros": [
      {"nombre": "Cajero Bancolombia", "direccion": "Parque Central", "calificacion": 4.7},
      {"nombre": "Cajero Davivienda", "direccion": "Calle 9", "calificacion": 2.1},
      {"nombre": "Cajero BBVA", "direccion": "Avenida 33", "calificacion": 3.9},
      {"nombre": "Cajero Banco de Bogotá", "direccion": "Calle 21", "calificacion": 4.4}
    ]
  };

  List<String> categorias = servicios.keys.toList();

  while (true) {
    print("\n=== Localizador de Servicios Cercanos ===");
    for (int i = 0; i < categorias.length; i++) {
      print("${i + 1}. ${categorias[i]}");
    }

  print("${categorias.length + 1}. Salir");

  stdout.write("Seleccione una categoría: ");
  int opcion = int.parse(stdin.readLineSync()!);

  if (opcion == categorias.length + 1) {
    print("👋Saliendo...");
    break;
  }

  if (opcion < 1 || opcion > categorias.length) {
    print("❌ Opción inválida.");
    continue;
  }

  String tipo = categorias[opcion - 1];
  var lista = servicios[tipo]!;

  lista.sort((a, b) => b["calificacion"].compareTo(a["calificacion"]));

  print("\n📋Mejores $tipo:");
  for (var servicio in lista) {
    print("${servicio["nombre"]} - ${servicio["direccion"]} (⭐${servicio["calificacion"]})");
  }
  }
}