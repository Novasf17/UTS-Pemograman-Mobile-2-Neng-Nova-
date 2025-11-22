import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  void register() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        passwordController.text == confirmController.text) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pastikan semua field diisi dan password sama')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Nama Lengkap')),
              TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
              TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
              TextField(controller: confirmController, decoration: const InputDecoration(labelText: 'Konfirmasi Password'), obscureText: true),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: register, child: const Text('Register')),
            ],
          ),
        ),
      ),
    );
  }
}

