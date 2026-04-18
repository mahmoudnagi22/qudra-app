import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

// ✅ تحميل بيانات الـ keystore من key.properties (اختياري)
val keystoreProps = Properties()
val keystoreFile = rootProject.file("key.properties")
if (keystoreFile.exists()) {
    keystoreProps.load(FileInputStream(keystoreFile))
}

android {
    namespace = "com.qudra.zabtly"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        // ✅ خليك على 17 أفضل حالياً (مع desugaring) — شغال ممتاز مع plugins
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17

        // ✅ REQUIRED for flutter_local_notifications
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.qudra.zabtly"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        // ✅ لو عندك key.properties هيعمل signing للـ release
        if (keystoreFile.exists()) {
            create("release") {
                keyAlias = keystoreProps["keyAlias"] as String
                keyPassword = keystoreProps["keyPassword"] as String
                storeFile = file(keystoreProps["storeFile"] as String)
                storePassword = keystoreProps["storePassword"] as String
            }
        }
    }

    buildTypes {
        getByName("release") {
            // ✅ لو keystore موجود استخدمه، لو مش موجود fallback على debug
            signingConfig = if (keystoreFile.exists()) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }

            // (اختياري) غالباً سيبها false دلوقتي عشان تتفادى مشاكل proguard
            isMinifyEnabled = false
            isShrinkResources = false

            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
        getByName("debug") {
            // debug defaults
        }
    }
}

// ✅ Kotlin toolchain (متوافق)
kotlin {
    jvmToolchain(17)
}

dependencies {
    // ✅ REQUIRED for core desugaring
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
}

// ✅ (اختياري) تثبيت نفس النسخة لو أي dependency شدّت نسخة مختلفة
configurations.all {
    resolutionStrategy {
        force("com.android.tools:desugar_jdk_libs:2.1.5")
    }
}

flutter {
    source = "../.."
}
