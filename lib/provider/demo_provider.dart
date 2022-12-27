import 'package:flutter/foundation.dart';
import 'package:using_provider/provider/auth_api_provider.dart';
import 'package:using_provider/screens/UserModel.dart';
import 'package:using_provider/shared/data_response.dart';
import 'package:using_provider/shared/error_model.dart';
class CountProvider with ChangeNotifier {
  List<UserModel?> supervisorInfo = [];
  AuthApiProvider authApiProvider = AuthApiProvider();

  Future loginApi() async {
    var response = await authApiProvider.signIn(UserModel(
        email: "maqsood@yopmail.com",
        password: "123456789",
        deviceType: "1",
        deviceToken: "123456"));
    if (response is ErrorModel) {
      if (response.code == 202) {
        if (kDebugMode) {
          print(response.body);
        }
      } else {
        if (kDebugMode) {
          print("Error");
        }
      }
    } else {
      var dataResponse = response as DataResponse;
      if (dataResponse.status == true) {
        if (kDebugMode) {
          print("Response succcesfull---------------->");
        }
        var userModel = dataResponse.body as UserModel;
      }
    }
  }

  Future getSupervisorInfo() async {
    var model = UserModel();
    var response = await authApiProvider.supervisor(model);
    if (response.body != null) {
      supervisorInfo = response.body!;
      notifyListeners();
    } else {
      if (kDebugMode) {
        print("Error");
      }
    }
  }

}











