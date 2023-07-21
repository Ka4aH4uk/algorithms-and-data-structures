
/// Узел
class Node {
    var value: String
    var next: Node?

    init(value: String) {
        self.value = value
    }
}

/// Связанный список
class LinkedList {
    /// Первый и последний узлы
    var head: Node?
    var tail: Node?

    func addString(value: String) {
        let newNode = Node(value: value)

        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }

    func searchString(value: String) -> Bool {
        var current = head

        while current != nil {
            if current?.value == value {
                return true
            }
            current = current?.next
        }
        return false
    }
}

let list = LinkedList()

list.addString(value: "Skillbox")
list.addString(value: "IT")

let isFound = list.searchString(value: "Skillbox")
print(isFound)

let isNotFound = list.searchString(value: "iT")
print(isNotFound)
