import 'dart:io';

void main() {
  stdout.write("Nombre de usuario: ");
  String usuario = stdin.readLineSync()!;

  stdout.write("Contraseña: ");
  String contrasena = stdin.readLineSync()!;

  stdout.write("Email: ");
  String email = stdin.readLineSync()!;

  stdout.write("Edad: ");
  int edad = int.parse(stdin.readLineSync()!);

  stdout.write("Teléfono: ");
  String telefono = stdin.readLineSync()!;

  // Validaciones
  bool valido = true;

  if (contrasena.length < 8) {
    print("❌ La contraseña debe tener al menos 8 caracteres.");
    valido = false;
  }
  if (!email.contains("@")) {
    print("❌ El email debe contener '@'.");
    valido = false;
  }
  if (edad <= 13) {
    print("❌ La edad debe ser mayor a 13.");
    valido = false;
  }
  if (telefono.length != 10 || int.tryParse(telefono) == null) {
    print("❌ El teléfono debe tener 10 dígitos numéricos.");
    valido = false;
  }

  if (valido) {
    print("✅ Registro exitoso de usuario: $usuario");
  } else {
    print("⚠️ Registro fallido. Corrige los datos e inténtalo de nuevo.");
  }
}