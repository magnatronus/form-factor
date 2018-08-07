import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'dart:io' show Platform;
import 'dart:math';

///
/// This Widget can detect either a Tablet or Phone form Factor
/// and is based on a simple algorithm to determine the screen size(on Android)
/// or the device type(on iOS)
/// For Android the screen size that is defined as a phone can be modified to alter when the switch occurs
/// 
class FormFactor extends StatefulWidget {

  final double phoneScreenSize;
  final Widget phone;
  final Widget tablet;

  FormFactor({@required this.phoneScreenSize, @required this.phone, this.tablet});

  _FormFactorState createState() => _FormFactorState();

}

class _FormFactorState extends State<FormFactor>{  
  
  Widget _screen = Container();
  bool _formFactorFound = false;


  _detectFormFactor(context) async{
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    if(Platform.isIOS){
      _formFactorFound = true;
      IosDeviceInfo info = await deviceInfo.iosInfo;
      String formFactor = (info.model == "iPhone")?"phone":"tablet";
      setState(() {
        if(formFactor == 'phone' || widget.tablet == null){
          _screen = widget.phone;
        } else {
          _screen = widget.tablet;
        }          
      });      
    }
    if(Platform.isAndroid){
      MediaQueryData info = MediaQuery.of(context, nullOk: true);
      if(info != null){
        _formFactorFound = true;
        double dpi = info.devicePixelRatio * 160;
        double x = pow((info.size.width * info.devicePixelRatio)/dpi, 2);
        double y = pow((info.size.height * info.devicePixelRatio)/dpi, 2);
        double screen = sqrt( x + y);
        //print("Actual calc x/y: ${info.size.width * info.devicePixelRatio} x ${info.size.height * info.devicePixelRatio}");
        //print("Calc Screen Size: $screen");        
        String formFactor = (screen<=widget.phoneScreenSize)?"phone":"tablet";
        setState(() {
        if(formFactor == 'phone' || widget.tablet == null){
          _screen = widget.phone;
        } else {
          _screen = widget.tablet;
        }          
      }); 

      }
     
    }
  }

 
  @override
  Widget build(BuildContext context) {
    if(!_formFactorFound){
      _detectFormFactor(context);
    }
    return _screen;
  }

}

