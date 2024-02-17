import 'dart:io';
import 'dart:convert';

Future<String> getFromWeb (String requestUri, Map<String, String> requestQuery) async {
    var http = HttpClient();
    var request = await http.getUrl(Uri.parse(requestUri).replace(queryParameters: requestQuery));
    var response = await request.close();

    try {
        if (response.statusCode == 200) {
            var content = await response.transform(utf8.decoder).join();
            return content;
        }
        else {
            return '';
        }
    }
    catch (e) {
        return '';
    }
    finally {
        http.close();
    }
}

Future<void> main (List<String> argvs) async {
    final configData = await File('config.json').readAsString();
    final config = await jsonDecode(configData);
    String text = argvs.join('\n');
    var content = await getFromWeb('https://api.telegram.org/bot'+config['botToken']+'/sendMessage',{'chat_id':config['chatId'],'text':text,'parse_mode':'html'});
    try {
        print(jsonDecode(content)['ok'] == true ? '消息发送成功' : '消息发送失败');
    } catch (e) {
        print('Error Happend: $e');
    }
}