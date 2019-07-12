//
//  Session.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/7/3.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import Foundation
import WCDBSwift

public class Session {
    
    var sessionID: String
    
    var name: String
    
    var avatar: String?
    
    var content: String? = nil
    
    /// 是否显示红点
    var showUnreadAsRedDot = false
    
    var muted: Bool = false
    
    public init(sessionID: String, name: String) {
        self.sessionID = sessionID
        self.name = name
    }
}

extension Session {
    
    func attributedStringForTitle() -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15.5),
            .foregroundColor: Colors.black
        ]
        return NSAttributedString(string: name, attributes: attributes)
    }
    
    func attributedStringForSubTitle() -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor(hexString: "9A9B9C")
        ]
        return NSAttributedString(string: content ?? "", attributes: attributes)
    }
    
    func attributedStringForTime() -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 11),
            .foregroundColor: Colors.DEFAULT_TEXT_DISABLED_COLOR
        ]
        return NSAttributedString(string: "12:40", attributes: attributes)
    }
}
