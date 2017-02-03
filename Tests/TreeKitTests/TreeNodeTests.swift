@testable import TreeKit

import XCTest

// MARK: - TreeNodeTests: XCTestCase

class TreeNodeTests: XCTestCase {
    func testTreeNodeInit() {
        let stringNode = TreeNode<String>(value: "beverages")

        XCTAssertEqual(stringNode.value, "beverages")
        XCTAssertNil(stringNode.parent)
        XCTAssertEqual(stringNode.children.count, 0)
    }

    func testTreeNodeInitTypes() {
        let stringNode = TreeNode<String>(value: "beverages")
        let intNode = TreeNode<Int>(value: 32)
        let doubleNode = TreeNode<Double>(value: 32.0)

        XCTAssertEqual(stringNode.value, "beverages")
        XCTAssertEqual(intNode.value, 32)
        XCTAssertEqualWithAccuracy(doubleNode.value, 32.0, accuracy: 0.01)
    }

    func testTreeNodeCheckParent() {
        let root = TreeNode<Int>(value: 0)
        let gen1 = TreeNode<Int>(value: 1)
        let gen2 = TreeNode<Int>(value: 2)
        let gen3 = TreeNode<Int>(value: 3)

        root.addChild(gen1)
        gen1.addChild(gen2)
        gen2.addChild(gen3)

        XCTAssertEqual(gen1.parent?.value, root.value)
        XCTAssertEqual(gen2.parent?.value, gen1.value)
        XCTAssertEqual(gen3.parent?.value, gen2.value)
    }

    func testTreeNodeAddChildren() {
        let tree = TreeNode<String>(value: "beverages")
        let hotNode = TreeNode<String>(value: "hot")
        let coldNode = TreeNode<String>(value: "cold")

        tree.addChild(hotNode)
        tree.addChild(coldNode)

        XCTAssertEqual(tree.value, "beverages")
        XCTAssertEqual(tree.children[0].value, "hot")
        XCTAssertEqual(tree.children[1].value, "cold")
    }

    func testTreeNodeSearch() {
        let tree = TreeNode<String>(value: "beverages")
        let hotNode = TreeNode<String>(value: "hot")
        let coldNode = TreeNode<String>(value: "cold")

        tree.addChild(hotNode)
        tree.addChild(coldNode)

        XCTAssertEqual(tree.search("hot")?.value, "hot")
        XCTAssertEqual(tree.search("hothot")?.value, nil)
    }
}
