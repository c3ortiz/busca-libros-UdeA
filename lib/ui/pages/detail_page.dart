import 'package:bds_mobile/foundations/foundations.dart';
import 'package:bds_mobile/molecules/bc_header/bc_header.dart';
import 'package:flutter/material.dart';

import '../../domain/models/book_data/book_data.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.bookDetail}) : super(key: key);
  final BookDetail bookDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      SizedBox(
        height: 81,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: BcHeader(
            type: BcHeaderType.PageTitle,
            style: BcHeaderStyle.StyleTertiary,
            title: 'Detalle',
            itemLeftIcon: BdsFunctionalIcons.ARROW_LEFT,
            itemLeftOnTap: Navigator.of(context).pop,
            itemLeftActionName: 'Volver',
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(children: [
            Image.network(bookDetail.image!),
            const SizedBox(
              height: 20,
            ),
            Text(bookDetail.title!,
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center),
            Text(bookDetail.subtitle!, textAlign: TextAlign.center),
            const SizedBox(
              height: 20,
            ),
            Text('ISBN: ${bookDetail.isbn13!}'),
            Text('Price: ${bookDetail.price!}'),
            Text('URL: ${bookDetail.url!}')
          ]))
    ])));
  }
}
