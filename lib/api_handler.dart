import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ip_info_app/api_result_model.dart';

class ApiHandler {
  static Future<ResultModel> apiCall({String ipAddress = ""}) async {
    String? apiKey = dotenv.env['API_KEY'];
    try {
      var url =
          Uri.parse('https://api.freegeoip.app/json/$ipAddress?apikey=$apiKey');
      var response = await http.get(url);

      if (response.statusCode != 200) {
        return ResultModel(
            isSuccess: false, message: "Something wrong happened");
      }
      var body = jsonDecode(response.body);
      return ResultModel(isSuccess: true, data: ApiResultModel.fromJson(body));
    } catch (e) {
      return ResultModel(isSuccess: false, message: e.toString());
    }
  }
}
