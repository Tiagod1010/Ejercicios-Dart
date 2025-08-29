import 'dart:io';

void main() {
  // Lista de contactos usando mapas
  List<Map<String, String>> contactos = [];

  print("Registro de 5 contactos:");
  for (int i = 0; i < 5; i++) {
    stdout.write("Nombre: ");
    String nombre = stdin.readLineSync()!;
    stdout.write("Teléfono: ");
    String telefono = stdin.readLineSync()!;
    stdout.write("Email: ");
    String email = stdin.readLineSync()!;

    contactos.add({"nombre": nombre, "telefono": telefono, "email": email});
  }

  print("\n📋 Lista de contactos:");
  for (var c in contactos) {
    print("${c['nombre']} - ${c['telefono']} - ${c['email']}");
  }

  // Buscar por nombre
  stdout.write("\nIngrese el nombre a buscar: ");
  String buscar = stdin.readLineSync()!;
  var encontrado = contactos.where((c) => c['nombre']!.toLowerCase() == buscar.toLowerCase());

  if (encontrado.isNotEmpty) {
    print("✅ Contacto encontrado: ${encontrado.first}");
  } else {
    print("❌ No se encontró el contacto.");
  }

  print("\nTotal de contactos registrados: ${contactos.length}");
}