import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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

 // _DetailsScreenState({required this.product_id})

  bool _isFavorite = false;

  final CarouselController carouselController=CarouselController();
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 8
          ),
          height: 60.0,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
              horizontal: 50
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Color(0xFF73499B),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width:5,
              ),
              RichText(
                text: TextSpan(
                  text: 'Add To Card | \$${widget.product.price}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ).copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body:SafeArea(
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
                  ],
                ),
                // Stack(
                //   alignment: Alignment.topLeft,
                //   children: [
                //     ClipRRect(
                //       borderRadius: BorderRadius.circular(24),
                //       child:
                //     ),
                //     Container(
                //       padding: EdgeInsets.all(10),
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         boxShadow: [
                //           BoxShadow(
                //               color: Colors.white.withOpacity(0.11),
                //             spreadRadius: 0.0,
                //             blurRadius: 4,
                //             offset: Offset(0, 5)
                //           )
                //         ]
                //       ),
                //       child: IconButton(
                //         onPressed: (){},
                //         icon: Icon(
                //           Icons.chevron_left_outlined,
                //           color: Colors.white,
                //           size: 30,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 400,
                  color: Colors.grey[200],
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
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              _isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: _isFavorite ? Colors.red : null,
                            ),
                            onPressed: (){
                              setState(() {
                                _isFavorite = !_isFavorite;
                              });
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
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RatingBar.builder(
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            onRatingUpdate: (rating) {},
                            itemSize: 15,
                            minRating: 1,
                            initialRating: 3,
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
                          // Text(
                          //   '3.0',
                          //   style: TextStyle(
                          //     fontSize: 13,
                          //   ),
                          // ),
                        ],
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
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            '${widget.product.brand}',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[900]
                            ),
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
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            ' ${widget.product.category}',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[900]
                            ),
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