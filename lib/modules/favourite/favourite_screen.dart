import 'package:flutter/material.dart';
import 'package:flutter_project/data/sqldb.dart';
import 'package:flutter_project/modules/details/details_screen.dart';

class FavoritesScreen extends StatefulWidget {


  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // final SqlDb dbHelper = SqlDb();
  //
  // Future<void> _toggleFavorite(Product product) async {
  //   final exists = await dbHelper.readData(
  //     'SELECT * FROM favourits WHERE title = ?',
  //     [product.title],
  //   );
  //
  //   if (exists.isNotEmpty) {
  //     final deletedRows = await dbHelper.deleteData(
  //       'DELETE FROM favourits WHERE title = ?',
  //       [product.title],
  //     );
  //     if (deletedRows > 0) {
  //       setState(() {
  //         widget.favoriteProducts.removeWhere((item) => item.title == product.title);
  //       });
  //     }
  //   } else {
  //     final insertedId = await dbHelper.insertData(
  //       'INSERT INTO favourits (title, image, price) VALUES (?, ?, ?)',
  //       [product.title, product.thumbnail, product.price],
  //     );
  //     setState(() {
  //       product.id = insertedId;
  //       widget.favoriteProducts.add(product);
  //     });
  //   }
  // }
  Sqflite sqlDb = Sqflite();
  List productsList = [];
  bool isLoading = true;
  myReadData() async {
    //List<Map> response = await sqlDb.readData('SELECT * FROM note');
    // Shortcut
    List<Map> response = await sqlDb.myRead('product');
    productsList.addAll(response);
    isLoading = false;
    setState(() {});
  }
  @override
  void initState() {
    myReadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body:
      // isLoading
      //     ? const Center(child: CircularProgressIndicator())
      //     :
      ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (context, index)=>buildProduct(productsList[index]),
      ),
    );
  }
}


