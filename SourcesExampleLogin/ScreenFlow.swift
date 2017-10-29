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
        
        // data
        let alreadyLoggedIn = InformOnSetBool(BoolMemory(false))
        
        // object composition
        super.init(origin:
            ScreenColored(color: ColorWhite, content:
                ScreenOR(
                    condition: alreadyLoggedIn,
                    isTrue: { _ in
                        ScreenWelcome(logoutAction: DoWritableBoolSet(false, to: alreadyLoggedIn))
                    },
                    isFalse: { _ in
                        ScreenLogin(successAction: DoWritableBoolSet(true, to: alreadyLoggedIn))
                    }
                )
            )
        )
    }
    
}
