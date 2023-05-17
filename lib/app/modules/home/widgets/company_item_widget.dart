



import 'package:flutter/material.dart';
import 'package:flutter_task/app/constants/contants.dart';
import 'package:flutter_task/app/models/company_model.dart';
import 'package:flutter_task/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class CompanyItemWidget extends GetView<HomeController> {
  const CompanyItemWidget({Key? key,required this.companyModel}) : super(key: key);
  final CompanyModel? companyModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width*0.25,
      width: size.width,


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(companyModel!.companyName!,style: const TextStyle(color: textPrimaryColor,fontSize: 17,fontWeight: FontWeight.w600,),),
            Text(companyModel!.email!,style: const TextStyle(color: textPrimaryColor,fontSize: 14),),
            Text(companyModel!.phone!,style: const TextStyle(color: textPrimaryColor,fontSize: 14,),),
          ],
        ),
      ),

          Container(
            height: 1,
            width: size.width,
            color: primaryGrey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
