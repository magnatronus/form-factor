# formfactor

An attempt at providing a widget that can be used to determine, and therefore alter, what is displayed in an app depending on whether it is running on a phone or a tablet.

## iOS
This is relatively easy as you can get the model value from the [device_info](https://pub.dartlang.org/packages/device_info) plugin which returns

- iPhone
- iPad

obviously really.

# Android
A lot more difficult (I stand to be corrected) but with my limited Flutter/Dart knowledge, and some research I have come up with the following solution.

Use [MediaQuery](https://docs.flutter.io/flutter/widgets/MediaQuery-class.html) to obtain some stats about the current display, do some math to get a physical diagonal screen measurement, then set a value for this measurement to toggle between a phone and a tablet.

I realise this is very subjective, as the calculated diagonal is not 100% accurate as mediaQuery return the size of the current context window, but as you can set the size where the limit is it is up to you to determine at what value a phone becomes a tablet. To be more accurate I should really use the physical display size.

In my very limited testing (6 inch screen phone and 10.2 inch screen tablet), it got values of 5 and 10 (values rounded up), so in this demo I set the phone tablet switch to 6.


## formFactor Widget

*FormFactor( double phoneScreenSize, Widget phone, Widget tablet)*

This has the following properties:

- phoneScreenSize ( double, required)  - this is the size for the phone/tablet switch setting
- phone (Widget, required) - This is the widget to display if a phone form factor is detected or no tablet widget is supplied
- tablet (Widget) - if supplied this widget is used if the tablet form factor is detected

In the main.dart of the project this is set up as

```
home: Scaffold(
    appBar: AppBar(title: Text("form Factor Demo")),
    body: FormFactor(
        phoneScreenSize: 6.0,
        phone: Text("Running on a phone"),
        tablet: Text("Running on a tablet")
    ),
)
```

Here the phone/tablet switch is set to **6.0** and if phone is detected it should print *Running on a phone*  and for a tablet *Running on a tablet*.


## Getting Started

For help getting started with Flutter, view the online
[documentation](https://flutter.io/).
