import '../../../../domain/models/book_data/book_data.dart';
import '../../../../domain/models/book_data/gateway/book_data_gateway.dart';
import 'package:http/http.dart' as http;
import 'errors/book_data_api_error.dart';

class BookDataApi extends BookDataGateway {
  final String searchParam;

  BookDataApi({this.searchParam = 'flutter'});

  @override
  Future<List<BookDetail>> getBookData() async {
    Uri url = Uri.parse('https://api.itbook.store/1.0/search/$searchParam');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final bookData = bookDataFromJson(response.body);
      final bookDetails = bookData!.bookDetails;
      return bookDetails!;
    } else {
      throw BookDataApiError();
    }
  }
}
