import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> detectLanguage(String text) async {
  final String apiKey = 'b1c4d7910fmsh7174c49addee880p1d278djsn713e5279bca6';
  final String endpoint = 'https://google-translate1.p.rapidapi.com/language/translate/v2/detect';

  final Map<String, String> headers = {
    'content-type': 'application/x-www-form-urlencoded',
    'accept-encoding': 'application/gzip',
    'x-rapidapi-host': 'google-translate1.p.rapidapi.com',
    'x-rapidapi-key': apiKey,
  };

  final Map<String, String> body = {
    'q': text,
  };

  final response = await http.post(
    Uri.parse(endpoint),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    final decodedResponse = json.decode(response.body);
    return decodedResponse['data']['detections'][0][0]['language'];
  } else {
    throw Exception('Failed to detect language');
  }
}

Future<Map<String, String>> getSupportedLanguages() async {
  final String apiKey = 'b1c4d7910fmsh7174c49addee880p1d278djsn713e5279bca6';
  final String endpoint = 'https://google-translate1.p.rapidapi.com/language/translate/v2/languages';

  final Map<String, String> headers = {
    'accept-encoding': 'application/gzip',
    'x-rapidapi-host': 'google-translate1.p.rapidapi.com',
    'x-rapidapi-key': apiKey,
  };

  final response = await http.get(
    Uri.parse(endpoint),
    headers: headers,
  );

  if (response.statusCode == 200) {
    final decodedResponse = json.decode(response.body);
    return decodedResponse['data']['languages'];
  } else {
    throw Exception('Failed to get supported languages');
  }
}

Future<String> translateText(String text, String targetLanguage, {String sourceLanguage = 'auto'}) async {
  final String apiKey = 'b1c4d7910fmsh7174c49addee880p1d278djsn713e5279bca6';
  final String endpoint = 'https://google-translate1.p.rapidapi.com/language/translate/v2';

  final Map<String, String> headers = {
    'content-type': 'application/x-www-form-urlencoded',
    'accept-encoding': 'application/gzip',
    'x-rapidapi-host': 'google-translate1.p.rapidapi.com',
    'x-rapidapi-key': apiKey,
  };

  final Map<String, String> body = {
    'q': text,
    'source': sourceLanguage,
    'target': targetLanguage,
  };

  final response = await http.post(
    Uri.parse(endpoint),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    final decodedResponse = json.decode(response.body);
    return decodedResponse['data']['translations'][0]['translatedText'];
  } else {
    throw Exception('Failed to translate text');
  }
}
