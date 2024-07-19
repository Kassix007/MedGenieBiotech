import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class IdentifyMedicationPage extends StatefulWidget {
  @override
  _IdentifyMedicationPageState createState() => _IdentifyMedicationPageState();
}

class _IdentifyMedicationPageState extends State<IdentifyMedicationPage> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _cameraController = CameraController(_cameras![0], ResolutionPreset.high);
      await _cameraController!.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  void _takePicture() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      try {
        XFile picture = await _cameraController!.takePicture();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Picture taken: ${picture.path}')));
        // Add your picture handling logic here
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error taking picture: $e')));
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
        children: [
          if (_isCameraInitialized)
            Expanded(
              child: AspectRatio(
                aspectRatio: _cameraController!.value.aspectRatio,
                child: CameraPreview(_cameraController!),
              ),
            )
          else
            Expanded(
              child: Center(child: CircularProgressIndicator()),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _takePicture,
              child: Text('Take Picture'),
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
