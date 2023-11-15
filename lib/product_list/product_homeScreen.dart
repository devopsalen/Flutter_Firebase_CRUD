import 'dart:ffi';

import 'package:firebase_crud/product_list/model/productModel.dart';
import 'package:firebase_crud/product_list/product_detailScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'presentation/product_bloc/product_bloc.dart';
import 'presentation/product_bloc/product_event.dart';
import 'presentation/product_bloc/product_state.dart';

class ProductHomeScreen extends StatefulWidget {
  const ProductHomeScreen({super.key});

  @override
  State<ProductHomeScreen> createState() => _ProductHomeScreenState();
}

class _ProductHomeScreenState extends State<ProductHomeScreen> {
  TextEditingController search = TextEditingController();
  List<Product> _filteredProducts = [];
  List<Product> _allProducts = [];
  bool noElement = false;

  void filterSearchResults(String query) {
    setState(() {
      _filteredProducts = _allProducts
          .where((products) =>
              products.title.toLowerCase().contains(query.toLowerCase()))
          .toList();

      if (_filteredProducts.isEmpty) {
        noElement = true;
      } else {
        noElement = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: Colors.pink,
          onRefresh: () async {
            final recentBloc = BlocProvider.of<ProductBloc>(context); /// this is for reloading purpose only
            recentBloc.add(FetchProductEvent()); /// you can remove this if refresh indicator is not needed
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => super.widget));
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                  if (state is ProductLoadingState) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.pink,
                    ));
                  }
                  else if (state is ProductLoadedState) {
                    _allProducts = state.productModel.products;
                    // print("printing list");
                    // print(_filteredProducts[2].title);
                    // print(_filteredProducts.length);
                    // print(_allProducts.length);

                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFF5F99),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Icon(Icons.person),
                                  ),
                                ),
                                const Icon(
                                  Icons.shopping_bag,
                                  color: Colors.pinkAccent,
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mobile Mart",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: const Text(
                              "Recommended items...",
                              // state.foodModel.first.restaurantName,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.all(20),
                              child: TextField(
                                onChanged: (value) {
                                  filterSearchResults(
                                    value,
                                  );
                                },
                                controller: search,
                                decoration: const InputDecoration(
                                    labelText: "Search",
                                    hintText: "search product here",
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    )),
                              )),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: search.text.isEmpty
                                  ? state.productModel.products.length
                                  : noElement == false
                                      ? _filteredProducts.length
                                      : 1,
                              itemBuilder: (context, index) {
                                if (search.text.isEmpty) {
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(state
                                          .productModel
                                          .products[index]
                                          .thumbnail),
                                    ),
                                    title: Text(state
                                        .productModel.products[index].title),
                                    subtitle: Text(state
                                        .productModel.products[index].price
                                        .toString()),
                                    onTap: () {
                                      Fluttertoast.showToast(
                                          msg: state.productModel
                                              .products[index].title);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailPage(
                                                      productmodel: state
                                                          .productModel
                                                          .products[index])));
                                    },
                                  );
                                } else {
                                  if (noElement == false) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            _filteredProducts[index].thumbnail),
                                      ),
                                      title:
                                          Text(_filteredProducts[index].title),
                                      subtitle: Text(_filteredProducts[index]
                                          .price
                                          .toString()),
                                      onTap: () {
                                        Fluttertoast.showToast(
                                            msg:
                                                _filteredProducts[index].title);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetailPage(
                                                        productmodel:
                                                            _filteredProducts[
                                                                index])));
                                      },
                                    );
                                  } else if (noElement == true) {
                                    return const Center(
                                        child: Text("No data found"));
                                  }
                                }
                              })
                        ],
                      ),
                    );
                  }
                  else if (state is ProductErrorState) {
                    Fluttertoast.showToast(msg: state.message);
                    return Container();
                  }
                  else {
                    return Container();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
