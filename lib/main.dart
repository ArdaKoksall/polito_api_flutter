import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:polito_api_flutter/polito_api_flutter.dart';
import 'package:polito_api_flutter/src/models/request/login_request.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polito API Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  String _statusMessage = 'Ready to login';
  bool _isLoggedIn = false;

  Future<void> _performLogin() async {
    setState(() {
      _isLoading = true;
      _statusMessage = 'Logging in...';
    });

    try {
      final env = dotenv.env;

      // Get credentials from .env or use defaults
      final username = env['USERNAME'] ?? 'YOUR_USERNAME';
      final password = env['PASSWORD'] ?? 'YOUR_PASSWORD';

      final api = PolitoApi();
      final loginRequest = LoginRequest(username: username, password: password);

      await api.basicLogin(loginRequest);

      setState(() {
        _isLoggedIn = true;
        _statusMessage = 'Login successful!';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Login failed: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Polito API Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _isLoggedIn ? Icons.check_circle : Icons.account_circle,
              size: 80,
              color: _isLoggedIn ? Colors.green : Colors.grey,
            ),
            SizedBox(height: 20),
            Text(
              _statusMessage,
              style: TextStyle(
                fontSize: 18,
                color: _isLoggedIn ? Colors.green : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            if (!_isLoggedIn)
              ElevatedButton(
                onPressed: _isLoading ? null : _performLogin,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Login to Polito'),
              ),
            if (_isLoggedIn)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoggedIn = false;
                    _statusMessage = 'Ready to login';
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: Text('Login Again'),
              ),
            SizedBox(height: 20),
            Text(
              'Make sure to set USERNAME and PASSWORD in your .env file',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
