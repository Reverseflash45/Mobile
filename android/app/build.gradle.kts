buildTypes {

    release {

        signingConfig = signingConfigs.getByName("debug")

        isMinifyEnabled = true
        isShrinkResources = true

    }

}