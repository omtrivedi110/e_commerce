import 'package:e_commerce/views/component/class.dart';
import 'package:flutter/material.dart';
import '../component/productlists.dart';

class AdddedCartPage extends StatefulWidget {
  const AdddedCartPage({Key? key}) : super(key: key);

  @override
  State<AdddedCartPage> createState() => _AddedCartPageState();
}

class _AddedCartPageState extends State<AdddedCartPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Added Carts Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              flex: 15,
              child: ListView.builder(
                itemCount: addcartproducts.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    SizedBox(height: s.height * 0.01),
                    // const Spacer(),
                    Row(
                      children: [
                        // product Image
                        CircleAvatar(
                          foregroundImage:
                              NetworkImage(addcartproducts[index].thumbnail),
                        ),
                        SizedBox(
                          width: s.width * 0.05,
                        ),
                        // Product Title / Product Price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // product Title
                            Text(addcartproducts[index].title),
                            // Product Price
                            Text(
                                "\$ ${addcartproducts[index].price * addcartproducts[index].quantity}"),
                          ],
                        ),
                        const Spacer(),
                        // Product Quantities
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (addcartproducts[index].quantity < 1) {
                                    addcartproducts
                                        .remove(addcartproducts[index]);
                                  } else {
                                    addcartproducts[index].quantity--;
                                  }
                                });
                              },
                              icon: const Icon(Icons.remove_rounded),
                            ),
                            Text("${addcartproducts[index].quantity}"),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  addcartproducts[index].quantity++;
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(MyRoutes.PersonalDetail);
                    },
                    child: const Text("Buy")))
          ],
        ),
      ),
    );
  }
}
