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
  String filter = "";
  List<Product?> filterproduct = [];

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
          leading: IconButton(
            onPressed: () {
              setState(() {
                filter = "";
              });
            },
            icon: const Icon(Icons.lock_reset_outlined),
          ),
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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: category
                      .map(
                        (c) => ElevatedButton(
                          onPressed: () {
                            setState(() {
                              filter = c;
                              filterproduct = product.map((e) {
                                if (e.category == c) {
                                  return e;
                                }
                              }).toList();
                              filterproduct
                                  .removeWhere((element) => element == null);
                            });
                          },
                          child: Text(c),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Expanded(
              flex: 13,
              child: (filter.isEmpty)
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: product.length,
                      itemBuilder: (context, index) => Container(
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: 170,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(product[index].thumbnail),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Text(product[index].category),
                          ],
                        ),
                      ),
                    )
                  : GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: List.generate(filterproduct.length, (index) {
                        if (filterproduct[index]!.category == filter) {
                          return Column(
                            children: [
                              Container(
                                height: 140,
                                width: 170,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          filterproduct[index]!.thumbnail),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Text(filterproduct[index]!.category),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),
                      // children: allProduct.map((element) {
                      //    else {
                      //     return Container();
                      //   }
                      // }).toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
