import 'package:flutter/material.dart';
import '../component/productlists.dart';

class AdddedCartPage extends StatefulWidget {
  const AdddedCartPage({Key? key}) : super(key: key);

  @override
  State<AdddedCartPage> createState() => _AdddedCartPageState();
}

class _AdddedCartPageState extends State<AdddedCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Added Cart Page"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) => Card(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 140,
                  width: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(addcartproduct[index]['thumbnail']),
                        fit: BoxFit.fill),
                  ),
                ),
                Text(addcartproduct[index]['title']),
                Text(
                  "₹ ${addcartproduct[index].price}",
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
