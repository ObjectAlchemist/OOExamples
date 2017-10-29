//
//  ViewBorderedArea.swift
//  OOExamples
//
//  Created by Karsten Litsche on 22.10.17.
//  
//

import OOUIKit

// Wrap the content into a white container with a 1pt black line border and 5pt insets.
public final class ViewBorderedArea: OOViewWrap {
    
    public init(content: OOView) {
        super.init(origin:
            ViewColored(color: ColorBlack, content:
                ViewBordered(top: 1, bottom: 1, left: 1, right: 1, content:
                    ViewColored(color: ColorWhite, content:
                        ViewBordered(top: 5, bottom: 5, left: 5, right: 5, content:
                            content
                        )
                    )
                )
            )
        )
    }
    
}
