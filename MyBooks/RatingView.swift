//
//  RatingView.swift
//  MyBooks
//
//  Created by Rafiul Hasan on 10/31/24.
//

import SwiftUI

struct RatingView: View {
    
    //MARK: Local Properties
    var maxRating: Int
    @Binding var currentRating: Int?
    var width:Int
    var color: UIColor
    var sfSymbol: String
    /*
    public init(maxRating: Int, currentRating: Binding<Int?>, width: Int, color: UIColor, sfSymbol: String) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.color = color
        self.sfSymbol = sfSymbol
    }
    */
    
    //MARK: Body
    var body: some View {
        HStack {
            Image(systemName: sfSymbol)
                .resizable()
                .scaledToFit()
                .symbolVariant(.slash)
                .foregroundStyle(Color(color))
                .onTapGesture {
                    withAnimation{
                        currentRating = nil
                    }
                }
                .opacity(currentRating == 0 ? 0 : 1)
            
            ForEach(1...maxRating, id: \.self) { rating in
                Image(systemName: sfSymbol)
                    .resizable()
                    .scaledToFit()
                    .fillImage(correctImage(for: rating))
                    .foregroundStyle(Color(color))
                    .onTapGesture {
                        withAnimation{
                            currentRating = rating + 1
                        }
                    }
            }
        }
        .frame(width: CGFloat(maxRating * width))
    }
    
    func correctImage(for rating: Int) -> Bool {
        if let currentRating, rating < currentRating {
            return true
        } else {
            return false
        }
    }
}

struct FillImage: ViewModifier {
    let fill: Bool
    func body(content: Content) -> some View {
        if fill {
            content
                .symbolVariant(.fill)
        } else {
            content
        }
    }
}

extension View {
    func fillImage(_ fill: Bool) -> some View {
        modifier(FillImage(fill: fill))
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var currentRating: Int? = 3
        
        var body: some View {
            RatingView(
                maxRating: 5,
                currentRating: $currentRating,
                width: 30,
                color: .orange,
                sfSymbol: "star"
            )
        }
    }
    return PreviewWrapper()
}
