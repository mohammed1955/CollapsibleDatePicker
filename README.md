# CollapsibleDatePicker
![](https://img.shields.io/badge/Swift-5.2-blue.svg?style=flat)
[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/mohammed1955/CollapsibleDatePicker/blob/master/license)

![Demo](https://github.com/mohammed1955/CollapsibleDatePicker/blob/master/CollapsiblePickerView.png)
## Features

1) `You can use it with storyboard and Programmatically`
2) `Easy to customize and interact `


## Requirements

- iOS 11.0+
- Xcode 9+

### Swift Package Manager

CollapsibleDatePicker is available through Swift Package Manager. To install
it, simply go to Xcode under `File > Swift Packages > Add Package Dependency...`

### Manually

If you prefer not to use SPM, you can integrate CollapsibleDatePicker into your project manually.

## Usage

### Storyboard
You can use CollapsibleDatePicker from storyboard easily By changing the type of a regular UIView into CollapsibleDatePickerView and set its Moudle to be CollapsibleDatePicker.

###  Programmatically
```swift
let collapseView = CollapsibleDatePickerView()
collapseView.dateType = .dateAndTime
collapseView.doneButtonBackgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)

// get the selected date like this:
collapseView.selectedDate = {(date) in
    print(date)
}

// CollapsibleDatePickerView by default is invisible so you can show it like this(considering you have already set an action for a button):

@IBAction func showCollapsibleDatePickerView(_ sender: UIButton) {
    collapseView.show()
}
```

## Author

Mohammed Reza Ghate

- https://github.com/mohammed1955
- https://www.linkedin.com/in/mohamadrezaghate/
- mohammed.r.ghate@gmail.com

## License

CollapsibleDatePicker is available under the MIT license. See the LICENSE file for more info.
