import 'package:grpc/grpc.dart';
import 'package:grpc_test/generated/users.pb.dart';
import 'package:grpc_test/generated/users.pbgrpc.dart';
import 'package:grpc_test/src/db.dart';
import 'package:grpc_test/src/server/server.dart';

void main() async {
  final channel = ClientChannel(
    'localhost',
    port: 5000,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  final stub = userServiceClient(channel);
  var response = await stub.display(information()..username = "08644004295");
  print(response.users[0].balance);
  print('Response received:$response');

  await channel.shutdown();

  
}

