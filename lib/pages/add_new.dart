import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:github_app/models/house.dart';
import '../local_storage/hive_storage.dart';

class AddNewTab extends StatelessWidget {
  AddNewTab({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final priceController = TextEditingController();
    final countRoomsController = TextEditingController();
    final cityController = TextEditingController();
    final areaController = TextEditingController();
    final imageController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Roof.kz'),
          centerTitle: true,
        ),
      body: Form(
        key: _formKey,
      child: ListView(
        children: [
           TextFormField(
              style: const TextStyle(fontSize: 22, color: Colors.grey),
              decoration: const InputDecoration(labelText: 'Price:'),
              controller: priceController,
              maxLines: 5,
              minLines: 1,
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Field is required';
                }
                return null;
              }
           ),
          TextFormField(
              style: const TextStyle(fontSize: 22, color: Colors.grey),
              decoration: const InputDecoration(labelText: 'Count of rooms:'),
              controller: countRoomsController,
              maxLines: 5,
              minLines: 1,
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Field is required';
                }
                return null;
              }
          ),

          TextFormField(
              style: const TextStyle(fontSize: 22, color: Colors.grey),
              decoration: const InputDecoration(labelText: 'City:'),
              controller: cityController,
              maxLines: 5,
              minLines: 1,
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Field is required';
                }
                return null;
              }
          ),
          TextFormField(
              style: const TextStyle(fontSize: 22, color: Colors.grey),
              decoration: const InputDecoration(labelText: 'Total area of the house:'),
              controller: areaController,
              maxLines: 5,
              minLines: 1,
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Field is required';
                }
                return null;
              }),
          TextFormField(
              style: const TextStyle(fontSize: 22, color: Colors.grey),
              decoration: const InputDecoration(labelText: 'Image URL:'),
              controller: imageController,
              maxLines: 5,
              minLines: 1,
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Field is required';
                }
                bool _validURL = Uri.parse(value).isAbsolute;
                if(!_validURL){
                  return 'Enter correct URL';
                }
                return null;
              }),
          TextFormField(
              style: const TextStyle(fontSize: 22, color: Colors.grey),
              decoration: const InputDecoration(labelText: 'Description:'),
              controller: descriptionController,
              maxLines: 10,
              minLines: 1,
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Field is required';
                }
                return null;
              }),
          ElevatedButton (
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              onPressed:() async {
                final house = House(
                  price: priceController.value.text,
                  countRooms: countRoomsController.value.text,
                  city: cityController.value.text,
                  area: areaController.value.text,
                  url: imageController.value.text,
                  description: descriptionController.value.text,
                  isFavorite: false,
                );
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  await HiveStorage.saveHouse(house);
                  final houses = await HiveStorage.loadHouses();
                  print(houses.length.toString());
                }
              },
              child: const Text('Add')
              )
          ]
          ),
      )
     // )
      );
  }
}
