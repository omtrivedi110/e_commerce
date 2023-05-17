import 'package:e_commerce/views/component/class.dart';
import 'package:e_commerce/views/component/productlists.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
        ],
        title: const Text("Detail Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            SizedBox(height: s.height * 0.1),
            // product Preview
            Stack(
              children: [
                Container(
                  height: s.height * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // product Preview
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2 / 3,
                      crossAxisCount: 1,
                    ),
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => SizedBox(
                      height: s.height * 0.02,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          height: s.height * 0.2,
                          child: Row(
                            children: [
                              Image.network(products[index]['images'][0]),
                              Image.network(products[index]['images'][1]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                    offset: const Offset(320, 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(MyRoutes.likedpage, arguments: index);
                      },
                      icon: Icon(
                        Icons.favorite_border_rounded,
                        size: s.height * 0.05,
                        color: Colors.redAccent,
                      ),
                    )),
              ],
            ),
            SizedBox(height: s.height * 0.01),
            // Price & Add To cart
            Container(
              height: s.height * 0.11,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "\$ ${product[index].price}",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          addcartproduct.add(product[index]);
                          Navigator.of(context)
                              .pushNamed(MyRoutes.likedpage, arguments: index);
                        },
                        icon:
                            Icon(Icons.favorite_border, size: s.height * 0.04),
                      ),
                      IconButton(
                        onPressed: () {
                          addcartproduct.add(product[index]);
                          Navigator.of(context).pushNamed(
                              MyRoutes.AddedCartPage,
                              arguments: index);
                        },
                        icon: Icon(Icons.shopping_cart_outlined,
                            size: s.height * 0.04),
                      ),
                    ],
                  ),
                  Text(product[index].title,
                      style: const TextStyle(fontSize: 20)),
                ],
              ),
            ),
            // Description
            Text(product[index].descprition,
                style: const TextStyle(fontSize: 18)),
            SizedBox(
              height: s.height * 0.02,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(MyRoutes.AddedCartPage, arguments: index);
        },
        child: const Icon(Icons.add_shopping_cart_outlined),
      ),
    );
  }
}
