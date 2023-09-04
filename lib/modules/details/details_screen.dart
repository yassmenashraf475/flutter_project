import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/data/sqldb.dart';
import 'package:flutter_project/models/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key,required this.product});
  //final int product_id;
  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  //late final List<Product> favoriteProducts;
  Sqflite sqlDb = Sqflite();

  double initialRating=0.0;
  late int fullStars;
  late double fractionalPart;

  bool _isFavorite = false;
  List productsList = [];
  bool isLoading = true;

  myReadData() async {
    // Shortcut
    List<Map> response = await sqlDb.myRead('product');
    productsList.addAll(response);
    isLoading = false;
    setState(() {});
    // Call checkFavoriteStatus with the favoriteProducts list
    checkFavoriteStatus(productsList);
  }

// Updated checkFavoriteStatus function
  Future<void> checkFavoriteStatus(List favoriteProducts) async {
    // Check if the product with the same ID exists in the favorite table
    bool isFavorite = favoriteProducts.any((favorite) =>
    favorite['id'] == widget.product.id && favorite['isColored'] == 1);

    setState(() {
      _isFavorite = isFavorite;
    });
  }


  final CarouselController carouselController=CarouselController();
  int currentIndex=0;

  @override
  void initState() {
    myReadData();
    super.initState();
    if (widget.product.rating is int) {
      initialRating = widget.product.rating.toDouble();
    } else if (widget.product.rating is double) {
      initialRating = widget.product.rating;
    }
    fullStars = initialRating.floor(); // Get the integer part
    fractionalPart = initialRating - fullStars; // Get the fractional part

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 8
          ),
          height: 65.0,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
              horizontal: 50
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Color(0xFF73499B),
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Add To Card | ',
                        style: TextStyle(
                          fontFamily: "fonttry",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ).copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Total Price:',
                        style: TextStyle(
                            fontFamily: "fonttry",
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ).copyWith(color: Colors.white),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '\$${widget.product.price}',
                        style: TextStyle(
                            fontFamily: "fonttry",
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ).copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            :SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        print(currentIndex);
                      },
                      child: CarouselSlider(
                          items: widget.product.images.map((imagePath) {
                            return Image.network(
                              imagePath,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            );
                          }).toList(),
                         // carouselController:carouselController,
                          options:CarouselOptions(
                            scrollPhysics:  const BouncingScrollPhysics(),
                            autoPlay: true,
                            aspectRatio: 1, // Adjust this aspect ratio as needed
                            viewportFraction: 0.9,
                            onPageChanged:  (index, reason) {
                              setState(() {
                                currentIndex=index;
                              });
                            },
                          )
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.11),
                              spreadRadius: 0.0,
                              blurRadius: 4,
                              offset: Offset(0, 5),
                            )
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.chevron_left_outlined,
                            color: Color(0xFF73499B),
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 400,
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${widget.product.title}',
                              style: TextStyle(
                                fontFamily: "fonttry",
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: _isFavorite ? Colors.red : null,
                            ),
                            onPressed: ()async{
                              setState(() {
                                _isFavorite = !_isFavorite;
                              }
                              );
                              if (_isFavorite) {
                                await sqlDb.myInsert('product', {
                                  "id": '${widget.product.id}',
                                  "title": '${widget.product.title}',
                                  "thumbnail": '${widget.product.thumbnail}',
                                  "rating": '${widget.product.rating}',
                                  "price": '${widget.product.price}',
                                  "isColored": 1,
                                });
                              } else {
                                // Remove the product from favorites
                                // You need to implement this part based on your database logic
                                await sqlDb.myDelete('product', 'id = ${widget.product.id}');
                              }
                              // _toggleFavorite(widget.product);
                              // FavoritesScreen(favoriteProducts: favoriteProducts,);
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color(0xFFD6C8E1),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text(
                              '${widget.product.stock} items left',
                               style:Theme.of(context).textTheme.bodyText2,
                              //TextStyle(
                              //     fontSize: 13,
                              //     fontWeight: FontWeight.w400
                              // ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RatingBar.builder(
                            onRatingUpdate: (rating) {
                             // print('New Rating: $rating');
                            },
                            itemSize: 15,
                            minRating: 1,
                            initialRating: initialRating,
                            itemBuilder: (context, index) { if (index < fullStars) {
                              // Full yellow star
                              return Icon(
                                Icons.star,
                                color: Colors.yellow,
                              );
                            } else if (index == fullStars && fractionalPart > 0.0) {
                              // Partial yellow star
                              return Icon(
                                Icons.star_half,
                                color: Colors.yellow,
                              );
                            } else {
                              // Empty star
                              return Icon(
                                Icons.star_border,
                                color: Colors.yellow,
                              );
                            }
                            },
                            itemCount: 5,
                            direction: Axis.horizontal,
                            itemPadding: EdgeInsets.all(0.5),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: '${widget.product.rating}',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ).copyWith(color: Colors.grey)
                              )
                          ),
                          SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Color(0xFFD6C8E1),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${widget.product.discountPercentage}%',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.red, // You can customize the color
                                ),
                              ),
                              Text(
                                'OFF',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.red, // You can customize the color
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontFamily: "fonttry",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${widget.product.description}',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'Brand: ',
                            style: TextStyle(
                                fontFamily: "fonttry",
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            '${widget.product.brand}',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            'Category:',
                            style: TextStyle(
                                fontFamily: "fonttry",
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            ' ${widget.product.category}',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}