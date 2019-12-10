//
//  AddPostModalViewController.swift
//  MC5 FirstTest
//
//  Created by Pedro Henrique Guedes Silveira on 10/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//

import UIKit
import CoreData

class AddPostModalViewController: UIViewController {

    
    
    @IBOutlet weak var closeBtn: UIImageView!
    @IBOutlet weak var SelectImageBtn: UIImageView!
    @IBOutlet weak var titleTextField: UITextView!
    @IBOutlet weak var authorTextField: UITextView!
    @IBOutlet weak var bodyTextField: UITextView!
    @IBOutlet weak var tagsTextField: UITextView!
    @IBOutlet weak var doneBtn: UIImageView!
    let currentChannel: Channel? = nil
    let modelController = CoreDataManager.self
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneBtn.addGestureRecognizer(dismiss)
        closeBtn.addGestureRecognizer(dismiss)

        // Do any additional setup after loading the view.
    }

    
    
    let dismiss = UIGestureRecognizer(target: self, action: #selector(dismissModal))
    
    @objc func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addPost() {
        
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
