// import 'package:app/screens/product_list.dart';
import 'package:app/screens/table_list.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Thực hiện xác thực tại đây, ví dụ: kiểm tra tên người dùng và mật khẩu
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Giả sử xác thực thành công nếu username và password không rỗng
    if (username.isNotEmpty && password.isNotEmpty) {
      // Chuyển sang màn hình thứ hai khi đăng nhập thành công
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TableList()),
      );
    } else {
      // Hiển thị thông báo lỗi nếu đăng nhập không thành công
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Đăng nhập không thành công'),
            content:
                const Text('Vui lòng kiểm tra lại tên người dùng và mật khẩu.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Đóng'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                    child: const FlutterLogo()),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Text(
                  "Hello\nWelcome Back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      labelText: "USERNAME",
                      labelStyle:
                          TextStyle(color: Color(0xff88888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          labelText: "PASSWORD",
                          labelStyle: TextStyle(
                              color: Color(0xff88888888), fontSize: 15)),
                    ),
                    const Text(
                      "SHOW",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _login,
                      child: const Text(
                        "SIGN IN",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )),
              ),
              Container(
                height: 130,
                width: double.infinity,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "NEW USER? SIGN UP",
                      style:
                          TextStyle(fontSize: 15, color: Color(0xff88888888)),
                    ),
                    Text(
                      "FORGOT PASSWORD?",
                      style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
