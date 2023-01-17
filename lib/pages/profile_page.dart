import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import '../image_helper.dart';
import 'forget_password.dart';

final imageHelper = ImageHelper();

class ProfileImage extends StatefulWidget{
  const ProfileImage({
    super.key,
    required this.initials,
  });

  final String initials;

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage>{
  File? _image;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('${user?.email!}',
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: const Icon( Icons.output),
                onPressed: () async {
                  FirebaseAuth.instance.signOut();
                }),
          ]),
      body: Column(
          children: [
            const SizedBox(height: 10),
            Center(
            child: FittedBox(
              fit: BoxFit.contain,
          child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 64,
              foregroundImage: _image != null ? FileImage(_image!) : null,
              child: Text(
                widget.initials,
                style: const TextStyle(fontSize: 48),
              ),
            ))),
         const SizedBox(height: 16),
          TextButton(
            onPressed: () async {
              final files = await imageHelper.pickImage();
              if(files.isNotEmpty){
                final croppedFile = await imageHelper.crop(
                  file: files.first,
                  cropStyle: CropStyle.circle,
                );
                if (croppedFile != null){
                  setState(() => _image = File(croppedFile.path));
                }
              }
            },
            child: const Text('Select Photo')),
      const Text('Do not remember your password?',
            style: TextStyle(
                height: 2,
                fontSize: 20,
                color: Colors.black45),),
          GestureDetector(
            onTap: () { Navigator.push(context,
                MaterialPageRoute(builder: (context){
                  return const ForgotPasswordPage();
                })
            );
            },
            child: const Text('You  can recover your password',
              style: TextStyle(
                  height: 2,
                  fontSize: 20,
                  color: Colors.blue),),
          ),
          ]),
    );
  }
}
class MultipleImages extends StatefulWidget{
  const MultipleImages({super.key});

  @override
  State<MultipleImages> createState() => _MultipleImagesState();
}

class _MultipleImagesState extends State<MultipleImages>{
  List<File> _images = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: _images
            .map(
              (e) => Image.file(
                e,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
          )
            .toList(),
        ),
        const SizedBox(height: 8),
        TextButton(
            onPressed: () async {
              final files = await imageHelper.pickImage(multiple: true);
              setState(() => _images = files.map((e) => File(e.path)).toList());
            },
            child: const Text('Select Multiple Photos'),
        ),
      ],
    );
  }
}