import 'dart:io';

class UsuarioMovil {
  String nombre;
  String biografia;
  int seguidores = 0;
  List<String> publicaciones = [];
  DateTime fechaRegistro = DateTime.now();

  UsuarioMovil(this.nombre, this.biografia);

  void actualizarPerfil({String? nombre, String? bio}) {
    if (nombre?.isNotEmpty ?? false) this.nombre = nombre!;
    if (bio?.isNotEmpty ?? false) this.biografia = bio!;
    print("✅ Perfil actualizado.");
  }

  void incrementarSeguidores() => print("🎉 Nuevo seguidor. Total: ${++seguidores}");

  void agregarPublicacion(String texto) {
    publicaciones.add(texto);
    print("📝 Publicación agregada.");
  }

  void mostrarPerfil() {
    print("\n👤 $nombre\n📄 $biografia\n👥 Seguidores: $seguidores\n📝 Publicaciones: ${publicaciones.length}\n📅 Registro: $fechaRegistro");
  }

  void generarEstadisticas() {
    print("\n      $nombre");
    print("      $biografia");

    print("\n--- 📊Estadísticas📊 ---");
    
    print("📝 Publicaciones: ${publicaciones.length}");
    print("👥 Seguidores: $seguidores");
    print("📅 Registro: ${fechaRegistro.toString().split('.').first}");
    if (publicaciones.isNotEmpty) print("Última publicación: ${publicaciones.last}");
  }
}

void main() {
  print("==================================");
  print("     📱 Red Social SENA");
  print("==================================");

  stdout.write("Nombre de usuario: ");
  String nombre = stdin.readLineSync() ?? "Usuario";
  stdout.write("Biografía: ");
  String bio = stdin.readLineSync() ?? "";

  var usuario = UsuarioMovil(nombre, bio);

  while (true) {
    print("\n=== Menú ===");
    print("1. Ver perfil");
    print("2. Actualizar perfil");
    print("3. Nueva publicación");
    print("4. Ganar seguidor");
    print("5. Ver estadísticas");
    print("6. Salir");
    stdout.write("Opción: ");
    switch (stdin.readLineSync()) {
      case "1": usuario.mostrarPerfil(); break;
      case "2":
        stdout.write("Nuevo nombre (enter para omitir): ");
        String n = stdin.readLineSync() ?? "";
        stdout.write("Nueva bio (enter para omitir): ");
        String b = stdin.readLineSync() ?? "";
        usuario.actualizarPerfil(nombre: n, bio: b);
        break;
      case "3":
        stdout.write("Escribe tu publicación: ");
        usuario.agregarPublicacion(stdin.readLineSync() ?? "");
        break;
      case "4": usuario.incrementarSeguidores(); break;
      case "5": usuario.generarEstadisticas(); break;
      case "6": print("👋 Hasta pronto!"); return;
      default: print("❌ Opción inválida.");
    }
  }
}