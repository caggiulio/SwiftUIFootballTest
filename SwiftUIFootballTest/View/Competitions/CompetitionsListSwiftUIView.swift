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
    
    var competition: [Competition]
    
    var body: some View {
        List(competitionsViewModel.competitions.identified(by: \.id)) { competition in
            CompetitionCellSwiftUIView(competition: competition)
            }.onAppear() {
                self.competitionsViewModel.getCompetitions()
        }
    }
}

#if DEBUG
struct CompetitionsListSwiftUIView_Previews : PreviewProvider {
    static var previews: some View {
        CompetitionsListSwiftUIView(competition: SharedMock.shared.mockCompetions())
    }
}
#endif
