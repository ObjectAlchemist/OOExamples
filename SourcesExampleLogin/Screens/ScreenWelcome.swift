//
//  ScreenWelcome.swift
//  OOExamples
//
//  Created by Karsten Litsche on 21.10.17.
//  
//

import OOBase
import OOUIKit

public final class ScreenWelcome: OOScreenWrap {
    
    public init(logoutAction: OOExecutable) {
        super.init(origin:
            ScreenSimple(content:
                ViewCentered(width: 260, height: 120, content:
                    ViewStackVertical(content: [
                        (height: 50, view:
                            ViewLabel(title: "Willkommen!", color: ColorDefault(.black), font: FontSystem(size: 24), textAlignment: .center)
                        ),
                        (height: VerticalStretched, view: ViewSpace()),
                        (height: 50, view:
                            ViewColored(color: ColorDefault(.red), content:
                                ViewTextButton(title: "Logout", color: ColorDefault(.white), font: FontSystem(size: 24), action: logoutAction)
                            )
                        )
                    ])
                )
            )
        )
    }
    
}
