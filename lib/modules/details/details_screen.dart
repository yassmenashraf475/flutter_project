import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _isFavorite = false;
  List imageList=[
    {"id" : 1, "imagepath" : 'assets/images/img/redirected-1000w-573329749.webp'},
    {"id" : 2, "imagepath" : 'assets/images/img/1487561c446a5f5124c704334f42ebee.jpg'},
    {"id" : 3, "imagepath" : 'assets/images/img/download (2).jpg'},
    {"id" : 4, "imagepath" : 'assets/images/img/OIP (17).jpg'},
  ];
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
            color: Colors.black,
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
                  text: 'Add To Card | \$1200',
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
                          items: imageList.map(
                                  (item) => Image.asset(
                                item['imagepath'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              )
                          ).toList(),
                          carouselController:carouselController,
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
                              'Non-Alcoholic Concentrated Perfume Oil',
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
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text(
                              '144 items left',
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
                                  text: '3.0',
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
                        'Genuine  Al-Rehab spray perfume from UAE/Saudi Arabia/Yemen High Quality',
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
                            'Brand:',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            ' Al Munakh',
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
                            ' fragrances',
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