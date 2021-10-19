import 'package:chopper/chopper.dart';
import 'book_model.dart';
import 'model_response.dart';
import 'model_converter.dart';
import 'service_interface.dart';
part 'book_service.chopper.dart';

const String apiUrl = 'https://www.googleapis.com/books/v1/';
const String apiKey = 'AIzaSyB07nsnPksO-QJyiN_v55zjnumu8j2W180';
// final apiKey = rootProject.file('.env');

Request _addQuery(Request req) {
  final params = Map<String, dynamic>.from(req.parameters);

  params['key'] = apiKey;

  return req.copyWith(parameters: params);
}

@ChopperApi()
abstract class BookService extends ChopperService implements ServiceInterface {
  @override
  @Get(path: 'volumes')
  Future<Response<Result<APIBookQuery>>> queryBooks(
    @Query('q') String query,
  );
  static BookService create() {
    final client = ChopperClient(
      baseUrl: apiUrl,
      interceptors: [_addQuery, HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$BookService(),
      ],
    );

    return _$BookService(client);
  }
}
