import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiService {
  final http.Client _httpClient;

  ApiService(this._httpClient);

  // Fetch Data
  Future<List<dynamic>> fetchData(String endpointUrl, Map<String, String> params) async {
    final url = Uri.parse(endpointUrl).replace(queryParameters: params);
    final response = await _httpClient.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      final jsonData = json.decode(response.body)['departments'] as List<dynamic>;
      return jsonData;
    } else {
      throw Exception('Failed to load data from $endpointUrl');
    }
  }
}

