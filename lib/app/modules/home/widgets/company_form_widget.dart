import 'package:flutter/material.dart';
import 'package:flutter_task/app/constants/contants.dart';
import 'package:flutter_task/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_task/app/reusable_widgets/block_button_widget.dart';
import 'package:flutter_task/app/reusable_widgets/text_field_widget.dart';
import 'package:get/get.dart';

class CompanyFormWidget extends GetWidget<HomeController> {
  const CompanyFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height*0.7,
      width: size.width,
      child: SingleChildScrollView(

        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                  Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                    color: cancelColor,
                  ),
                ),
              ),


              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5),
                child:  Text(
                 'Create a New Company',
                  style: TextStyle(fontSize: 22,color: textPrimaryColor),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                child: TextFieldWidget(
                  labelText: 'Company Name',
                  hintText: 'Company Name',
                  keyboardType: TextInputType.text,
                  hasBorder: true,
                  radius: 5,
                  onChanged: (input)
                  {
                    controller.companyModel.companyName=input;

                  },
                  validator: (v)
                  {
                    if(v!.isEmpty)
                    {
                      return 'Company name cannot be empty';
                    }

                    else
                    {
                      return null;
                    }


                  },
                  initialValue: '',
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                child: TextFieldWidget(
                  labelText: 'Work Email',
                  hintText: 'Work Email',
                  keyboardType: TextInputType.text,
                  hasBorder: true,
                  radius: 5,
                  onChanged: (input)
                  {
                    controller.companyModel.email=input;

                  },
                  validator: (v)
                  {
                    if(v!.isEmpty)
                      {
                        return 'Email cannot be empty';
                      }
                    else if(!v.contains('@'))
                      {
                        return 'Please enter valid email address.';
                      }
                    else
                      {
                        return null;
                      }


                  },
                  initialValue: '',
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                child: TextFieldWidget(
                  labelText: 'Password',
                  hintText: 'Password',
                  keyboardType: TextInputType.text,
                  hasBorder: true,
                  radius: 5,
                  onChanged: (input)
                  {
                    controller.companyModel.password=input;

                  },
                  validator: (v)
                  {
                    if(v!.isEmpty || v.length<7)
                    {
                      return 'Password must be at least 7 characters.';
                    }
                    else
                    {
                      return null;
                    }


                  },
                  initialValue: '',
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                child: TextFieldWidget(
                  labelText: 'Phone',
                  hintText: 'Phone',
                  keyboardType: TextInputType.text,
                  hasBorder: true,
                  radius: 5,
                  onChanged: (input)
                  {
                    controller.companyModel.phone=input;

                  },
                  validator: (v)
                  {
                    if(v!.isEmpty || v.length<11)
                    {
                      return 'Please enter valid phone number';
                    }
                    else
                    {
                      return null;
                    }


                  },
                  initialValue: '',
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                child: BlockButtonWidget(
                  onPressed: ()
                  {
                    if(controller.formKey.currentState!.validate()){
                      print('CompanyFormWidget.build:${controller.companyModel.toJson()}');

                      Get.back();
                      controller.addCompany();
                    }
                  },
                  color: primaryColor,
                  child: const Text('Create a new company',style: TextStyle(color: textSecondaryColor),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}