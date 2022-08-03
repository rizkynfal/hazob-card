// ignore_for_file: depend_on_referenced_packages, unnecessary_null_comparison

import 'dart:io';

import 'package:googleapis/drive/v3.dart' as ga;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class GoogleDrive {
  late ga.FileList tes;
  // ignore: prefer_const_declarations
  static final _credentials = auth.ServiceAccountCredentials.fromJson(r'''
{
  "type": "service_account",
  "project_id": "new-hazob-2022",
  "private_key_id": "27ae369a79d30fa0a6bbe40dc3311790c3916f66",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC4QUUFNzOwbob0\nkQGmhf+iGR0MBBc6NCygIjCw+ImbcbJ+JiLwPuN493Mh/8zj4Q1xu7Ny7jIpBGYI\nBDm30FpVxyb37HhEH3jVCTtxGlBdW+JT9goFWpQK/24RwooNSu0doDE2NC+FkZtb\nZ8EcbvaaUVaUoIL2knpz49GqyLKNrpaTVX66bwAZ/GB+xRNX+0S3Oy9vEBqMz7Ry\np7JY+KwrZqdQNWr+zo5WG28UWEKWr77NJ77LSYnkmYdWiH6WB+/iVph2vTdXqU6r\nR8IY5ksJU/BLen9GT0XJQ/vZC1mPxsKDVz69bnMMoDGpsiNGzigiBlMKsdXqmCs+\n1BGWJhN3AgMBAAECggEAHioJS55K5wJhM56dn45mWDo2SCZPSycJezm9sOsvU/Rc\nHUzPAXe6M66G+bTv7QqF8e2hphoauh5POda/QDlq4IoW9hWPZs+kL3QweAavy2jk\nd4xa/Z9jhx1j/qJTiXOPt/7mr5IBiaNZxLAKrEX6Ny9DtldEuWsngtt0ErqCiLEZ\n85NXUp3a7Np5UdZwzPpveaI+cUB1cgHmWOTuI4UQTm8EvfjQWPllyDoGJVo+YXxW\nRu96jT51Yj+4t5aOCQYRpgflZWrnUMFTAEhY9yodKBgSrJW4ti9E3PgnIdp2dkWZ\nmadMBAuG34AxWtC6zfI+Kalt26cBGEDOaam94cf3CQKBgQDstGbmN8qgtDgbRynj\nkzEaRGlzf9weu7kIYmwrSxFLVLTM/V9gZ0pOzLg+ih9w1o2iGwKguNAZN0As/dAm\nnXuELBc5d9YONz6ahXYItNMajKE0MeuWQ6AS1fEe/OtzrzluwU07ZbHg88wkzvdu\ncuOpyiCdRiMAvYhnEe/Okp+7tQKBgQDHRlYzY+fKKBn5MKUGmWfTWxWv67Kqp+Wh\nVMDiKsUwszTRu+eedfmHV5I710InugIAXexLORSdQXL0w8alJWFJ5iug0cyiUpSP\nmkxWc+qeaGMqUehPBEJ3HUtFzGj/y8q5NQBz7ry3P0o8K3KVvsY/KbBqv4zuDnNq\nfwQaRXSF+wKBgQC6BF/lRi0QM/DvxvItbSwmd2LjqLSk1mPoKejV8Q1rROs9OVUt\n3p5v5MRaKZPhykrN/SoIgpTPbDMb6G8fGZ3K1hd+SyXGUDX7myySVQCdmazJ5v08\nPnLaupTeBGdIp4ib+H8oUZgDr7RbrOaYPuOZOEZ/MnIpj8lVLqxli6bKDQKBgFI7\nMC8ctvWw/qbZ7/99Jl8NYzGpLZ1Gk3ezpbSuuZiTGuTBiZ7WSBYViP6woVgLZfAI\n0g1ojJ0n+OwQLdTQTAlWtgIzESKauTtZDM9QHi0oHmPEUPzqYRMOP5WZ+Go2Cn3K\n5Vjx12Y288dIlow8oUpHRcmHKfzCcdYse+DrcF4pAoGBANCXqUa9JqwPGmjAVIOY\nbyMJwibZQiJp6SYdgp57XdP2WnT2qy2FkFALRnfzaIblz/hiJwyikHfj55D9U+De\nT+0+JIfql/mOv0pR+K0p/f2cMGBVOsuiF9U8O1knNu5tAcW/GdXd/nRm3GadRwpv\ntHFPSk8accuu/wJGjM1cZ3GP\n-----END PRIVATE KEY-----\n",
  "client_email": "hazob-hse-2022@new-hazob-2022.iam.gserviceaccount.com",
  "client_id": "111620727009867621194",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/hazob-hse-2022%40new-hazob-2022.iam.gserviceaccount.com"
}

''');

  static const driveScope = ['https://www.googleapis.com/auth/drive'];
  static final _client = http.Client();

  Future<http.Client> getAccessCredentials() async {
    return auth.authenticatedClient(
        http.Client(),
        await auth.obtainAccessCredentialsViaServiceAccount(
            _credentials, driveScope, _client));
  }

  Future<String?> _getFolderId(ga.DriveApi driveApi) async {
    const mimeType = "application/vnd.google-apps.folder";
    String folderName = "Hazob pict";

    try {
      final found = await driveApi.files.list(
        q: "mimeType = '$mimeType' and name = '$folderName'",
        $fields: "files(id, name)",
      );
      final files = found.files;
      if (files == null) {
        return null;
      }

      // The folder already exists
      if (files.isNotEmpty) {
        return files.first.id;
      }

      // Create a folder
      var folder = ga.File();
      folder.name = folderName;
      folder.mimeType = mimeType;
      final folderCreation = await driveApi.files.create(folder);

      return folderCreation.id;
    } catch (e) {
      return null;
    }
  }

  Future<String> uploadFile(File file) async {
    var client = await getAccessCredentials();
    ga.DriveApi driveApi = ga.DriveApi(client);
    final folderId = await _getFolderId(driveApi);
    var driveFile = ga.File();
    driveFile.parents = [folderId!];
    var response = await driveApi.files.create(
        driveFile
          ..name =
              "${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}.png",
        uploadMedia: ga.Media(file.openRead(), file.lengthSync()));
    Map<String, dynamic> detailImg = response.toJson();
    return detailImg['id'].toString();
  }
}
