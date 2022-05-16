import 'package:check_value_show/api/get_api.dart';
import 'package:check_value_show/model/model.dart';
import 'package:flutter/cupertino.dart';

class GetProvider extends ChangeNotifier {
  GetApi getApi = GetApi();
  CustomApiModel<ApiModel> customModel = CustomApiModel<ApiModel>();
  bool isCheck = false;

  Future<CustomApiModel<ApiModel>> getApiProvider() async {
    customModel = await getApi.fetchData();
    notifyListeners();
    return customModel;
  }

  checkValue() {
    isCheck = !isCheck;
    notifyListeners();
  }
}