Widget buildProduct(Map product){return Container(
  height: 250,
  width: 350,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(
      color: Colors.white,
      width: 1,
    ),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        child: Container(
          height: 100,
          width: 130,
          child: Image.network(
            product["thumbnail"],
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      const SizedBox(height: 5),
      Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          product["title"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 15,
            fontFamily: "fonttry",
            fontWeight: FontWeight.w500,
            color: Colors.deepPurple,
          ),
        ),
      ),
      const SizedBox(height: 10),
      const SizedBox(height: 10),
      Row(
        children: [
          Text(
            "rate |",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 1),
          Text(
            product["rating"],
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      SizedBox(height: 5),
      Expanded(
        child: Text(
          "Price: \$${product["price"]}",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Color.fromRGBO(30, 7, 72, 10),
          ),
        ),
      ),
      Row(
        children: [
          IconButton(
            onPressed: () async{
             // int response = await sqlDb.myDelete('product',"id = ${product["id"]}");
              //print(response);
            },
            icon: const Icon(Icons.delete),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(
                //         builder: (context) => DetailsScreen(
                //           product: product["id"],
                //         ),
                //       ),
                // );
              },
              child: const Text(
                "Show More Details",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(156, 62, 243, 100),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);
}























// import 'package:flutter/material.dart';
// import 'package:flutter_project/data/sqldb.dart';
// import 'package:flutter_project/models/product.dart';
// import 'package:flutter_project/modules/details/details_screen.dart';
//
// class FavoritesScreen extends StatelessWidget {
//   final List<Product> favoriteProducts; // Change this line
//
//   FavoritesScreen({required this.favoriteProducts});
//
//   final SqlDb dbHelper = SqlDb();
//
//   void _toggleFavorite(Product product) async {
//     final exists = await dbHelper.readData('SELECT * FROM favourits WHERE title = ?',
//         [product.title]);
//
//     if (exists.isNotEmpty) {
//       // If the product exists in favorites, remove it
//       final deletedRows = await dbHelper.deleteData('DELETE FROM favourits WHERE title = ?',
//           [product.title]);
//       if (deletedRows > 0) {
//         // Remove the product from the favoriteProducts list
//         favoriteProducts.removeWhere((item) => item.title == product.title);
//       }
//     } else {
//       // If the product doesn't exist in favorites, add it
//       final insertedId = await dbHelper.insertData(
//         'INSERT INTO favourits (title, image, price) VALUES (?, ?, ?)',
//         [product.title, product.thumbnail, product.price],
//       );
//       if (insertedId != null) {
//         // Add the product to the favoriteProducts list
//         product.id = insertedId;
//         favoriteProducts.add(product);
//       }
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     // Build your UI to display the favorite products here
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorites'),
//       ),
//       body: ListView.builder(
//         itemCount: favoriteProducts.length,
//         itemBuilder: (context, index) {
//           final product = favoriteProducts[index];
//           return Container(
//             height: 250,
//             width: 350,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//               border: Border.all(
//                 color: Colors.white,
//                 width: 1,
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 5.0,
//                   ),
//                   child: Container(
//                     height: 100,
//                     width: 130,
//                     child: Image.network(
//                       product.thumbnail,
//                       fit: BoxFit.fitWidth,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Padding(
//                   padding: EdgeInsets.only(left: 10.0),
//                   child: Text(
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     "${product.title}",
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontFamily: "sonttry",
//                       fontWeight: FontWeight.w500,
//                       color: Colors.deepPurple,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Text(
//                       "rate |",
//                       style: TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.normal,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     const SizedBox(width: 1),
//                     // Add spacing between photo and text
//                     Text(
//                       "${product.rating}",
//                       style: TextStyle(
//                         fontWeight: FontWeight.normal,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 5),
//                 Expanded(
//                   child: Text(
//                     "Price: \$${product.price}",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 20,
//                       color: Color.fromRGBO(30, 7, 72, 10),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 40.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       // Navigate to another page here
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DetailsScreen(
//                             product: product,
//                           ),
//                         ),
//                       ); // Replace with your destination page
//                     },
//                     child: const Text(
//                       "Show More Details",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500,
//                         color: Color.fromRGBO(156, 62, 243, 100),
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 40.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       // Toggle the favorite status
//                       _toggleFavorite(product);
//                     },
//                     child: Icon(
//                       Icons.favorite, // You can use the _isProductFavorite function here
//                       color: _isProductFavorite(product) ? Colors.red : null,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:flutter_project/data/sqldb.dart';
// import 'package:flutter_project/models/product.dart';
// import 'package:flutter_project/modules/details/details_screen.dart';
//
// class FavoritesScreen extends StatelessWidget {
//   final List<Product> favoriteProducts; // Change this line
//
//   FavoritesScreen({required this.favoriteProducts});
//
//   final SqlDb dbHelper = SqlDb();
//   void _toggleFavorite(Product product) async {
//     final exists = await dbHelper.readData('SELECT * FROM favourits WHERE title = ?', [product.title]);
//
//     if (exists.isNotEmpty) {
//       // If the product exists in favorites, remove it
//       final deletedRows = await dbHelper.deleteData('DELETE FROM favourits WHERE title = ?', [product.title]);
//       if (deletedRows > 0) {
//         setState(() {
//           favoriteProducts.remove(product);
//         });
//       }
//     } else {
//       // If the product doesn't exist in favorites, add it
//       final insertedId = await dbHelper.insertData(
//         'INSERT INTO favourits (title, image, price) VALUES (?, ?, ?)',
//         [product.title, product.image, product.price],
//       );
//       if (insertedId != null) {
//         setState(() {
//           product.id = insertedId;
//           favoriteProducts.add(product);
//         });
//       }
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     // Build your UI to display the favorite products here
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorites'),
//       ),
//       body: Container(
//         height: 250,
//         width: 350,
//     decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(15),
//     border: Border.all(
//     color: Colors.white,
//     width: 1,
//     ),
//     ),
//     // padding: EdgeInsets.all(8),
//     // width: 160, // Set a fixed width here
//     // decoration: BoxDecoration(
//     // color: Colors.white,
//     // borderRadius: BorderRadius.circular(15),
//     // border: Border.all(
//     // color: Colors.white,
//     // width: 1,
//     // ),
//     // ),
//         //color: Color.fromARGB(255, 238, 225, 220),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 5.0,
//               ),
//               child: Container(
//                 height: 100,
//                 width: 130,
//                 child: Image.network(
//                   product.thumbnail,
//                   fit: BoxFit.fitWidth,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 5), // Add spacing between photo and text
//             Padding(
//               padding: EdgeInsets.only(left: 10.0),
//               child: Text(
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 "${product.title}",
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontFamily: "sonttry",
//                   fontWeight: FontWeight.w500,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 Text(
//                   "rate |",
//                   style: TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(width: 1),
//                 // Add spacing between photo and text
//                 Text(
//                   "${product.rating}",
//                   style: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 5),
//             Expanded(
//               child: Text(
//                 "Price: \$${product.price}",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 20,
//                   color: Color.fromRGBO(30, 7, 72, 10),
//                 ),
//               ),
//             ),
//             // const SizedBox(height: 5),
//             Padding(
//               padding: const EdgeInsets.only(left: 40.0),
//               child: GestureDetector(
//                 onTap: () {
//                   // Navigate to another page here
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DetailsScreen(
//                         product: product,
//                       ),
//                     ),
//                   ); // Replace with your destination page
//                 },
//                 child: const Text(
//                   "Show More Details",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w500,
//                     color: Color.fromRGBO(156, 62, 243, 100),
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//           },
//           separatorBuilder: (BuildContext context, int index) => const SizedBox(
//             width: 20,
//           ),
//       ),
//     );
//   }
// }