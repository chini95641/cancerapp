//
//  RiskCalculator.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import Foundation
import UIKit


enum TractSymptomsState:Double {
    
    case none = -1.0
    case no = 0.0
    case voidingOrObstructive = 1.0
    case storageOrIrritative = 2.0
    case mixed = 3.0
    
    
    var displayName:String? {
        
        switch self {
        case .none:
            return nil
        case .no:
            return "NONE"
        case .voidingOrObstructive:
            return "VOIDING/OBSTRUCTIVE"
        case .storageOrIrritative:
            return "STORAGE/IRRITATIVE"
        case .mixed:
            return "MIXED"
            
        }
        
    }
    
    
    
}


enum UTIState:Double {
    
    case none = -1.0
    case no = 0.0
    case single = 1.0
    case recurrent = 2.0
    
    var value:Double {
        
        if self == .no {
            return 0.0
        } else if self == .single {
            return 0.74

        } else {
            return 0.75
        }
        
    }
    
    var displayName:String? {
        
        switch self {
        case .none:
            return nil
        case .no:
            return "NO"
        case .single:
            return "SINGLE UTI"
        case .recurrent:
            return "RECURRENT UTIs"

            
        }
        
    }

    
}

enum BooleanState:Double {
    
    case none = -1.0
    case no = 0.0
    case yes = 1.0
    
    var value:Double {
        
        return 1.91 * self.rawValue
    }
    var displayName:String? {
        
        switch self {
        case .none:
            return nil
        case .no:
            return "NO"
        case .yes:
            return "YES"
        }
        
    }
    
}

enum GenderState:Double {
    
    case none = -1.0
    case female = 0.0
    case male = 1.0
    
    var value:Double {
        
        return 0.71 * self.rawValue
    }
    
    var displayName:String? {
        
        switch self {
        case .none:
            return nil
        case .male:
            return "MALE"
        case .female:
            return "FEMALE"
        }
     }
}

enum SmokingState:Double {
    
    case none = -1.0
    case no = 0.0
    case exSmoker = 1.0
    case currentSmoker = 2.0
    
    var value:Double {
        
        if self == .no {
            return 0.0
        } else if self == .exSmoker {
            return 0.71

        } else {
            return 1.06
        }
        
    }
    var displayName:String? {
        
        switch self {
        case .none:
            return nil
        case .no:
            return "NO"
        case .exSmoker:
            return "EX-SMOKER"
        case .currentSmoker:
            return "CURRENT SMOKER"
            
        }
     }
    
}


class RiskCalculator {
    
    private init() {
        
        loadScores()
    }
    
    static let shared = RiskCalculator()
    
    var risks:[Risk] = []
    
    var riskScoreList:[RiskScore] = []
    var scoreDict:[Int:RiskScore] = [:]
    var age:Int = 0
    
    var score = 0.0
    var resultString = ""
    var riskScore:RiskScore? = nil
    
    var visibleHaematuria:BooleanState = .none
    var gender:GenderState = .none
    var smoking:SmokingState = .none
    var familyHistory:BooleanState = .none
    var previousBenign:BooleanState = .none
    
//    var tractSymptoms:TractSymptomsState = .none
    
    var utiState:UTIState = .none


    var catheterUse:BooleanState = .none
    var previousPelvicRadiotherapy:BooleanState = .none
    var anticoagulation:BooleanState = .none

