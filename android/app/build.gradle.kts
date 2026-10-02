import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.coralcell.islamiapp"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.coralcell.islamiapp"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // Load release signing configuration from key.properties if present
    val keystoreProperties = Properties()
    val keystorePropertiesFile = rootProject.file("key.properties")
    if (keystorePropertiesFile.exists()) {
        keystorePropertiesFile.inputStream().use { keystoreProperties.load(it) }
    }

    // Create a release signing config ONLY if all properties are valid to avoid NPEs during signing
    val storeFilePath = keystoreProperties.getProperty("storeFile")
    val storePasswordProp = keystoreProperties.getProperty("storePassword")
    val keyAliasProp = keystoreProperties.getProperty("keyAlias")
    val keyPasswordProp = keystoreProperties.getProperty("keyPassword")
    val storeFileResolved = if (storeFilePath != null) rootProject.file(storeFilePath) else null
    val hasValidKeystore =
        keystorePropertiesFile.exists() &&
        !storeFilePath.isNullOrBlank() &&
        !storePasswordProp.isNullOrBlank() &&
        !keyAliasProp.isNullOrBlank() &&
        !keyPasswordProp.isNullOrBlank() &&
        (storeFileResolved?.exists() == true)

    if (hasValidKeystore) {
        signingConfigs {
            create("release") {
                storeFile = storeFileResolved
                storePassword = storePasswordProp
                keyAlias = keyAliasProp
                keyPassword = keyPasswordProp
            }
        }
    }

    // Fail fast on release tasks if a valid keystore is not configured
    val isReleaseTaskRequested = gradle.startParameter.taskNames.any { it.contains("Release", ignoreCase = true) }
    if (!hasValidKeystore && isReleaseTaskRequested) {
        throw RuntimeException(
            "Release keystore is not configured or not found. Please create android/key.properties and ensure the keystore file exists."
        )
    }

    buildTypes {
        release {
            // Require the release signing config for release builds
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
