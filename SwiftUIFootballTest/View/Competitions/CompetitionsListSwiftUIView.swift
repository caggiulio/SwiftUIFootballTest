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
        List(self.competitionsViewModel.competitions.identified(by: \.id)) { competition in
                CompetitionCellSwiftUIView(competition: competition)
            }
        .onAppear() {
                //if we call on onAppear(), every time we open the view, we also update data
                self.competitionsViewModel.getCompetitions()
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
