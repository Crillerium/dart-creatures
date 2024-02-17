import 'dart:convert';
import 'dart:io';

Future<void> fetchPoem() async {
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse('https://v1.jinrishici.com/all.txt'));
    var response = await request.close();
    
    if (response.statusCode == 200) {
        var poem = await response.transform(utf8.decoder).join();
        print('今日诗词：$poem');
    } else {
        print('Failed to fetch poem. Status code: ${response.statusCode}');
    }
    httpClient.close();
}

void main() {
    fetchPoem();
}
