//
//  ContentView.swift
//  swift-charts-tests
//
//  Created by tommyhan on 1/12/2022.
//

/// This Project is mainly testing on Apple's Latest UI Framework for SwiftUI.
/// Swift Charts is a new UI framework, which helps to provide a better apporach
/// on creating charts, base on dataModel provided, on SwiftUI
/// This simple sample is based on Apple documentation tutorials, and other online tutorials

import SwiftUI
import Charts

// TODO: Move Different Charts to Separate Views

// For BarMark Use Model
struct ToyType: Identifiable {
    let color: String
    let type: String
    let count: Double
    var id = UUID()
}

// For AreaMark Use Model
struct StockPrice: Identifiable {
    var id = UUID().uuidString
    let name: String
    let price: Double
    let date: Date
    
    init(name: String, price: Double, month: Int, day: Int) {
        self.name = name
        self.price = price
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(month: month, day: day))!
    }
}

// For LineMark Use Model
struct StockEntity: Identifiable {
    var id = UUID().uuidString
    let name: String
    let highestPrice: Double
    let lowestPrice: Double
    let endPrice: Double
    let date: Date
    
    init(name: String, highestPrice: Double, lowestPrice: Double, endPrice: Double, month: Int, day: Int) {
        self.name = name
        self.highestPrice = highestPrice
        self.lowestPrice = lowestPrice
        self.endPrice = endPrice
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(month: month, day: day))!
    }
}

struct ContentView: View {
    @State private var symbol: BasicChartSymbolShape = .square
    
    // MARK: - BarMark Data
    var data: [ToyType] = [
        // The new instance creation method, in delcarative syntax
        .init(color: "Green", type: "Cube", count: 2),
        .init(color: "Green", type: "Sphere", count: 0),
        .init(color: "Green", type: "Pyramid", count: 1),
        .init(color: "Purple", type: "Cube", count: 1),
        .init(color: "Purple", type: "Sphere", count: 1),
        .init(color: "Purple", type: "Pyramid", count: 1),
        .init(color: "Pink", type: "Cube", count: 1),
        .init(color: "Pink", type: "Sphere", count: 2),
        .init(color: "Pink", type: "Pyramid", count: 0),
        .init(color: "Yellow", type: "Cube", count: 1),
        .init(color: "Yellow", type: "Sphere", count: 1),
        .init(color: "Yellow", type: "Pyramid", count: 2)

    ]
    
    // MARK: - AreaMark Data
    var stockData: [StockPrice] = [
        StockPrice(name: "TSMC", price: 519.00, month: 8, day: 19),
        StockPrice(name: "TSMC", price: 510.00, month: 8, day: 22),
        StockPrice(name: "TSMC", price: 504.00, month: 8, day: 23),
        StockPrice(name: "TSMC", price: 503.00, month: 8, day: 24),
        StockPrice(name: "TSMC", price: 508.00, month: 8, day: 25),
        StockPrice(name: "TSMC", price: 512.00, month: 8, day: 26),
        StockPrice(name: "TSMC", price: 498.50, month: 8, day: 29),
        StockPrice(name: "TSMC", price: 496.00, month: 8, day: 30),
        StockPrice(name: "TSMC", price: 505.00, month: 8, day: 31),
        StockPrice(name: "TSMC", price: 490.50, month: 9, day: 1),
        StockPrice(name: "TSMC", price: 485.00, month: 9, day: 2),
        StockPrice(name: "TSMC", price: 486.00, month: 9, day: 5),
        StockPrice(name: "TSMC", price: 489.00, month: 9, day: 6),
        StockPrice(name: "TSMC", price: 472.50, month: 9, day: 7),
        StockPrice(name: "TSMC", price: 475.00, month: 9, day: 8),
        
        StockPrice(name: "AUO", price: 16.95, month: 8, day: 19),
        StockPrice(name: "AUO", price: 16.95, month: 8, day: 22),
        StockPrice(name: "AUO", price: 16.00, month: 8, day: 23),
        StockPrice(name: "AUO", price: 16.15, month: 8, day: 24),
        StockPrice(name: "AUO", price: 16.10, month: 8, day: 25),
        StockPrice(name: "AUO", price: 16.15, month: 8, day: 26),
        StockPrice(name: "AUO", price: 15.75, month: 8, day: 29),
        StockPrice(name: "AUO", price: 16.40, month: 8, day: 30),
        StockPrice(name: "AUO", price: 16.75, month: 8, day: 31),
        StockPrice(name: "AUO", price: 17.10, month: 9, day: 1),
        StockPrice(name: "AUO", price: 16.90, month: 9, day: 2),
        StockPrice(name: "AUO", price: 17.40, month: 9, day: 5),
        StockPrice(name: "AUO", price: 17.50, month: 9, day: 6),
        StockPrice(name: "AUO", price: 17.40, month: 9, day: 7),
        StockPrice(name: "AUO", price: 17.35, month: 9, day: 8),

    ]
    
