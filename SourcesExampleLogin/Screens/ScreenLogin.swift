//
//  ScreenLogin.swift
//  OOExamples
//
//  Created by Karsten Litsche on 21.10.17.
//  
//

import OOBase
import OOUIKit

public final class ScreenLogin: OOScreenWrap {
    
    public init(successAction: OOExecutable) {
        
        // data
        let loginString = InformOnSetString(StringMemory(""))
        let passwordString = InformOnSetString(StringMemory(""))
        let currentReponderIndex = InformOnSetInt(IntMemory(-1))

        // textfields (index 0 & 1)
        let loginTextField = ViewTextField(value: loginString, placeholder: "Login", isLast: false, delegate:
            TextFieldDelegateSimple(
                shouldReturn: { _ in BoolDoWhenGetValue(true, action: DoWritableIntSet(1, to: currentReponderIndex)) }
            )
        )
        let passwordTextField = ViewSecureTextField(value: passwordString, placeholder: "Password", isLast: true, delegate:
            TextFieldDelegateSimple(
                shouldReturn: { _ in BoolDoWhenGetValue(true, action: DoWritableIntSet(2, to: currentReponderIndex)) }
            )
        )
        
        // object composition
        super.init(origin:
            ScreenKeyboardResize(content:
                ScreenSimple(content:
                    ViewCoordinatingResponder(index: currentReponderIndex, responder: [loginTextField, passwordTextField], content:
                        ViewVerticalCentered(width: 260, content:
                            ViewStackVertical(content: [
                                (height: VerticalStretched, view: ViewSpace()),
                                (height: 50, view: ViewBorderedArea(content: loginTextField)),
                                (height: 10, view: ViewSpace()),
                                (height: 50, view: ViewBorderedArea(content: passwordTextField)),
                                (height: 10, view: ViewSpace()),
                                (height: 50, view:
                                    ViewOR(
                                        condition: !IsEmptyString(loginString) && !IsEmptyString(passwordString),
                                        conditionChangeListener: loginString && passwordString,
                                        isTrue: {
                                            ViewColored(color: ColorDefault(.green), content:
                                                ViewTextButton(title: "Login", color: ColorDefault(.white), font: FontSystem(size: 24), action: successAction)
                                            )
                                        },
                                        isFalse: {
                                            ViewColored(color: ColorDefault(.gray), content:
                                                ViewLabel(title: "Login", color: ColorDefault(.white), font: FontSystem(size: 24), textAlignment: .center)
                                            )
                                        }
                                    )
                                ),
                                (height: 10, view: ViewSpace())
                            ])
                        )
                    )
                )
            )
        )
    }
    
}
