
/// Узел бинарного дерева поиска
class TreeNode {
    var value: String
    /// Левый и правый дочерние узлы
    var left: TreeNode?
    var right: TreeNode?

    init(value: String) {
        self.value = value
    }
}

/// Бинарное дерево поиска строк
class SearchBinaryTree {
    var root: TreeNode?

    func insert(value: String) {
        let newNode = TreeNode(value: value)

        if root == nil {
            root = newNode
        } else {
            insertNode(node: root, newNode: newNode)
        }
    }

    private func insertNode(node: TreeNode?, newNode: TreeNode) {
        guard let node = node else { return }

        if newNode.value < node.value {
            if node.left == nil {
                node.left = newNode
            } else {
                insertNode(node: node.left, newNode: newNode)
            }
        } else {
            if node.right == nil {
                node.right = newNode
            } else {
                insertNode(node: node.right, newNode: newNode)
            }
        }
    }

    func search(value: String) -> Bool {
        return searchNode(node: root, value: value)
    }

    private func searchNode(node: TreeNode?, value: String) -> Bool {
        guard let node = node else { return false }

        if node.value == value {
            return true
        } else if value < node.value {
            return searchNode(node: node.left, value: value)
        } else {
            return searchNode(node: node.right, value: value)
        }
    }
}

let tree = SearchBinaryTree()

tree.insert(value: "Skillbox")
tree.insert(value: "IT")

let isFound = tree.search(value: "Skillbox")
print(isFound)

let isNotFound = tree.search(value: "iT")
print(isNotFound)
