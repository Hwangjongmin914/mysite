//
//  ViewController.swift
//  Setting_Clone_App
//
//  Created by 시큐웍스 on 2022/02/04.
//

import UIKit

class ViewController: UIViewController {

    var settingModel = [[SettingModel]]()
    
    
    
    @IBOutlet weak var settingTableView: UITableView!
    
    func makeData() {
        settingModel.append(
        [SettingModel(leftImageName: "person.circle", menuTitle: "sign in to your iphone", subTitle: "Set up iCloud, the App Store, and more." , rightImageName: nil)]
        )
        
        settingModel.append(
        [SettingModel(leftImageName: "gear", menuTitle: "General", subTitle: nil, rightImageName: "chevron.right"),
         SettingModel(leftImageName: "person.fill", menuTitle: "Accessibility", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "hand.raised.fill", menuTitle: "Privacy", subTitle: nil, rightImageName: "chevron.right")]
        )
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = UIColor(white: 245/250, alpha: 1)
   
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")

        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        
        // 네비게이션 컨트롤러 타이틀 설정
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = UIColor(white: 245/250, alpha: 1)
        
        makeData()
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count
        
        //        return 5    // cell의 줄 갯수
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    // 눌렀을때 세부사항 항목가져오는 방법
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            if let generalVC = UIStoryboard(name: "GeneralViewController", bundle: nil).instantiateViewController(identifier: "GeneralViewController") as? GeneralViewController {
                self.navigationController?.pushViewController(generalVC, animated: true)
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        
         
         if indexPath.section == 0 {
             let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
              as! ProfileCell
             
             cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
             cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
             cell.bottomDesccription.text = settingModel[indexPath.section][indexPath.row].subTitle
             
              return cell

             
         }
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
         
         cell.leftImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
         cell.leftImageView.tintColor = .red
         cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
         cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "")
          
          return cell

         
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         if indexPath.row == 0 {
             return UITableView.automaticDimension   // 첫번째는 자동으로 조절
             
         }
         return 60   // 나머지는 60으로 크기지정
     }
     
 //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
 //        return 80
 //    }
     
 }
