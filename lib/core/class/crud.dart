import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:Eventune/core/class/statusrequest.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String linkurl, Map data, Map<String, String>? headers) async {
    // if (await checkInternet()) {
    var response =
        await http.post(Uri.parse(linkurl), body: data, headers: headers);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);

      print("post1============ $responsebody");

      return Right(responsebody);
    } else {
      print("post2============ ${response.body}");

      return const Left(StatusRequest.serverfailure);
    }

    // } else {
    //   return const Left(StatusRequest.offlinefailure);
    // }
  }

  Future<Either<StatusRequest, Map>> getData(
      String linkurl, Map<String, String> headers) async {
    // if (await checkInternet()) {
    var response = await http.get(Uri.parse(linkurl), headers: headers);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);

      //print(responsebody);
      print('=======${response}');
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
    // } else {
    //   return const Left(StatusRequest.offlinefailure);
    // }
  }

  postFileAndData(String linkUrl, Map data, File file) async {
    var request = http.MultipartRequest('Post', Uri.parse(linkUrl));
    int fileLength = await file.length();
    var streamData = http.ByteStream(file.openRead());
    var multiFile = http.MultipartFile('photo', streamData, fileLength,
        filename: basename(file.path));
    request.files.add(multiFile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);

      print("postMultiData1============ $responsebody");

      return Right(responsebody);
    } else {
      print("postMultiData1============ ${response.body}");

      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> postMutipleImagesAndData(String linkurl,
      Map data, Map<String, String> headers, images, int typeList) async {
    var uri = Uri.parse(linkurl);
    var request = http.MultipartRequest('POST', uri);
    if (typeList == 2) {
      for (int i = 0; i < images.length; i++) {
        for (int j = 0; j < images[i].length; j++) {
          request.files.add(
            http.MultipartFile(
              'images[$i][$j]',
              http.ByteStream(images[i][j].openRead()),
              await images[i][j].length(),
              filename: basename(images[i][j].path),
            ),
          );
        }
      }
    } else {
      for (int i = 0; i < images.length; i++) {
        request.files.add(
          http.MultipartFile(
            'images[$i]',
            http.ByteStream(images[i].openRead()),
            await images[i].length(),
            filename: basename(images[i].path),
          ),
        );
      }
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });
    request.headers.addAll(headers);

    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);

    if (myRequest.statusCode == 200 || myRequest.statusCode == 201) {
      return Right(jsonDecode(response.body));
    } else {
      print(response.body);
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> postMutipleImagesAsMapAndData(
      String linkurl,
      Map data,
      Map<String, String> headers,
      images,
      int typeList) async {
    var uri = Uri.parse(linkurl);
    var request = http.MultipartRequest('POST', uri);

    if (typeList == 2) {
      images.forEach((key, value) async {
        for (int i = 0; i < images![key].length; i++) {
          request.files.add(
            http.MultipartFile(
              'images[$key][$i]',
              http.ByteStream(images[key][i].openRead()),
              await images[key][i].length(),
              filename: basename(images[key][i].path),
            ),
          );
        }
      });
    } else {
      images.forEach((key, value) async {
        request.files.add(
          http.MultipartFile(
            'images[$key]',
            http.ByteStream(images[key].openRead()),
            await images[key].length(),
            filename: basename(images[key].path),
          ),
        );
      });
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });
    request.headers.addAll(headers);

    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);
    if (myRequest.statusCode == 200 || myRequest.statusCode == 201) {
      return Right(jsonDecode(response.body));
    } else {
      print(response.body);
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> getdata(
      String linkurl, Map data, Map<String, String> header) async {
    //  if (await checkInternet()) {
    try {
      var request = await http.Request(
          'GET',
          Uri.parse(
            (linkurl),
          ));
      request.headers.addAll(header);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final stream = await response.stream.transform(utf8.decoder);
        Map data2 =
            await stream.map((jsonString) => json.decode(jsonString)).first;
        print('=================== $data2');
        print('=================== ${response.statusCode}');

        return Right(data2);
      } else {
        var respons = await http.Response.fromStream(response);
        print(respons.body);
        return const Left(StatusRequest.failure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
    // } else {
    //   return const Left(StatusRequest.offlinefailure);
    // }
  }
}




/*

void uploads(url, image, Map data, header) async {
    var uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);
    for (int i = 0; i < image.length; i++) {
      request.files.add(
        http.MultipartFile(
          'images[$i]',
          http.ByteStream(image[i].openRead()),
          await image[i].length(),
          filename: basename(image[i].path),
        ),
      );
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    request.headers.addAll(header);

    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

 */