import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_crud/product_list/model/productModel.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key,required this.productmodel}) : super(key: key);
  final Product productmodel;
  // print()
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  @override
  void initState() {
    print("jjjj");
   print(widget.productmodel.images);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xffD00D41),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: widget.productmodel.images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(i);
                  },
                );
              }).toList(),
            ),

            Text("Title : ${widget.productmodel.title}"),
            Text("Description : ${widget.productmodel.description}"),
            Text("Price : ${widget.productmodel.price.toString()}"),

          ],
        ),
      ),
    );
  }
}











