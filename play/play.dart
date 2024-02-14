import 'dart:io';
import 'dart:math';

void main(){
    stdout.write('欢迎! 我们一起来做加法吧!\n');
    while(true){
        int num1 = Random().nextInt(100);
        int num2 = Random().nextInt(100);
        int result = num1 + num2;
        stdout.write('$num1 + $num2 = ');
        var answer = int.tryParse(stdin.readLineSync() ?? '');
        if (answer == result) {
            stdout.write('回答正确!\n你还要继续吗?');
            var a = stdin.readLineSync();
        }
        else {
            stdout.write('回答错误~ 答案是 $result\n你还要继续吗?');
            var a = stdin.readLineSync();
        }
    }
}