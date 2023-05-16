import 'package:e_commerce/views/component/class.dart';
import 'package:e_commerce/views/component/productlists.dart';
import 'package:e_commerce/views/screens/likedpage.dart';
import 'package:flutter/material.dart';

import 'views/screens/addedcartpage.dart';
import 'views/screens/pdfpage.dart';
import 'views/screens/personaldetail.dart';
import 'views/screens/productdetail.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool theme = false;
  String? filter;

  @override
  Widget build(BuildContext context) {
    // Size s = MediaQuery.of(context).size;
    return MaterialApp(
      routes: {
        MyRoutes.likedpage: (context) => const LikedPage(),
        MyRoutes.ProductDetail: (context) => const ProductDetail(),
        MyRoutes.AddedCartPage: (context) => const AdddedCartPage(),
        MyRoutes.PersonalDetail: (context) => const PersonalDetail(),
        MyRoutes.PdfPage: (context) => const PdfPage(),
      },
      debugShowCheckedModeBanner: false,
      darkTheme: (theme) ? ThemeData.light() : ThemeData.dark(),
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Text(
                "♡",
                style: TextStyle(fontSize: 24),
              ),
            ),
            IconButton(
                onPressed: () {
                  theme = !theme;
                  setState(() {});
                },
                icon: Icon(
                    (theme) ? Icons.dark_mode_outlined : Icons.light_mode)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined)),
          ],
          title: const Text(
            "E_Commerce",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Text("Filter :-"),
                    ElevatedButton(
                        onPressed: () {
                          filter = "smartphones";
                          setState(() {});
                        },
                        child: const Text("SmartPhone")),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          filter = "laptops";
                          setState(() {});
                        },
                        child: const Text("laptops")),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          filter = "skincare";
                          setState(() {});
                        },
                        child: const Text("skincare")),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          filter = "fragrances";
                          setState(() {});
                        },
                        child: const Text("fragrances")),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          filter = "groceries";
                          setState(() {});
                        },
                        child: const Text("groceries")),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 697,
                width: double.infinity,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) => Card(
                          child: Visibility(
                            // visible: product[index].category == "$filter",
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    MyRoutes.ProductDetail,
                                    arguments: index);
                              },
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          product[index].thumbnail)),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.primaries[index % 18].shade200,
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Spacer(),
                                          Transform.scale(
                                            scale: 0.5,
                                            child: FloatingActionButton(
                                              onPressed: () {},
                                              child: Text(
                                                "♡",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(
                                        "₹${product[index].price}",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        product[index].title,
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
