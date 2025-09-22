//
//  LiquidGlass.swift
//  SwiftDataMedium
//
//  Created by Robert Goedman on 9/20/25.
//

import SwiftUI

struct LiquidGlass {
  @Binding var isLiquidGlassVisible: Bool
  @Environment(\.accessibilityReduceTransparency) var reduceTransparency
  @State private var expanded = false
}

extension LiquidGlass: View {
    var body: some View {
      VStack {
        Spacer()
        if expanded {
          RoundedRectangle(cornerRadius: 30)
                .glassEffect(reduceTransparency ? .regular : .clear)
                .frame(width: 200, height: 200)
                .background(
                    Image("ncg")
                        .resizable()
                )
        } else {
            Circle()
                .glassEffect(reduceTransparency ? .clear : .regular)
                .frame(width: 200, height: 200)
                .background(
                    Image("cntr")
                        .resizable()
                )
        }
//        ZStack {
//            Image("ncg")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .edgesIgnoringSafeArea(.all)
//
//            Text("Hello, World!")
//        }

        Spacer()
        HStack {
          Spacer()
          Button("Toggle") {
            withAnimation(.spring()) { expanded.toggle() }
          }
          Spacer()
          Button("Dismiss") {
            isLiquidGlassVisible = false
          }
          Spacer()
        }
      }
    }
}

#Preview {
  LiquidGlass(isLiquidGlassVisible: .constant(true))
}