    // MARK: - LineMark Data
    var lineStockData: [StockEntity] = [
        .init(name: "TSMC", highestPrice: 523.00, lowestPrice: 517.00, endPrice: 519.00, month: 8, day: 19),
        .init(name: "TSMC", highestPrice: 514.00, lowestPrice: 510.00, endPrice: 510.00, month: 8, day: 22),
        .init(name: "TSMC", highestPrice: 506.00, lowestPrice: 502.00, endPrice: 504.00, month: 8, day: 23),
        .init(name: "TSMC", highestPrice: 508.00, lowestPrice: 503.00, endPrice: 503.00, month: 8, day: 24),
        .init(name: "TSMC", highestPrice: 510.00, lowestPrice: 504.00, endPrice: 508.00, month: 8, day: 25),
        .init(name: "TSMC", highestPrice: 515.00, lowestPrice: 511.00, endPrice: 512.00, month: 8, day: 26),
        .init(name: "TSMC", highestPrice: 502.00, lowestPrice: 496.00, endPrice: 498.50, month: 8, day: 29),
        .init(name: "TSMC", highestPrice: 500.00, lowestPrice: 496.00, endPrice: 496.00, month: 8, day: 30),
        .init(name: "TSMC", highestPrice: 505.00, lowestPrice: 492.00, endPrice: 505.00, month: 8, day: 31),
        .init(name: "TSMC", highestPrice: 495.50, lowestPrice: 490.00, endPrice: 490.50, month: 9, day: 1),
        .init(name: "TSMC", highestPrice: 489.50, lowestPrice: 485.00, endPrice: 485.00, month: 9, day: 2),
        .init(name: "TSMC", highestPrice: 488.00, lowestPrice: 484.00, endPrice: 486.00, month: 9, day: 5),
        .init(name: "TSMC", highestPrice: 491.50, lowestPrice: 486.50, endPrice: 489.00, month: 9, day: 6),
        .init(name: "TSMC", highestPrice: 478.00, lowestPrice: 472.00, endPrice: 472.50, month: 9, day: 7),
        .init(name: "TSMC", highestPrice: 475.00, lowestPrice: 472.00, endPrice: 475.00, month: 9, day: 8),
        
        .init(name: "AUO", highestPrice: 17.15, lowestPrice: 15.70, endPrice: 16.95, month: 8, day: 19),
        .init(name: "AUO", highestPrice: 16.95, lowestPrice: 16.60, endPrice: 16.95, month: 8, day: 22),
        .init(name: "AUO", highestPrice: 16.80, lowestPrice: 15.75, endPrice: 16.00, month: 8, day: 23),
        .init(name: "AUO", highestPrice: 16.40, lowestPrice: 16.05, endPrice: 16.15, month: 8, day: 24),
        .init(name: "AUO", highestPrice: 16.30, lowestPrice: 15.95, endPrice: 16.10, month: 8, day: 25),
        .init(name: "AUO", highestPrice: 16.25, lowestPrice: 16.00, endPrice: 16.15, month: 8, day: 26),
        .init(name: "AUO", highestPrice: 16.05, lowestPrice: 15.40, endPrice: 15.75, month: 8, day: 29),
        .init(name: "AUO", highestPrice: 16.70, lowestPrice: 16.15, endPrice: 16.40, month: 8, day: 30),
        .init(name: "AUO", highestPrice: 16.75, lowestPrice: 16.15, endPrice: 16.75, month: 8, day: 31),
        .init(name: "AUO", highestPrice: 17.25, lowestPrice: 16.45, endPrice: 17.10, month: 9, day: 1),
        .init(name: "AUO", highestPrice: 17.35, lowestPrice: 16.70, endPrice: 16.90, month: 9, day: 2),
        .init(name: "AUO", highestPrice: 17.45, lowestPrice: 16.80, endPrice: 17.40, month: 9, day: 5),
        .init(name: "AUO", highestPrice: 17.70, lowestPrice: 17.25, endPrice: 17.50, month: 9, day: 6),
        .init(name: "AUO", highestPrice: 17.60, lowestPrice: 17.10, endPrice: 17.40, month: 9, day: 7),
        .init(name: "AUO", highestPrice: 17.60, lowestPrice: 17.30, endPrice: 17.35, month: 9, day: 8)
    ]
    
