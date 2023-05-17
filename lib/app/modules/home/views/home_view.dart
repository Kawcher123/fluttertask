import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/app/constants/contants.dart';
import 'package:flutter_task/app/modules/home/widgets/company_form_widget.dart';
import 'package:flutter_task/app/modules/home/widgets/company_item_widget.dart';
import 'package:flutter_task/app/reusable_widgets/block_button_widget.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldBackground,
        appBar: AppBar(
          backgroundColor: scaffoldBackground,
          elevation: 1,
          title: const Text(
            'Company List',
            style: TextStyle(color: textPrimaryColor),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Obx(()
            {

            if(controller.dataLoaded.isTrue)
              {
                return CustomRefreshIndicator(
                  /// delegate with configuration
                  builder: MaterialIndicatorDelegate(
                    builder: (context, controller) {
                      return const Icon(
                        Icons.replay_circle_filled,
                        color: Colors.blue,
                        size: 30,
                      );
                    },
                  ),
                  onRefresh: controller.getCompanyListWithPageNo,
                  trigger: IndicatorTrigger.trailingEdge,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: List.generate(controller.companyList.length, (index) {
                        return  CompanyItemWidget(companyModel:controller.companyList[index] ,);
                      }),
                    ),
                  ),
                );
              }

                else
                  {
                    return const Center(child: CircularProgressIndicator());
                  }
            }),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: BlockButtonWidget(
                  width: size.width * 0.45,
                  onPressed: () {
                    _showAlertDialog(context);
                  },
                  color: primaryColor,
                  child: const Text(
                    'Create Company',
                    style: TextStyle(color: textSecondaryColor),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Future<void> _showAlertDialog(context) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
              insetPadding: const EdgeInsets.only(top: 55, bottom: 45, left: 15, right: 15),
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  return const CompanyFormWidget();
                },
              ),
            ));
  }
}
