

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras=[];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int index=0;
  late CameraController _cameraController;
  Future<void>? cameravalue;
  late Future<void> _initializeControllerFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
          _cameraController = CameraController(cameras[1],ResolutionPreset.high);
          cameravalue=_cameraController.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
      future: cameravalue,
      builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.done){
          return CameraPreview(_cameraController);
      }else{
          return CircularProgressIndicator();
      }
    },),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
           // color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.photo,size: 30,color: Colors.white,),
                Icon(Icons.panorama_fish_eye,size: 80,color: Colors.white,),
                IconButton(onPressed: () {setState(() {
                  index=index==0?1:0;
                  _cameraController = CameraController(cameras[index],ResolutionPreset.high);
          cameravalue=_cameraController.initialize();
                });
                  
                },icon:Icon(Icons.switch_camera,size: 30,color: Colors.white,))
              ],
            ),
          ),
        )
      ],
    );
  }
}