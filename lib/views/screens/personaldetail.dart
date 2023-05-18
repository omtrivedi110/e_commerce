import 'package:flutter/material.dart';

import '../component/productlists.dart';

class PersonalDetail extends StatefulWidget {
  const PersonalDetail({Key? key}) : super(key: key);

  @override
  State<PersonalDetail> createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Your Deatil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Enter Your Name"),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: "Enter Name",
                        labelText: "Name",
                        border: OutlineInputBorder()),
                    onSaved: (val) {
                      Myvariable.name = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Enter Your Mail"),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: "Enter Mail",
                        labelText: "Mail",
                        border: OutlineInputBorder()),
                    onSaved: (val) {
                      Myvariable.mail = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Mail";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Enter Your Phone Number"),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    maxLength: 10,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        hintText: "Enter Phone Number",
                        labelText: "Phone",
                        prefixText: "+91",
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Phone Number";
                      } else if (val.length < 10) {
                        return "Invalid Number";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) {
                      Myvariable.phoneno = int.parse(val!);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    formkey.currentState!.validate();
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Pay"))
            ],
          ),
        ),
      ),
    );
  }
}
