import 'dart:io';

// Clase Producto
class Producto {
  String nombre;
  double precio;
  String categoria;

  Producto(this.nombre, this.precio, this.categoria);

  @override
  String toString() {
    return "$nombre (\$${precio.toStringAsFixed(2)}) - $categoria";
  }
}

// Clase Cliente
class Cliente {
  String nombre;
  String direccion;
  String telefono;

  Cliente(this.nombre, this.direccion, this.telefono);

  @override
  String toString() {
    return "👤 Cliente: $nombre\n📍 Dirección: $direccion\n📞 Teléfono: $telefono";
  }
}

// Clase Pedido
class Pedido {
  Cliente cliente;
  List<Producto> productos;
  int tiempoEstimado; // en minutos
  double costoDomicilio;

  Pedido(this.cliente, this.productos, this.tiempoEstimado, this.costoDomicilio);

  double calcularTotal() {
    double subtotal = productos.fold(0, (total, p) => total + p.precio);
    return subtotal + costoDomicilio;
  }

  void mostrarResumen() {
    print("\n=== 📦 Resumen del Pedido ===");
    print(cliente);
    print("\nProductos:");
    for (var p in productos) {
      print("- ${p.nombre}: \$${p.precio.toStringAsFixed(2)}");
    }
    print("\nTiempo estimado de entrega: $tiempoEstimado minutos");
    print("Costo de domicilio: \$${costoDomicilio.toStringAsFixed(2)}");
    print("TOTAL a pagar: \$${calcularTotal().toStringAsFixed(2)}");
  }
}

void main() {
  // Catálogo de productos disponibles
  List<Producto> catalogo = [
    Producto("Pizza Familiar", 45000, "Comida rápida"),
    Producto("Hamburguesa", 20000, "Comida rápida"),
    Producto("Ensalada", 15000, "Saludable"),
    Producto("Jugo Natural", 8000, "Bebida"),
    Producto("Gaseosa 1.5L", 6000, "Bebida"),
  ];

  print("=== 🚚 Sistema de Entregas ===");

  // Registro del cliente
  stdout.write("Ingrese su nombre: ");
  String nombre = stdin.readLineSync() ?? "";
  stdout.write("Ingrese su dirección: ");
  String direccion = stdin.readLineSync() ?? "";
  stdout.write("Ingrese su teléfono: ");
  String telefono = stdin.readLineSync() ?? "";

  Cliente cliente = Cliente(nombre, direccion, telefono);

  // Selección de productos
  List<Producto> seleccionados = [];
  while (true) {
    print("\n=== Catálogo de Productos ===");
    for (int i = 0; i < catalogo.length; i++) {
      print("${i + 1}. ${catalogo[i]}");
    }
    print("0. Finalizar pedido");

    stdout.write("Elija un producto (número): ");
    int? opcion = int.tryParse(stdin.readLineSync() ?? "");
    if (opcion == null || opcion < 0 || opcion > catalogo.length) {
      print("❌ Opción inválida.");
      continue;
    }
    if (opcion == 0) break;

    seleccionados.add(catalogo[opcion - 1]);
    print("✅ ${catalogo[opcion - 1].nombre} agregado al pedido.");
  }

  if (seleccionados.isEmpty) {
    print("❌ No se seleccionaron productos. Pedido cancelado.");
    return;
  }

  // Simulamos tiempo de entrega aleatorio (30-60 min)
  int tiempoEstimado = 30 + (DateTime.now().second % 31);
  double costoDomicilio = 5000;

  Pedido pedido = Pedido(cliente, seleccionados, tiempoEstimado, costoDomicilio);

  // Mostrar resumen del pedido
  pedido.mostrarResumen();
}