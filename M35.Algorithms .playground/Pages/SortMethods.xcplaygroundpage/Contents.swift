
/// Быстрая сортировка
func quickSort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }

    let pivot = array[array.count / 2]
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }

    return quickSort(array: less) + equal + quickSort(array: greater)
}

/// Сортировка слиянием
func mergeSort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }

    let middle = array.count / 2
    let leftArray = mergeSort(array: Array(array[..<middle]))
    let rightArray = mergeSort(array: Array(array[middle...]))

    return merge(leftArray: leftArray, rightArray: rightArray)
}

private func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
    var mergedArray: [Int] = []
    var leftIndex = 0
    var rightIndex = 0

    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        mergedArray.append(leftArray[leftIndex] < rightArray[rightIndex] ? leftArray[leftIndex] : rightArray[rightIndex])
        if leftArray[leftIndex] < rightArray[rightIndex] {
            leftIndex += 1
        } else {
            rightIndex += 1
        }
    }

    mergedArray.append(contentsOf: leftArray[leftIndex...])
    mergedArray.append(contentsOf: rightArray[rightIndex...])

    return mergedArray
}

var list = [130, 2, 7, 99, 30, 100, 19, 25, 78, 41]

let quickSorted = quickSort(array: list)
print("Быстрая сортировка: \(quickSorted)")

let mergeSorted = mergeSort(array: list)
print("Сортировка слиянием: \(mergeSorted)")
