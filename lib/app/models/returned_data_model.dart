import '../enum/enum.dart';

class ReturnedDataModel<T> {
  ReturnedStatus status;
  String? errorMessage;
  T? data;
  ReturnedDataModel({required this.status, this.data, this.errorMessage});
}
