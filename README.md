# Lines

App Flutter per il monitoraggio del ciclo.

## Impostare la lingua di base
### iOS

apri il file _projectname.xcodeproj/project.pbxproj_ e cerca  _developmentRegion_
```swift
developmentRegion = it;
```

## Firebase
Creare i progetti su [Firebase](https://firebase.google.com/)

Dalla console Firebase aggiungere Firebase alla tua app Flutter.

Verrà richiesto di eseguire i seguenti comandi nella directory principale del progetto Flutter:
```bash
dart pub global activate flutterfire_cli
flutterfire configure --project=lines-74cf1
```

Una volta completata la procedura aggiungere il seguente codice nel file _main.dart_ per inizializzare Firebase

```dart
FutureOr<void> main() async {
  // Aspetto che l'app venga interamente inizializzata
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();

  runApp(const App());
}

_initApp() async {
  [...]
  await _initFirebase();
}

_initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
```

### Creare i progetti per Firebase Distribution
Una volta creato il progetto aggiungere le app _dev_ e _prod_ sia Android che iOS.

<img src="./readme/readme_firebase_1.png" alt="Firebase" width="600px"/>



## Flavors

La prima cosa da fare con un nuovo progetto è la generazione dei flavors, gli ambienti di sviluppo.

Aggiungere le seguenti righe nel file _pubpsec.yml_ e impostare i parametri specifici del progetto per creare 2 flavors: _dev_ e _prod_

```yaml
# Flavors
flavorizr:
  app:
    android:
      flavorDimensions: "flavor-type"

  flavors:
    dev:
      app:
        name: "Lines"
      android:
        applicationId: "it.tandu.lines"
        firebase:
          config: "firebase/android/dev/google-services.json"
      ios:
        bundleId: "it.tandu.lines"
        firebase:
          config: "firebase/ios/dev/GoogleService-Info.plist"

    prod:
      app:
        name: "Lines"
      android:
        applicationId: "it.fater.lines" # FIXME:
        firebase:
          config: "firebase/android/prod/google-services.json"
      ios:
        bundleId: "it.fater.lines"
        firebase:
          config: "firebase/ios/prod/GoogleService-Info.plist"

```


e lanciare il seguente comando per generare i 2 flavors: dev e prod

```bash
make generate_flavors
```

## Generazione key per ambienti di produzione e debug
### Android

#### Development
```bash
cd android/app
keytool -genkey -v -alias LinesKeyDev -keyalg RSA -keysize 2048 -validity 10000 -storetype JKS -dname "CN=Lines,OU=IT,O=Lines,L=Italy,C=IT" -keystore LinesKeyDev.keystore  -storepass LinesPassword!
keytool -list -v -alias LinesKeyDev -keystore LinesKeyDev.keystore
keytool -list -v -keystore LinesKeyDev.keystore -alias LinesKeyDev -storepass LinesPassword! -keypass LinesPassword!
```

#### Produzione
```bash
keytool -genkey -v -alias LinesKey -keyalg RSA -keysize 2048 -validity 10000 -storetype JKS -dname "CN=Lines,OU=IT,O=Lines,L=Italy,C=IT" -keystore LinesKey.keystore  -storepass LinesPassword!
keytool -list -v -alias LinesKey -keystore LinesKey.keystore
keytool -list -v -keystore LinesKey.keystore -alias LinesKey -storepass LinesPassword! -keypass LinesPassword!
```

#### Verifica delle firme sha per Firebase

```bash
cd android; ./gradlew signingReport
```


#### Impostare le key generate 

Incollare nel file `app/build.gradle` il seguente codice:

```java
signingConfigs {
  debug {
    storeFile file("LinesKeyDev.keystore")
    storePassword "LinesPassword!"
    keyAlias "LinesKeyDev"
    keyPassword "LinesPassword!"
  }

  release {
    storeFile file("LinesKey.keystore")
    storePassword "LinesPassword!"
    keyAlias "LinesKey"
    keyPassword "LinesPassword!"
  }
}

buildTypes {
  debug {
    signingConfig signingConfigs.debug
  }
      
  release {
    signingConfig signingConfigs.release
  }
}
```




## Disabilitare rotazione schermo Android

Apri il file `android/app/src/main/AndroidManifest.xml`

Aggiungi  
```xml
<activity 
  ... 
  android:windowSoftInputMode="adjustResize"
  android:orientation="vertical"
>
```