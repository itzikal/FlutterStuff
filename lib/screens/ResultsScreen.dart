import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test_drive/model/VideoResults.dart';
import 'package:flutter_test_drive/server/HttpWrapper.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  VideoResults? videos;

  updateVideos() async {
    VideoResults? videos = await HttpWrapper().getVideos();
    videos?.data?.forEach((element) {
      print("${element.cover}");
    });
    setState(() {
      this.videos = videos;
    });
  }

  @override
  void initState() {
    updateVideos();

    super.initState();
  }

  Future<String?> genThumbnailFile(String videoUrl) async {
    return VideoThumbnail.thumbnailFile(
        video: videoUrl,
        // thumbnailPath: _tempDir,
        imageFormat: ImageFormat.JPEG,
        //maxHeightOrWidth: 0,
        maxHeight: 800,
        maxWidth: 800,
        quality: 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Results"),
        ),
        // bottomNavigationBar: MainButtomNavigation(),
        body: ListView.builder(
            itemCount: videos?.data?.length ?? 0,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(children: [
                  Positioned(
                      child: Align(
                          alignment: FractionalOffset.centerLeft,
                          child: SizedBox(
                            width: 180,
                            height: 120,
                            child: ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                child: Image.network(
                                    videos?.data?[index]?.cover ?? "",
                                    fit: BoxFit.fill, errorBuilder:
                                        (context, exception, stackTrace) {
                                  return Icon(Icons.error);
                                  // FutureBuilder<String?>(
                                  //   future: genThumbnailFile(videos?.data?[index]?.source ?? ""),
                                  //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  //     return Image.file(File(snapshot.data), fit: BoxFit.cover);
                                  //   });
                                }),
                              ),
                            ),
                          ))),
                  Text("datadata")
                ]),
              );
            }));
    // return Card (
    // FutureBuilder<UInt8List> ( // I also think getting Data, instead of a DownloadUrl is more practical here. It keeps the data more secure, instead of generating a DownloadUrl  which is accesible for everyone who knows it.
    //   future: FirebaseStorage().ref().child('entire/path/can/go/here')
    //       .getData(maxsize),
    //   builder: (BuildContext context, AsyncSnapshot<UInt8List> snapshot) {
    //     // When this builder is called, the Future is already resolved into snapshot.data
    //     // So snapshot.data contains the not-yet-correctly formatted Image.
    //     return Image.memory(data, fit: BoxFit.Cover);
    //   },
    // ),
    // return Container(
    // height: 50,
    // child: Center(child: Image.memory(genThumbnailFile(videos?.data?[index]?.source ?? ""))
    //     Text('Entry ${videos?.data?[index]?.source}')
    // ),
  }
}
