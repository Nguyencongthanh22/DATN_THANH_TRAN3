import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReturnProduct extends StatefulWidget {
  const ReturnProduct({super.key});

  @override
  State<ReturnProduct> createState() => _ReturnProductState();
}

class _ReturnProductState extends State<ReturnProduct> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  XFile? _video;

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  Future<void> _pickVideo() async {
    final XFile? pickedFile =
        await _picker.pickVideo(source: ImageSource.gallery);
    setState(() {
      _video = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Hoàn trả sản phẩm',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.red,
              )),
        ),
        body: Form(
            child: Column(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Lý do hoàn trả",
                  fillColor: Colors.red[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Tên người gửi",
                fillColor: Colors.red[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Số điện thoại",
                  fillColor: Colors.red[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Địa chỉ lấy hàng",
                  fillColor: Colors.red[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null
                  ? IconButton(
                      icon: Icon(
                        Icons.photo_library,
                        size: 50,
                      ),
                      color: Colors.red,
                      onPressed: _pickImage,
                      tooltip: 'Pick Image',
                    )
                  : GestureDetector(
                      onTap: _pickImage,
                      child: Image.file(
                        File(_image!.path),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
              SizedBox(
                width: 10,
              ),
              _video == null
                  ? IconButton(
                      icon: Icon(
                        Icons.videocam,
                        size: 50,
                      ),
                      color: Colors.red,
                      onPressed: _pickVideo,
                      tooltip: 'Pick Video',
                    )
                  : GestureDetector(
                      onTap: _pickVideo,
                      child: Icon(
                        Icons.videocam,
                        color: Colors.red,
                        size: 100,
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              //  login();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Gửi",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ])));
  }
}
