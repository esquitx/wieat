import 'package:flutter/material.dart';

// SHARED
import 'package:wieat/shared/shared.dart';
import 'package:wieat/services/services.dart';

// CAMERA
import 'package:camera/camera.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

enum WidgetState { NONE, LOADING, LOADED, ERROR }

class _CameraScreenState extends State<CameraScreen> {
  // Camera initalization
  WidgetState _widgetState = WidgetState.NONE;
  List<CameraDescription>? _cameras;
  CameraController? _cameraController;

  @override
  void initState() {
    super.initState();
    initalizeCamera();
  }

  @override
  Widget build(BuildContext context) {
    // Camera preview
    final mediaSize = MediaQuery.of(context).size;
    final deviceRatio = mediaSize.width / mediaSize.height;
    final xScale = _cameraController!.value.aspectRatio / deviceRatio;

    switch (_widgetState) {
      case WidgetState.NONE:
      case WidgetState.LOADING:
        return _buildScaffold(
            context,
            const Center(
              child: CircularProgressIndicator(),
            ));

      case WidgetState.LOADED:
        return _buildScaffold(
            context,
            AspectRatio(
              aspectRatio: deviceRatio,
              child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.diagonal3Values(xScale, 1, 1),
                  child: CameraPreview(_cameraController!)),
            ));

      case WidgetState.ERROR:
        return _buildScaffold(
            context,
            const Center(
              child: Text("Unable to load camera :( Try to restart the app"),
            ));
    }
  }

  Widget _buildScaffold(BuildContext context, body) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.orange[300],
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                ),
                const LanguageMenu(),
                IconButton(
                  icon: const Icon(Icons.flash_auto),
                  onPressed: () {},
                ),
              ])),
      body: body,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[300],
        foregroundColor: Colors.white,
        onPressed: () async {
          // take picture, if not catch error
          try {
            // Initialize controller
            await _cameraController!.initialize();

            // take image
            final image = await _cameraController!.takePicture();

            // save file
            final String imagePath = await getFilePath();
            await image.saveTo(imagePath);

            Navigator.pushNamed(context, '/processing',
                arguments:
                    ApiArguments('assets/test/test3.jpg', selectedLanguage));
          } catch (e) {
            _widgetState = WidgetState.ERROR;
          }
        },
        child: const Icon(Icons.camera, size: 40),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // START CAMERA
  Future initalizeCamera() async {
    _widgetState = WidgetState.LOADING;
    if (!mounted) setState(() {});

    _cameras = await availableCameras();

    _cameraController = CameraController(_cameras![0], ResolutionPreset.medium);

    await _cameraController!.initialize();

    if (_cameraController!.value.hasError) {
      _widgetState = WidgetState.ERROR;
      if (mounted) setState(() {});
    } else {
      _widgetState = WidgetState.LOADED;
      if (mounted) setState(() {});
    }
  }
}

class ApiArguments {
  final String imagePath;
  final String languageCode;

  ApiArguments(this.imagePath, this.languageCode);
}
