//
//  TestCollectionViewCell.swift
//  TestProject
//
//  Created by Krishna C Aluru on 11/29/17.
//  Copyright © 2017 Krishna C Aluru. All rights reserved.
//

import Foundation
import Reusable
import SnapKit

final class TestCollectionViewCell: UICollectionViewCell, Reusable {
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    // MARK: Init methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .gray
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 4
        addSubviews()
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Instance methods
    
    func configure(with name: String) {
        nameLabel.text = name
    }
    
    fileprivate func addSubviews() {
        contentView.addSubview(nameLabel)
    }
    
    fileprivate func addConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
        }
    }
}

