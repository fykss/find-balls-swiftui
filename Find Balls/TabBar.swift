//
//  TabBar.swift
//  find-balls
//
//  Created by Vladyslav Lietun on 02.12.2020.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "house")
                    .frame(width: 40, height: 40)

                Spacer()
                
                Image(systemName: "book.closed")
                    .frame(width: 40, height: 40)

                Spacer()
                
                Image(systemName: "person.crop.circle")
                    .frame(width: 40, height: 40)

            }
            .foregroundColor(.gray)
            .padding(.horizontal, 50)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
