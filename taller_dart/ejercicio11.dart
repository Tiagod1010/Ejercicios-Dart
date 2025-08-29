import 'dart:io';

class Evento {
  String nombre;
  String fecha;
  String lugar;
  double precio;
  int capacidad;
  int reservas = 0;

  Evento(this.nombre, this.fecha, this.lugar, this.precio, this.capacidad);

  bool reservar(int cantidad) {
    if (reservas + cantidad <= capacidad) {
      reservas += cantidad;
      return true;
    }
    return false;
  }

  bool cancelar(int cantidad) {
    if (cantidad <= reservas) {
      reservas -= cantidad;
      return true;
    }
    return false;
  }

  void mostrar(int id) {
    print(
        "$id. $nombre - $fecha en $lugar | Precio: \$${precio.toStringAsFixed(0)} | Cupos disponibles: ${capacidad - reservas} | Reservas actuales: $reservas");
  }
}

void main() {
  List<Evento> eventos = [
    Evento("Concierto Rock", "20/09/2025", "Teatro Municipal", 50000, 100),
    Evento("Película Acción", "21/09/2025", "Cine Central", 15000, 80),
    Evento("Obra de Teatro", "22/09/2025", "Auditorio Popular", 30000, 50),
  ];

  while (true) {
    print("\n=== Sistema de Reservas ===");
    print("1. Ver eventos");
    print("2. Reservar");
    print("3. Cancelar reserva");
    print("4. Salir");

    stdout.write("Opción: ");
    int op = int.parse(stdin.readLineSync()!);

    if (op == 1) {
      print("\n📅 Eventos disponibles:");
      for (int i = 0; i < eventos.length; i++) {
        eventos[i].mostrar(i + 1);
      }
    } else if (op == 2) {
      print("\nSeleccione evento para reservar:");
      for (int i = 0; i < eventos.length; i++) {
        eventos[i].mostrar(i + 1);
      }
      stdout.write("Número de evento: ");
      int ev = int.parse(stdin.readLineSync()!) - 1;

      stdout.write("Cantidad de entradas a reservar: ");
      int cant = int.parse(stdin.readLineSync()!);

      if (eventos[ev].reservar(cant)) {
        print("✅ Reserva realizada. Ahora tienes ${eventos[ev].reservas} reservas en este evento.");
      } else {
        print("❌ No hay cupos suficientes.");
      }
    } else if (op == 3) {
      print("\nSeleccione evento para cancelar:");
      for (int i = 0; i < eventos.length; i++) {
        eventos[i].mostrar(i + 1);
      }
      stdout.write("Número de evento: ");
      int ev = int.parse(stdin.readLineSync()!) - 1;

      print("🔎 Este evento tiene actualmente ${eventos[ev].reservas} reservas.");
      stdout.write("Cantidad de entradas a cancelar: ");
      int cant = int.parse(stdin.readLineSync()!);

      if (eventos[ev].cancelar(cant)) {
        print("✅ Cancelación realizada. Ahora este evento tiene ${eventos[ev].reservas} reservas activas.");
      } else {
        print("❌ No puedes cancelar más reservas de las que tienes.");
      }
    } else if (op == 4) {
      print("👋 Saliendo...");
      break;
    } else {
      print("❌ Opción inválida.");
    }
  }
}