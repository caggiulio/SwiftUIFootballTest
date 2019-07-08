//
//  ContentView.swift
//  SwiftUIFootballTest
//
//  Created by nunzio giulio caggegi on 24/06/2019.
//  Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//

import SwiftUI
import PromiseKit
import SwiftyJSON
import Combine

struct HomeListView : View {
    var list: HomeList
    var competitionsViewModel = CompetitionsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Image("stadium")
                Text("Football App")
                    .font(FontBook.Regular.of(size: 70))
                
                NavigationLink(destination: CompetitionsListSwiftUIView(competitions: self.competitionsViewModel.competitions).environmentObject(competitionsViewModel)) {
                    HomeCellSwiftUIView(cell: list.list[0])
                }
                NavigationLink(destination: EmptyView()) {
                    HomeCellSwiftUIView(cell: list.list[1])
                }
                NavigationLink(destination: EmptyView()) {
                    HomeCellSwiftUIView(cell: list.list[2])
                }
            }.padding(.bottom, 120)
        }
    }
}

#if DEBUG
struct HomeListView_Previews : PreviewProvider {
    static var previews: some View {
        HomeListView(list: SharedMock.shared.mockHomeList())
    }
}
#endif
