import 'package:flutter/foundation.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ydapp/data/common/base_url.dart';

class BookingOptionDataProvider {
  final _baseUrl = BaseUrl.baseUrl;
  // final storage = const FlutterSecureStorage();
  final successCode = 200;

  // Future<Map<String, dynamic>> addReceipt(
  //     {required var imageFile,
  //     required String category,
  //     required String amount,
  //     required bool vat,
  //     required String payTo,
  //     required String payFor,
  //     required String quantity,
  //     required String note,
  //     required String title}) async {
  //   var url = Uri.parse("$_baseUrl/organize/add/receipt");
  //   var access = (await storage.read(key: 'access'))!;
  //   var company = (await storage.read(key: 'company'))!;

  //   var request = http.MultipartRequest("POST", url);

  //   //Add headers
  //   Map<String, String> headers = {"Authorization": "Bearer $access"};

  //   // Adding image
  //   if (imageFile.runtimeType == String) {
  //     var image = await http.MultipartFile.fromPath("image", imageFile);
  //     request.files.add(image);
  //   } else {
  //     var image = await http.MultipartFile.fromPath("image", imageFile!.path);
  //     request.files.add(image);
  //   }
  //   request.headers.addAll(headers);

  //   // Adding other fields
  //   request.fields["company"] = company;
  //   request.fields["title"] = title;
  //   request.fields["category"] = category;
  //   request.fields["amount"] = amount;
  //   request.fields["pay_to"] = payTo;
  //   request.fields["pay_for"] = payFor;
  //   request.fields["quantity"] = quantity;
  //   request.fields["note"] = note;
  //   request.fields["vat"] = vat.toString();

  //   var response = await request.send();
  //   final respStr = await response.stream.bytesToString();

  //   if (response.statusCode == successCode) {
  //     if (kDebugMode) {
  //       print("RESPONSE: $response");
  //     }
  //     // return true;
  //     Map<String, dynamic> json = jsonDecode(respStr);
  //     return json;
  //   } else {
  //     Map<String, dynamic> json = jsonDecode(respStr);
  //     return errorMessage(json);
  //   }
  // }

  // Future<List<ReceiptModel>> fetchHomeReceipt({int startIndex = 0}) async {
  //   int dataLimit = 10;
  //   int limit = startIndex + dataLimit;
  //   var company = (await storage.read(key: 'company'))!;
  //   var url = Uri.parse(
  //       "$_baseUrl/organize/home/receipts?company=$company&start=$startIndex&limit=$limit");
  //   var access = (await storage.read(key: 'access'))!;
  //   final response = await http.get(
  //     url,
  //     headers: {
  //       "Authorization": "Bearer $access",
  //     },
  //   );

  //   if (response.statusCode == successCode) {
  //     final json = jsonDecode(response.body);

  //     List<ReceiptModel> receiptList = <ReceiptModel>[];
  //     for (var receipt in json) {
  //       if (receipt['images'].length > 0) {
  //         var receiptImage = receipt['images'][0];
  //         ReceiptImageModel receiptImage0 =
  //             ReceiptImageModel.fromJson(receiptImage);
  //         receipt['images'] = receiptImage0;
  //       } else {
  //         receipt['images'] =
  //             const ReceiptImageModel(id: 0, image: '', order: 0, receipt: 0);
  //       }

  //       ReceiptModel receiptData = ReceiptModel.fromJson(receipt);

  //       receiptList.add(receiptData);
  //     }

  //     return receiptList;
  //   } else {
  //     throw response.statusCode;
  //   }
  // }

  Future<Map<String, dynamic>> fetchBookingOptions() async {
    var url = Uri.parse("$_baseUrl/booking/options");
    final response = await http.get(
      url,
      headers: {},
    );
    if (response.statusCode == successCode) {
      final json = jsonDecode(response.body);
      Map<String, dynamic> report = json;
      return report;
    } else {
      throw response.statusCode;
    }
  }

  Future<Map<String, dynamic>> fetchBookingTime(
      {required int destination, required String date}) async {
    var url =
        Uri.parse("$_baseUrl/booking/time?destination=$destination&date=$date");
    final response = await http.get(
      url,
      headers: {},
    );
    if (response.statusCode == successCode) {
      final json = jsonDecode(response.body);
      Map<String, dynamic> report = json;
      return report;
    } else {
      throw response.statusCode;
    }
  }

