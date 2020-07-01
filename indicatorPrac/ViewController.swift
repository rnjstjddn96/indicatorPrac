//
//  ViewController.swift
//  indicatorPrac
//
//  Created by 권성우 on 2020/06/10.
//  Copyright © 2020 권성우. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable {

    @IBAction func button(_ sender: UIButton) {
        startAnimating(CGSize(width: 30, height: 30), message: "Loading...", type: NVActivityIndicatorType.cubeTransition)
        //버튼 클릭시 cubeTransition효과의 Indicator와 함께 Loading 메시지가 출력된다.
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5){
            NVActivityIndicatorPresenter.sharedInstance.setMessage("Authenticating")
            //1.5초뒤 메시지는 Authenticating으로 변경
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3){
            self.stopAnimating()
            self.performSegue(withIdentifier: "nextPage", sender: nil)
            //3초가 된 순간 PerformSegue를 통해 화면이 전환되고 Indicator 애니메이션은 중단된다.
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

