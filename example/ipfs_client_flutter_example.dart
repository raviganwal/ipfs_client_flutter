import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';

Future<void> main() async {
  IpfsClient ipfsClient = IpfsClient(url: "https://u0huvbekn5-u0qu5ph2gb-ipfs.us0-aws.kaleido.io");
  var res = await ipfsClient.mkdir('testpath1');
  print('awesome: ${res}');
}
