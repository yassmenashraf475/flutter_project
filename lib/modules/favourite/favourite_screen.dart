import 'package:flutter/material.dart';
import 'package:flutter_project/data/sqldb.dart';
import 'package:flutter_project/models/product.dart';
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
    List<Map<String, dynamic>>response = await sqlDb.myRead('product');
    productsList.addAll(response);
    isLoading = false;
    setState(() {});
  }



  @override
  void initState() {
    myReadData();
    super.initState();
  }

  void deleteItem(int itemId) async {
    int response = await sqlDb.myDelete('product', 'id = $itemId');
    print(response); // Print the response for debugging
    setState(() {
      productsList.removeWhere((product) => product["id"] == itemId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text('Favorites',
          style: TextStyle(
             fontFamily: 'fonttry',
          ),
        ),
        backgroundColor: Color.fromARGB(
            255, 89, 16, 138),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          :GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items in each row
          childAspectRatio: 0.7, // Adjust this aspect ratio as needed
        ),
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          return buildProduct(
            productsList[index],
            sqlDb, () => deleteItem(productsList[index]["id"]),context,
          );
        },
      ),
    );
  }
}


Widget buildProduct(Map product,Sqflite sqlDb,VoidCallback deleteItem,BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
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
              product['thumbnail'],
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            product['title'],
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
              product['rating'].toString(),
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
            "Price: \$${product['price']}",
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
              onPressed: deleteItem,
              icon: const Icon(Icons.delete,
              color: Color.fromARGB(
                  255, 89, 16, 138),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DetailsScreen(
                  //           product: product,
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
),
  );
}




