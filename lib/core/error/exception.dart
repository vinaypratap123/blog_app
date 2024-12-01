import 'package:blog_app/core/constants/string_constants.dart';

class ServerException implements Exception {
  final String message;
  ServerException([this.message = StringConstants.oopsSomethingWentWrong]);
}
