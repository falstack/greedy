import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:greedy/views/home.dart';
import 'package:greedy/views/login.dart';
import 'package:greedy/views/webview.dart';
import 'package:greedy/views/main-note.dart';
import 'package:greedy/views/main-notice.dart';
import 'package:greedy/views/main-user.dart';
import 'package:greedy/views/main-zone.dart';
import 'package:greedy/views/note-show.dart';
import 'package:greedy/views/user-show.dart';
import 'package:greedy/views/zone-show.dart';

class Routes {
  static void configureRoutes(Router router) {
    router.define('/login', handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return LoginPage();
      },
    ));

    router.define('/home', handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return Homepage();
      },
    ));

    router.define('/webview', handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        String title = params['title']?.first;
        String url = params['url']?.first;
        return Webview(title: title, url: url);
      },
    ));

    router.define('/main/note', handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return MainNote();
      }
    ));

    router.define('/main/zone', handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return MainZone();
      },
    ));

    router.define('/main/notice', handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return MainNotice();
      },
    ));

    router.define('/main/user', handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return MainUser();
      },
    ));

    router.define('/user/:slug', handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        String slug = params['slug']?.first;
        return UserShow(slug);
      },
    ));

    router.define('/note/:slug', handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return NoteShow();
      },
    ));

    router.define('/zone/:slug', handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return ZoneShow();
      },
    ));
  }
}
