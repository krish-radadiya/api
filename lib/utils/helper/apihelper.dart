import 'dart:convert';
import 'dart:developer';

import 'package:api/utils/global.dart';

import '../model/api_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();

  Future<List<api_model>> fetchData() async {
    String apiPoint = "https://dummyjson.com/products";
    http.Response response = await http.get(Uri.parse(apiPoint));
    log("${response.statusCode}");
    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);
      List allProduct = decodedData['products'];
      allProdyct = decodedData['products'];
      List<api_model> apiModel =
          allProduct.map((e) => api_model.fromApi(data: e)).toList();

      return apiModel;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
