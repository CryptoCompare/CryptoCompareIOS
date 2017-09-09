//
//  LineChartViewController.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 10/9/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import UIKit
import Charts

class LineChartViewController: UIViewController {

    
    //Mark: Properties
    @IBOutlet weak var chtChart: LineChartView!
    
    var freshLaunch = true
    
    var numbers:[Double] = [10.0, 20.0, 30.0]
    
    override func viewDidAppear(_ animated: Bool) {
        if freshLaunch == true {
            freshLaunch = false
            self.tabBarController?.selectedIndex = 1 // 2nd tab
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateGraph()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func updateGraph() {
        
        var lineChartEntry = [ChartDataEntry]()
        
        for i in 0..<numbers.count {
            
            let value = ChartDataEntry(x : Double(i), y: numbers[i])
            lineChartEntry.append(value)
        }
        
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Number")
        line1.colors = [NSUIColor.blue]
        let data = LineChartData()
        data.addDataSet(line1)
        chtChart.data = data
        chtChart.chartDescription?.text = "My awesome chart"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
