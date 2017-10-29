//
//  ScreenFlow.swift
//  OOExamples
//
//  Created by Karsten Litsche on 21.10.17.
//  
//

import OOBase
import OOUIKit

public final class ScreenFlow: OOScreenWrap {
    
    public init() {
        
        let label = ViewLabel(title: "Label", textAlignment: .center)
        let buttonUpdate = ViewBorderedButton(title: "Update UI", action: DoUpdateView(label))
        let buttonLogin = ViewBorderedButton(title: "Logout", action: DoNothing())
        
        // object composition
        super.init(origin:
            ScreenColored(color: ColorWhite, content:
                ScreenSimple(content:
                    ViewVerticalCentered(width: 260, content:
                        ViewStackVertical(content: [
                            (height: 50, view: ViewSpace()),
                            (height: 50, view: label),
                            (height: 10, view: ViewSpace()),
                            (height: 50, view: buttonUpdate),
                            (height: 10, view: ViewSpace()),
                            (height: 50, view: buttonLogin),
                            (height: VerticalStretched, view: ViewSpace())
                        ])
                    )
                )
            )
        )
    }
    
}
