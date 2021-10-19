import 'package:chopper/chopper.dart';
import 'model_response.dart';
import 'book_model.dart';

abstract class ServiceInterface {
  Future<Response<Result<APIBookQuery>>> queryBooks(String query);
}
