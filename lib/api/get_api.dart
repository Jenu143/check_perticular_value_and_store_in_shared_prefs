import 'dart:convert';
import 'package:check_value_show/constant/strings.dart';
import 'package:check_value_show/model/model.dart';
import 'package:http/http.dart' as http;

class GetApi {
  //
  Future<CustomApiModel<ApiModel>> fetchData() async {
    final response = await http.get(Uri.parse(Strings.url));

    if (response.statusCode == 200) {
      return CustomApiModel<ApiModel>(
        data: ApiModel.fromJson(jsonDecode(response.body)),
        statusCode: 200,
      );
    } else {
      return CustomApiModel<ApiModel>(
        msg: "Faild to fetch data from the internet",
        statusCode: 400,
      );
    }
  }
}
