<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A flutter client library for the [IPFS HTTP API](https://docs.ipfs.io/reference/http/api/).

### Features

* Make a directory
* List all directories/files in a directory/subdirectory
* File status
* Write a file
* Read a file
* Remove a file/directory
* Move/Rename a file

### Usage
```
  IpfsClient ipfsClient = IpfsClient();
```
OR 
```
  IpfsClient ipfsClient = IpfsClient(url: "http://127.0.0.1:5001"); 
  // default is http://127.0.0.1:5001 so you don't need to pass url in case you are working on localhost
```

If your app uses `Basic Authorization` then,
```
  IpfsClient ipfsClient =
      IpfsClient(url: "YOUR_SERVER_URL", authorizationToken: "YOUR_TOKEN");
```
### How to make a directory in IPFS
```
  var response = await ipfsClient.mkdir(dir: 'myfolder');
```

### Get list of directories/files in a directory/subdirectory in the local mutable namespace.
```
  var response = await ipfsClient.ls(dir: 'myfolder');
```
If you dont pass any folder it will return all files and directories of root directory.

### How to Write to a file
```
    var response = await ipfsClient.write(
      dir: 'myfolder/sample.png',
      filePath: "/Users/myuser/Desktop/sample.png",
      fileName: "sample.png");
```
### How to read a file
```
  var response = await ipfsClient.read(dir: "myfolder/sample.png");
```
### How to remove a file
```
  var response = await ipfsClient.remove(dir: "myfolder/sample.png");
```
### How to move/rename a file
```
  var response = await ipfsClient.mv(oldPath: "myfolder/sample.png", newPath: "myfolder/MY_SAMPLE.png");
```
