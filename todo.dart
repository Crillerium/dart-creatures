import 'dart:io';

void main(List<String> argvs){
    if (argvs.length != 0) {
        stdout.write('Dart Todo List: ['+argvs[0]+']\n');
        switch (argvs[0]) {
            case 'list':
                listTodo();
                break;
            case 'add':
                addTodo();
                break;
            case 'edit':
                editTodo();
                break;
            case 'del':
                delTodo();
                break;
            default:
                helpTodo();
        }
    }
    else {
        helpTodo();
    }
}

void listTodo(){
    var list = File('todo.db').readAsLinesSync();
    int order = 1;
    list.forEach((content) {
        stdout.write('[$order] $content\n');
        order+=1;
    });
}

void addTodo(){
    var list = File('todo.db').readAsLinesSync();
    stdout.write('New Todo: ');
    String rel = stdin.readLineSync() ?? '';
    list.add(rel);
    String content = list.join('\n');
    File('todo.db').writeAsString(content).then((_)=>print('Added Successfully!')).catchError((error) => print('Error Happened: $error'));
}

void editTodo(){
    listTodo();
    var list = File('todo.db').readAsLinesSync();
    stdout.write('which one would you like to edit? ');
    var order = int.tryParse(stdin.readLineSync() ?? '');
    if (order != null && order >= 1 && order <= list.length) {
        stdout.write('Update Todo: ');
        String rel = stdin.readLineSync() ?? '';
        try {
            list[order-1] = rel;
            String content = list.join('\n');
            File('todo.db').writeAsString(content).then((_)=>print('Edited Successfully!')).catchError((error) => print('Error Happened: $error'));
        }
        catch (error) {
            print('Error Happened: $error');
        }
    }
    else {
        print('Invalid Order!');
    }
}

void delTodo(){
    listTodo();
    var list = File('todo.db').readAsLinesSync();
    stdout.write('which one would you like to edit? ');
    var order = int.tryParse(stdin.readLineSync() ?? '');
    if (order != null && order >= 1 && order <= list.length) {
        try {
            list.removeAt(order-1);
            String content = list.join('\n');
            File('todo.db').writeAsString(content).then((_)=>print('Deleted Successfully!')).catchError((error)=>print('Error Happened: $error'));
        } catch (error) {
            print('Error Happened: $error');
        }
    }
    else {
        print('Invalid Order!');
    }
}

void helpTodo(){
    stdout.write('avaliable arguments:\n');
    stdout.write('[list]: show existed todoes\n');
    stdout.write('[add]: add a new todo\n');
    stdout.write('[edit]: edit a certain todo\n');
    stdout.write('[del]: delete a certain todo\n');
    stdout.write('[help]: show this information\n');
    stdout.write('[other~]: same as argument `help`\n');
}