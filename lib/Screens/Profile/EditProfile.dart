import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../Styles/Color/appTheme.dart';

class EditUpdateProfileScreen extends StatefulWidget {
  const EditUpdateProfileScreen({Key? key}) : super(key: key);

  @override
  _EditUpdateProfileScreenState createState() =>
      _EditUpdateProfileScreenState();
}

class _EditUpdateProfileScreenState extends State<EditUpdateProfileScreen> {
  File? image;

  Future pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;

      final imageTemporary = File(pickedImage.path);
      print("image picked: ${pickedImage.path}");
      setState(() => image = imageTemporary);
    } on PlatformException catch (e) {
      print("Failed to pick images: $e");
    }
  }

  final TextEditingController _fullNameController =
      TextEditingController(text: "Anup Tarone");
  final TextEditingController _emailController =
      TextEditingController(text: "anuphsm@gmail.com");
  final TextEditingController _phoneNumberController =
      TextEditingController(text: "1234567890");
  final TextEditingController _addressController =
      TextEditingController(text: "Nowhere city Everywhere road");

  bool _isEditing = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorDark,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: AppColors.backgroundColorDark,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontFamily: 'RobotoSlab',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 120,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white),
                      image: DecorationImage(
                        image: image != null
                            ? FileImage(File(image.toString()))
                            : const AssetImage("assets/images/applogo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera_alt_rounded,
                          size: 20,
                          color: AppColors.buttonColor,
                        ),
                        onPressed: pickImage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 56),
            TextFormField(
              style: const TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelText: "Full Name",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              readOnly: true,
              initialValue: "Anup Tarone",
            ),
            const SizedBox(height: 16),
            TextFormField(
              style: const TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelText: "Email",
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              readOnly: true,
              initialValue: "anuptarone22@gmail.com",
            ),
            const SizedBox(height: 16),
            TextFormField(
              style: const TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelText: "Gender",
                prefixIcon: const Icon(Icons.person_2_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              readOnly: true,
              initialValue: "Male",
            ),
            const SizedBox(height: 16),
            TextFormField(
              style: const TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelText: "Date of Birth",
                prefixIcon: const Icon(Icons.date_range_sharp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              readOnly: true,
              initialValue: "22-04-2002",
            ),
            const SizedBox(height: 16),
            _buildEditableTextField(
              label: "Address",
              prefixIcon: Icons.location_on_outlined,
              controller: _addressController,
            ),
            const SizedBox(height: 16),
            _buildEditableTextField(
              label: "Phone No.",
              prefixIcon: Icons.phone,
              controller: _phoneNumberController,
            ),
            const SizedBox(height: 16),
            TextFormField(
              style: const TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelText: "Joining Date",
                prefixIcon: const Icon(Icons.input),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              readOnly: true,
              initialValue: "02-05-2024",
            ),
            const SizedBox(height: 16),
            TextFormField(
              style: const TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelText: "Department",
                prefixIcon: const Icon(Icons.work),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              readOnly: true,
              initialValue: "Employee",
            ),
            const SizedBox(height: 16),
            TextFormField(
              style: const TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelText: "Role",
                prefixIcon: const Icon(Icons.work_history_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              readOnly: true,
              initialValue: "IT",
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  side: WidgetStateProperty.all<BorderSide>(BorderSide.none),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppColors.buttonColor),
                ),
                onPressed: () {
                  setState(() {
                    _isEditing = !_isEditing;
                  });
                  if (_isEditing) {
                    print("Changes saved!");
                  }
                },
                child: Text(
                  _isEditing ? "Save Changes" : "Edit Profile",
                  style: const TextStyle(
                    fontFamily: 'RobotoSlab',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableTextField({
    required String label,
    required IconData prefixIcon,
    required TextEditingController controller,
  }) {
    return TextFormField(
      style: const TextStyle(
          fontFamily: 'RobotoSlab', fontSize: 15, fontWeight: FontWeight.bold),
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      readOnly: !_isEditing,
    );
  }
}
