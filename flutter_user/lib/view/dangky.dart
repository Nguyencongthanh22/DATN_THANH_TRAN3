import 'dart:convert';

import 'package:flutter/material.dart';

import '../methods/api.dart';
import 'dangnhap.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void register() async {
    final data = {
      'email': emailController.text.toString(),
      'name': nameController.text.toString(),
      'password': passwordController.text.toString()
    };
    final result = await API().postRequset(route: '/register', data: data);
    final response = jsonDecode(result.body);
    if (response['status'] == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Loginpage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                register();
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/methods/api.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: RegisterPage(),
//     );
//   }
// }

// class RegisterPage extends StatelessWidget {
  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController emailController= TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // void register() async {
  //   final data = {
  //     'email': emailController.text.toString(),
  //     'name': nameController.text.toString(),
  //     'password': passwordController.text.toString()
  //   };
  //   final result = await API().postRequset(route: '/register', data: data);
  //   final response=jsonDecode( result.body);
  //   if(response['status']==200){
  //   Navigator.of(context)
  //   }
  // }
//   // Future<void> registerUser(String name, String email, String password) async {
//   //   final response = await http.post(
//   //     Uri.parse('http://10.0.2.2:8000/api/register'),
//   //     body: {
//   //       'name': name,
//   //       'email': email,
//   //       'password': password,
//   //     },
//   //   );

//   //   if (response.statusCode == 201) {
//   //     // Registration successful, navigate to login page or show success message
//   //     print('User registered successfully');
//   //   } else {
//   //     // Registration failed, show error message
//   //     print('Failed to register: ${response.body}');
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 register();
//               },
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_1/view/auth_sever.dart';

// // class RegisterScreen extends StatelessWidget {
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final AuthService authService = AuthService();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Register')),
// //       body: Padding(
// //         padding: EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: nameController,
// //               decoration: InputDecoration(labelText: 'Name'),
// //             ),
// //             TextField(
// //               controller: emailController,
// //               decoration: InputDecoration(labelText: 'Email'),
// //             ),
// //             TextField(
// //               controller: passwordController,
// //               decoration: InputDecoration(labelText: 'Password'),
// //               obscureText: true,
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 authService
// //                     .register(
// //                   nameController.text,
// //                   emailController.text,
// //                   passwordController.text,
// //                 )
// //                     .then((_) {
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(content: Text('Registration thành công')),
// //                   );
// //                 }).catchError((error) {
// //                   // Handle registration error
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(content: Text('Registration Failed')),
// //                   );
// //                 });
// //               },
// //               child: Text('Register'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
