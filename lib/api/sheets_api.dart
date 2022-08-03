// ignore_for_file: prefer_const_declarations

import 'package:gsheets/gsheets.dart';
import 'package:hazob_card_app/model/hazob_field.dart';
import 'dart:async';

class HazobSheetsApi {
  static const _credentials = r'''
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
''';

  static final _spreadsheetId = "19Emv6EHYl8d2TiAh2ucXVW_n4Cn6_kcwcOPNTgHqrRc";
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _hazobSheet;

  static Future init() async {
    try {
      final spreadsheets = await _gsheets.spreadsheet(_spreadsheetId);
      _hazobSheet = await _getWorkSheet(spreadsheets, title: 'Hazob');

      final firstRow = HazobFields.getFields();
      _hazobSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      return null;
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_hazobSheet == null) return;
    _hazobSheet!.values.map.appendRows(rowList);
  }
}
