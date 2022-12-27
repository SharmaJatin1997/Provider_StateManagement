





import 'package:dio/dio.dart';
import 'package:using_provider/Injector.dart';
import 'package:using_provider/api_constants.dart';
import 'package:using_provider/screens/UserModel.dart';
import 'package:using_provider/shared/data_response.dart';
import 'package:using_provider/shared/error_model.dart';
import 'package:using_provider/shared/page_response.dart';

class AuthApiProvider{
  late Dio _dio;

  AuthApiProvider(){
    _dio = Injector().getDio();
  }


  Future< DataResponse<UserModel?>> signUp(UserModel userModel) async{
    try{
      Map<String, dynamic> map = userModel.toJson();
      // Response response = await _dio.post(ApiConstants.login,options: Injector.getHeaderToken(), data: map);
      Response response = await _dio.post(
          ApiConstants.signUpUrl, options: Injector.getHeaderToken(),
          data: map
      );
      var dataResponse = DataResponse<UserModel>.fromJson(response.data, (data) =>
          UserModel.fromJson(data as Map<String, dynamic>));
      return dataResponse;
    }
    catch(error){
      final res = (error as dynamic).response;
      if(res!=null) return DataResponse.fromJson(res?.data, (data) => null);
      return DataResponse(code :0,message: error.toString());
    }
  }

  //-------------------VerifyOtp---------------------------//

  Future<dynamic> verifyOtp(UserModel userModel) async{
    try{
      Response response =
      await _dio.post(ApiConstants.verificationUrl,options: Injector.getHeaderToken(),
          data: userModel);
      var dataResponse = DataResponse<UserModel>.fromJson(response.data,
              (data) => UserModel.fromJson(data as Map<String, dynamic>));
      return dataResponse;
    }catch (error) {
      final res = (error as dynamic).response;
      if (res != null) return DataResponse.fromJson(res?.data, (data) => null);
      return DataResponse(message: error.toString());
    }
  }
  //-----------------------SignIn---------------------------//
  Future<dynamic> signIn(UserModel userModel) async{
    try{
      Response response = await _dio.post(ApiConstants.loginUrl,data: userModel);
      var dataResponse = DataResponse<UserModel>.fromJson(response.data, (data) =>
          UserModel.fromJson(data as Map<String, dynamic>));
      return dataResponse;
    }catch(error){
      final res = (error as dynamic).response;
      if(res!=null) return ErrorModel.fromJson(res?.data,(data) =>
          UserModel.fromJson(data as Map<String, dynamic>));
      return ErrorModel(message: error.toString());
    }
  }

  //-----------------------Forgot Password---------------------------//
  Future<DataResponse<UserModel?>> forgotPass(UserModel userModel) async{
    try{
      Response response = await _dio.post(ApiConstants.forgotPassUrl,data: userModel);
      var dataResponse = DataResponse<UserModel>.fromJson(response.data, (data) =>
          UserModel.fromJson(data as Map<String, dynamic>));
      return dataResponse;
    }catch (error) {
      final res = (error as dynamic).response;
      if (res != null) return DataResponse.fromJson(res?.data, (data) => null);
      return DataResponse(message: error.toString());
    }
  }
  //-----------------------Get Supervisor's Info---------------------------//
  Future<PageResponse<UserModel?>> supervisor(UserModel userModel) async{
    try{
      Map<String, dynamic> map = userModel.toJson();
      // Response response = await _dio.post(ApiConstants.login,options: Injector.getHeaderToken(), data: map);
      Response response = await _dio.get(
        ApiConstants.getSupervisorUrl,
      );
      var dataResponse = PageResponse<UserModel>.fromJson(response.data, (data) =>
          UserModel.fromJson(data as Map<String, dynamic>));
      return dataResponse;
    }
    catch(error){
      final res = (error as dynamic).response;
      if(res!=null) return PageResponse.fromJson(res?.data, (data) => null);
      return PageResponse(success :0,message: error.toString());
    }
  }
  //-----------------------Get Supervisor's Info---------------------------//
  Future< DataResponse<UserModel?>> resendOtp(UserModel userModel) async{
    try{
      Response response = await _dio.post(ApiConstants.resendOtpUrl,data: userModel);
      var dataResponse = DataResponse<UserModel>.fromJson(response.data, (data) =>
          UserModel.fromJson(data as Map<String, dynamic>));
      return dataResponse;
    }catch(error){
      final res = (error as dynamic).response;
      if(res!=null) return DataResponse.fromJson(res?.data, (data) => null);
      return DataResponse(message: error.toString());
    }
  }
//
// Future< DataResponse<UserModel?>> verifyOtp(UserModel userModel) async{
//   try{
//     Response response = await _dio.post(ApiConstants.verify,options: Injector.getHeaderToken(), data: userModel);
//     var dataResponse = DataResponse<UserModel>.fromJson(response.data, (data) =>
//         UserModel.fromJson(data as Map<String, dynamic>));
//     return dataResponse;
//   }catch(error){
//     final res = (error as dynamic).response;
//     if(res!=null) return DataResponse.fromJson(res?.data, (data) => null);
//     return DataResponse(success :0,message: error.toString());
//   }
// }
// Future< DataResponse<UserModel?>> resendOtp(UserModel userModel) async{
//   try{
//     Response response = await _dio.post(ApiConstants.resendOtp,options: Injector.getHeaderToken(), data: userModel);
//     var dataResponse = DataResponse<UserModel>.fromJson(response.data, (data) =>
//         UserModel.fromJson(data as Map<String, dynamic>));
//     return dataResponse;
//   }catch(error){
//     final res = (error as dynamic).response;
//     if(res!=null) return DataResponse.fromJson(res?.data, (data) => null);
//     return DataResponse(success :0,message: error.toString());
//   }
// }
// Future< DataResponse<UserModel?>> forgetPassword(UserModel userModel) async{
//   try{
//     Response response = await _dio.post(ApiConstants.forgotPassword,options: Injector.getHeaderToken(), data: userModel);
//     var dataResponse = DataResponse<UserModel>.fromJson(response.data, (data) =>
//         UserModel.fromJson(data as Map<String, dynamic>));
//     return dataResponse;
//   }catch(error){
//     final res = (error as dynamic).response;
//     if(res!=null) return DataResponse.fromJson(res?.data, (data) => null);
//     return DataResponse(success :0,message: error.toString());
//   }
// }
// Future<DataResponse<Object?>> logOut()async{
//   try{
//     Response response = await _dio.put(ApiConstants.logOut,options: Injector.getHeaderToken());
//     var dataResponse = DataResponse.fromJson(response.data, (data) =>
//     null);
//     return dataResponse;
//   }catch(error){
//     final res = (error as dynamic).response;
//     if(res!=null) return DataResponse.fromJson(res?.data,(data)=>null);
//     return DataResponse(message: error.toString(), success: 0);
//   }
// }
// Future< DataResponse<UserModel?>> changePassword(UserModel userModel) async{
//   try{
//     Response response = await _dio.post(ApiConstants.changePassword,
//         options: Injector.getHeaderToken(), data: userModel);
//     var dataResponse = DataResponse<UserModel>.fromJson(response.data, (data) =>
//         UserModel.fromJson(data as Map<String, dynamic>));
//     return dataResponse;
//   }catch(error){
//     final res = (error as dynamic).response;
//     if(res!=null) return DataResponse.fromJson(res?.data, (data) =>  null);
//     return DataResponse(success :0,message: error.toString());
//   }
// }
}