import 'dart:io';

class Plan {
  String nombre;
  double gbInculidos;
  double costoMensual;
  double costoExtraPorGb;

  Plan(this.nombre, this.gbInculidos, this.costoMensual, this.costoExtraPorGb);

  double calcularCostoTotal(double consumoGb) {
    if (consumoGb <= gbInculidos) return costoMensual;
    double extra = consumoGb - gbInculidos;
    return costoMensual + extra * costoExtraPorGb;
  }
}

void main() {
  List<Plan> planes = [
    Plan("Básico", 10, 20000, 3000),
    Plan("Estandar", 20, 35000, 3000),
    Plan("Premium", 30, 50000, 3000),
  ];

  stdout.write("Ingrese el consumo de datos en GB: ");
  double consumo = double.parse(stdin.readLineSync()!);

  Plan mejorPlan = planes[0];
  double costoMinimo = mejorPlan.calcularCostoTotal(consumo);

  for (var plan in planes) {
    double costo = plan.calcularCostoTotal(consumo);
    print("${plan.nombre}: \$${costo.toStringAsFixed(0)}");
    if (costo < costoMinimo) {
      costoMinimo = costo;
      mejorPlan = plan;
    }
  }

  print("\n✅ El plan más económico es: ${mejorPlan.nombre} con un costo de \$${costoMinimo.toStringAsFixed(0)}");
}