  /* Future<ReportReceiptModel> fetchMoreReportReceipt(
      {required String? nextUrl}) async {
    var access = (await storage.read(key: 'access'))!;

    var url = Uri.parse(nextUrl!);
    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $access",
      },
    );

    if (response.statusCode == successCode) {
      final json = jsonDecode(response.body);

      LinkModel links = LinkModel.fromJson(json['links']);
      List<ReceiptModel> receiptList = <ReceiptModel>[];

      for (var receipt in json['results']) {
        var receiptImage = receipt['images'][0];
        receiptImage = ReceiptImageModel.fromJson(receiptImage);
        receipt['images'] = receiptImage;

        var receiptData = ReceiptModel.fromJson(receipt);

        receiptList.add(receiptData);
      }

      json['links'] = links;
      json['results'] = receiptList;

      ReportReceiptModel report = ReportReceiptModel.fromJson(json);

      return report;
    } else {
      throw response.statusCode;
    }
  }

  Future<bool> deleteReceipt(
      {required int receiptId, required int receiptImageId}) async {
    var access = (await storage.read(key: 'access'))!;
    var company = (await storage.read(key: 'company'))!;
    var url =
        Uri.parse("$_baseUrl/organize/delete/receipt/$receiptId/$company");

    final receiptResponse = await http.delete(
      url,
      headers: {
        "Authorization": "Bearer $access",
      },
    );

    if (receiptResponse.statusCode == successCode) {
      return true;
    } else {
      throw receiptResponse.statusCode;
    }
  }

  Future<DeletedReceiptModel> fetchDeletedReceipts(var title, var amountGte,
      var amountLte, var id, var createdAtGte, var createdAtLte) async {
    var company = (await storage.read(key: 'company'))!;
    var url = Uri.parse(
        "$_baseUrl/organize/list/deleted/receipts?company=$company&id=&title&amount__gte&amount__lte&created_at__gte&created_at__lte");
    var access = (await storage.read(key: 'access'))!;
    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $access",
      },
    );

    if (response.statusCode == successCode) {
      final json = jsonDecode(response.body);

      List<ReceiptModel> receipts = [];

      for (var receipt in json['results']) {
        var receiptImage = receipt['images'][0];
        receiptImage = ReceiptImageModel.fromJson(receiptImage);
        receipt['images'] = receiptImage;

        var receiptData = ReceiptModel.fromJson(receipt);

        receipts.add(receiptData);
      }

      json['results'] = receipts;

      var deletedReceipts = DeletedReceiptModel.fromJson(json);

      return deletedReceipts;
    } else {
      throw response.statusCode;
    }
  }

  Future<Map<String, dynamic>> restoreReceipt({required int receiptId}) async {
    var access = (await storage.read(key: 'access'))!;
    var company = (await storage.read(key: 'company'))!;
    var url = Uri.parse("$_baseUrl/organize/restore/deleted/receipt");

    final response = await http.put(url,
        headers: {
          "Authorization": "Bearer $access",
          "content-type": "application/json",
        },
        body: jsonEncode({
          "id": receiptId,
          "company": company,
        }));

    if (response.statusCode == successCode) {
      final json = jsonDecode(response.body);
      print(json);
      if (json['status'] == 'success') {
        return {'text': json['message']};
      } else if (json['status'] == 'error') {
        return {"message": json['message']};
      } else {
        return {"error": "Something went wrong"};
      }
    } else {
      throw response.statusCode;
    }
  }

  Future<bool> deleteReceiptPermanently({required int receiptId}) async {
    var access = (await storage.read(key: 'access'))!;
    var company = (await storage.read(key: 'company'))!;
    var url = Uri.parse(
        "$_baseUrl/organize/delete/receipt/permanently/$receiptId/$company");

    final receiptResponse = await http.delete(
      url,
      headers: {
        "Authorization": "Bearer $access",
      },
    );

    if (receiptResponse.statusCode == successCode) {
      return true;
    } else {
      throw receiptResponse.statusCode;
    }
  } */
}
