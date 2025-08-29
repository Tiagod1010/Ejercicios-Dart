import 'dart:io';

// Clase Producto
class Producto {
  String nombre;
  double precio;
  String categoria;
  bool disponible;

  Producto(this.nombre, this.precio, this.categoria, this.disponible);

  @override
  String toString() {
    return "$nombre - \$${precio.toStringAsFixed(2)} (${categoria}) "
        "${disponible ? 'Disponible' : 'No disponible'}";
  }
}

// Clase Carrito
class Carrito {
  List<Producto> _productos = [];

  // Agregar producto al carrito
  void agregarProducto(Producto producto) {
    if (producto.disponible) {
      _productos.add(producto);
      print("✅ ${producto.nombre} agregado al carrito.");
    } else {
      print("❌ ${producto.nombre} no está disponible.");
    }
  }

  // Calcular subtotal
  double calcularSubtotal() {
    return _productos.fold(0, (total, p) => total + p.precio);
  }

  // Aplicar descuento (ejemplo: 10% si supera $100)
  double aplicarDescuento(double subtotal) {
    if (subtotal > 100) {
      return subtotal * 0.10; // 10% de descuento
    }
    return 0;
  }

  // Calcular impuestos (ejemplo: 19%)
  double calcularImpuestos(double subtotal) {
    return subtotal * 0.19;
  }

  // Calcular total final
  double calcularTotal() {
    double subtotal = calcularSubtotal();
    double descuento = aplicarDescuento(subtotal);
    double impuestos = calcularImpuestos(subtotal - descuento);
    return subtotal - descuento + impuestos;
  }

  // Mostrar resumen del carrito
  void mostrarResumen() {
    print("\n=== 🛒 Resumen del Carrito ===");
    if (_productos.isEmpty) {
      print("El carrito está vacío.");
      return;
    }

    for (var p in _productos) {
      print("- ${p.nombre}: \$${p.precio.toStringAsFixed(2)}");
    }

    double subtotal = calcularSubtotal();
    double descuento = aplicarDescuento(subtotal);
    double impuestos = calcularImpuestos(subtotal - descuento);
    double total = calcularTotal();

    print("\nSubtotal: \$${subtotal.toStringAsFixed(2)}");
    print("Descuento: -\$${descuento.toStringAsFixed(2)}");
    print("Impuestos: +\$${impuestos.toStringAsFixed(2)}");
    print("TOTAL: \$${total.toStringAsFixed(2)}");
  }
}

void main() {
  // Lista de productos disponibles
  List<Producto> catalogo = [
    Producto("Celular", 800, "Electrónica", true),
    Producto("Audífonos", 50, "Electrónica", true),
    Producto("Cargador", 20, "Accesorios", false),
    Producto("Camiseta", 30, "Ropa", true),
    Producto("Zapatos", 120, "Ropa", true),
  ];

  Carrito carrito = Carrito();

  while (true) {
    print("\n=== 📱 Carrito de Compras ===");
    print("1. Ver catálogo");
    print("2. Agregar producto al carrito");
    print("3. Ver resumen del carrito");
    print("4. Salir");
    stdout.write("Elige una opción: ");
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case "1":
        print("\n=== Catálogo de productos ===");
        for (int i = 0; i < catalogo.length; i++) {
          print("${i + 1}. ${catalogo[i]}");
        }
        break;

      case "2":
        print("\nElige el número del producto a agregar:");
        for (int i = 0; i < catalogo.length; i++) {
          print("${i + 1}. ${catalogo[i]}");
        }
        stdout.write("Número: ");
        int? num = int.tryParse(stdin.readLineSync() ?? "");
        if (num != null && num > 0 && num <= catalogo.length) {
          carrito.agregarProducto(catalogo[num - 1]);
        } else {
          print("❌ Opción no válida.");
        }
        break;

      case "3":
        carrito.mostrarResumen();
        break;

      case "4":
        print("👋 Gracias por usar el carrito de compras.");
        return;

      default:
        print("❌ Opción inválida, intenta de nuevo.");
    }
  }
}