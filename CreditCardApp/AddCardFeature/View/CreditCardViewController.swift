//
//  CreditCardViewController.swift
//  CreditCardApp
//
//  Created by 13401027 on 11/07/22.
//

import UIKit

class CreditCardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continueButton: UIButton!

    var viewModel: CreditCardViewModel?
    
    // Question 1: I have used protocol to enable phoneNumber, email and etc cell in same array.
    var tableModel = [CreditCardCell]() { // PhoneNumberCellController
        didSet {
            guard tableView != nil else { return }
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureView()
        bindView()
    }
    
    convenience init(viewModel: CreditCardViewModel?) {
        self.init()
        self.viewModel = viewModel
    }
    
    private func configureView() {
        self.title = viewModel?.getTitle()
        tableView.registerCell(type: PhoneNumberCell.self)
        tableView.registerCell(type: EmailCell.self)
        configureContinueBtn(false)
    }
    
    @IBAction func continueBtnAction(sender: UIButton) {
        print("\(viewModel?.getPhoneNumber() ?? ""), \(viewModel?.getEmail() ?? "")")
    }
    
    private func configureContinueBtn(_ isEnabled: Bool) {
        self.continueButton.setTitle("Continue", for: .normal)
        self.continueButton.titleLabel?.font = .systemFont(ofSize: 14)
        self.continueButton.setTitleColor(.white, for: .normal)
        self.continueButton.backgroundColor = isEnabled ? .black : .black.withAlphaComponent(0.5)
        self.continueButton.isUserInteractionEnabled = isEnabled ? true : false
    }
    
    func bindView() {
        viewModel?.enableProceed = { [weak self] enable in
            self?.configureContinueBtn(enable)
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension CreditCardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableModel[indexPath.row].view(in: tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
