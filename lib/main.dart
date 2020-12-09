import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc_test/generated/users.pb.dart';
import 'package:grpc_test/generated/users.pbgrpc.dart';
import 'package:grpc_test/src/server/server.dart';
import 'package:grpc_test/common/client.dart';

void main() => runApp(new FlutterGrpcApp());

class FlutterGrpcApp extends StatefulWidget {
  _FlutterGrpcAppState createState() => _FlutterGrpcAppState();
}

class _FlutterGrpcAppState extends State<FlutterGrpcApp> {
  String res;

  @override
  void initState() {
    res = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grpc"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () async => _display(),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "Check Balance",
                    style: TextStyle(color: Colors.white),
                  )),
              res.isNotEmpty ? Text("Your Balnce is : $res" ) : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _display() async {
 final channel = ClientChannel(
    '10.0.2.2',
    port: 5000,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  final stub = userServiceClient(channel);
  var response = await stub.display(information()..username = "08644004295");
  var bal= response.users[0].balance;
  print(response);
   setState(() {
      res = bal.toString() ;
    });


  }
}
