import 'package:flutter/material.dart';

import 'package:animated_background/animated_background.dart';
import 'package:flutter_project/components/constants.dart';
import 'package:flutter_project/models/classes.dart';
import 'package:flutter_project/models/product.dart';
import 'package:flutter_project/modules/details/details_screen.dart';
import 'package:flutter_project/network/remote/dio_helper.dart';

import '../../components/components.dart';
import '../account/account_screen.dart';
import '../favourite/favourite_screen.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool _isFavorite = false;
  final List<String> names = <String>[
    "smartphones",
    'laptops',
    'fragrances',
    'skincare',
    'groceries',
    'home-decoration',
  ];
  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    List ProductsList = await DioHelper().getProducts(
      path: ApiConstants.baseUrl + ApiConstants.newsEndpoint,
    );
    products = Product.convertToProducts(ProductsList);
    setState(() {});
  }
  bool isIconTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 238, 225, 220),
      backgroundColor: Colors.grey[200],
      body:
      products.length == 0
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.deepPurple,
        ),
      )
          :
            SingleChildScrollView(
              child: Column(
                children: [
                  _searchTextFormField(),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,

                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: const Image(
                          height: 160,
                          image: AssetImage("assets/images/img/main.jpg"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _listViewCategory(),
                      const SizedBox(height: 10),
                      _listViewCategoryPhoto(),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 10),
                        child: Column(
                          children: List<Widget>.generate(names.length, (categoryIndex) {
                            String categoryName = names[categoryIndex]; // Get the category name
                            List<Product> categoryProducts = [];
                            List<bool> isFavoriteList = List.generate(products.length, (index) => false);
// Create a list for each category

                            for (int i = 0; i < products.length; i++) {
                              if (products[i].category == categoryName) {
                                categoryProducts.add(products[i]);
                              }
                            }

                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.0, right: 25),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                       // color: const Color.fromARGB(255, 238, 225, 220),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 32.0),
                                              child: Text(
                                                '$categoryName', // Use 'categoryName' variable
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20,
                                                  color: Color.fromARGB(255, 47, 2, 131),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "See More",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(110, 8, 217, 1.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            const SizedBox(height: 25),
                                // Container(
                                //   height: 215,
                                //   width: 350,
                                //   //color: Color.fromARGB(255, 238, 225, 220),
                                //   child: ListView.separated(
                                //     itemCount: categoryProducts.length,
                                //     scrollDirection: Axis.horizontal,
                                //     itemBuilder: (context, index) {
                                //       Product product = categoryProducts[index];
                                //       return Container(
                                //         decoration: BoxDecoration(
                                //          color: Colors.white,
                                //           borderRadius: BorderRadius.circular(15),
                                //           border: Border.all(
                                //             color: Colors.white,
                                //             width: 1,
                                //           ),
                                //         ),
                                //
                                //         child: Column(
                                //           mainAxisAlignment: MainAxisAlignment.start,
                                //           crossAxisAlignment: CrossAxisAlignment.start,
                                //           children: [
                                //             Padding(
                                //               padding: const EdgeInsets.symmetric(
                                //                 horizontal: 14.0
                                //               ),
                                //               child: Container(
                                //                 height: 100,
                                //                 width: 120,
                                //                 child: Image.network(
                                //                   product.thumbnail,
                                //                   fit: BoxFit.fitWidth,
                                //                 ),
                                //               ),
                                //             ),
                                //             const SizedBox(height: 5), // Add spacing between photo and text
                                //             Padding(
                                //               padding: EdgeInsets.only(left:20.0),
                                //               child: Text(
                                //                 "${product.title}",
                                //                 style: TextStyle(
                                //                   fontSize:10 ,
                                //                   fontWeight: FontWeight.w400,
                                //                   color: Colors.deepPurple,
                                //                 ),
                                //               ),
                                //             ),
                                //             const SizedBox(height: 10),
                                //
                                //             const SizedBox(height: 10),
                                //
                                //             Padding(
                                //               padding: EdgeInsets.only(left:20.0,right: 9,bottom: 6),
                                //               child: Row(
                                //                 mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                                //                 children: [
                                //                   Text(
                                //                     "rate |",
                                //                     style: TextStyle(
                                //                       fontSize: 10,
                                //                       fontWeight: FontWeight.normal,
                                //                       color: Colors.grey,
                                //
                                //                     ),),
                                //                   const SizedBox(width: 1),
                                //                   // Add spacing between photo and text
                                //
                                //                   Text(
                                //                     "${product.rating}",
                                //                     style: TextStyle(
                                //                       fontWeight: FontWeight.normal,
                                //                       color: Colors.grey,
                                //
                                //                     ),
                                //                   ),
                                //                   SizedBox(width: 30),
                                //
                                //                   Text(
                                //                     "\$${product.price}",
                                //                     style: TextStyle(
                                //                       fontWeight: FontWeight.w400,
                                //                       fontSize: 20,
                                //                       color: Color.fromRGBO(30, 7, 72, 10),
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                //
                                //             ),
                                //             const SizedBox(height: 15),
                                //             Padding(
                                //               padding: const EdgeInsets.only(left: 55.0),
                                //               child: GestureDetector(
                                //                 onTap: () {
                                //                   // Navigate to another page here
                                //                   Navigator.push(
                                //                     context,
                                //                     MaterialPageRoute(builder: (context) => DetailsScreen(
                                //                       product: product,
                                //                     )
                                //                     ), // Replace with your destination page
                                //                   );
                                //                 },
                                //                 child: const Text(
                                //                   "Show More Details",
                                //                   textAlign: TextAlign.center,
                                //                   style: TextStyle(
                                //                     fontSize: 10,
                                //                     fontWeight: FontWeight.w500,
                                //                     color: Color.fromRGBO(156, 62, 243, 100),
                                //                     decoration: TextDecoration.underline,
                                //                   ),
                                //                 ),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       );
                                //     },
                                //     separatorBuilder: (BuildContext context, int index) =>
                                //     const SizedBox(
                                //       width: 20,
                                //     ),
                                //   ),
                                // ),
                                Container(
                                  height: 250,
                                  width: 350,
                                  //color: Color.fromARGB(255, 238, 225, 220),
                                  child: ListView.separated(
                                    itemCount: categoryProducts.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      Product product = categoryProducts[index];
                                      return Container(
                                        padding: EdgeInsets.all(8),
                                        width: 160, // Set a fixed width here
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
                                                  product.thumbnail,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 5), // Add spacing between photo and text
                                            Padding(
                                              padding: EdgeInsets.only(left: 20.0),
                                              child: Text(
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                "${product.title}",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "sonttry",
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
                                                // Add spacing between photo and text
                                                Text(
                                                  "${product.rating}",
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
                                                "Price: \$${product.price}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20,
                                                  color: Color.fromRGBO(30, 7, 72, 10),
                                                ),
                                              ),
                                            ),
                                           // const SizedBox(height: 5),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 55.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  // Navigate to another page here
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => DetailsScreen(
                                                        product: product,
                                                      ),
                                                    ),
                                                  ); // Replace with your destination page
                                                },
                                                child: const Text(
                                                  "Show More Details",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromRGBO(156, 62, 243, 100),
                                                    decoration: TextDecoration.underline,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int index) => const SizedBox(
                                      width: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          }),
                        ),
                      ),

                    ]
                    ),
                  )
                ],
              ),
            ),
      // bottomNavigationBar: BottomNavBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: _onItemTapped,
      // ),
    );
  }







  Widget _searchTextFormField() {
    return  Container(
      //color: const Color.fromARGB(255, 238, 225, 220),

      child: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 18, right: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 35,
              width: 210,
              child: Container(
                decoration: BoxDecoration(
                  // Set the background color here
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SizedBox(
                  height: 35,
                  width: 210,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                        color: Color.fromARGB(255, 99, 14, 197),
                      ),
                      hintText: 'Search.....',
                      hintStyle: const TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 99, 14, 197),
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 114, 34, 187),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 114, 34, 187),
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 114, 34,
                              187), // Change the border color here
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 114, 34, 187),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Badge(
              label: Text('+11'),
              child: Image(
                height: 30,
                width: 60,
                image: AssetImage("assets/images/img/shopping-card.png"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Badge(
              label: Text('+9'),
              child: Image(
                height: 30,
                width: 60,
                image: AssetImage("assets/images/img/inbox-32.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return  Container(
      //color: const Color.fromARGB(255, 238, 225, 220),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: Text(
              "Categores",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color.fromARGB(255, 47, 2, 131),
              ),
            ),
          ),
        ],
      ),
    )


    ;
  }



  Widget _listViewCategoryPhoto() {
    return  Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 10),
      child: Container(
        height: 100,
        width: 350,
        //color: Color.fromARGB(255, 238, 225, 220),
        child: ListView.separated(
          itemCount: names.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/img/mobile.png"),
                  ),
                ),
                const SizedBox(height: 5),
                CustomText(text: names[index])
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
  Widget _listViewProduct() {
    print("number of product ${products.length}");
    return

      ListView.builder(
        itemBuilder: (context, index) {
          return Column(children: [
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: const Color.fromARGB(255, 238, 225, 220),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 32.0),
                          child: Text(
                            products[index].category,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color.fromARGB(255, 47, 2, 131),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //const SizedBox(width: ),

                  const Text("See More",style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(110, 8, 217, 1.0),

                  ),)
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 10),
              child: Container(
                height: 220,
                width: 350,
                color: Color.fromARGB(255, 238, 225, 220),
                child: ListView.separated(
                  itemCount: names.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(

                      decoration: BoxDecoration(
                        color:  Colors.white,

                        borderRadius: BorderRadius.circular(10),
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
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage("assets/images/img/ipone.jpg"),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5), // Add spacing between photo and text
                          const Padding(
                            padding: EdgeInsets.only(left:20.0),
                            child: Text(
                              "iPhone 13",
                              style: TextStyle(
                                fontSize:10 ,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          const SizedBox(height: 10),

                          const Padding(
                            padding: EdgeInsets.only(left:20.0,right: 9,bottom: 6),
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                              children: [
                                Text(
                                  "rate |",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,

                                  ),),
                                const SizedBox(width: 1),
                                // Add spacing between photo and text

                                Text(
                                  "4.9",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,

                                  ),
                                ),
                                SizedBox(width: 30),

                                Text(
                                  "1500\$",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Color.fromRGBO(30, 7, 72, 10),
                                  ),
                                ),
                              ],
                            ),

                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,bottom:10),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isIconTapped = !isIconTapped;
                                    });
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color: isIconTapped ? Colors.red : Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    // Navigate to another page here
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => FavScreen()), // Replace with your destination page
                                    );
                                  },
                                  child: const Text(
                                    "Show More Details",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                      color: Color.fromRGBO(156, 62, 243, 100),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    width: 20,
                  ),
                ),
              ),
            ),
          ],);
        },
        itemCount: products.length,




      );
  }
}
