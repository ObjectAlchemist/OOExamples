//
//  Application.swift
//  OOExamples
//
//  Created by Karsten Litsche on 21.10.17.
//
//

import OOBase
import OOUIKit

@UIApplicationMain
final class Application: UIApplicationDelegateWrap {

    init() {
        // global data
        let alreadyLoggedIn = InformOnSetBool(BoolMemory(false))
        // create flow
        super.init(origin:
            UIApplicationDelegateInitialize(screenFlow:
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
        )
    }
    
}
