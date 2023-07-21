
struct Station: Hashable {
    var name: String
}

struct Edge {
    var primary: Station
    var destination: Station
    var duration: Int
}

class GraphMetro {
    /// Массив станциий и рёбер
    var stations: [Station]
    var edges: [Edge]

    init() {
        stations = []
        edges = []
    }

    func addStation(name: String) {
        let station = Station(name: name)
        stations.append(station)
    }

    func addEdge(primary: Station, destination: Station, duration: Int) {
        let edge = Edge(primary: primary, destination: destination, duration: duration)
        edges.append(edge)
    }

    func findPath(from primary: Station, to destination: Station) -> (path: [Station], totalTime: Int)? {
        var stack = [(station: primary, path: [primary], totalTime: 0)]

        while !stack.isEmpty {
            let (currentStation, path, totalTime) = stack.removeLast()

            if currentStation == destination {
                return (path, totalTime)
            }

            let neighbors = getNeighbors(station: currentStation)

            for neighbor in neighbors {
                let newPath = path + [neighbor.destination]
                let newTotalTime = totalTime + neighbor.duration
                stack.append((neighbor.destination, newPath, newTotalTime))
            }
        }
        return nil
    }

    private func getNeighbors(station: Station) -> [Edge] {
        return edges.filter { $0.primary == station }
    }
}

let metro = GraphMetro()

metro.addStation(name: "Станция 1")
metro.addStation(name: "Станция 2")
metro.addStation(name: "Станция 3")
metro.addStation(name: "Станция 4")
metro.addStation(name: "Станция 5")

metro.addEdge(primary: Station(name: "Станция 1"), destination: Station(name: "Станция 2"), duration: 4)
metro.addEdge(primary: Station(name: "Станция 2"), destination: Station(name: "Станция 3"), duration: 5)
metro.addEdge(primary: Station(name: "Станция 3"), destination: Station(name: "Станция 4"), duration: 3)
metro.addEdge(primary: Station(name: "Станция 4"), destination: Station(name: "Станция 5"), duration: 6)


if let (path, totalTime) = metro.findPath(from: Station(name: "Станция 1"), to: Station(name: "Станция 5")) {
    for station in path {
        print(station.name)
    }
    print("Общая длительность поездки: \(totalTime) мин")
}

