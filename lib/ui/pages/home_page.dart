import 'package:flutter/material.dart';

import 'package:bds_mobile/foundations/foundations.dart';
import 'package:bds_mobile/molecules/molecules.dart';

import '../../domain/models/book_data/book_data.dart';

import 'detail_page.dart';	

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.bookDetailList}) : super(key: key);
  final Future<List<BookDetail>> bookDetailList;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: 
      Column(children: [
        Container(
          height: 81,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: BcHeader(
              type: BcHeaderType.PageHeader,
              style: BcHeaderStyle.StyleSecondary,
              title: 'Home',
              logo: Container(
                alignment: Alignment.centerLeft,
                child: const Icon(
                  BdsFunctionalLogos.BRAND_BANCOLOMBIA_ISOTIPO_NEGRO,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: BcSearch(
            controller: TextEditingController(),
            hintText: 'Buscar',
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        FutureBuilder<List<BookDetail>>(
          future: bookDetailList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding( 
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      BookDetail bookDetail = snapshot.data![index];
                      return ListTile(
                        leading: Image.network(bookDetail.image!),
                        title: Text(bookDetail.title!),
                        subtitle: Text(bookDetail.subtitle!),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(bookDetail: bookDetail),
                            ),
                          );
                        },
                      );
                    })),
              );
            } else if (snapshot.hasError) {
              return Text('error: $snapshot');
            }
            return const Center(
                child: SizedBox(
                    width: 20, height: 20, child: CircularProgressIndicator()));
          },
        )
      ])),
    );
  }
}
