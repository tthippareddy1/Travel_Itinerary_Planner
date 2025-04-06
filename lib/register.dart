import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _registerUser() async {
    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill all fields")),
        );
        return;
      }

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration Successful!")),
      );

      Navigator.pushReplacementNamed(context, 'login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Create an Account",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _registerUser,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
              child: const Text("Register", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'login'),
              child: const Text("Already have an account? Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}









// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class MyRegister extends StatefulWidget {
//   const MyRegister({super.key});

//   @override
//   State<MyRegister> createState() => _MyRegisterState();
// }

// class _MyRegisterState extends State<MyRegister> {
//   final TextEditingController email = TextEditingController();
//   final TextEditingController password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/register.png'), fit: BoxFit.cover)),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(
//               padding: const EdgeInsets.only(left: 35, top: 130),
//               child: const Text(
//                 "SIGN UP",
//                 style: TextStyle(color: Colors.white, fontSize: 30),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.5,
//                     left: 35,
//                     right: 35),
//                 child: Column(children: [
//                   TextField(
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey,
//                       filled: true,
//                       hintText: "Name",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   TextField(
//                     controller: email,
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey,
//                       filled: true,
//                       hintText: "email id",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   TextField(
//                     controller: password,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey,
//                       filled: true,
//                       hintText: "password",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       try {
//                         // ignore: unused_local_variable
//                         UserCredential userCredential = await FirebaseAuth
//                             .instance
//                             .createUserWithEmailAndPassword(
//                                 email: email.text, password: password.text);
//                         // ignore: use_build_context_synchronously
//                         // debugPrint('userCredentials: $userCredential');
//                         // ignore: use_build_context_synchronously
//                         Navigator.pushNamed(context, 'login');
//                       } on FirebaseAuthException catch (e) {
//                         if (e.code == 'weak-password') {
//                           //display a snackbar
//                           SnackBar snackBar = const SnackBar(
//                             content: Text('The password provided is too weak.'),
//                           );
//                           // Find the ScaffoldMessenger in the widget tree
//                           // and use it to show a SnackBar.
//                           // ignore: use_build_context_synchronously
//                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                           //print('The password provided is too weak.');
//                         } else if (e.code == 'email-already-in-use') {
//                           SnackBar snackBar = const SnackBar(
//                             content: Text(
//                                 'The account already exists for that email.'),
//                           );
//                           // ignore: use_build_context_synchronously
//                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                           // print('The account already exists for that email.');
//                         } else {
//                           debugPrint('another error: $e');
//                         }
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 50, vertical: 10),
//                         textStyle: const TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                     child: const Text('SIGN UP'),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text("Already have an account?"),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, 'login');
//                     },
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 50, vertical: 10),
//                         textStyle: const TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                     child: const Text('SIGN IN'),
//                   ),
//                 ]),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
