import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';

Future<void> main() async {
  IpfsClient ipfsClient = IpfsClient();
  var res = await ipfsClient.mkdir(dir: 'testDir');
  var res1 = await ipfsClient.write(
      dir: 'testpath3/Simulator.png',
      filePath: "[FILE_PATH]/Simulator.png",
      fileName: "Simulator.png");
  var res2 = await ipfsClient.getAllDirectories(dir: "testDir");

}
