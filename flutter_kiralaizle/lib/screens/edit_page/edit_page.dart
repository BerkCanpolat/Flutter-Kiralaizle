import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kiralaizle/Service/Firebase_storage.dart';
import 'package:flutter_kiralaizle/model/userModel.dart';
import 'package:flutter_kiralaizle/provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  File? image;
  void takePicture() async {
    XFile? value = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (value != null) {
      setState(() {
        image = File(value.path);
      });
    }
  }

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profili Düzenle"),
      ),
      body: Column(
        children: [
          Center(
            child: image == null ? CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: takePicture,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 60,
                child: Icon(Icons.image,color: Colors.white,),
              ),
            ) : CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: takePicture,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 60,
                backgroundImage: FileImage(image!),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(hintText: "${appProvider.getuserInformationProvider.name}.."),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton(onPressed: () async{
              UserModel model = appProvider.getuserInformationProvider.copyWith(name: name.text);
              appProvider.updateUserProfile(context, model, image);
            }, child: Text("Güncelle")),
          ),
        ],
      ),
    );
  }
}