//
//  PhoneBookViewController.swift
//  poketmonPhonebook
//
//  Created by t2023-m0149 on 12/10/24.
//

import UIKit
import SnapKit

class PhoneBookViewController: UIViewController {
    private let profileImageView = UIImageView()
    private let randomImageButton = UIButton(type: .system)
    private let nameTextView = UITextView()
    private let phoneTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupViews()
    }

    private func setupNavigationBar() {
        // 제목 설정
        navigationItem.title = "연락처 추가"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "적용", style: .plain, target: self, action: #selector(applyButtonTapped))
    }

    private func setupViews() {
        // 프로필 이미지 설정
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 50
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor.gray.cgColor
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .clear
        view.addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.width.height.equalTo(100)
        }

        // 랜덤 이미지 생성 버튼
        randomImageButton.setTitle("랜덤 이미지 생성", for: .normal)
        randomImageButton.setTitleColor(.black, for: .normal)
        randomImageButton.addTarget(self, action: #selector(randomImageButtonTapped), for: .touchUpInside)
        view.addSubview(randomImageButton)
        randomImageButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileImageView.snp.bottom).offset(16)
        }

        // 이름 입력 텍스트뷰
        nameTextView.text = ""
        nameTextView.textColor = .gray
        nameTextView.font = UIFont.systemFont(ofSize: 16)
        nameTextView.layer.borderWidth = 1
        nameTextView.layer.borderColor = UIColor.lightGray.cgColor
        nameTextView.layer.cornerRadius = 8
        view.addSubview(nameTextView)
        nameTextView.snp.makeConstraints {
            $0.top.equalTo(randomImageButton.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }

        // 전화번호 입력 텍스트뷰
        phoneTextView.text = ""
        phoneTextView.textColor = .gray
        phoneTextView.font = UIFont.systemFont(ofSize: 16)
        phoneTextView.layer.borderWidth = 1
        phoneTextView.layer.borderColor = UIColor.lightGray.cgColor
        phoneTextView.layer.cornerRadius = 8
        view.addSubview(phoneTextView)
        phoneTextView.snp.makeConstraints {
            $0.top.equalTo(nameTextView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
    }

    // 랜덤 이미지 버튼 탭 이벤트 
    @objc private func randomImageButtonTapped() {
        print("랜덤 이미지 버튼이 눌렸습니다.")
    }

    // 적용 버튼 액션
    @objc private func applyButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
