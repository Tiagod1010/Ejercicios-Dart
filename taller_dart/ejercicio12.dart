import 'dart:io';

class Actividad {
  String tipo;
  int duracion; // en minutos
  double caloriasPorMinuto;
  double velocidadPromedio; // km/h

  Actividad(this.tipo, this.duracion, this.caloriasPorMinuto, this.velocidadPromedio);

  double caloriasTotales() => duracion * caloriasPorMinuto;

  double distancia() => (velocidadPromedio * duracion) / 60.0; // km
}

void main() {
  List<Actividad> actividades = [];

  // Valores promedio según estudios
  Map<String, double> caloriasPromedio = {
    "Caminar": 4.0,     // kcal/min
    "Correr": 10.0,
    "Bicicleta": 8.0,
  };

  Map<String, double> velocidadPromedio = {
    "Caminar": 5.0,     // km/h
    "Correr": 9.0,
    "Bicicleta": 16.0,
  };

  while (true) {
    print("\n=== Monitor de Actividad Física ===");
    print("1. Registrar actividad");
    print("2. Ver estadísticas");
    print("3. Salir");

    stdout.write("Opción: ");
    int op = int.parse(stdin.readLineSync()!);

    if (op == 1) {
      print("\nSeleccione tipo de actividad:");
      print("1. Caminar (≈4 kcal/min, 5 km/h)");
      print("2. Correr (≈10 kcal/min, 9 km/h)");
      print("3. Bicicleta (≈8 kcal/min, 16 km/h)");

      stdout.write("Opción: ");
      int act = int.parse(stdin.readLineSync()!);

      String tipo = (act == 1)
          ? "Caminar"
          : (act == 2)
              ? "Correr"
              : "Bicicleta";

      stdout.write("Duración (min): ");
      int dur = int.parse(stdin.readLineSync()!);

      double calorias = caloriasPromedio[tipo]!;
      double vel = velocidadPromedio[tipo]!;

      actividades.add(Actividad(tipo, dur, calorias, vel));

      print("✅ Actividad registrada: $tipo, $dur min, "
          "${(vel * dur / 60).toStringAsFixed(2)} km, $calorias kcal/min.");
    } 
    else if (op == 2) {
      if (actividades.isEmpty) {
        print("⚠️ No hay actividades registradas todavía.");
        continue;
      }

      double totalCal = actividades.fold(0, (s, a) => s + a.caloriasTotales());
      double totalDist = actividades.fold(0, (s, a) => s + a.distancia());
      int totalTiempo = actividades.fold(0, (s, a) => s + a.duracion);

      print("\n📊 Estadísticas semanales:");
      print("Duración total: $totalTiempo min");
      print("Distancia total: ${totalDist.toStringAsFixed(2)} km");
      print("Calorías totales quemadas: ${totalCal.toStringAsFixed(2)} kcal");
      print("Promedio calorías/min: ${(totalCal / totalTiempo).toStringAsFixed(2)}");

      // Distancia promedio por tipo
      for (var tipo in ["Caminar", "Correr", "Bicicleta"]) {
        var sub = actividades.where((a) => a.tipo == tipo).toList();
        if (sub.isNotEmpty) {
          double dist = sub.fold(0, (s, a) => s + a.distancia());
          int tiempo = sub.fold(0, (s, a) => s + a.duracion);
          print("Promedio distancia en $tipo: ${(dist / (tiempo / 60)).toStringAsFixed(2)} km/h");
        }
      }

      // Objetivo fijo de referencia
      double objetivo = 2000;
      print(totalCal >= objetivo
          ? "✅ Objetivo de $objetivo kcal alcanzado."
          : "⚠️ Objetivo de $objetivo kcal NO alcanzado (faltan ${(objetivo - totalCal).toStringAsFixed(0)} kcal).");
    } 
    else if (op == 3) {
      print("👋 Saliendo...");
      break;
    }
  }
}