import 'package:flutter/material.dart';
import 'package:flutter_task/app/enum/enum.dart';
import 'package:flutter_task/app/models/company_model.dart';
import 'package:flutter_task/app/repositories/company_repository.dart';
import 'package:get/get.dart';

import '../../../common_ui/ui.dart';

class HomeController extends GetxController {
  final CompanyRepository _companyRepository = CompanyRepository();
  final companyList = <CompanyModel>[].obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final page = 1.obs;
  final dataLoaded=false.obs;

  final CompanyModel companyModel = CompanyModel();

  @override
  void onInit() {
    super.onInit();
    getCompanyList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getCompanyList() async {

    _companyRepository.getCompanyData().then((resp) {
      print('HomeController.getCompanyList:${resp.status}');
      companyList.value = resp.data;
      dataLoaded.value=true;
    }).catchError((onError) {
      dataLoaded.value=true;
      debugPrint('Error in getCompanyList of HomeController: $onError');
    });
  }

  Future<void> getCompanyListWithPageNo() async {
    page.value++;
    _companyRepository.getCompanyData(page: page.value).then((resp) {
      print('HomeController.getCompanyListWithPageNo:${resp.data.length}');

      companyList.addAll(resp.data);
      print('HomeController.getCompanyListWithPageNo:${companyList.length}');
    }).catchError((onError) {
      debugPrint('Error in getCompanyListWithPageNo of HomeController: $onError');
    });
  }

  Future<void> addCompany() async {
    Ui.customDialogLoader();

    _companyRepository.addCompany(companyModel).then((resp) {
      Get.back();

      print('HomeController.addCompany:${resp.status}');
      if (resp.status == ReturnedStatus.success) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(Ui.successAwesomeSnackBar(message: 'Data Added Successfully', title: 'Success'));
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(Ui.errorAwesomeSnackBar(message: resp.data.toString(), title: 'Error'));
      }

      print('HomeController.addCompany:${companyList.length}');
    }).catchError((onError) {
      Get.back();
      ScaffoldMessenger.of(Get.context!).showSnackBar(Ui.errorAwesomeSnackBar(message: 'Failed to add data', title: 'Error'));

      debugPrint('Error in addCompany of HomeController: $onError');
    });
  }
}
