//
//  PasscodeSettingsViewController.swift
//  Moments
//
//  Created by user on 30/11/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class PasscodeSettingsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        title = "TouchID & Passcode"
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
        passcodeCheck()
        
    }
    
    @IBOutlet weak var passcode: UISwitch!
    
    @IBOutlet weak var touchID: UISwitch! {
        didSet {
            touchID.isOn = UserDefaults.standard.bool(forKey: "touchEnabled")
        }
    }
    
    @IBOutlet weak var changePasscode: UISwitch!
    
    func passcodeCheck(){
        
        if UserDefaults.standard.bool(forKey: "passcodeEnabled"){
            passcode.isOn = true
            touchID.isOn = UserDefaults.standard.bool(forKey: "touchEnabled")
            tableView.cellForRow(at: [2,0])?.isHidden = false
            tableView.cellForRow(at: [1,0])?.isHidden = false
            UserDefaults.standard.set(true, forKey: "touchEnabled")

        }
        else{
            passcode.isOn = false
            touchID.isOn = false
            tableView.cellForRow(at: [1,0])?.isHidden = true
            tableView.cellForRow(at: [2,0])?.isHidden = true
        }
    }
    
    @IBAction func passcodeSwitch(_ sender: UISwitch) {
    
    if sender.isOn {
            guard let passcodeVc = storyboard?.instantiateViewController(withIdentifier: "PasscodeViewController") else { return }
            navigationController?.present(passcodeVc, animated: true, completion: nil)
        }
        
    else{
        guard let passcodeVc = storyboard?.instantiateViewController(withIdentifier: "PasscodeViewController") as? PasscodeViewController else { return }
        navigationController?.present(passcodeVc, animated: true, completion:  nil)
    
        passcodeVc.mode = MomentPasscode.removePasscode.rawValue
        }
    }
    
    @IBAction func touchIDSwitch(_ sender: UISwitch) {
        
        if touchID.isOn {
            UserDefaults.standard.set(true, forKey: "touchEnabled")
            UserDefaults.standard.synchronize()
        }
            
        else{
            UserDefaults.standard.removeObject(forKey: "touchEnabled")
            UserDefaults.standard.synchronize()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 44.0
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath != [0,0]{
            
        if !UserDefaults.standard.bool(forKey: "passcodeEnabled"){
            cell.isHidden = true
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath == [2,0] {
            
            guard let passcodeVc = self.storyboard?.instantiateViewController(withIdentifier: "PasscodeViewController") else {
                return }
            self.navigationController?.present(passcodeVc, animated: true, completion: nil)
        }
    }
}





