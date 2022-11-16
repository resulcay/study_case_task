import 'package:dio/dio.dart';

import '../constant/text.dart';

class CustomDioMixin {
  final service = Dio(BaseOptions(baseUrl: ConstantAppText.baseUrl));
}
