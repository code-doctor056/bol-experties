import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        fontFamily: "Arial",
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 100),
            CircleAvatar(
              radius: 36,
              backgroundColor: const Color(0xFFEFF4F5),
              child: Icon(Icons.directions_car, size: 32, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                "Welcome to App",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                "Log in to continue or create a new account",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                filled: true,
                fillColor: const Color(0xFFF5F6FA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                hintText: "Password",
                filled: true,
                fillColor: const Color(0xFFF5F6FA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Expanded(child: Divider(thickness: 0.8, color: Colors.black26)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "or create a new account",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ),
                Expanded(child: Divider(thickness: 0.8, color: Colors.black26)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
