//
//  CustomFont.swift
//  Properly
//
//  Created by Avish Manocha on 12/02/20.
//  Copyright © 2020 Properly. All rights reserved.
//

import UIKit
import CoreText

public class CustomFonts: NSObject {
    
    public enum Style: CaseIterable {
        case bold
        case medium
        case regular
        case semibold
        public var value: String {
            switch self {
            case .bold: return "Metropolis-Bold"
            case .medium: return "Metropolis-Medium"
            case .regular: return "Metropolis-Regular"
            case .semibold: return "Metropolis-SemiBold"
            }
        }
        public var font: UIFont {
            return UIFont(name: self.value, size: 14) ?? UIFont.init()
        }
    }
    
    // Lazy var instead of method so it's only ever called once per app session.
    
    public static var loadFonts: () -> Void = {
        let fontNames = Style.allCases.map { $0.value }
        for fontName in fontNames {
            loadFont(withName: fontName)
        }
        
        
        return {}
    }()
    
    private static func loadFont(withName fontName: String) {
       
        
//       let urll = Bundle(for: CustomFonts.self).resourceURL?.appendingPathComponent("Garden.bundle")
//        print(urll!)
//        let bundle = Bundle(url: urll!)
//        print(bundle)
//        let fontUrl = bundle?.url(forResource: fontName, withExtension: "otf")
//        print(fontUrl)
        guard
           
            let fontURL = Bundle(for: CustomFonts.self).url(forResource: "\(fontName)", withExtension: "otf"),
            let fontData = try? Data(contentsOf: fontURL) as CFData,
            let provider = CGDataProvider(data: fontData),
            let font = CGFont(provider) else {
                return
        }
        CTFontManagerRegisterGraphicsFont(font, nil)
    }
    
}

