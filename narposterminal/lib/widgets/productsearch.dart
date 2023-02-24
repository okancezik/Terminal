import 'package:flutter/material.dart';

class ProductSearch extends SearchDelegate {
  final List<String> menuList;

  ProductSearch({required this.menuList});

  //arama kısmının sağ tarafındaki iconları
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query.isEmpty ? null : query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  //arama kısmının sol tarafındaki iconları
  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
        size: 24,
      ),
      onTap: () {
        close(context, null);
      },
    );
  }

  //arama yaptıktan sonra cıkacak olan sonucların nasıl gösterilecegini
  @override
  Widget buildResults(BuildContext context) {
    List<String> filteredList = menuList
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filteredList.length > 0
        ? ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${filteredList[index]}"),
              );
            },
          )
        : Center(
            child: Text(
              "Ürün Bulunamadı",
              textAlign: TextAlign.center,
            ),
          );
  }

  //
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }
}
