//
//  ViewsAndModifiers.swift
//  HackingWithSwift
//
//  Created by Robert Lorentz on 2020-02-18.
//  Copyright © 2020 Robert Lorentz. All rights reserved.
//

import SwiftUI

struct ViewsAndModifiers: View {
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height

    var body: some View {
        NavigationView {
            ScrollView {
                GridStack(rows: 5, columns: 7) { row, col in
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: self.width/7, height: self.height/5, alignment: .leading)
                        .border(Color.black, width: 1)
                }
            }
        }
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0 ..< rows) { row in
                HStack(alignment: .center, spacing: 0) {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ViewsAndModifiers_Previews: PreviewProvider {
    static var previews: some View {
        ViewsAndModifiers()
    }
}

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
//
//struct Watermark: ViewModifier {
//    var text: String
//
//    func body(content: Content) -> some View {
//        ZStack(alignment: .bottomTrailing) {
//            content
//            Text(text)
//                .font(.caption)
//                .foregroundColor(.white)
//                .padding(5)
//                .background(Color.black)
//        }
//    }
//}
//
//extension View {
//    func watermarked(with text: String) -> some View {
//        self.modifier(Watermark(text: text))
//    }
//}
//
//extension View {
//    func titleStyle() -> some View {
//        self.modifier(Title())
//    }
//}
