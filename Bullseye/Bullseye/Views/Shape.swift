//
//  Shape.swift
//  Bullseye
//
//  Created by Lê Văn Huy on 12/07/2022.
//

import SwiftUI

struct Shape: View {
    var body: some View {
        VStack{
            Circle()
//                .fill(Color.blue)
                .strokeBorder(Color.blue, lineWidth: 1.0)
                .frame(width: 200, height: 100)
            
        }
        .background(Color.green)
    }
}

struct Shape_Previews: PreviewProvider {
    static var previews: some View {
        Shape()
    }
}
