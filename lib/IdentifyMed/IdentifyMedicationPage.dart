import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON encoding/decoding
import 'dart:io'; // For File class

class IdentifyMedicationPage extends StatefulWidget {
  @override
  _IdentifyMedicationPageState createState() => _IdentifyMedicationPageState();
}

class _IdentifyMedicationPageState extends State<IdentifyMedicationPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });

      // Upload the picture and get the result
      String apiUrl = 'https://467c-102-117-164-164.ngrok-free.app/process_image'; // Replace with your API endpoint

      // Create a File instance
      File imageFile = File(_image!.path);

      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(http.MultipartFile.fromBytes(
        'picture',
        await imageFile.readAsBytes(),
        filename: _image!.name,
      ));

      // Send the request
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var result = jsonDecode(String.fromCharCodes(responseData));

        // Navigate to a new screen with the result
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(result: result),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to upload picture')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Identify Medication'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_image != null)
            Expanded(
              child: Image.file(File(_image!.path)),
            )
          else
            Expanded(
              child: Center(child: Text('No image selected')),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: Text('Take Picture'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Make button full-width
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Text('Pick from Gallery'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Make button full-width
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final dynamic result;

  ResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Text('Result: $result'), // Display the result here
      ),
    );
  }
}