    var riskColor:UIColor = UIColor.black
    
    
    func loadScores() {
        
        
        
        guard let path = Bundle.main.url(forResource: "RiskScore", withExtension: "json") else { return }
        
        guard let jsonData = try? Data.init(contentsOf: path, options: Data.ReadingOptions.mappedIfSafe) else {  return }
        
        guard let jsonResult:[[String:Any]] = try? JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:Any]] else { return }
        
        
        
        self.riskScoreList.removeAll()
        self.scoreDict.removeAll()
        
        for jsonObject in jsonResult {
            
            if let obj = RiskScore.init(with: jsonObject) {
                self.riskScoreList.append(obj)
                self.scoreDict[obj.score] = obj
            }
            
            
        }
        
    }
    
    

    
    func performCalculation(with completionHandler:@escaping(_ error:String?)->Void) {
        
        self.score = 0.0
        
        if age <= 0 || age > 110 {
            
            completionHandler("Please add valid age to calculate risk")
            
        } else if self.visibleHaematuria == .none {
            
            completionHandler("Please select visible haematuria to calculate risk")
        } else if gender == .none {
            
            completionHandler("Please select gender to calculate risk")
        } else if self.smoking == .none {
            
            completionHandler("Please select smoking to calculate risk")

        } else if self.familyHistory == .none {
            
            completionHandler("Please select Family history of urothelial cancer to calculate risk")

        } else if self.previousBenign == .none {
            
            completionHandler("Please select previous haematuria to calculate risk")

        } else if self.utiState == .none {
            
            completionHandler("Please select episode of UTI to calculate risk")

        } else if self.catheterUse == .none {
            
            completionHandler("Please select Catheter use to calculate risk")

        } else if self.previousPelvicRadiotherapy == .none {
            
            completionHandler("Please select previous pelvic radiotherapy to calculate risk")

        } else if self.anticoagulation == .none {
            
            completionHandler("Please select anticoagulation to calculate risk")

        } else {
            
            self.score += 1.91 * self.visibleHaematuria.rawValue

            self.score += 0.71 * self.gender.rawValue

            self.score += 0.047 * Double(self.age)

            self.score += self.smoking.value

            self.score +=  0.72 * self.familyHistory.rawValue

            self.score -=  0.84 * self.previousBenign.rawValue

            self.score -=   self.utiState.value

            self.score -=   1.60 * self.catheterUse.rawValue

            self.score -=   0.60 * self.previousPelvicRadiotherapy.rawValue

            self.score -=  0.33 * self.anticoagulation.rawValue

            self.score -=   0.84 * self.visibleHaematuria.rawValue * self.gender.rawValue


            
            
            
            
            /*
              1.91(visible haematuria)
              + 0.71(gender)
             + 0.047(age)
             + 1.06(Current smoker) + 0.71(ex-smoker)
             + 0.72(Family history of urothelial cancer)
             - 0.84(previous haematuria)
             - 0.74(Single episode of UTI associated with haematuria) – 0.75(Recurrent episode of UTI associated with haematuria)
             - 1.60(Catheter use)
             -0.60(previous pelvic radiotherapy)
             – 0.33(anticoagulation)
             - 0.84(visiblehaematuria*gender)
             
             */
            //[ 1.91(visible haematuria) + 0.71(gender) + 0.047(age) + 1.06(Current smoker) + 0.71(ex-smoker) + 0.72(Family history of urothelial cancer) - 0.84(previous haematuria) - 0.74(Single episode of UTI associated with haematuria) – 0.75(Recurrent episode of UTI associated with haematuria) - 1.60(Catheter use) -0.60(previous pelvic radiotherapy) – 0.33(anticoagulation) - 0.84(visiblehaematuria*gender)]
            
            
            
            self.score *= 10.0
            self.score += 7.0
            
            print("Score is -> ",self.score)
            
            switch score {
                
            case (0...44):
                self.resultString = "There is a VERY LOW Risk of Urinary Tract Cancer"
                self.riskColor = UIColor.lowRisk

            case (45...60):
                self.resultString = "There is a LOW Risk of Urinary Tract Cancer"
                self.riskColor = UIColor.lowRisk
            case (61...76):
                self.resultString = "There is a INTERMEDIATE Risk of Urinary Tract Cancer"
                self.riskColor = UIColor.intermediateRisk
            default:
                
                self.resultString = "There is a HIGH Risk of Urinary Tract Cancer"
                self.riskColor = UIColor.highRisk

                
            }
            
            
            self.riskScore = self.scoreDict[Int(score)]
         
            
            
            completionHandler(nil)
            
            
        }
        
        
     
        
        
        
        
        
        
        
        
        /*
         Risk score =
         7 + 10 x [ 1.91(visible haematuria) + 0.71(gender) + 0.047(age) + 1.06(Current smoker) + 0.71(ex-smoker) + 0.72(Family history of urothelial cancer) - 0.84(previous haematuria) - 0.74(Single episode of UTI associated with haematuria) – 0.75(Recurrent episode of UTI associated with haematuria) - 1.60(Catheter use) -0.60(previous pelvic radiotherapy) – 0.33(anticoagulation) - 0.84(visiblehaematuria*gender)]
         */
        
        
        
        
        
    }
    
    func updateValues() {
        
        
        self.risks[0].selectedString = self.visibleHaematuria.displayName
        
        self.risks[1].selectedString = self.gender.displayName
       
        
        self.risks[2].selectedString = self.smoking.displayName

        
        self.risks[3].selectedString = self.familyHistory.displayName
        
        self.risks[4].selectedString = self.previousBenign.displayName
        
//        self.risks[5].selectedString = self.tractSymptoms.displayName
        
        
        self.risks[5].selectedString = self.utiState.displayName
        
        
        self.risks[6].selectedString = self.catheterUse.displayName

        self.risks[7].selectedString = self.previousPelvicRadiotherapy.displayName
        
        self.risks[8].selectedString = self.anticoagulation.displayName
        
        
        

        
        /*list.append(Risk.init(withName: "Visible Haematuria", andSubTitle: "In the absence of visible haematuria calculator assumes presence of non-visible haematuria"))
         list.append(Risk.init(with: "Male", with: ["FEMALE","MALE"]))

         list.append(Risk.init(with: "Smoking History", with: ["NO","EX-SMOKER","CURRENT SMOKER"]))
         
         list.append(Risk.init(with: "Family history of Urothelial Cancer",with:["NO","YES"]))
         
         list.append(Risk.init(with: "Previous benign investigation of haematuria",with:["NO","YES"]))
         list.append(Risk.init(with: "Lower urinary tract symptoms",with: ["NONE","VOIDING OR OBSTRUCTIVE","STORAGE OR IRRITATIVE","MIXED"]))
         list.append(Risk.init(with: "Urinary tract infection (UTI) associated with haematuria episode",with: ["NO","SINGLE UTI","RECURRENT UTIs"]))
         
         
         list.append(Risk.init(with: "Catheter use",with: ["NO","YES"]))
         list.append(Risk.init(with: "Previous pelvic radiotherapy",with: ["NO","YES"]))
         list.append(Risk.init(with: "Anticoagulation",with: ["NO","YES"]))*/
        
    }
    
    func reset() {
        
        self.age = 0
        self.risks.removeAll()
        
        self.risks = Risk.getContent()
        self.score = 0.0
        self.resultString = ""
        self.riskScore = nil
        self.visibleHaematuria = .none
        self.gender = .none
        self.smoking = .none
        self.familyHistory = .none
        self.previousBenign = .none
//        self.tractSymptoms = .none
        self.utiState = .none
        self.catheterUse = .none
        self.previousPelvicRadiotherapy = .none
        self.anticoagulation = .none
        
    }
    
    
    
    
}
