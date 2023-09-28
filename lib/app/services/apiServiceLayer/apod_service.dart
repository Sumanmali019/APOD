import 'dart:convert';
import 'package:apod_app/app/services/dataModel/apod_model.dart';
import 'package:apod_app/app/utils/const.dart';
import 'package:http/http.dart' as http;

class ApodCountService {
  ApodCountService();

  Future<List<ApodModel>> fetchApodImages({int count = 5}) async {
    final url = Uri.parse(
        'https://api.nasa.gov/planetary/apod?api_key=$apiKey&count=$count');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> apodDataList = json.decode(response.body);
        return apodDataList.map((json) => ApodModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch APOD images');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
