import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../models/jobs_model.dart';
import '../utils/app_constants.dart';


final clientProvider = Provider((ref) => Dio(
    BaseOptions(
        baseUrl: AppConstants.BASE_URL)
)
);





final repository =
Provider<RepositoryAPI>((ref) => RepositoryAPI(ref));





abstract class Repository {
  Future<List<JobModel>> getJobData();
  Future<dynamic> post(String path,Map body);
}



class RepositoryAPI implements Repository{
  final Ref ref;
  RepositoryAPI(this.ref);


  ///FIXME: THIS IS AN EXAMPLE POST METHOD WITH DIO
  ///@override
  ///Future storePlaidAccount(Map body) async{
  ///  // TODO: implement storePlaidAccount
  ///  try{
  ///    final response = await ref.watch(clientProvider).post(
  ///        AppConstants.STORE_PLAID_ACCOUNT_URI, data: body);
  ///    final dynamic result = jsonDecode(response.data['data']);
  ///    print("result from repository for store plaid acct: ${result}");
  ///  } on DioError catch (errorMessage) {
  ///    throw Exception(errorMessage);
  ///  }
  ///}


  @override
  Future<dynamic> post(String path,Map body) async{

    try{
      /**
       *
       * testing headers:: Learned about the importance of content length in headers
       */

      Options requestOptions = Options();
      ref.watch(clientProvider).options.headers = {
        "content-Type": "application/json",
        "host": AppConstants.BASE_URL.toString().replaceAll("http://", ""),
        "content-Length": (jsonEncode(body).replaceAll(" ", "")).toString(),
      };
      requestOptions.headers = requestOptions.headers ?? {};
      print(requestOptions.headers);
      print(ref.watch(clientProvider).options.headers);
      print("passed header test");
      /**
       *
       * Post Request
       *
       */
      final response = await ref.watch(clientProvider).post(
        path,
        data: jsonEncode(body),
      );
      /**
       *
       *
       *
       */
      print("passed post method");
      Map<String, dynamic> jsonResponse = response.data;
      print(jsonResponse);
      return jsonResponse;
    } on DioError catch (errorMessage) {
      throw Exception(errorMessage);
    }
  }

  Future<dynamic> updateHeaders(String token) async{
    Map<String, String> authorizationHeader = {
      "Authorization":"Bearer ${token}"
    };

    Options requestOptions = Options();
    ref.watch(clientProvider).options.headers.addAll(authorizationHeader);
    requestOptions.headers = requestOptions.headers ?? {};
    print(requestOptions.headers);
    print(ref.watch(clientProvider).options.headers);

  }

  @override
  Future<List<JobModel>> getJobData() async {
    try {
      final response = await ref.watch(clientProvider).get(
          AppConstants.GET_JOB_DATA_URI);
      final List result = jsonDecode(jsonEncode(response.data))['data'];
      print("result from repository: ${result}");
      return result.map((e) => JobModel.fromJson(e)).toList();
    } on DioError catch (errorMessage) {
      throw Exception(errorMessage);
    }

  }
}