//
//  ViewController.swift
//  poketmonPhonebook
//
//  Created by t2023-m0149 on 12/10/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let tableView = UITableView()
    private let addButton = UIButton()
    private var contacts: [Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupTableView()
        loadDummyData()
    }

    private func setupNavigationBar() {
        // 제목 설정
        navigationItem.title = "친구 목록"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 18)]

        // 추가 버튼 설정
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.lightGray, for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)

        let rightBarButtonItem = UIBarButtonItem(customView: addButton)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        // 테이블뷰 제약조건 설정
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.bottom.equalToSuperview()
        }
    }

    private func loadDummyData() {
        contacts = [
            Contact(name: "name", phoneNumber: "010-0000-0000", profileImage: nil),
            Contact(name: "name", phoneNumber: "010-0000-0000", profileImage: nil),
            Contact(name: "name", phoneNumber: "010-0000-0000", profileImage: nil),
            Contact(name: "name", phoneNumber: "010-0000-0000", profileImage: nil),
            Contact(name: "name", phoneNumber: "010-0000-0000", profileImage: nil),
            Contact(name: "name", phoneNumber: "010-0000-0000", profileImage: nil)
        ]
        tableView.reloadData()
    }

//    @objc private func addButtonTapped() {
//        print("추가 버튼이 눌렸습니다.")
//    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: contacts[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    @objc private func addButtonTapped() {
        let phoneBookVC = PhoneBookViewController()
        navigationController?.pushViewController(phoneBookVC, animated: true)
    }
}
