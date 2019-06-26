//
//  HomeCellSwiftUIView.swift
//  SwiftUIFootballTest
//
//  Created by nunzio giulio caggegi on 24/06/2019.
//  Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//

import SwiftUI

struct HomeCellSwiftUIView : View {
    var cell: HomeCell
    
    var body: some View {
        VStack {
            
            MainCellView(cell: self.cell)
            
            Divider()
            .frame(width: UIScreen.main.bounds.width * 0.9, height: 5, alignment: .center)
        }
    }
}

#if DEBUG
struct HomeCellSwiftUIView_Previews : PreviewProvider {
    static var previews: some View {
        HomeCellSwiftUIView(cell: SharedMock.shared.mockHomeCell())
    }
}
#endif

struct MainCellView : View {
    
    var cell: HomeCell
    
    var body: some View {
        
        VStack {
            HStack {
                Text(cell.title)
                    .font(FontBook.Regular.of(size: 50))
                    .padding(.all, 50)
                Spacer()
                Image(cell.iconString)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 70, height: 70, alignment: .center)
                    .padding()
                }.frame(width: UIScreen.main.bounds.width * 0.9, height: 80, alignment: .center)
                 .foregroundColor(.black)
            }
        }
    }
