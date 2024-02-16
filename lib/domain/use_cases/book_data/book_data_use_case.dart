import '../../models/book_data/book_data.dart';
import '../../models/book_data/gateway/book_data_gateway.dart';

class BookDataUseCase{
  final BookDataGateway bookDataGateway;
  BookDataUseCase(this.bookDataGateway);
  Future<List<BookDetail>> getBookData() => bookDataGateway.getBookData();
}