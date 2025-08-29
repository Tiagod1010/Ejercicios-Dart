import 'dart:io';

abstract class Transporte {
  String nombre;
  double tarifaBase; // Tarifa base por km

  Transporte(this.nombre, this.tarifaBase);

  double calcularCosto(double distancia) {
    return distancia * tarifaBase;
  }
}

// Clases específicas de transporte
class Bus extends Transporte {
  Bus() : super("Bus", 2000);
}

class Metro extends Transporte {
  Metro() : super("Metro", 2500);
}

class Taxi extends Transporte {
  Taxi() : super("Taxi", 3000);
}

class AplicacionMovil extends Transporte {
  AplicacionMovil() : super("Aplicación Móvil", 3500);
}

void main() {
  stdout.write("Ingrese la distancia del viaje en km: ");
  double distancia = double.parse(stdin.readLineSync()!);

  List<Transporte> transportes = [Bus(), Metro(), Taxi(), AplicacionMovil()];

  print("\n📊 Tarifas de transporte para $distancia km:");
  for (var transporte in transportes) {
    print(
      "${transporte.nombre}: \$${transporte.calcularCosto(distancia).toStringAsFixed(0)}",);
  }
}