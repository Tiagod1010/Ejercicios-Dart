import 'dart:io';

class Estudiante {
  String nombre;
  String id;
  List<double> calificaciones;

  Estudiante(this.nombre, this.id, this.calificaciones);

  double primedio() =>
      calificaciones.reduce((a, b) => a + b) / calificaciones.length;

  bool aprobado() => primedio() >= 3.0;

  void reporte() {
    print("📋 Estudiante: $nombre (ID: $id)");
    print("Notas: $calificaciones");
    print("Promedio: ${primedio().toStringAsFixed(2)}");
    print(aprobado() ? "✅ Aprobado" : "❌ Reprobó");
  }
}

void main() {
  List<Estudiante> estudiantes = [];

  stdout.write("¿Cuántos estudiantes desea registrar? ");
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    stdout.write("\nNombre del estudiante: ");
    String nombre = stdin.readLineSync()!;
    stdout.write("ID del estudiante: ");
    String id = stdin.readLineSync()!;
    stdout.write("Ingrese las calificaciones separadas por comas: ");
    List<String> notasStr = stdin.readLineSync()!.split(',');
    List<double> notas = notasStr.map((e) => double.parse(e.trim())).toList();

    estudiantes.add(Estudiante(nombre, id, notas));
  }

  print("\n=== Reporte de Estudiantes ===");
for (var estudiante in estudiantes) {
    estudiante.reporte();
}

// Resumen
double promedioGeneral = estudiantes.map((e) => e.primedio()).reduce((a, b) => a + b) / estudiantes.length;
print("\n📊 Promedio general de la clase: ${promedioGeneral.toStringAsFixed(2)}");
}