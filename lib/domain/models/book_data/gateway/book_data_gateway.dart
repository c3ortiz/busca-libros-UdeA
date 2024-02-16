import '../book_data.dart';

abstract class BookDataGateway {
  Future<List<BookDetail>> getBookData();
}