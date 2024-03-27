import 'package:app_food/common/enums.dart';

class ResponseResult {
  final ResponseStatus responseStatus;
  final String message;

  ResponseResult({
    required this.responseStatus,
    required this.message,
  });
}
