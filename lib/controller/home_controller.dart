import 'dart:convert';

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:get/get.dart';
import 'package:hex/hex.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';

class HomeController extends GetxController{
  var isReadyScanning = false.obs;

  @override
  void onInit() {
    super.onInit();
    readNFC();
  }
  void readNFC() async{
    isReadyScanning.value = false;
    await NfcManager.instance.isAvailable();
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async{
      print(tag.data);
      final String identifier = tag.data['nfcv']['identifier']
          .map((e) => e.toRadixString(16).padLeft(2, '0'))
          .join('');
      print(identifier);
    },);
    // var tag = await FlutterNfcKit.poll();
    // print(jsonEncode(tag));
    //CF46A00A00A007E0
    isReadyScanning.value = true;
  }
}