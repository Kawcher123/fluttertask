import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter_task/app/models/company_model.dart';

import '../apis/api_manager.dart';
import '../apis/api_url.dart';
import '../enum/enum.dart';
import '../models/returned_data_model.dart';

class CompanyRepository {
  final APIManager _apiManager = APIManager();

  Future<ReturnedDataModel> getCompanyData({int page = 1}) async {
    ReturnedDataModel returnedDataModel = ReturnedDataModel(status: ReturnedStatus.error);

    try {
      var result = await _apiManager.getApiCall(url: ApiUrl.getCompanyDataUrl(page: page), headerData: {});

      List<CompanyModel> users = [];

      if (result.containsKey("status_code")) {
        if (result["status_code"].toString() == '1') {
          if (result.containsKey("company_list")) {
            if (result["company_list"].isNotEmpty) {
              if (result["company_list"].containsKey("data")) {
                if (result["company_list"]["data"].isNotEmpty) {
                  for (var item in result["company_list"]["data"]) {
                    users.add(CompanyModel.fromJson(item));
                  }

                  returnedDataModel.data = users;
                  returnedDataModel.status = ReturnedStatus.success;
                }
              }
            }
          }
        }
      }
    } on Exception catch (e) {
      // TODO

      throw ('Exception in addCompany: ${e.toString()}');
    }

    return returnedDataModel;
  }

  Future<ReturnedDataModel<int>> addCompany(CompanyModel company) async {
    ReturnedDataModel<int> returnedDataModel = ReturnedDataModel(status: ReturnedStatus.error);

    try {
      var result = await _apiManager
          .postApiCall(url: ApiUrl.addCompanyUrl, param: jsonEncode(company.toJson()), headerData: {'Content-Type': 'application/json'});

      if (result.containsKey("status_code")) {
        if (result["status_code"].toString() == '1') {
          print('CompanyRepository.addCompany:${result}');
          returnedDataModel.status = ReturnedStatus.success;
        }
      }
    } on Exception catch (e) {
      // TODO

      throw ('Exception in addCompany: ${e.toString()}');
    }

    return returnedDataModel;
  }
}
