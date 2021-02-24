# DarkModeExample
An Example project for implementing Dark Mode in iOS App.

<img src="https://github.com/kamrul-cse/DarkModeExample/blob/main/Screenshots/mode-light.png" width="40%" /> <img src="https://github.com/kamrul-cse/DarkModeExample/blob/main/Screenshots/mode-dark.png" width="40%" >


## Image Appearance
Set your desired image for specific Appearance.
<img src="https://github.com/kamrul-cse/DarkModeExample/blob/main/Screenshots/asset-image.png" width="100%" />

Now access your image using code snippet
```swift
let imageView = UIImageView(image: UIImage(named: "backgroundImage"))
imageView.contentMode = .scaleAspectFill
imageView.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(imageView)
```

## Color Appearance
Set your desired color set for specific Appearance.
<img src="https://github.com/kamrul-cse/DarkModeExample/blob/main/Screenshots/asset-color.png" width="100%" />

Now access your color using code snippet
```swift
let myLabel = UILabel()
myLabel.text = "Greetings!"
myLabel.textColor = UIColor(named: "yellowColor")
myLabel.translatesAutoresizingMaskIntoConstraints = false
myLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
view.addSubview(myLabel)
```

## Listen Appearance Change
```swift
/*! To be overridden as needed to provide custom behavior when the environment's traits change. */
override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    print(#function)
}
```
