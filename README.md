# Bloom

[![Build Status](https://www.bitrise.io/app/dc82ca461a4db774/status.svg?token=wqNkKz787M3_5C-54cMLvQ)](https://www.bitrise.io/app/dc82ca461a4db774)
[![GitHub release](https://img.shields.io/github/release/dbart01/Bloom.svg?style=flat)](https://github.com/dbart01/Bloom/releases/latest)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/dbart01/Bloom/blob/master/LICENSE)

An elegant and intuitive colorizer for command-line applications, written in Swift.

```swift
print("▸ Building sample application...".blinking.bold.blueText)
print("▸ Compiling ".yellowText + "main.swift")
print("▸ Linking...".greenText)
print("▸ " + "Something went wrong.".redBackground.underlined + " Unable to link dependencies.")
print("▸ Aborting build.".dimmed)
print("▸ " + "Build failed.".bold.inverted) 
```
![bloom](https://user-images.githubusercontent.com/5244861/30249922-e43339bc-9613-11e7-8f1f-e994d209533a.gif)

## Installation

Command-line application cannot link against dynamic frameworks. Instead, Bloom is compiled as a static Swift framework, which bypasses the need for "Copy Frameworks" build phase and let's you use a framework dependency in your command-line app. Bloom supports both Carthage and submodules, feel free to use which ever one you're most comfortable with.

## Colorizing output

Bloom let's you specify attributes for command-line output using [ANSI escape codes](https://en.wikipedia.org/wiki/ANSI_escape_code) by wrapping strings in a kind of "attributed string", called `Fragment`. Each fragment has `attributes` that specify how it should be rendered in the console, akin to how `NSAttributedString` has attributes dictating how it should be rendered on-screen.

You can create a fragment without any attributes:

```swift
let fragment = Fragment("Some output")
```

This isn't particularly useful, though, since we can achieve the same effect with a regular `String`. So let's add some attributes:

```swift
fragment.bold
fragment.blueText
```

Using mutating builder properties we can change various attributes of this `Fragment`. These properties actually return the `Fragment` instance instead of the attributes themselves, which makes chaining possible:

```swift
let result = fragment.bold.blueText

print(result === fragment) // true
```

This pattern might seem strange at first, but fragments support composition and that's where this approach really shines. The `Fragment` type overrides the addition operator, making it possible to compose fragments just like `String` objects:

```swift
let fragment = Fragment("The operation ") + Fragment("failed").underlined.redText
```

In addition to overloading the addition operator, `Fragment` also comforms to `CustomStringConvertible`, `CustomDebugStringConvertible` and `ExpressibleByStringLiteral`. This allows us to simplify fragment composition even more. The above can be even more concise:

```swift
let fragment = "The operation " + "failed".underlined.redText
```

There are a few tricks that make this work. First, `String` has extensions that mirror all attribute mutations that `Fragment` provides. For example:

```swift
extension String {
    ...
    
    public var redText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.red
        return Fragment(self, attributeCollection: attributes)
    }
    
    ...
}
```

Since `"failed".underlined.redText` returns a `Fragment` and `Fragment` conform to `ExpressibleByStringLiteral`, `"The operation "` is infered to also return `Fragment`, which translates into fragment composition.

Conveniently, `Fragment` conforms to `CustomStringConvertible` allowing raw fragments to be passed directly to print commands:

```swift
print(fragment)
```

This is equivalent to:

```swift
print(fragment.description)
```