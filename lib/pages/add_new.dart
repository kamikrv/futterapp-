import 'package:flutter/material.dart';
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
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: ListView(
            children: [
              const SizedBox(
                width: 200,
                height: 15,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.attach_money),
                    labelText: 'Price:',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  }),
              const SizedBox(
                width: 200,
                height: 15,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.bedroom_parent_sharp),
                    labelText: 'Count of rooms:',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  }),

              const SizedBox(
                width: 200,
                height: 15,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    labelText: 'City:',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  }),
              const SizedBox(
                width: 200,
                height: 15,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.house),
                    labelText: 'Total area of the house: ',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  }),
              const SizedBox(
                width: 200,
                height: 15,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.image),
                    labelText: 'Image URL:',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  }),
              const SizedBox(
                width: 200,
                height: 15,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    labelText: 'Description:',
                    border: OutlineInputBorder(),
                  ),
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
          ),
      )
     // )
      );
  }
}
