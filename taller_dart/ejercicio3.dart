import 'dart:io';

void main() {
  stdout.write("Porcentaje actual de batería (0-100): ");
  double bateria = double.parse(stdin.readLineSync()!);

  stdout.write("Horas de uso promedio diario: ");
  double horasUso = double.parse(stdin.readLineSync()!);

  // Suposición: batería completa dura 'horasUso' horas
  double duracionTotal = (bateria / 100) * horasUso;

  // Convertir a horas y minutos
  int horas = duracionTotal.floor();
  int minutos = ((duracionTotal - horas) * 60).round();

  print("⏳ Te quedan $horas horas y $minutos minutos de uso según tu promedio diario.");

  // Modos de ahorro
  print("\nModos de ahorro de bateria disponibles:");
  print("1. Ahorro de energia (+20%)");
  print("2. Ultra ahorro de Energia (+50%)");

  stdout.write("Seleccione un modo (1/2): ");
  int modo = int.parse(stdin.readLineSync()!);

  if (modo == 1) {
    duracionTotal *= 1.2;
  } else if (modo == 2) {
    duracionTotal *= 1.5;
  }

  // Recalcular horas y minutos con el modo de ahorro
  horas = duracionTotal.floor();
  minutos = ((duracionTotal - horas) * 60).round();

  print("🔋 Con el Modo Ahorro seleccionado la batería durará: $horas horas y $minutos minutos.");
}