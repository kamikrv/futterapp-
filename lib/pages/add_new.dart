import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNewTab extends StatefulWidget {
  const AddNewTab({super.key});
  
  @override
  AddNewTabState createState() => AddNewTabState();
}
final _formKey = GlobalKey<FormState>();

class AddNewTabState extends State{
  // text controllers
    final priceController = TextEditingController();
    final countRoomsController = TextEditingController();
    final cityController = TextEditingController();
    final areaController = TextEditingController();
    final imageController = TextEditingController();
    final descriptionController = TextEditingController();

    Future addNew() async {
      //validation checking
      print('addnew1');
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        // display the msg that data is being sent to the server
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Processing Data')),
        );
        // add new ads
        addNewAd(
          priceController.text.trim(),
          countRoomsController.text.trim(),
          cityController.text.trim(),
          areaController.text.trim(),
          imageController.text.trim(),
          descriptionController.text.trim()
        );
      }
    }
    // add new ads
    Future addNewAd(
        String price,
        String countOfRooms,
        String city,
        String totalArea,
        String image,
        String description) async{
      await FirebaseFirestore.instance.collection('add_new').add({
        'Price': price,
        'Count of rooms': countOfRooms,
        'City': city,
        'Total area': totalArea,
        'Image': image,
        'Description': description,
      });
    }

    @override
    void dispose() {
      priceController.dispose();
      countRoomsController.dispose();
      cityController.dispose();
      areaController.dispose();
      imageController.dispose();
      descriptionController.dispose();
      super.dispose();
    }
    @override
    Widget build(BuildContext context) {
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
                children: <Widget> [
                  const SizedBox(
                    width: 200,
                    height: 15,
                  ),
                  // price textFiled
                  TextFormField(
                      controller: priceController,
                      decoration:  InputDecoration(
                        enabledBorder:  OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(Icons.attach_money),
                        labelText: 'Price:',
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: const OutlineInputBorder(),
                      ),
                      //validation
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
                  //count of rooms textFiled
                  TextFormField(
                      controller: countRoomsController,
                      decoration:  InputDecoration(
                        enabledBorder:  OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(Icons.bedroom_parent_sharp),
                        labelText: 'Count of rooms:',
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: const OutlineInputBorder(),
                      ),
                      //validation
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
                  //city textFiled
                  TextFormField(
                      controller: cityController,
                      decoration:  InputDecoration(
                        enabledBorder:  OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(Icons.location_city),
                        labelText: 'City:',
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: const OutlineInputBorder(),
                      ),
                      //validation
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
                  //total area textfiled
                  TextFormField(
                      controller: areaController,
                      decoration:  InputDecoration(
                        enabledBorder:  OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(Icons.house),
                        labelText: 'Total area of the house: ',
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: const OutlineInputBorder(),
                      ),
                      //validation
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
                  //image textfiled
                  TextFormField(
                      controller: imageController,
                      decoration:  InputDecoration(
                        enabledBorder:  OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(Icons.image),
                        labelText: 'Image URL:',
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: const OutlineInputBorder(),
                      ),
                      //validation
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
                  // description textfiled
                  TextFormField(
                      controller: descriptionController,
                      decoration:  InputDecoration(
                        enabledBorder:  OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(Icons.description),
                        labelText: 'Description:',
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: const OutlineInputBorder(),
                      ),
                      //validation
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
                  //add new button
                  ElevatedButton (
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: addNew,
                      //     ()
                      // async {
                      //   final house = House(
                      //     price: priceController.value.text,
                      //     countRooms: countRoomsController.value.text,
                      //     city: cityController.value.text,
                      //     area: areaController.value.text,
                      //     url: imageController.value.text,
                      //     description: descriptionController.value.text,
                      //     isFavorite: false,
                      //   );
                      //     await HiveStorage.saveHouse(house);
                      //     final houses = await HiveStorage.loadHouses();
                      //     print(houses.length.toString());
                      //   }
                      // },
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


