import 'package:reactive_forms/reactive_forms.dart';

final wifiForm = FormGroup(
    {'ssid': FormControl<String>(validators: [Validators.required]), 'password': FormControl<String>(validators: [Validators.required])});

