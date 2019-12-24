import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:greedy/config/app.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController _passwordEditingController = new TextEditingController();
  TextEditingController _userNameEditingController = new TextEditingController();
  FocusNode _passwordFocusNode = new FocusNode();
  FocusNode _emailFocusNode = new FocusNode();
  FocusScopeNode _focusScopeNode = new FocusScopeNode();
  GlobalKey<FormState> _signInFormKey = new GlobalKey();

  static const tabs = [
    '登录',
    '注册'
  ];
  bool isShowPassWord = false;
  bool isLoading = false;
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);// 和下面的 TabBar.tabs 数量对应
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // 点击控制密码是否显示
  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  // 登陆操作
  doLogin() {
    print("doLogin");
    _signInFormKey.currentState.save();
//    setState(() {
//      isLoading = true;
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50.0, bottom: 20.0, left: 20.0, right: 20.0),
            decoration: BoxDecoration(
              color: App.color
            ),
            child: Image.asset('assets/images/login_bg.png', fit: BoxFit.contain),
          ),
          Form(
            key: _signInFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 20, bottom: 20),
                    child: TextFormField(
                      controller: _userNameEditingController,
                      focusNode: _emailFocusNode,
                      onEditingComplete: () {
                        if (_focusScopeNode == null) {
                          _focusScopeNode = FocusScope.of(context);
                        }
                        _focusScopeNode.requestFocus(_passwordFocusNode);
                      },

                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: "Github 登录名",
                          border: InputBorder.none),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      //验证
                      validator: (value) {
                        if (value.isEmpty) {
                          return "登录名不可为空!";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.75,
                  color: Colors.grey[400],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                    child: TextFormField(
                      controller: _passwordEditingController,
                      focusNode: _passwordFocusNode,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        hintText: "Github 登录密码",
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.black,
                          ),
                          onPressed: showPassWord,
                        ),
                      ),
                      obscureText: !isShowPassWord,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "密码不可为空!";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 42, right: 42, top: 10, bottom: 10),
              child: Text("LOGIN"),
            ),
            onTap: () {
              print('?????');
              if (_signInFormKey.currentState.validate()) {
                doLogin();
              } else {
                print("form validate failed");
              }
            },
          ),
          RaisedButton(
            child: Text("点击登录成功，跳转到主页"),
            onPressed: () {
              App.router.navigateTo(context, '/home', transition: TransitionType.fadeIn, replace: true, clearStack: true);
            },
          )
        ],
      ),
    );
  }
}
