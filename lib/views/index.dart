import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:greedy/views/demo/border_radius.dart';
import 'package:greedy/views/demo/controller_scroll.dart';
import 'package:greedy/views/demo/controller_text_editing.dart';
import 'package:greedy/views/demo/refresh_loadmore.dart';
import 'package:greedy/views/demo/text_line_height.dart';
import 'package:greedy/views/demo/transform.dart';
import 'package:greedy/views/launch.dart';
import 'package:greedy/views/login.dart';
import 'package:greedy/views/home.dart';
import 'package:greedy/views/webview.dart';
import 'package:greedy/views/main-note.dart';
import 'package:greedy/views/main-notice.dart';
import 'package:greedy/views/main-user.dart';
import 'package:greedy/views/main-zone.dart';
import 'package:greedy/views/note-show.dart';
import 'package:greedy/views/user-show.dart';
import 'package:greedy/views/zone-show.dart';

List demoWidgets = <Map>[
  {
    'name': '输入框',
    'path': '/demo/text-editing-controller',
    'handler': TextEditingControllerDemo()
  },
  {
    'name': '圆角',
    'path': '/demo/border-radius',
    'handler': BorderRadiusDemo()
  },
  {
    'name': '滑动监听',
    'path': '/demo/scroll-controller',
    'handler': ScrollControllerDemo()
  },
  {
    'name': 'Transform',
    'path': '/demo/transform',
    'handler': TransformDemo()
  },
  {
    'name': '行高',
    'path': '/demo/line-height',
    'handler': TextLineHeightDemo()
  },
  {
    'name': '刷新和加载更多',
    'path': '/demo/refresh-loadmore',
    'handler': RefreshLoadMoreDemo()
  }
];

class Routes {
  static void configureRoutes(Router router) {
    router.define('/launch', handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return LaunchPage();
      },
    ));

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

    demoWidgets.forEach((demo) {
      router.define(demo['path'], handler: Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          return demo['handler'];
        },
      ));
    });
  }
}
