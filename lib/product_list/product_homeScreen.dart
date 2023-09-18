import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/product_bloc/product_bloc.dart';
import 'presentation/product_bloc/product_event.dart';
import 'presentation/product_bloc/product_state.dart';

class ProductHomeScreen extends StatefulWidget {
  const ProductHomeScreen({super.key});

  @override
  State<ProductHomeScreen> createState() => _ProductHomeScreenState();
}

class _ProductHomeScreenState extends State<ProductHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductBloc()..add(FetchProductEvent()),
          ),
        ],
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            color: Colors.pink,
            onRefresh: () async {
              final recentBloc =
              BlocProvider.of<ProductBloc>(
                  context);
              recentBloc.add(FetchProductEvent());
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => super.widget));
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              child: Column(
                children: [
                  BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
                    if (state is ProductLoadingState) {
                      return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.pink,
                          ));
                    }
                    else if (state is ProductLoadedState) {
                      return Column(
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
                                  "Hello Boys!",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "What flavour do you want today?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Text("resturant name",
                              // state.foodModel.first.restaurantName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    else if (state is ProductErrorState) {
                      print(state.message);
                      // Fluttertoast.showToast(msg: state.message);
                      return Container();
                    } else {
                      return Container();
                    }
                  }),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
