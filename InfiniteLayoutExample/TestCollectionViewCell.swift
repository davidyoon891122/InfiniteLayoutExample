//
//  TestCollectionViewCell.swift
//  InfiniteLayoutExample
//
//  Created by iMac on 2022/07/04.
//

import Foundation
import SnapKit
import UIKit

final class TestCollectionViewCell: UICollectionViewCell {
    static let identifier = "TestCollectionViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .red
        return label
    }()

    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16.0)
        return label
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 12.0, weight: .light)
        return label
    }()

    func setupCell(news: NewsModel) {
        setupViews()
        titleLabel.text = news.title
        contentLabel.text = news.content
        dateLabel.text = news.date
    }
}

private extension TestCollectionViewCell {
    func setupViews() {
        backgroundColor = .lightGray
        layer.cornerRadius = 10
        layer.masksToBounds = true
        [
            titleLabel,
            contentLabel,
            dateLabel
        ]
            .forEach {
                contentView.addSubview($0)
            }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16.0)
            $0.leading.equalToSuperview().offset(16.0)
            $0.height.equalTo(16.0)
        }

        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-16.0)
            $0.height.equalTo(40.0)
        }

        dateLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(4.0)
            $0.leading.equalTo(contentLabel)
            $0.bottom.equalToSuperview().offset(-4.0)
        }
    }
}
