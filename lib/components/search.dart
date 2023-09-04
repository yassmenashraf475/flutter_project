import 'package:flutter/material.dart';
import 'package:flutter_project/components/constants.dart';
import 'package:flutter_project/network/remote/dio_helper.dart';

import '../models/product.dart';
class SearchUser extends SearchDelegate{
  DioHelper _dioHelper=DioHelper();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
  List<Product> products = [];
  @override

  Future<void> getData() async {
    List ProductsList = await DioHelper().getProducts(
      path: ApiConstants.baseUrl + ApiConstants.newsEndpoint,
    );
    products = Product.convertToProducts(ProductsList);

  }

  @override
  // Widget buildResults(BuildContext context) {
  //
  //         return ListView.builder(
  //             itemCount: products.length,
  //             itemBuilder: (context, index) {
  //               return ListTile(
  //                 title: Row(
  //                   children: [
  //                     Container(
  //                       width: 60,
  //                       height: 60,
  //                       decoration: BoxDecoration(
  //                         color: Colors.deepPurpleAccent,
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                       child: Center(
  //                         child: Text(
  //                           '${products[index].id}',
  //                           style: TextStyle(
  //                               fontSize: 20,
  //                               fontWeight: FontWeight.bold,
  //                               color: Colors.white),
  //                           overflow: TextOverflow.clip,
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(width: 20),
  //                     Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             '${products[index].title}',
  //                             style: TextStyle(
  //                                 fontSize: 18, fontWeight: FontWeight.w600),
  //                           ),
  //                           SizedBox(height: 10),
  //                           Text(
  //                             '${products[index].price}',
  //                             style: TextStyle(
  //                               color: Colors.black,
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.w400,
  //                             ),
  //                           ),
  //                         ])
  //                   ],
  //                 ),
  //               );
  //             });
  //
  // }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> searchResults = [];

    // Perform a search based on the user's query
    if (query.isNotEmpty) {
      searchResults = products.where((product) =>
          product.title.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      // If the query is empty, show all products
      searchResults = products;
    }

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '${searchResults[index].id}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${searchResults[index].title}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${searchResults[index].price}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search User'),
    );
  }}