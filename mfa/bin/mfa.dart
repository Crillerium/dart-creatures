import 'package:dart_totp/dart_totp.dart';

void main() {
  String totp = TOTP.generateTOTP('SPDIONZ2RO6D75S4');
  print('awesome: $totp');
}
