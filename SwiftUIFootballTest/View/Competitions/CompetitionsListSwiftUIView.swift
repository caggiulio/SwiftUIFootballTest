//
//  CompetitionsListSwiftUIView.swift
//  SwiftUIFootballTest
//
//  Created by nunzio giulio caggegi on 25/06/2019.
//  Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//

import SwiftUI
import PromiseKit

struct CompetitionsListSwiftUIView : View {
    
    @EnvironmentObject var competitionsViewModel: CompetitionsViewModel
    
    var competitions: [Competition]
    
    var body: some View {
        //to view preview use competitions and not competitionsViewModel
        
        VStack {
            Toggle(isOn: self.$competitionsViewModel.changeList) {
                Text("Show only with Teams")
            }
            .padding()
            
            if self.competitionsViewModel.changeList {
                ListCompetions(competitions: self.competitionsViewModel.competitionsWithTeams)
                    .onAppear() {
                        //if we call on onAppear(), every time we open the view, we also update data
                        if self.competitionsViewModel.competitionsWithTeams.count == 0 {
                            self.competitionsViewModel.getCompetitions()
                        }
                }
            } else {
                ListCompetions(competitions: self.competitionsViewModel.competitions)
                    .onAppear() {
                        //if we call on onAppear(), every time we open the view, we also update data
                        if self.competitionsViewModel.competitions.count == 0 {
                            self.competitionsViewModel.getCompetitions()
                        }
                }
            }
        }
    }
}

#if DEBUG
struct CompetitionsListSwiftUIView_Previews : PreviewProvider {
    static var previews: some View {
        CompetitionsListSwiftUIView(competitions: SharedMock.shared.mockCompetions()).environmentObject(CompetitionsViewModel())
    }
}
#endif

struct ListCompetions : View {
    
    var competitions: [Competition]
    
    var body: some View {
        List(competitions.identified(by: \.name)) { competition in
            CompetitionCellSwiftUIView(competition: competition)
        }
    }
}
