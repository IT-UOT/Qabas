import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiService {
  /// The http client should be imoplemnted by a helper method or class
   final http.Client _httpClient = http.Client();
  static const _departmentsEndpoint = 'https://mocki.io/v1/aadee6d5-7ebe-4a85-88f9-869a2708a87f';



  // Fetch Departments
  Future<List<dynamic>> fetchDepartments() async {
    final url = Uri.parse(_departmentsEndpoint);
    final response = await _httpClient.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['departments'] as List<dynamic>;
      return jsonData;
    } else {
      throw Exception('Failed to load departments');
    }
  }
}

