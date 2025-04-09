import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/analysis.dart';

class SonnetApi {
  static const String apiUrl = 'https://api.sonnetcloud.com/v1/analyze';
  static const String accessToken = 'YOUR_ACCESS_TOKEN';

  static Future<Analysis> analyzeText(String inputText) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: json.encode({'input_text': inputText}),
    );

    if (response.statusCode == 200) {
      // تحويل الرد إلى كائن Analysis
      return Analysis.fromJson(json.decode(response.body));
    } else {
      // معالجة الحالة غير المتوقعة
      throw Exception('Failed to analyze text: ${response.statusCode}');
    }
  }
}
