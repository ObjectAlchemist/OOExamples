//
//  ViewBorderedButton.swift
//  OOExamples
//
//  Created by Karsten Litsche on 23.10.17.
//  
//

import OOBase
import OOUIKit

public final class ViewBorderedButton: OOViewWrap {
    
    public convenience init(title: String, action: OOExecutable) {
        self.init(title: StringConst(title), action: action)
    }
    
    public init(title: OOString, action: OOExecutable) {
        super.init(origin:
            ViewColored(color: ColorDefault(.black), content:
                ViewBordered(top: 1, bottom: 1, left: 1, right: 1, content:
                    ViewColored(color: ColorDefault(.green), content:
                        ViewBordered(top: 5, bottom: 5, left: 5, right: 5, content:
                            ViewTextButton(title: title, color: ColorDefault(.black), action: action)
                        )
                    )
                )
            )
        )
    }
    
}
