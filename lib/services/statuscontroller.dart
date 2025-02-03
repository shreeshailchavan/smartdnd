import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';


class LedController extends StatefulWidget {
  @override
  _LedControllerState createState() => _LedControllerState();
}

class _LedControllerState extends State<LedController> {
  late MqttServerClient client;
  String ledStatus = "OFF";

  @override
  void initState() {
    super.initState();
    connectMQTT();
  }

  Future<void> connectMQTT() async {
    client = MqttServerClient("broker.hivemq.com", "FlutterClient");
    client.port = 1883;
    client.keepAlivePeriod = 20;
    client.logging(on: false);

    final connMessage = MqttConnectMessage()
        .withClientIdentifier("FlutterClient")
        .startClean();
    client.connectionMessage = connMessage;

    try {
      await client.connect();
      print("✅ Connected to MQTT broker");
    } catch (e) {
      print("❌ Failed to connect: $e");
    }
  }

  void toggleLED() {
    final builder = MqttClientPayloadBuilder();
    builder.addString(ledStatus == "OFF" ? "ON" : "OFF");

    client.publishMessage("esp32/led", MqttQos.atLeastOnce, builder.payload!);

    setState(() {
      ledStatus = (ledStatus == "OFF") ? "ON" : "OFF";
    });
  }

  @override
  void dispose() {
    client.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ESP32 MQTT Control")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("LED is $ledStatus"),
              ElevatedButton(
                onPressed: toggleLED,
                child: Text(ledStatus == "OFF" ? "Turn ON" : "Turn OFF"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
