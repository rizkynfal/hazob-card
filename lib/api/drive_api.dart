// ignore_for_file: depend_on_referenced_packages, unnecessary_null_comparison

import 'dart:io';
import 'package:intl/intl.dart';

import 'package:googleapis/drive/v3.dart' as ga;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;



class GoogleDrive {
  late ga.FileList tes;
  // ignore: prefer_const_declarations
  static final _credentials = auth.ServiceAccountCredentials.fromJson(r'''
{
  "type": "service_account",
  "project_id": "hazob-card-app",
  "private_key_id": "f0bedf850656392f365efa81c2e7100538f9361a",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDZ3co0QoOd14KD\nfWUZ+HyBLdhyNM0fLEzj5Vr2Br7t44zzJLW+DtsPfIK+CK24suQegACo6rUCPIyS\nUHzxNMCMix4KF3HBQc+8A++GyShLatgZK342BrYXJCJvSyYYjaxBzC3KDC0FMGg4\n2eoaS4HlrQAa/2zl9w9nw/Dq0Y+3WfunKvHkXj0soKycZGfm5lA3csf5PCQieRzY\n3QNzTGsDlCRQZHZkCrWWCKi3itNbA/LWJxxBAqckiHmm7GZsvTndGTPY5VbRuVKv\nzCoAg/Dg82QUrhxBHAeI5STjh2UuzeORhJC6FI+fLL7vrp9Enol5c6eijoM/tXUD\nN8jre+qhAgMBAAECggEABjmAcXeTQVJZMLQc6LNEyZwPDGmdyc3GOCyqRfqOB0e5\nheHGLcFIrk9BuXfIrRQIQybSbDn2st2o5LxlTlmZRPjrrQRbyzotsFnxxKz5v4bC\n2H/rZXCnNBaANVzuEigvZ75MVfLSOD7Ye3WQMkZacts7ZfvY7KkYLHkDWnIqVeXM\niOyOTl/QXy3EkPFU/BdDzVccRQP0aE+HbiimABhFZ+xQht5s3b/iY0mo6N9Ey8aC\nu0pvo5jZ4Kc9nkmSSCI3GWOUukqWXtWmRg47vdysOWP75kWsat8LzOa3KOPGUjk8\n9jLdwGOse4l+zt+4ri4BSwJBR7Hl9exuc5EZm21a0QKBgQD0DOA6GChb2ZJ6v/pE\nOe2KIqTTis0rxmijaIQHKBN0z6eb0+zXt1fuTctq58FR09G1liL6B1SbYgg/lcMc\nXQ9csFP+DZrD9RZqIw5rLtnMBjBzPLz3crzVJJSgv+WA6CgKMdKXstTfEneLVlK6\nmuK/p/2LtO/XJOLvPEGEZsmZ1wKBgQDkiLQRJV2b8qJAYK6Zqu6zlkJ2grK1yVPG\nny+k37lF5idKnkYiFXmUmK9E4PWDqfzJ2vzd5C2hs+LXLUjPFZDsa4m8fuH39ieW\nb88PgD6cGIfDJOXHGAfgu1mAPlUC3vvCe13SLiAYMyy1R8Vw4+HmHgaBn8WEczYQ\nYXx0/zfARwKBgGmt5a7iZR+Y8HgdB6dhmj310IAWG9A343nXOUzMCtjLTt4IgAfN\nSdNUdqB9aNYhLi8+qziv0fBTHBVEqa9vkMZnSIe7pmfyilk9gvHg4MkbaQGNrJpO\nYfy+EWomjqAqZ6Q6fOHZu5o5KfD5WWuaxFOP0BgeKrl0LJzB7/EAfY4TAoGAAlDA\nQkw2npXevvg7zKLGuFsVYU4BsYXQq3qBaRI7NlIWo9LmswG0saS6YeBFnIfkX8cw\nOK9PJwxDiBqVWkPFrB+KzbYbY//Cduu7FVUfTUWSWo/NJC9CJSzAw2PeSKEpu9a0\nJKUC/jvGgC+x+GrWpxY2yqlrvuPL8G6MbEMJtZECgYEA5ul7SZwq8OswQtHtt8JV\ns1WR9JrqZhvp8jjxYxhsfSWo0QwS9RGDzCfnuE7vJUXxyO6sTy5BfZSwnvGIuDt9\n2OTFmyy6FbSmyb3VPFsrfWMn9rUktCR5Hbs7pPHP9cZObxhs35UAnp71hh+zotLi\nUvaUlB3jDTDEseVoW/0rT18=\n-----END PRIVATE KEY-----\n",
  "client_email": "hazob-card-app@hazob-card-app.iam.gserviceaccount.com",
  "client_id": "113910447101275947728",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/hazob-card-app%40hazob-card-app.iam.gserviceaccount.com"
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
    try {
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

    } on Exception {
      return "Uploading";
    }
  }
}
