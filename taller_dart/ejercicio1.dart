import 'dart:io';

void main() {
  // Solicitar datos consumidos en MB durante una semana
  stdout.write("Ingrese la cantidad de datos consumidos en MB durante la semana: ");
  double mbSemana = double.parse(stdin.readLineSync()!);

  // Calcular promedio diario
  double promedioDiario = mbSemana / 7;
  print("Promedio diario: ${promedioDiario.toStringAsFixed(2)} MB");

  // Plan mensual (2 GB = 2048 MB)
  double planMensual = 2048;
  double consumoMensualEstimado = promedioDiario * 30;

  if (consumoMensualEstimado > planMensual) {
    print("⚠️ Excederás tu plan de 2GB con este consumo.");
  } else {
    print("✅ No excederás tu plan.");
  }

  // Calcular cuántos días y horas duraría el plan
  double diasDisponibles = planMensual / promedioDiario;
  int dias = diasDisponibles.floor();
  int horas = ((diasDisponibles - dias) * 24).round();

  print("📅 Tu plan durará aproximadamente $dias días y $horas horas con este consumo.");
}