import 'package:dart_totp/dart_totp.dart';
import 'package:console/console.dart';
import 'dart:io';

String readline(String prompt) {
    stdout.write(prompt);
    var line = Console.readLine() ?? '';
    return line;
}

void main(List<String> argvs) {
    String totp = TOTP.generateTOTP(argvs.length != 0 ? argvs[0] : readline('Please Input Your Key: '));
    print('Athentication Code: $totp');
}
