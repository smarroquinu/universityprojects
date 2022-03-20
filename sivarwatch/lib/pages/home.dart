import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sivarwatch/pages/director.dart';
import 'package:sivarwatch/pages/participant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _channelName = TextEditingController();
  final _userName = TextEditingController();
  late int uid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }

  Future<void> getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? storeUid = preferences.getInt("localUid");
    if (storeUid != null) {
      uid = storeUid;
    } else {
      int time = DateTime.now().microsecondsSinceEpoch;
      uid = int.parse(time.toString().substring(1, time.toString().length - 3));
      preferences.setInt("localUid", uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/sivarwatch-logos_black.png'),
          const Text("Juega y comparte"),
          const SizedBox(height: 40),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextField(
              controller: _userName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey)),
                  hintText: 'Correo electronico'),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextField(
              controller: _channelName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey)),
                  hintText: 'Nombre de la sala'),
            ),
          ),
          TextButton(
              onPressed: () async {
                await [Permission.camera, Permission.microphone].request();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Participant(
                          channelName: _channelName.text,
                          userName: _userName.text,
                          uid: uid,
                        )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Participar',
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.live_tv)
                ],
              )),
          // TextButton(
          //     onPressed: () async {
          //       await [Permission.camera, Permission.microphone].request();
          //       Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) => Director(
          //                 channelName: _channelName.text,
          //               )));
          //     },
          //     child: Row(
          //       children: [
          //         Text(
          //           'Director',
          //           style: TextStyle(fontSize: 20),
          //         ),
          //         Icon(Icons.cut)
          //       ],
          //     ))
        ],
      )),
    );
  }
}
