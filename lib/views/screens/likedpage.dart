import 'package:e_commerce/views/component/productlists.dart';
import 'package:flutter/material.dart';

import '../component/class.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({Key? key}) : super(key: key);

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liked Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: likedproducts.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  MyRoutes.ProductDetail,
                  arguments: index,
                );
              },
              leading: CircleAvatar(
                foregroundImage: NetworkImage(
                  likedproducts[index].thumbnail,
                ),
              ),
              title: Text(
                likedproducts[index].title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              trailing: Text(
                "\$ ${likedproducts[index].price}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
