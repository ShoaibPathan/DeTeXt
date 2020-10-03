//
//  RowView.swift
//  iOS
//
//  Created by Venkat on 1/10/20.
//

import SwiftUI

struct RowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let symbol: Symbol
    var confidence: Double?
    
    var body: some View {
        Group {
            if let conf = confidence {
                HStack {
                    ZStack {
                        Image("\(symbol.css_class)", label: Text(symbol.command))
                            .font(.largeTitle)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:40, alignment: .center)
                            .foregroundColor((colorScheme == .light ? Color.black : Color.white))
                    }
                    .frame(width:40, height:40, alignment: .leading)
                    Divider()
                    SymbolDetailsView(symbol: symbol)
                    Spacer()
                    Text(String(format: "%.1f", conf) + "%")
                        .font(.system(.callout, design: .rounded))
                }
            }
            else {
                HStack {
                    SymbolDetailsView(symbol: symbol)
                    Spacer()
                    ZStack {
                        Image("\(symbol.css_class)", label: Text(symbol.command))
                            .font(.largeTitle)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:40, alignment: .center)
                            .foregroundColor((colorScheme == .light ? Color.black : Color.white))
                    }
                    .frame(width:40, height:40, alignment: .trailing)
                    
                }
            }
        }
        .contextMenu(/*@START_MENU_TOKEN@*/ContextMenu(menuItems: {
            Button(action: {
                let pasteboard = UIPasteboard.general
                pasteboard.string = symbol.command
            }){
                HStack {
                    Text("Copy command")
                    Image(systemName: "doc.on.doc.fill")
                }
            }
        })/*@END_MENU_TOKEN@*/)
    }
}

struct SymbolDetailsView: View {
    let symbol: Symbol
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(symbol.command)")
                .font(.system(.headline, design: .monospaced))
                .padding(.bottom, 4)
                .padding(.top, 4)
            if symbol.mathmode {
                Text(" mathmode")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
            }
            else if symbol.textmode {
                Text(" textmode")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
            }
            else {}

            if let package = symbol.package {
                Text("\\usepackage{\(package)}")
                    .font(.system(.footnote, design: .monospaced))
                    .foregroundColor(Color.gray)
            }
            
            
            if let fontenc = symbol.fontenc {
                Text("fontenc: \(fontenc)")
                    .font(.system(.footnote, design: .monospaced))
                    .foregroundColor(Color.gray)
            }
            
        }
    }
}
