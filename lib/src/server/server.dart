import 'package:grpc/grpc.dart';
import 'package:grpc_test/generated/users.pb.dart';
import 'package:grpc_test/generated/users.pbgrpc.dart';
import 'package:grpc_test/src/db.dart';

class UserService extends userServiceBase {
  @override
  Future<UsersResponse> display(ServiceCall call, information request) async {
    final userslist =
        Usersdata.where((user)=>user['username']==request.username).map((user) => User.fromJson('{"4":"${user['balance']}"}'))
            ;

    return UsersResponse()..users.addAll(userslist);
  }

}

void main() async {
  final server = Server([UserService()]);
  await server.serve(port: 5000);
  print('server listening on port ${server.port}');
}
