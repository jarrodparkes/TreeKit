# TreeKit

<img src="https://img.shields.io/badge/os-mac | linux-blue.svg?style=flat" alt="Mac and Linux" />
<a href="https://raw.githubusercontent.com/jarrodparkes/DominoKit/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift3-compatible-orange.svg?style=flat" alt="Swift 3 Compatible" /></a>

## Summary

TreeKit is a Swift library for representing a simple tree structure.

## Installation

Using the Swift Package Manager, ensure TreeKit is included in the dependencies section of `Package.swift`:

```swift
let package = Package(
    name: "MyProject",
    dependencies: [
        .Package(url: "https://github.com/jarrodparkes/TreeKit.git", majorVersion: 1),
        ...
    ]
    ...
)
```

## Usage

```swift
import TreeKit

let tree = TreeNode<String>(value: "beverages")
let hotNode = TreeNode<String>(value: "hot")
let coldNode = TreeNode<String>(value: "cold")

tree.addChild(hotNode)
tree.addChild(coldNode)

print(tree) // prints "beverages {hot, cold}"
print(tree.children.count) // prints 2
print(hotNode.parent?.value) // prints "beverages"
```
