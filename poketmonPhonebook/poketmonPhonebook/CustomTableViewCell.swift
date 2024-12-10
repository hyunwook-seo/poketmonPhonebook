//
//  CustomTableViewCell.swift
//  poketmonPhonebook
//
//  Created by t2023-m0149 on 12/10/24.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let phoneLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUIViews() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneLabel)

        // 프로필 이미지 설정
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 30
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor.lightGray.cgColor
        profileImageView.backgroundColor = .white

        // 이름 라벨
        nameLabel.font = .boldSystemFont(ofSize: 16)
        nameLabel.textColor = .black

        // 전화번호 라벨
        phoneLabel.font = .systemFont(ofSize: 14)
        phoneLabel.textColor = .black
        phoneLabel.textAlignment = .right

        // 레이아웃 설정
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(45)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(60)
        }

        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(30)
            $0.top.equalToSuperview().offset(30)
            $0.trailing.lessThanOrEqualTo(phoneLabel.snp.leading).offset(-8)
        }

        phoneLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-45)
            $0.centerY.equalTo(nameLabel.snp.centerY)
            $0.width.equalTo(120)
        }
    }

    func configure(with contact: Contact) {
        nameLabel.text = contact.name
        phoneLabel.text = contact.phoneNumber
    }
}
