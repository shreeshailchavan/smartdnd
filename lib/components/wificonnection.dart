import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:wifi_iot/wifi_iot.dart';

class WiFiConnectScreen extends StatefulWidget {
  @override
  _WiFiConnectScreenState createState() => _WiFiConnectScreenState();
}

class _WiFiConnectScreenState extends State<WiFiConnectScreen> {
  final FormGroup form = FormGroup({
    'ssid': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  // 🔹 Function to show the modal
  void showWiFiModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Connect to Wi-Fi"),
          content: ReactiveForm(
            formGroup: form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ReactiveTextField<String>(
                  formControlName: 'ssid',
                  decoration: InputDecoration(labelText: "Wi-Fi SSID"),
                ),
                SizedBox(height: 10),
                ReactiveTextField<String>(
                  formControlName: 'password',
                  decoration: InputDecoration(labelText: "Wi-Fi Password"),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (form.valid) {
                      connectToWiFi(
                        form.control('ssid').value,
                        form.control('password').value,
                      );
                      Navigator.pop(context); // Close modal
                    }
                  },
                  child: Text("Connect"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 🔹 Function to connect to Wi-Fi using wifi_iot
  Future<void> connectToWiFi(String ssid, String password) async {
    bool success = await WiFiForIoTPlugin.connect(ssid, password: password);
    if (success) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Connected to $ssid")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to connect")));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    @override
    Widget build(BuildContext context) {
      return WiFiConnectScreen();
    }

    throw UnimplementedError();
  }
}
