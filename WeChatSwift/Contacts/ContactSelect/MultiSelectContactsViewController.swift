//
//  MultiSelectContactsViewController.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/8/7.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import AsyncDisplayKit

class MultiSelectContactsViewController: ASViewController<ASDisplayNode> {
    
    private let tableNode = ASTableNode(style: .grouped)
    
    private var doneButton: UIButton?
    
    private var dataSource: [ContactSection] = []
    
    init(string: String) {
        super.init(node: ASDisplayNode())
        node.addSubnode(tableNode)
        tableNode.dataSource = self
        tableNode.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        node.backgroundColor = Colors.DEFAULT_BACKGROUND_COLOR
        tableNode.frame = view.bounds
        tableNode.backgroundColor = .clear
        navigationItem.title = "选择联系人"
        
        let cancelButton = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancelButtonClicked))
        cancelButton.tintColor = .black
        navigationItem.leftBarButtonItem = cancelButton
        
        let doneButton = wc_doneBarButton(title: "完成")
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: doneButton)
        doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
        self.doneButton = doneButton
    }
    
    private func setupDataSource() {
        
    }
}

// MARK: - Event Handlers
extension MultiSelectContactsViewController {
    
    @objc private func cancelButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func doneButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - ASTableDelegate & ASTableDataSource
extension MultiSelectContactsViewController: ASTableDelegate, ASTableDataSource {
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return dataSource.count
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].models.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let contact = dataSource[indexPath.section].models[indexPath.row]
        let isLastCell = indexPath.row == dataSource[indexPath.section].models.count - 1
        let block: ASCellNodeBlock = {
            return MultiSelectContactsCellNode(contact: contact, isLastCell: isLastCell)
        }
        return block
    }
    
}
