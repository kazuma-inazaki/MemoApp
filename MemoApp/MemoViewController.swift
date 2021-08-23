//
//  MemoViewController.swift
//  MemoApp
//
//  Created by inazaki on 2021/06/03.
//

import UIKit

class MemoViewController: UIViewController {

    var memo: String?
    
    @IBOutlet weak var memoTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let memo = self.memo {
            self.memoTextField.text = memo
            self.navigationItem.title = "Edit Memo"
        }
        self.updateSaveButtonState()
    }
    
    private func updateSaveButtonState() {
        let memo = self.memoTextField.text ?? ""
        self.saveButton.isEnabled = !memo.isEmpty
    }
    
    @IBAction func memoTextFieldChanged(_ sender: Any) {
        self.updateSaveButtonState()
    }
    
    @IBAction func cancel(_ sender: Any) {
        if self.presentingViewController is UINavigationController {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === self.saveButton else {
            return
        }
        self.memo = self.memoTextField.text ?? ""
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
