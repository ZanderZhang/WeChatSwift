//
//  ChatRoomCellNodeFactory.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/7/9.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import AsyncDisplayKit

final class ChatRoomCellNodeFactory {
    
    class func node(for message: Message) -> MessageCellNode {
        var contentNode: MessageContentNode
        switch message.content {
        case .text(let txtMsg):
            contentNode = TextContentNode(message: message, text: txtMsg)
        case .image(let imageMsg):
            contentNode = ImageContentNode(message: message, imageMsg: imageMsg)
        case .emoticon(let emoticonMsg):
            contentNode = EmoticonContentNode(message: message, emoticon: emoticonMsg)
        case .voice(let voiceMsg):
            contentNode = VoiceContentNode(message: message, voiceMsg: voiceMsg)
        case .location(let locationMsg):
            contentNode = LocationContentNode(message: message, locationMsg: locationMsg)
        case .link(let appURL):
            contentNode = AppURLContentNode(message: message, appURL: appURL)
        default:
            contentNode = UnknownContentNode(message: message)
        }
        return MessageCellNode(message: message, contentNode: contentNode)
    }
    
}
