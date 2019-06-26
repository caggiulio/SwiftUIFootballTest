//
//  CompetitionCellSwiftUIView.swift
//  SwiftUIFootballTest
//
//  Created by nunzio giulio caggegi on 25/06/2019.
//  Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//

import SwiftUI
import SDWebImage

struct CompetitionCellSwiftUIView : View {
    
    var competition: Competition
    
    var body: some View {
        CompetitionCell(competition: competition)
    }
}

#if DEBUG
struct CompetitionCellSwiftUIView_Previews : PreviewProvider {
    static var previews: some View {
        CompetitionCellSwiftUIView(competition: SharedMock.shared.mockCompetions().first!)
    }
}
#endif

struct CompetitionCell : View {
    
    var competition: Competition
    
    var body: some View {
        
        VStack {
                Text(competition.name)
                .font(FontBook.Regular.of(size: 50))
            
            Spacer()
            if competition.currentSeason != nil {
                Text(competition.currentSeason.startDate + "  " + competition.currentSeason.endDate)
                    .font(FontBook.Regular.of(size: 25))
                
                Spacer()
            }
            
            Text(competition.area.name)
                .font(FontBook.Regular.of(size: 25))
            
            if competition.currentSeason != nil {
                if competition.currentSeason.winner != nil {
                    Spacer()
                    Text(competition.currentSeason.winner.name)
                        .font(FontBook.Regular.of(size: 25))
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: 130, alignment: .center)
    }
}
