//
//  TreeNode.swift
//  TreeKit
//
//  Created by Jarrod Parkes on 2/2/17.
//  Copyright © 2017 Parkes Twins. All rights reserved.
//

// MARK: - TreeNode

public class TreeNode<T> {

    // MARK: Properties

    public var value: T
    public weak var parent: TreeNode?
    public var children = [TreeNode<T>]()
    public var maxChildren: Int? = nil

    // MARK: Initializers

    public init(value: T) {
        self.value = value
    }

    public init(value: T, maxChildren: Int) {
        self.value = value
        self.maxChildren = maxChildren
    }

    // MARK: Add Child

    public func addChild(_ node: TreeNode<T>) {
        if let maxChildren = maxChildren {
            if children.count < maxChildren {
                _addChild(node)
            }
        } else {
            _addChild(node)
        }
    }

    private func _addChild(_ node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
}

// MARK: - TreeNode: CustomStringConvertible

extension TreeNode: CustomStringConvertible {
    public var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        return s
    }
}

// MARK: - TreeNode (Search)

extension TreeNode where T: Equatable {
    public func search(_ value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}
