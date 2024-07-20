import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON encoding/decoding
import 'dart:io'; // For File class
import 'dart:convert';

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
      String apiUrl = 'https://467c-102-117-164-164.ngrok-free.app/process_image';

      File imageFile = File(_image!.path);


      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        await imageFile.readAsBytes(),
        filename: _image!.name,
      ));
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
      });


      // Send the request
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var result = String.fromCharCodes(responseData);

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
  final String result;

  ResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    final extractedInfo = extractInfo(result);

    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${extractedInfo['Name']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Use: ${extractedInfo['Use']}', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('Recommended Dosage: ${extractedInfo['Recommended Dosage']}', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('Potential Side Effects:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ...?extractedInfo['Potential Side Effects']?.map((sideEffect) => Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text('- $sideEffect', style: TextStyle(fontSize: 16)),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> extractInfo(String text) {
    final nameRegEx = RegExp(r'"Name": "([^"]+)"');
    final useRegEx = RegExp(r'"Use": "([^"]+)"');
    final dosageRegEx = RegExp(r'"Recommended Dosage": "([^"]+)"');
    final sideEffectsRegEx = RegExp(r'"Potential Side Effects":\s*\[\s*([^]]+)\s*\]');

    final nameMatch = nameRegEx.firstMatch(text);
    final useMatch = useRegEx.firstMatch(text);
    final dosageMatch = dosageRegEx.firstMatch(text);
    final sideEffectsMatch = sideEffectsRegEx.firstMatch(text);

    final name = nameMatch != null ? nameMatch.group(1) : null;
    final use = useMatch != null ? useMatch.group(1) : null;
    final dosage = dosageMatch != null ? dosageMatch.group(1) : null;
    final sideEffects = sideEffectsMatch != null
        ? sideEffectsMatch.group(1)?.split(RegExp(r',\s*')).map((e) => e.replaceAll('"', '').trim()).toList()
        : null;

    return {
      'Name': name,
      'Use': use,
      'Recommended Dosage': dosage,
      'Potential Side Effects': sideEffects,
    };
  }
}
