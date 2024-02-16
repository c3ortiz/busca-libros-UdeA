
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/use_cases/book_data/book_data_use_case.dart';
import '../../infrastructure/driven_adapter/api/book_data_api/book_data_api.dart';

final bookDataProvider = Provider<BookDataUseCase>(
  (ref) {
    return BookDataUseCase(BookDataApi());
  },
);
