# Simple Swift Project Integrated with Linea Pro SDK (DTDevices)
This project is already set with all the tricks you need to be able to use Swift Language + iOS8 + Linea Pro Objective C SDK. But if you already have a project created, you can follow these instructions below to set your project to do the same: 

Hi @petercosmo, I created this little tutorial to help you guys out using iOS8 + Swift + Linea Pro SDK. In the end of this post you will find a git repository that I also created with a base project with all this settings and codes already in there...

How to make Objective-C Linea Pro SDK works with iOS8 and Swift

First steps:

1) Download this sdk package: DTDevices-iOS_2015-02-27_v1.96_Universal_XCode6.zip or this DTDevices-iOS_2014-04-25_v1.88_Universal_XCode5.zip

2) Drag DTDevices.h and libdtdev.a to your project

3) If you are using the Xcode5 SDK package from Linea, you need to open DTDevices.h and paste these two following lines on top of it. Ignore this step if you are using Xcode6 SDK package.

 #import <UIKit/UIKit.h>

 #import <Foundation/Foundation.h>

4) Go to your project settings -> General tab -> Scroll to Linked Frameworks and Libraries and click to add another one. Select ExternalAccessory.framework and add it to your project.

5) Go to your project settings -> Build Settings and filter by Swift Compiler. Expand “Objective-C Bridging Header” and add (there is an add button right on its side) inside of Debug and Release an “Any Architecture | Any SDK” line and type this value inside of both: “DTDevices.h” (without quotes)

6) Go to your project settings -> Info Tab -> Look for “Supported external accessory protocols” key, if does not exist, right click in the list and click “Add row”, start typing Supported… and select Supported external accessory protocols” option. 

At item 0 add this value: com.datecs.linea.pro.msr

Add another line with this value: com.datecs.linea.pro.bar

7) Try to compile (Command B), if you got a briging header error saying that DTDevices.h does not exist, you may need to edit your library/framework search paths in your build settings.

8) Modify your ViewController Class and add the DTDeviceDelegate at your class header.

class ViewController: UIViewController, DTDeviceDelegate {

}

9) Create a variable with a DTDevice object:

let scanner : DTDevices = DTDevices()

10) Modify your viewDidLoad function:

override func viewDidLoad() {

self.scanner.delegate = self

self.scanner.connect()

super.viewDidLoad()

}

11) Run and try to use it now... You will need to code the rest of your app, but the base is already set.

Git repository:  https://github.com/matheuscmpm/lineaswift