// libraries
import 'package:flutter/material.dart';

class AddressSearch extends StatefulWidget {
  @override
  _AddressSearchState createState() => _AddressSearchState();
}

class _AddressSearchState extends State<AddressSearch> {
  TextEditingController _controller = TextEditingController();
  bool isEditing = true;
  late String address;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Delivering to the Bay Area, CA.");
    /**return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if(isEditing)
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _controller,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      address = _controller.text;
                      isEditing = false;
                    });
                  },
                  child: Text("Deliver here"))
              ],
            ),
          )
        else
          Text("Delivering to: ${address}")
      ],
    );**/
  }
}