    // MARK: - Main View Location
    var body: some View {
        ScrollView {
            VStack {
                // BarMark Implementation
                Chart {
                    ForEach(data) { shape in
                        BarMark(
                            x: .value("Shape Type", shape.type),
                            y: .value("Total Count", shape.count)
                        )
                        .cornerRadius(10)
                        .foregroundStyle(by: .value("Shape Color", shape.color))
                        .opacity(0.5)
                        .symbol(.asterisk)
                    }
                }
                .frame(height: 300)
                .padding()
                .chartForegroundStyleScale([
                    "Green": .green, "Purple": .purple, "Pink": .pink, "Yellow": .yellow
                ])
                
                // AreaMark Implementation
                Chart {
                    ForEach(stockData) { datum in
                        AreaMark(
                            x: .value("Date", datum.date),
                            y: .value("End Price", datum.price)
                        )
                        .foregroundStyle(by: .value("Stock Name", datum.name))
                    }
                }
                .frame(height: 300)
                .padding()
                
                // LineMark Implementation
                Chart {
                    ForEach(lineStockData) { data in
                        LineMark(
                            x: .value("Date", data.date),
                            y: .value("End Price", data.endPrice)
                        )
                        .foregroundStyle(by: .value("Stock Name", data.name))
                        .symbol(symbol)
                        .symbolSize(100)
                    }
                }
                .frame(height: 300)
                .padding()
                
                // Trigger Symbol Menu
                Menu {
                    MenuSymbolButton(symbol: $symbol, symbolName: "Square", symbolImageName: "square")
                    MenuSymbolButton(symbol: $symbol, symbolName: "Circle", symbolImageName: "circle")
                    MenuSymbolButton(symbol: $symbol, symbolName: "Triangle", symbolImageName: "triangle")
                    MenuSymbolButton(symbol: $symbol, symbolName: "Diamond", symbolImageName: "diamond")
                    MenuSymbolButton(symbol: $symbol, symbolName: "Pentagon", symbolImageName: "pentagon")
                    MenuSymbolButton(symbol: $symbol, symbolName: "Plus", symbolImageName: "plus")
                    MenuSymbolButton(symbol: $symbol, symbolName: "Cross", symbolImageName: "cross")
                    MenuSymbolButton(symbol: $symbol, symbolName: "Asterisk", symbolImageName: "asterisk")
                } label: {
                    Text("Choose Label")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MenuSymbolButton: View {
    @Binding var symbol: BasicChartSymbolShape
    
    var symbolName: String
    var symbolImageName: String
    
    var body: some View {
        Button {
            symbol = {
                switch symbolImageName {
                case "square": return .square
                case "circle": return .circle
                case "triangle": return .triangle
                case "diamond": return .diamond
                case "pentagon": return .pentagon
                case "plus": return .plus
                case "cross": return .cross
                case "asterisk": return .asterisk
                default: return .square
                }
            }()
        } label: {
            Label(symbolName, systemImage: symbolImageName)
        }
    }
}
